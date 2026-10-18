"use client";
import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import PublicShell from "@/components/PublicShell";
import { Button } from "@/components/ui/button";
import { useT } from "@/lib/i18n";
import { useUser } from "@/lib/store";
import { api } from "@/lib/supabase";
export default function Login() {
  const t = useT(), router = useRouter();
  const [f, setF] = useState({ username: "", password: "" });
  const [err, setErr] = useState(""), [busy, setBusy] = useState(false);
  async function submit(e: React.FormEvent) {
    e.preventDefault(); setBusy(true); setErr("");
    const d: any = await api("/api/auth/login", f);
    if (d.error) { setErr(d.error); setBusy(false); return; }
    await useUser.getState().refresh(); router.push("/game");
  }
  return (
    <PublicShell>
      <form onSubmit={submit} className="grid gap-3 rounded-lg border border-line bg-panel/80 p-6 backdrop-blur">
        <h1 className="font-display text-3xl text-gold">{t("login")}</h1>
        <label className="grid gap-1 text-sm">{t("username")}<input className="input" autoComplete="username" required value={f.username} onChange={(e) => setF({ ...f, username: e.target.value })} /></label>
        <label className="grid gap-1 text-sm">{t("password")}<input className="input" type="password" autoComplete="current-password" required value={f.password} onChange={(e) => setF({ ...f, password: e.target.value })} /></label>
        {err && <p role="alert" className="text-hot">{t("err_" + err)}</p>}
        <Button disabled={busy}>{t("login")}</Button>
        <Link href="/forgot" className="text-center text-sm underline text-paper/70">{t("forgot_link")}</Link>
        <Link href="/register" className="text-center text-sm underline">{t("no_account")}</Link>
      </form>
    </PublicShell>
  );
}
