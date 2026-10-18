"use client";
import { useCallback, useState } from "react";
import { CheckCircle2, LogOut as QuitIcon } from "lucide-react";
import { LEVELS, isPlayable, playTheme, playLabel, THEMES } from "@/lib/config";
import { useLang, useT } from "@/lib/i18n";
import { api } from "@/lib/supabase";

type Row = { difficulty: string; mode: string; score: number; correct: number; total: number; length: number; status: string; started_at: string; secs: number | null };
const PAGE = 20;

/**
 * Riwayat permainan. Tanpa `username` = milik sendiri. Dengan `username` = milik teman (server menolak untuk non-teman).
 * Data diambil hanya saat tombol ditekan (tidak ada polling), lalu "Muat lebih banyak" memakai kursor waktu.
 */
export default function GameHistory({ username }: { username?: string }) {
  const t = useT(), lang = useLang((s) => s.lang);
  const [rows, setRows] = useState<Row[] | null>(null), [more, setMore] = useState(false), [busy, setBusy] = useState(false), [err, setErr] = useState("");
  const load = useCallback(async (append: boolean, last?: string) => {
    setBusy(true); setErr("");
    const qs = new URLSearchParams({ limit: String(PAGE) });
    if (username) qs.set("u", username);
    if (append && last) qs.set("before", last);
    const d: any = await api(`/api/history?${qs}`);
    setBusy(false);
    if (d?.error) { setErr(t("err_" + d.error)); return; }
    setRows((cur) => (append ? [...(cur ?? []), ...d.rows] : d.rows));
    setMore(d.rows.length === PAGE);
  }, [username, t]);

  const fmt = (iso: string) => new Date(iso).toLocaleString(lang === "id" ? "id-ID" : "en-US", { day: "numeric", month: "short", hour: "2-digit", minute: "2-digit" });
  const dur = (s: number | null) => (s == null ? "" : s >= 60 ? `${Math.floor(s / 60)}m ${s % 60}s` : `${s}s`);

  if (rows === null) return (
    <div><button type="button" disabled={busy} onClick={() => load(false)} className="btn">{busy ? t("loading") : t("h_show")}</button>{err && <p role="alert" className="mt-2 text-sm text-hot">{err}</p>}</div>
  );
  return (
    <div className="grid gap-2">
      {rows.length === 0 && <p className="text-sm text-paper/60">{t("h_empty")}</p>}
      {rows.map((r, i) => {
        const th = isPlayable(r.difficulty) ? playTheme(r.difficulty) : THEMES.easy, acc = r.total ? Math.round((r.correct / r.total) * 100) : 0;
        return (
          <div key={r.started_at + i} className="grid grid-cols-[auto_1fr_auto] items-center gap-3 rounded-xl border bg-panel/70 px-3 py-2" style={{ borderColor: th.main + "44" }}>
            <span className="w-16 text-center text-xs font-bold uppercase tracking-wider" style={{ color: th.main }}>{isPlayable(r.difficulty) ? playLabel(r.difficulty) : r.difficulty}</span>
            <div className="min-w-0">
              <p className="truncate text-sm"><span className="font-semibold">{t("mode_" + (r.mode || "normal"))}</span> <span className="text-paper/50">· {fmt(r.started_at)}{r.secs != null && r.secs > 0 ? ` · ${t("h_dur")} ${dur(r.secs)}` : ""}</span></p>
              <p className="text-xs text-paper/60">{r.correct}/{r.total} {t("h_correct")} · {acc}%</p>
            </div>
            <div className="text-right">
              <p className="font-mono text-lg font-bold text-gold">+{r.score}</p>
              <p className={`inline-flex items-center gap-1 text-[11px] ${r.status === "finished" ? "text-mint" : "text-paper/50"}`}>{r.status === "finished" ? <CheckCircle2 size={11} /> : <QuitIcon size={11} />}{t(r.status === "finished" ? "h_finished" : "h_quit")}</p>
            </div>
          </div>
        );
      })}
      {more && <button type="button" disabled={busy} onClick={() => load(true, rows[rows.length - 1]?.started_at)} className="btn justify-self-start">{busy ? t("loading") : t("h_more")}</button>}
      {err && <p role="alert" className="text-sm text-hot">{err}</p>}
    </div>
  );
}
