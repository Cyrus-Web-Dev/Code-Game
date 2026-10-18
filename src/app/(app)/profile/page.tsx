"use client";
import { useEffect, useState } from "react";
import dynamic from "next/dynamic";
import confetti from "canvas-confetti";
import Link from "next/link";
import { Flame, Trophy, Medal } from "lucide-react";
import { Button } from "@/components/ui/button";
import TitleBadge from "@/components/TitleBadge";
import LevelRanks from "@/components/LevelRanks";
import GameHistory from "@/components/GameHistory";
import { ACHIEVEMENTS, LEVEL_IDS, LEVELS, TITLE_DEFS, THEMES, anyTheme, earnedDevBadges, activeMaster, type AchievementId } from "@/lib/config";
import Avatar from "@/components/Avatar";
import { MasterCard, MasterPill } from "@/components/Master";
import { useLang, useT } from "@/lib/i18n";
import { api } from "@/lib/supabase";
import { useMe } from "@/lib/store";
import langs from "@/data/languages.json";
const PdfLink = dynamic(() => import("@/components/PdfLink"), { ssr: false, loading: () => <span className="btn opacity-50">…</span> });
const L = langs as { name: string; level: string | null }[];

export default function Profile() {
  const t = useT(), lang = useLang((s) => s.lang);
  const [d, setD] = useState<any>(null);
  const [e, setE] = useState({ favorite_language: "", favorite_framework: "", role: "fullstack", skill_level: "newbie", avatar_url: "" });
  const [msg, setMsg] = useState("");
  const load = (force = false) => useMe.getState().fetchMe({ force }).then((x: any) => {
    setD(x);
    if (x?.profile) setE({ favorite_language: x.profile.favorite_language ?? "", favorite_framework: x.profile.favorite_framework ?? "", role: x.profile.role, skill_level: x.profile.skill_level, avatar_url: x.profile.avatar_url ?? "" });
  });
  useEffect(() => { load(); }, []);
  useEffect(() => { // rayakan saat gelar naik
    if (!d?.title) return;
    const key = `${d.title.tier}:${d.title.name}`;
    try {
      const old = localStorage.getItem("kt_title:" + d.profile.id);
      if (old && old !== key && d.title.tier !== "starter") confetti({ particleCount: 180, spread: 110, origin: { y: 0.4 }, disableForReducedMotion: true });
      localStorage.setItem("kt_title:" + d.profile.id, key);
    } catch {}
  }, [d]);
  if (!d) return <div className="grid gap-4"><div className="skeleton h-72 w-full" /><div className="skeleton h-32 w-full" /></div>;
  if (d.error) return <p>{t("err_" + d.error)}</p>;
  const p = d.profile, ti = d.title, th = anyTheme(ti.level), meta = d.meta ?? { streak: 0, bestStreak: 0, achievements: [] };
  const devBadges = earnedDevBadges(d.stats ?? []), master = activeMaster(devBadges, p.selected_master);
  async function save() {
    const r: any = await api("/api/profile", e);
    setMsg(r.error ? t("err_" + r.error) : t("saved")); if (!r.error) { useMe.getState().invalidate(); load(true); }
  }
  function photo(f?: File) {
    if (!f) return;
    if (f.size > 200_000) return setMsg(t("p_photo"));
    const r = new FileReader(); r.onload = () => setE((x) => ({ ...x, avatar_url: String(r.result) })); r.readAsDataURL(f);
  }
  const Chip = ({ k, v }: { k: string; v: string }) => <span className="chip"><span className="text-paper/50">{k}</span><b>{v || "-"}</b></span>;
  return (
    <div className="grid gap-6">
      <MasterCard role={master}>
      <section className="print-card relative overflow-hidden rounded-2xl border p-5 sm:p-7" style={{ borderColor: th.main + "88", background: `radial-gradient(120% 110% at 15% 0%, ${th.glow}55, rgba(24,21,38,.94) 62%)`, boxShadow: `0 0 70px -20px ${th.glow}` }}>
        <div className="grid items-center gap-6 md:grid-cols-[330px_1fr]">
          <TitleBadge tier={ti.tier} level={ti.level} tech={p.favorite_language} size={330} label={ti.name} particles />
          <div>
            <div className="flex items-center gap-3">
              <Avatar src={p.avatar_url} name={p.username} size={64} master={master} />
              <div><h1 className="flex flex-wrap items-center gap-2 font-display text-3xl">{p.username}{p.is_demo && <span className="chip chip-demo">{t("demo_tag")}</span>}</h1>
                <p className="text-xs uppercase tracking-[0.25em]" style={{ color: th.main }}>{t("tier_" + ti.tier)}</p></div>
            </div>
            {devBadges.length > 0 && (
              <div className="mt-3 flex flex-wrap gap-2">
                {devBadges.map((b) => <MasterPill key={b.role} role={b.role} active={b.role === master} className="px-2.5 py-1 text-xs" />)}
              </div>
            )}
            <p className="mt-4 text-xs text-paper/60">{t("p_title_label")}</p>
            <p className="text-2xl font-extrabold leading-tight" style={{ color: th.main, textShadow: `0 0 24px ${th.glow}` }}>{ti.name}</p>
            <p className="mt-1 text-sm text-paper/75">{ti.desc[lang]}</p>
            <div className="mt-4 flex flex-wrap gap-2"><Chip k={t("p_role")} v={t("role_" + p.role)} /><Chip k={t("p_fav_lang")} v={p.favorite_language} /><Chip k={t("p_fav_fw")} v={p.favorite_framework} /><Chip k={t("p_skill")} v={t("skill_" + p.skill_level)} /></div>
            <div className="mt-4 grid grid-cols-3 gap-2 text-center">
              <div className="rounded-xl bg-black/25 p-2"><Trophy size={16} className="mx-auto text-gold" /><p className="font-mono text-lg text-gold">{p.total_points}</p><p className="text-[10px] text-paper/50">{t("points")}</p></div>
              <div className="rounded-xl bg-black/25 p-2"><Medal size={16} className="mx-auto text-mint" /><p className="font-mono text-lg text-mint">#{d.rank}</p><p className="text-[10px] text-paper/50">{t("rank")}</p></div>
              <div className="rounded-xl bg-black/25 p-2"><Flame size={16} className="mx-auto text-hot" /><p className="font-mono text-lg text-hot">{meta.streak}</p><p className="text-[10px] text-paper/50">{t("streak_days")}</p></div>
            </div>
            <Link href="/titles" className="mt-4 inline-block text-sm text-mint underline">{t("p_all_titles")}</Link>
            {p.is_demo && <p className="mt-2 text-xs text-gold/80">{t("p_demo_note")}</p>}
          </div>
        </div>
      </section>
      </MasterCard>

      <section className="grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("p_levelranks")}</h2>
        <LevelRanks ranks={d.levelRanks} />
      </section>

      <section className="grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("p_next")}</h2>
        {LEVEL_IDS.map((l) => {
          const s = d.stats.find((x: any) => x.difficulty === l), n = s?.questions_answered ?? 0, acc = n ? Math.round((s.correct_answers / n) * 100) : 0;
          const got = d.titles.find((x: any) => x.level === l), c = THEMES[l];
          return (
            <div key={l} className="print-card level-card" style={{ ["--c" as string]: c.main, ["--g" as string]: c.glow }}>
              <div className="flex flex-wrap items-baseline gap-x-5 gap-y-1 font-mono text-sm">
                <b className="w-20 text-base" style={{ color: c.main }}>{LEVELS[l].label}</b>
                <span>{s?.games_played ?? 0} {t("p_games")}</span><span>{n} {t("p_questions")}</span><span>{t("p_accuracy")} {acc}%</span><span className="text-gold">{s?.points ?? 0} {t("points")}</span>
                <span className="text-paper/50">{t("p_hints")}: {d.hints[l]}/{LEVELS[l].hints}</span>
              </div>
              <div className="mt-3 grid gap-2 sm:grid-cols-2">
                <div><div className="bar"><i style={{ width: `${Math.min(100, (n / 50) * 100)}%` }} /></div><p className="mt-1 text-[11px] text-paper/60">{t("p_prog_std", { n: Math.min(n, 50) })} · {TITLE_DEFS[l].std}</p></div>
                <div><div className="bar"><i style={{ width: `${Math.min(100, (n / 150) * 100)}%` }} /></div><p className="mt-1 text-[11px] text-paper/60">{t("p_prog_leg", { n: Math.min(n, 150) })} · {TITLE_DEFS[l].legend.split(" (")[0]}</p></div>
              </div>
              {got && <p className="mt-2 text-sm font-bold" style={{ color: c.main }}>★ {got.name}</p>}
            </div>
          );
        })}
      </section>

      <section className="grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("p_ach")}</h2>
        <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
          {(Object.keys(ACHIEVEMENTS) as AchievementId[]).map((id) => {
            const a = ACHIEVEMENTS[id], on = meta.achievements.includes(id);
            return (
              <div key={id} className={`flex items-center gap-3 rounded-xl border p-3 ${on ? "border-gold/50 bg-gold/10" : "border-line bg-panel/60 opacity-60"}`}>
                <span className="text-2xl">{a.icon}</span>
                <div><p className="text-sm font-semibold">{a.name[lang]}</p><p className="text-xs text-paper/60">{a.desc[lang]}</p></div>
              </div>
            );
          })}
        </div>
      </section>

      <section className="no-print grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("h_title")}</h2>
        <GameHistory />
      </section>

      <section className="no-print grid gap-2 rounded-2xl border border-line bg-panel/80 p-4 sm:grid-cols-2">
        <h2 className="font-display text-xl text-gold sm:col-span-2">{t("p_edit")}</h2>
        <label className="grid gap-1 text-sm">{t("fav_lang")}<input className="input" maxLength={40} list="dl-lang" value={e.favorite_language} onChange={(x) => setE({ ...e, favorite_language: x.target.value })} /></label>
        <label className="grid gap-1 text-sm">{t("fav_fw")}<input className="input" maxLength={40} list="dl-fw" value={e.favorite_framework} onChange={(x) => setE({ ...e, favorite_framework: x.target.value })} /></label>
        <datalist id="dl-lang">{L.filter((x) => x.level && x.level !== "normal").map((x) => <option key={x.name} value={x.name} />)}</datalist>
        <datalist id="dl-fw">{L.filter((x) => x.level === "normal").map((x) => <option key={x.name} value={x.name} />)}</datalist>
        <label className="grid gap-1 text-sm">{t("role")}<select className="input" value={e.role} onChange={(x) => setE({ ...e, role: x.target.value })}>{["frontend", "backend", "fullstack"].map((k) => <option key={k} value={k}>{t("role_" + k)}</option>)}</select></label>
        <label className="grid gap-1 text-sm">{t("skill")}<select className="input" value={e.skill_level} onChange={(x) => setE({ ...e, skill_level: x.target.value })}>{["newbie", "intermediate", "advanced"].map((k) => <option key={k} value={k}>{t("skill_" + k)}</option>)}</select></label>
        <label className="grid gap-1 text-sm sm:col-span-2">{t("p_photo")}<input className="input" type="file" accept="image/png,image/jpeg,image/webp" onChange={(x) => photo(x.target.files?.[0])} /></label>
        <div className="flex flex-wrap items-center gap-2 sm:col-span-2"><Button onClick={save}>{t("save")}</Button><PdfLink d={{ ...d, profile: { ...p, ...e } }} lang={lang} /><span className="text-sm" role="status">{msg}</span></div>
      </section>
    </div>
  );
}
