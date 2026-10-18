"use client";
import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import PublicShell from "@/components/PublicShell";
import { Button } from "@/components/ui/button";
import { useT } from "@/lib/i18n";
import { api } from "@/lib/supabase";
import langs from "@/data/languages.json";

const L = langs as { name: string; level: string | null }[];

type Method = "old_password" | "security";

export default function ForgotPassword() {
  const t = useT();
  const router = useRouter();
  const [step, setStep] = useState<1 | 2>(1);
  const [username, setUsername] = useState("");
  const [method, setMethod] = useState<Method>("security");
  const [oldPassword, setOldPassword] = useState("");
  const [favoriteLanguage, setFavoriteLanguage] = useState("");
  const [favoriteFramework, setFavoriteFramework] = useState("");
  const [role, setRole] = useState("fullstack");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [err, setErr] = useState("");
  const [ok, setOk] = useState(false);
  const [busy, setBusy] = useState(false);

  function goStep2(e: React.FormEvent) {
    e.preventDefault();
    setErr("");
    const u = username.trim().toLowerCase();
    if (!/^[a-z0-9_]{3,20}$/.test(u)) {
      setErr("USERNAME_INVALID");
      return;
    }
    setUsername(u);
    setStep(2);
  }

  async function submitReset(e: React.FormEvent) {
    e.preventDefault();
    setBusy(true);
    setErr("");
    setOk(false);

    if (newPassword.length < 8 || newPassword.length > 128) {
      setErr("PASSWORD_SHORT");
      setBusy(false);
      return;
    }
    if (newPassword !== confirmPassword) {
      setErr("PASSWORD_MISMATCH");
      setBusy(false);
      return;
    }

    const body: Record<string, string> = {
      username,
      method,
      newPassword,
    };
    if (method === "old_password") {
      body.oldPassword = oldPassword;
    } else {
      body.favoriteLanguage = favoriteLanguage;
      body.favoriteFramework = favoriteFramework;
      body.role = role;
    }

    const d: { error?: string; ok?: boolean } = await api("/api/auth/reset-password", body);
    if (d.error) {
      setErr(d.error);
      setBusy(false);
      return;
    }
    setOk(true);
    setBusy(false);
    setTimeout(() => router.push("/login"), 1800);
  }

  return (
    <PublicShell>
      <div className="grid gap-3 rounded-lg border border-line bg-panel/80 p-6 backdrop-blur">
        <h1 className="font-display text-3xl text-gold">{t("forgot_title")}</h1>
        <p className="text-sm text-paper/70">{t("forgot_desc")}</p>

        {step === 1 && (
          <form onSubmit={goStep2} className="grid gap-3">
            <label className="grid gap-1 text-sm">
              {t("username")}
              <input
                className="input"
                autoComplete="username"
                required
                minLength={3}
                maxLength={20}
                pattern="[A-Za-z0-9_]{3,20}"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
              />
              <span className="text-xs text-paper/60">{t("user_hint")}</span>
            </label>
            {err && (
              <p role="alert" className="text-hot">
                {t(("err_" + err) as "err_SERVER")}
              </p>
            )}
            <Button type="submit">{t("forgot_continue")}</Button>
            <Link href="/login" className="text-center text-sm underline">
              {t("back_to_login")}
            </Link>
          </form>
        )}

        {step === 2 && (
          <form onSubmit={submitReset} className="grid gap-3">
            <p className="text-sm">
              {t("forgot_for_user")}: <strong className="text-mint">{username}</strong>
              <button
                type="button"
                className="ml-2 text-xs underline text-paper/60"
                onClick={() => {
                  setStep(1);
                  setErr("");
                  setOk(false);
                }}
              >
                {t("forgot_change_user")}
              </button>
            </p>

            <fieldset className="grid gap-2 rounded-lg border border-line/60 p-3">
              <legend className="px-1 text-sm text-paper/80">{t("forgot_method")}</legend>
              <label className="flex items-start gap-2 text-sm cursor-pointer">
                <input
                  type="radio"
                  name="method"
                  className="mt-1"
                  checked={method === "security"}
                  onChange={() => setMethod("security")}
                />
                <span>{t("forgot_method_security")}</span>
              </label>
              <label className="flex items-start gap-2 text-sm cursor-pointer">
                <input
                  type="radio"
                  name="method"
                  className="mt-1"
                  checked={method === "old_password"}
                  onChange={() => setMethod("old_password")}
                />
                <span>{t("forgot_method_old")}</span>
              </label>
            </fieldset>

            {method === "old_password" ? (
              <label className="grid gap-1 text-sm">
                {t("old_password")}
                <input
                  className="input"
                  type="password"
                  autoComplete="current-password"
                  required
                  maxLength={128}
                  value={oldPassword}
                  onChange={(e) => setOldPassword(e.target.value)}
                />
              </label>
            ) : (
              <>
                <label className="grid gap-1 text-sm">
                  {t("fav_lang")}
                  <input
                    className="input"
                    required
                    maxLength={40}
                    list="dl-lang-forgot"
                    value={favoriteLanguage}
                    onChange={(e) => setFavoriteLanguage(e.target.value)}
                  />
                </label>
                <label className="grid gap-1 text-sm">
                  {t("fav_fw")}
                  <input
                    className="input"
                    required
                    maxLength={40}
                    list="dl-fw-forgot"
                    value={favoriteFramework}
                    onChange={(e) => setFavoriteFramework(e.target.value)}
                  />
                </label>
                <label className="grid gap-1 text-sm">
                  {t("role")}
                  <select className="input" value={role} onChange={(e) => setRole(e.target.value)}>
                    {["frontend", "backend", "fullstack"].map((k) => (
                      <option key={k} value={k}>
                        {t(("role_" + k) as "role_frontend")}
                      </option>
                    ))}
                  </select>
                </label>
                <datalist id="dl-lang-forgot">
                  {L.filter((x) => x.level && x.level !== "normal").map((x) => (
                    <option key={x.name} value={x.name} />
                  ))}
                </datalist>
                <datalist id="dl-fw-forgot">
                  {L.filter((x) => x.level === "normal").map((x) => (
                    <option key={x.name} value={x.name} />
                  ))}
                </datalist>
                <p className="text-xs text-paper/60">{t("forgot_security_hint")}</p>
              </>
            )}

            <label className="grid gap-1 text-sm">
              {t("new_password")}
              <input
                className="input"
                type="password"
                autoComplete="new-password"
                required
                minLength={8}
                maxLength={128}
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
              />
              <span className="text-xs text-paper/60">{t("pw_hint")}</span>
            </label>
            <label className="grid gap-1 text-sm">
              {t("confirm_password")}
              <input
                className="input"
                type="password"
                autoComplete="new-password"
                required
                minLength={8}
                maxLength={128}
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
              />
            </label>

            {err && (
              <p role="alert" className="text-hot">
                {t(("err_" + err) as "err_SERVER")}
              </p>
            )}
            {ok && (
              <p role="status" className="text-mint">
                {t("forgot_success")}
              </p>
            )}

            <Button type="submit" disabled={busy || ok}>
              {t("forgot_submit")}
            </Button>
            <Link href="/login" className="text-center text-sm underline">
              {t("back_to_login")}
            </Link>
          </form>
        )}
      </div>
    </PublicShell>
  );
}
