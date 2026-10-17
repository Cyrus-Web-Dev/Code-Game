"use client";
import { useCallback, useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { AnimatePresence, motion } from "framer-motion";
import confetti from "canvas-confetti";
import { create } from "zustand";
import { Check, X, Clock, Lightbulb, Flag, Share2, RotateCcw, LayoutGrid, Zap } from "lucide-react";
import { api } from "@/lib/supabase";
import { useMe } from "@/lib/store";
import { isAnyLevel, isGodLevel, TIME_LIMIT, ACHIEVEMENTS, anyLabel, type AchievementId } from "@/lib/config";
import { useT, useLang } from "@/lib/i18n";
import { sfx } from "@/lib/sounds";
import CodeBlock from "@/components/CodeBlock";

type Q = { id: string; type: string; prompt: string; code: string; language: string; options: string[] };
type Fb = { correct: boolean; late?: boolean; correctIndex: number; explanation: string; gained: number; gainedBase?: number; gainedBonus?: number; streak?: number; streakActive?: boolean };
const useGame = create<{ score: number; set: (n: number) => void }>((set) => ({ score: 0, set: (score) => set({ score }) }));

export default function Play({ params }: { params: { level: string } }) {
  const t = useT(), lang = useLang((s) => s.lang), router = useRouter(), level = params.level;
  const { score, set: setScore } = useGame();
  const [session, setSession] = useState(""), [q, setQ] = useState<Q | null>(null), [left, setLeft] = useState(0), [hints, setHints] = useState(0), [hint, setHint] = useState("");
  const [hintsUnlimited, setHintsUnlimited] = useState(false), [hintStage, setHintStage] = useState(0);
  const [streak, setStreak] = useState(0), [streakMin, setStreakMin] = useState(0), [streakBonus, setStreakBonus] = useState(0);
  const [pureClear, setPureClear] = useState(true), [hintsUsedTotal, setHintsUsedTotal] = useState(0);
  const [progress, setProgress] = useState({ answered: 0, total: 10 }), [fb, setFb] = useState<Fb | null>(null), [picked, setPicked] = useState<number | null>(null);
  const [done, setDone] = useState<null | "finished" | "quit">(null), [err, setErr] = useState("");
  const [timeLimit, setTimeLimit] = useState(TIME_LIMIT);
  const [mode, setMode] = useState("normal");
  const [levelLabel, setLevelLabel] = useState(level);
  const [correctCount, setCorrectCount] = useState(0);
  const [toasts, setToasts] = useState<{ id: string; icon: string; name: string }[]>([]);
  const [shared, setShared] = useState(false);
  const busy = useRef(false);
  // Batas waktu soal sebagai titik waktu absolut (performance.now): tetap akurat walau tab di latar belakang atau timer browser ditahan
  const deadline = useRef(0);
  const prevLeft = useRef(30);

  const pushAch = useCallback((ids: string[]) => {
    if (!ids?.length) return;
    const items = ids.map((id) => {
      const a = ACHIEVEMENTS[id as AchievementId];
      return a ? { id, icon: a.icon, name: a.name[lang] } : null;
    }).filter(Boolean) as { id: string; icon: string; name: string }[];
    if (items.length) {
      sfx.levelUp();
      setToasts((t) => [...t, ...items]);
      setTimeout(() => setToasts((t) => t.slice(items.length)), 3500);
    }
  }, [lang]);

  const applyQuestionPayload = useCallback((d: any) => {
    if (!d || d.error) {
      if (d?.error) setErr(d.error);
      return;
    }
    setHints(d.hints);
    setHintsUnlimited(!!d.hintsUnlimited);
    setProgress({ answered: d.answered, total: d.total });
    setScore(d.score);
    setTimeLimit(d.timeLimit || TIME_LIMIT);
    setMode(d.mode || "normal");
    setLevelLabel(d.level || level);
    setCorrectCount(d.correct ?? 0);
    setStreak(d.streak ?? 0); setStreakMin(d.streakMin ?? 0); setStreakBonus(d.streakBonus ?? 0);
    setPureClear(d.pureClear ?? true);
    setHintStage(0);
    if (d.finished) {
      if (d.newAchievements) pushAch(d.newAchievements);
      return setDone("finished");
    }
    setQ(d.question);
    setLeft(d.secondsLeft);
    deadline.current = performance.now() + d.secondsLeft * 1000;
    setHint("");
    setFb(null);
    setPicked(null);
    busy.current = false;
    prevLeft.current = d.secondsLeft;
  }, [setScore, level, pushAch]);

  /** Fallback: fetch next bila payload belum ada (kompatibel deployment lama). */
  const load = useCallback(async (sid: string) => {
    const d: any = await api(`/api/game/next?session=${sid}`);
    applyQuestionPayload(d);
  }, [applyQuestionPayload]);

  useEffect(() => {
    if (!isAnyLevel(level) && level !== "daily") return;
    const modeParam = new URLSearchParams(location.search).get("mode") || (level === "daily" ? "daily" : "normal");
    api("/api/game/start", { level: level === "daily" ? "easy" : level, mode: modeParam }).then((d: any) => {
      if (d.error) return setErr(d.error);
      setSession(d.session);
      setMode(d.mode);
      setLevelLabel(d.level);
      // Hemat 1 invocation: soal pertama ikut di response start
      if (d.first) applyQuestionPayload(d.first);
      else load(d.session);
    });
  }, [level, load, applyQuestionPayload]);

  useEffect(() => {
    if (done === "finished" || done === "quit") {
      useMe.getState().invalidate(); // stats/gelar di halaman lain ikut segar
    }
    if (done === "finished" && score > 0) {
      confetti({ particleCount: 120, spread: 80, origin: { y: 0.7 }, disableForReducedMotion: true });
      sfx.confetti();
    }
  }, [done, score]);

  // Cache next question from answer response (hemat 1 invocation per soal)
  const pendingNext = useRef<any>(null);

  const answer = useCallback(async (choice: number | null) => {
    if (!q || busy.current) return; busy.current = true; setPicked(choice);
    const d: any = await api("/api/game/answer", { session, question: q.id, choice });
    if (d.error) return setErr(d.error);
    setFb(d); setScore(d.score);
    pendingNext.current = d.next ?? null;
    useMe.getState().invalidate(); // poin/hint berubah: halaman lain harus mengambil data baru
    if (d.correct) { sfx.correct(); setCorrectCount((c) => c + 1); }
    else if (choice === null || d.late) sfx.timeout();
    else sfx.wrong();
    if (d.newAchievements) pushAch(d.newAchievements);
  }, [q, session, setScore, pushAch]);

  const goNext = useCallback(() => {
    const cached = pendingNext.current;
    pendingNext.current = null;
    if (cached) applyQuestionPayload(cached);
    else load(session);
  }, [applyQuestionPayload, load, session]);

  useEffect(() => {
    if (!q || fb) return;
    const tick = () => {
      const remain = Math.max(0, Math.ceil((deadline.current - performance.now()) / 1000));
      if (remain <= 5 && remain < prevLeft.current) sfx.tick();
      prevLeft.current = remain;
      setLeft(remain);
      if (remain <= 0) answer(null);
    };
    tick();
    const id = setInterval(tick, 250);
    const onVis = () => { if (document.visibilityState === "visible") tick(); }; // sinkron seketika saat kembali ke tab
    document.addEventListener("visibilitychange", onVis);
    return () => { clearInterval(id); document.removeEventListener("visibilitychange", onVis); };
  }, [q, fb, answer]);

  async function useHint() {
    if (!q) return;
    const d: any = await api("/api/game/hint", { session, question: q.id });
    if (d.error) setHint(t("err_" + d.error));
    else { setHint(d.hint); setHints(d.hints); if (d.stage) setHintStage(d.stage); if (typeof d.hintsUsedTotal === "number") setHintsUsedTotal(d.hintsUsedTotal); sfx.hint(); }
  }
  async function quit() { await api("/api/game/quit", { session }); setDone("quit"); }

  async function shareResult() {
    const text = `🏆 Kode Tebak — ${isAnyLevel(levelLabel) ? anyLabel(levelLabel) : levelLabel}\n` +
      `Skor: ${score} | Benar: ${correctCount}/${progress.total}\n` +
      (mode !== "normal" ? `Mode: ${mode}\n` : "") +
      `https://kode-tebak.vercel.app`;
    try {
      if (navigator.share) await navigator.share({ title: "Kode Tebak", text });
      else { await navigator.clipboard.writeText(text); setShared(true); setTimeout(() => setShared(false), 2000); }
    } catch { /* cancelled */ }
  }

  if (!isAnyLevel(level) && level !== "daily") return <p>404</p>;
  if (err) return (
    <div className="grid gap-4 text-center py-16">
      <p role="alert" className="text-hot text-lg">{t("err_" + err)}</p>
      <button className="btn mx-auto" onClick={() => router.push("/game")}>{t("choose")}</button>
    </div>
  );

  if (done) {
    const acc = progress.total ? Math.round((correctCount / progress.total) * 100) : 0;
    return (
      <div className="grid gap-6 max-w-lg mx-auto text-center anim-pop">
        <div className="card-glow">
          <p className="text-xs uppercase tracking-[0.2em] text-gold/70 mb-2">
            {done === "quit" ? t("over") : t("done")}
          </p>
          <h1 className="font-display text-4xl text-gold mb-1">{score}</h1>
          <p className="text-paper/60 text-sm mb-4">{t("points")}</p>
          <div className="grid grid-cols-3 gap-3 text-sm">
            <div className="rounded-lg bg-ink/50 p-3">
              <div className="text-mint font-mono text-lg">{correctCount}</div>
              <div className="text-paper/50 text-xs">{t("p_questions")}</div>
            </div>
            <div className="rounded-lg bg-ink/50 p-3">
              <div className="text-gold font-mono text-lg">{acc}%</div>
              <div className="text-paper/50 text-xs">{t("p_accuracy")}</div>
            </div>
            <div className="rounded-lg bg-ink/50 p-3">
              <div className="text-paper font-mono text-lg capitalize">{mode}</div>
              <div className="text-paper/50 text-xs">mode</div>
            </div>
          </div>
          {done === "finished" && isGodLevel(levelLabel) && (
            <p className={`mt-4 text-xs font-semibold ${pureClear ? "text-gold" : "text-paper/60"}`}>
              {pureClear ? `✨ ${t("god_pure_clear")}` : t("god_used_hint", { n: hintsUsedTotal })}
            </p>
          )}
        </div>
        <p className="text-paper/60 text-sm">{t("saved_profile")}</p>
        <div className="flex flex-wrap justify-center gap-3">
          <button className="btn btn-primary inline-flex items-center gap-2" onClick={() => location.reload()}>
            <RotateCcw size={16} />{t("again")}
          </button>
          <button className="btn inline-flex items-center gap-2" onClick={() => router.push("/game")}>
            <LayoutGrid size={16} />{t("choose")}
          </button>
          <button className="btn btn-gold inline-flex items-center gap-2" onClick={shareResult}>
            <Share2 size={16} />{shared ? t("copied") : t("share")}
          </button>
        </div>
      </div>
    );
  }

  if (!q) return (
    <div className="grid gap-4 py-8">
      <div className="skeleton h-8 w-48" />
      <div className="skeleton h-40 w-full" />
      <div className="grid gap-2 sm:grid-cols-3">
        <div className="skeleton h-14" /><div className="skeleton h-14" /><div className="skeleton h-14" />
      </div>
      <p className="font-mono text-sm text-paper/50 text-center">{t("loading_q")}</p>
    </div>
  );

  const danger = left <= 5;
  const pct = (left / timeLimit) * 100;
  const qNum = Math.min(progress.answered + 1, progress.total);

  return (
    <div className="grid gap-5 relative">
      {/* Achievement toasts */}
      <div className="fixed top-20 right-4 z-50 flex flex-col gap-2 pointer-events-none">
        <AnimatePresence>
          {toasts.map((a) => (
            <motion.div key={a.id} initial={{ opacity: 0, x: 40 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: 40 }}
              className="pointer-events-auto rounded-xl border border-gold/40 bg-panel/95 px-4 py-3 shadow-lg backdrop-blur">
              <p className="text-xs text-gold uppercase tracking-wider">{t("ach_unlocked")}</p>
              <p className="font-semibold">{a.icon} {a.name}</p>
            </motion.div>
          ))}
        </AnimatePresence>
      </div>

      {/* Top bar */}
      <div className="flex flex-wrap items-center gap-3 font-mono text-sm">
        <span className="rounded-md bg-panel px-2.5 py-1 border border-line font-semibold">
          {isAnyLevel(levelLabel) ? anyLabel(levelLabel) : levelLabel}
          {mode === "speedrun" && <Zap size={12} className="inline ml-1 text-gold" />}
          {mode === "daily" && <span className="ml-1 text-gold text-xs">DAILY</span>}
          {mode === "maraton" && <span className="ml-1 text-mint text-xs">100</span>}
        </span>
        <span className="text-paper/60">{t("q_n", { n: qNum, total: progress.total })}</span>
        <span className="text-gold font-semibold">{score} {t("points")}</span>
        {streakMin > 0 && (
          <span className={`rounded-md px-2 py-1 text-xs font-semibold ${streak >= streakMin ? "bg-hot/20 text-hot" : "bg-ink/50 text-paper/60"}`}>
            🔥 {t("streak_n", { n: streak })}{streak < streakMin ? ` · ${t("streak_need", { n: streakMin })}` : ` · +${streakBonus}`}
          </span>
        )}
        <span className={`ml-auto flex items-center gap-1.5 text-xl font-bold tabular-nums ${danger ? "text-hot" : "text-mint"}`}>
          <Clock size={18} />{left}s
        </span>
      </div>

      {/* Timer bar */}
      <div className="timer-bar">
        <div className={danger ? "bg-hot" : "bg-mint"} style={{ width: `${pct}%` }} />
      </div>

      {/* Question progress dots */}
      <div className="flex gap-1 flex-wrap">
        {Array.from({ length: Math.min(progress.total, 20) }, (_, i) => (
          <div key={i} className={`h-1.5 flex-1 min-w-[8px] max-w-[24px] rounded-full transition-colors ${
            i < progress.answered ? "bg-mint" : i === progress.answered ? "bg-gold" : "bg-line"
          }`} />
        ))}
        {progress.total > 20 && <span className="text-xs text-paper/40 ml-1">+{progress.total - 20}</span>}
      </div>

      <AnimatePresence mode="wait">
        <motion.div key={q.id} initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -8 }}
          transition={{ duration: 0.25 }} className="grid gap-4">
          <h2 className="text-xl font-semibold leading-snug">{q.prompt}</h2>
          <CodeBlock code={q.code} lang={q.language} />

          <div className={`grid gap-2.5 sm:grid-cols-3 ${fb && !fb.correct && !fb.late && picked !== null ? "anim-shake" : ""}`}>
            {q.options.map((o, i) => {
              let cls = "opt-btn";
              if (fb) {
                if (i === fb.correctIndex) cls += " correct flash-ok";
                else if (i === picked) cls += " wrong flash-bad";
                else cls += " dim";
              }
              return (
                <button key={i} disabled={!!fb} onClick={() => { sfx.click(); answer(i); }} className={cls}>
                  <span className="mr-2 inline-flex h-6 w-6 items-center justify-center rounded-md bg-ink/40 text-xs font-mono text-paper/50">
                    {String.fromCharCode(65 + i)}
                  </span>
                  {o}
                </button>
              );
            })}
          </div>

          {hint && (
            <motion.p initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }}
              className="rounded-xl border border-gold/50 bg-gold/5 p-3.5 text-gold text-sm">
              <Lightbulb size={14} className="inline mr-1.5" />{t("hint_prefix")} {hint}
            </motion.p>
          )}

          {fb && (
            <motion.div initial={{ opacity: 0, scale: 0.95 }} animate={{ opacity: 1, scale: 1 }}
              className={`rounded-xl border p-5 anim-pop ${fb.correct ? "border-mint bg-mint/5" : "border-hot bg-hot/5"}`}>
              <div className="flex items-center gap-2 mb-2">
                {fb.correct
                  ? <Check className="text-mint" size={22} />
                  : <X className="text-hot" size={22} />}
                <p className="font-semibold text-lg">
                  {fb.correct ? t("right", { n: fb.gained }) : fb.late ? (picked === fb.correctIndex ? t("late_correct") : t("timeout")) : picked === null ? t("timeout") : t("wrong")}
                </p>
              </div>
              {fb.correct && !!fb.streakActive && !!fb.gainedBonus && (
                <p className="mb-3 text-xs font-semibold text-hot">🔥 {t("streak_bonus_line", { base: fb.gainedBase ?? 0, bonus: fb.gainedBonus })}</p>
              )}
              <p className="text-paper/75 text-sm leading-relaxed mb-4">{fb.explanation}</p>
              <button className="btn btn-primary" onClick={goNext}>{t("next")}</button>
            </motion.div>
          )}
        </motion.div>
      </AnimatePresence>

      {!fb && (
        <div className="flex gap-3 pt-1">
          {mode !== "speedrun" && (
            <button className="btn inline-flex items-center gap-2" disabled={!hintsUnlimited && hints <= 0} onClick={useHint}>
              <Lightbulb size={16} />{t("hint")} {hintsUnlimited ? `(${t("hint_unlimited")}${hintStage ? ` · ${hintStage}/3` : ""})` : `(${hints})`}
            </button>
          )}
          <button className="btn btn-danger ml-auto inline-flex items-center gap-2" onClick={quit}>
            <Flag size={16} />{t("quit")}
          </button>
        </div>
      )}
    </div>
  );
}
