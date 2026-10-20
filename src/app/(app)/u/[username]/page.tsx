"use client";
import { useCallback, useEffect, useState } from "react";
import Link from "next/link";
import { ArrowLeft, Flame, Medal, Trophy, UserPlus, UserMinus, Check, X, Clock } from "lucide-react";
import Avatar from "@/components/Avatar";
import { MasterCard, MasterPill } from "@/components/Master";
import TitleBadge from "@/components/TitleBadge";
import LevelRanks from "@/components/LevelRanks";
import EarnedTitles from "@/components/EarnedTitles";
import GameHistory from "@/components/GameHistory";
import { ACHIEVEMENTS, LEVEL_IDS, LEVELS, THEMES, anyTheme, TITLE_DEFS, earnedDevBadges, activeMaster, isPlayable, playLabel, type AchievementId } from "@/lib/config";
import { useLang, useT } from "@/lib/i18n";
import { agoText } from "@/lib/time";
import { api } from "@/lib/supabase";

export default function Player({ params }: { params: { username: string } }) {
  const t = useT(), lang = useLang((s) => s.lang);
  const [d, setD] = useState<any>(null), [msg, setMsg] = useState(""), [busy, setBusy] = useState(false);
  const load = useCallback(() => api(`/api/users/${encodeURIComponent(params.username)}`).then(setD), [params.username]);
  useEffect(() => { load(); }, [load]);

  if (!d) return <div className="grid gap-4"><div className="skeleton h-72 w-full" /><div className="skeleton h-32 w-full" /></div>;
  if (d.error) return <div className="grid gap-3"><Link href="/friends" className="inline-flex items-center gap-1 text-sm text-mint"><ArrowLeft size={16} />{t("pf_back")}</Link><p>{d.error === "USER_NOT_FOUND" ? t("pf_not_found") : t("err_" + d.error)}</p></div>;

  const ti = d.title, th = anyTheme(ti.level);
  const devBadges = earnedDevBadges(d.stats ?? []), master = activeMaster(devBadges, d.msel);
  async function act(body: Record<string, unknown>) {
    setBusy(true);
    const r: any = await api("/api/friends", body);
    setBusy(false);
    setMsg(r?.error ? t("err_" + r.error) : t("fr_r_" + r.result));
    load();
  }
  const status = d.playing ? t("fr_playing", { lvl: isPlayable(d.playing) ? playLabel(d.playing) : d.playing }) : d.online ? t("fr_online") : d.seen_ago == null ? t("fr_offline_never") : t("fr_offline", { ago: agoText(d.seen_ago, t) });
  const joined = new Date(d.joined).toLocaleDateString(lang === "id" ? "id-ID" : "en-US", { year: "numeric", month: "long" });
  const Chip = ({ k, v }: { k: string; v: string }) => <span className="chip"><span className="text-paper/50">{k}</span><b>{v || "-"}</b></span>;

  return (
    <div className="grid gap-6">
      <Link href="/friends" className="inline-flex items-center gap-1 text-sm text-mint"><ArrowLeft size={16} />{t("pf_back")}</Link>
      <MasterCard role={master}>
      <section className="relative overflow-hidden rounded-2xl border p-5 sm:p-7" style={{ borderColor: th.main + "88", background: `radial-gradient(120% 110% at 15% 0%, ${th.glow}55, rgba(24,21,38,.94) 62%)`, boxShadow: `0 0 70px -20px ${th.glow}` }}>
        <div className="grid items-center gap-6 md:grid-cols-[330px_1fr]">
          <TitleBadge tier={ti.tier} level={ti.level} tech={d.fav} size={330} label={ti.name} particles />
          <div>
            <div className="flex items-center gap-3">
              <Avatar src={d.avatar} name={d.username} size={68} online={d.online == null ? null : d.online || !!d.playing} master={master} />
              <div>
                <h1 className="flex flex-wrap items-center gap-2 font-display text-3xl">{d.username}{d.demo && <span className="chip chip-demo">{t("demo_tag")}</span>}</h1>
                <p className="text-xs uppercase tracking-[0.25em]" style={{ color: th.main }}>{t("tier_" + ti.tier)}</p>
                {d.online != null && <p className={`text-xs ${d.playing ? "text-gold" : d.online ? "text-mint" : "text-paper/50"}`}>{status}</p>}
              </div>
            </div>
            {devBadges.length > 0 && (
              <div className="mt-3 flex flex-wrap gap-2">
                {devBadges.map((b) => <MasterPill key={b.role} role={b.role} active={b.role === master} className="px-2.5 py-1 text-xs" />)}
              </div>
            )}
            <p className={`mt-4 text-2xl font-extrabold leading-tight ${ti.tier === "legendary" ? "name-shine" : ""}`} style={{ color: th.main, textShadow: `0 0 24px ${th.glow}`, ["--c" as string]: th.main, ["--g" as string]: th.glow }}>{ti.name}</p>
            <p className="mt-1 text-sm text-paper/75">{ti.desc[lang]}</p>
            <div className="mt-4 flex flex-wrap gap-2"><Chip k={t("p_fav_lang")} v={d.fav} /><Chip k={t("pf_joined")} v={joined} /></div>
            <div className="mt-4 grid grid-cols-4 gap-2 text-center">
              <div className="rounded-xl bg-black/25 p-2"><Trophy size={16} className="mx-auto text-gold" /><p className="font-mono text-lg text-gold">{d.pts}</p><p className="text-[10px] text-paper/50">{t("points")}</p></div>
              <div className="rounded-xl bg-black/25 p-2"><Medal size={16} className="mx-auto text-mint" /><p className="font-mono text-lg text-mint">#{d.rank}</p><p className="text-[10px] text-paper/50">{t("rank")}</p></div>
              <div className="rounded-xl bg-black/25 p-2"><Flame size={16} className="mx-auto text-hot" /><p className="font-mono text-lg text-hot">{d.streak}</p><p className="text-[10px] text-paper/50">{t("streak_days")}</p></div>
              <div className="rounded-xl bg-black/25 p-2"><Flame size={16} className="mx-auto text-gold" /><p className="font-mono text-lg text-gold">{d.best_streak}</p><p className="text-[10px] text-paper/50">{t("pf_best_streak")}</p></div>
            </div>
            <div className="mt-4 flex flex-wrap items-center gap-2">
              {d.relation === "self" && <><span className="chip">{t("pf_you")}</span><Link href="/profile" className="btn px-3 py-1.5 text-xs">{t("nav_profile")}</Link></>}
              {d.relation === "none" && <button disabled={busy} onClick={() => act({ action: "request", username: d.username })} className="btn btn-primary inline-flex items-center gap-1"><UserPlus size={16} />{t("fr_add")}</button>}
              {d.relation === "pending_out" && <><span className="chip"><Clock size={12} />{t("fr_pending")}</span><button disabled={busy} onClick={() => act({ action: "remove", userId: d.id })} className="btn px-3 py-1.5 text-xs hover:border-hot">{t("fr_cancel")}</button></>}
              {d.relation === "pending_in" && <><button disabled={busy} onClick={() => act({ action: "respond", requestId: d.request_id, accept: true })} className="btn btn-primary inline-flex items-center gap-1"><Check size={16} />{t("fr_accept")}</button><button disabled={busy} onClick={() => act({ action: "respond", requestId: d.request_id, accept: false })} className="btn inline-flex items-center gap-1 hover:border-hot"><X size={16} />{t("fr_decline")}</button></>}
              {d.relation === "friends" && <><span className="chip border-mint/60 text-mint"><Check size={12} />{t("fr_is_friend")}</span><button disabled={busy} onClick={() => confirm(t("fr_remove_ask", { name: d.username })) && act({ action: "remove", userId: d.id })} className="btn inline-flex items-center gap-1 px-3 py-1.5 text-xs hover:border-hot"><UserMinus size={14} />{t("fr_remove")}</button></>}
              {msg && <span role="status" className="text-sm text-gold">{msg}</span>}
            </div>
          </div>
        </div>
      </section>
      </MasterCard>

      <EarnedTitles stats={d.stats ?? []} current={ti} tech={d.fav} />

      <section className="grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("p_levelranks")}</h2>
        <LevelRanks ranks={d.level_ranks} />
      </section>

      <section className="grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("pf_stats")}</h2>
        {LEVEL_IDS.map((l) => {
          const s = d.stats.find((x: any) => x.difficulty === l), n = s?.questions_answered ?? 0, acc = n ? Math.round((s.correct_answers / n) * 100) : 0, c = THEMES[l];
          const got = d.titles.find((x: any) => x.level === l);
          return (
            <div key={l} className="level-card" style={{ ["--c" as string]: c.main, ["--g" as string]: c.glow }}>
              <div className="flex flex-wrap items-baseline gap-x-5 gap-y-1 font-mono text-sm">
                <b className="w-20 text-base" style={{ color: c.main }}>{LEVELS[l].label}</b>
                <span>{s?.games_played ?? 0} {t("p_games")}</span><span>{n} {t("p_questions")}</span><span>{t("p_accuracy")} {acc}%</span><span className="text-gold">{s?.points ?? 0} {t("points")}</span>
              </div>
              {got && <p className="mt-2 text-sm font-bold" style={{ color: c.main }}>★ {got.name}</p>}
              {!got && <p className="mt-2 text-xs text-paper/40">{TITLE_DEFS[l].std}</p>}
            </div>
          );
        })}
      </section>

      <section className="grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("h_title")}</h2>
        {d.relation === "friends" || d.relation === "self" ? <GameHistory username={d.relation === "self" ? undefined : d.username} /> : <p className="text-sm text-paper/60">{t("h_friends_only")}</p>}
      </section>

      <section className="grid gap-3">
        <h2 className="font-display text-xl text-gold">{t("p_ach")}</h2>
        <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
          {(Object.keys(ACHIEVEMENTS) as AchievementId[]).map((id) => {
            const a = ACHIEVEMENTS[id], on = d.achievements.includes(id);
            return (
              <div key={id} className={`flex items-center gap-3 rounded-xl border p-3 ${on ? "border-gold/50 bg-gold/10" : "border-line bg-panel/60 opacity-60"}`}>
                <span className="text-2xl">{a.icon}</span>
                <div><p className="text-sm font-semibold">{a.name[lang]}</p><p className="text-xs text-paper/60">{a.desc[lang]}</p></div>
              </div>
            );
          })}
        </div>
        <p className="text-xs text-paper/40">{t("pf_hidden")}</p>
      </section>
    </div>
  );
}
