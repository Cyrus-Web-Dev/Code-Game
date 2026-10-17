"use client";
import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import PublicShell from "@/components/PublicShell";
import { Button } from "@/components/ui/button";
import { useT } from "@/lib/i18n";
import { useUser } from "@/lib/store";
import { api } from "@/lib/supabase";
import langs from "@/data/languages.json";
const L = (langs as { name: string; level: string | null }[]);
export default function Register() {
  const t = useT(), router = useRouter();
  const [f, setF] = useState({ username: "", password: "", favoriteLanguage: "", favoriteFramework: "", skillLevel: "newbie", role: "fullstack" });
  const [err, setErr] = useState(""), [busy, setBusy] = useState(false);
  const set = (k: string) => (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => setF({ ...f, [k]: e.target.value });
  async function submit(e: React.FormEvent) {
    e.preventDefault(); setBusy(true); setErr("");
    const d: any = await api("/api/auth/register", f);
    if (d.error) { setErr(d.error); setBusy(false); return; }
    await useUser.getState().refresh(); router.push("/profile");
  }
  return (
    <PublicShell>
      <form onSubmit={submit} className="grid gap-3 rounded-lg border border-line bg-panel/80 p-6 backdrop-blur">
        <h1 className="font-display text-3xl text-gold">{t("register")}</h1>
        <label className="grid gap-1 text-sm">{t("username")}<input className="input" required minLength={3} maxLength={20} pattern="[A-Za-z0-9_]{3,20}" autoComplete="username" value={f.username} onChange={set("username")} /><span className="text-xs text-paper/60">{t("user_hint")}</span></label>
        <label className="grid gap-1 text-sm">{t("password")}<input className="input" type="password" required minLength={8} maxLength={128} autoComplete="new-password" value={f.password} onChange={set("password")} /><span className="text-xs text-paper/60">{t("pw_hint")}</span></label>
        <label className="grid gap-1 text-sm">{t("fav_lang")}<input className="input" required maxLength={40} list="dl-lang" value={f.favoriteLanguage} onChange={set("favoriteLanguage")} /></label>
        <label className="grid gap-1 text-sm">{t("fav_fw")}<input className="input" required maxLength={40} list="dl-fw" value={f.favoriteFramework} onChange={set("favoriteFramework")} /></label>
        <datalist id="dl-lang">{L.filter((x) => x.level && x.level !== "normal").map((x) => <option key={x.name} value={x.name} />)}</datalist>
        <datalist id="dl-fw">{L.filter((x) => x.level === "normal").map((x) => <option key={x.name} value={x.name} />)}</datalist>
        <label className="grid gap-1 text-sm">{t("skill")}<select className="input" value={f.skillLevel} onChange={set("skillLevel")}>{["newbie", "intermediate", "advanced"].map((k) => <option key={k} value={k}>{t("skill_" + k)}</option>)}</select></label>
        <label className="grid gap-1 text-sm">{t("role")}<select className="input" value={f.role} onChange={set("role")}>{["frontend", "backend", "fullstack"].map((k) => <option key={k} value={k}>{t("role_" + k)}</option>)}</select></label>
        <p className="text-xs text-gold/80">{t("starter_note")}</p>
        {err && <p role="alert" className="text-hot">{t("err_" + err)}</p>}
        <Button disabled={busy}>{t("create_account")}</Button>
        <Link href="/login" className="text-center text-sm underline">{t("has_account")}</Link>
      </form>
    </PublicShell>
  );
}
