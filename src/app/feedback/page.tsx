"use client";
import { useRef, useState } from "react";
import Link from "next/link";
import { ImagePlus, X } from "lucide-react";
import PublicShell from "@/components/PublicShell";
import { Button } from "@/components/ui/button";
import { useT } from "@/lib/i18n";
import { useUser } from "@/lib/store";
import { api } from "@/lib/supabase";

const MAX_PHOTOS = 3;
/** Perkecil foto di perangkat sebelum dikirim (maks. 1280 px, JPEG): hemat kuota dan cukup jelas untuk bukti bug. */
async function compress(file: File): Promise<string> {
  const bmp = await createImageBitmap(file);
  const k = Math.min(1, 1280 / Math.max(bmp.width, bmp.height));
  const c = document.createElement("canvas");
  c.width = Math.max(1, Math.round(bmp.width * k)); c.height = Math.max(1, Math.round(bmp.height * k));
  c.getContext("2d")!.drawImage(bmp, 0, 0, c.width, c.height);
  bmp.close?.();
  let q = 0.82, url = c.toDataURL("image/jpeg", q);
  while (url.length > 880_000 && q > 0.4) { q -= 0.1; url = c.toDataURL("image/jpeg", q); }
  return url;
}

export default function Feedback() {
  const t = useT(), { status } = useUser();
  const [kind, setKind] = useState("saran"), [message, setMessage] = useState("");
  const [photos, setPhotos] = useState<string[]>([]), [note, setNote] = useState("");
  const [err, setErr] = useState(""), [sent, setSent] = useState(""), [busy, setBusy] = useState(false);
  const fileRef = useRef<HTMLInputElement>(null);

  async function pick(e: React.ChangeEvent<HTMLInputElement>) {
    const files: File[] = Array.from((e.target.files ?? []) as ArrayLike<File>); e.target.value = ""; setNote("");
    const room = MAX_PHOTOS - photos.length;
    if (files.length > room) setNote(t("f_photo_max"));
    const out: string[] = [];
    for (const f of files.slice(0, Math.max(room, 0))) {
      if (!f.type.startsWith("image/") || f.size > 15_000_000) { setNote(t("f_photo_bad")); continue; }
      try { out.push(await compress(f)); } catch { setNote(t("f_photo_bad")); }
    }
    if (out.length) setPhotos((p) => [...p, ...out].slice(0, MAX_PHOTOS));
  }
  async function submit(e: React.FormEvent) {
    e.preventDefault(); setBusy(true); setErr(""); setSent("");
    const d: any = await api("/api/feedback", { kind, message, images: photos });
    setBusy(false);
    if (d.error) return setErr(d.error);
    setSent(d.attached < d.requested ? t("f_sent_nophoto") : d.attached > 0 ? t("f_sent_photos", { n: d.attached }) : t("f_sent"));
    setMessage(""); setPhotos([]);
  }
  return (
    <PublicShell>
      <div className="grid gap-3 rounded-lg border border-line bg-panel/80 p-6 backdrop-blur">
        <h1 className="font-display text-3xl text-gold">{t("f_title")}</h1>
        <p className="text-sm text-paper/70">{t("f_desc")}</p>
        {status === "out" ? <p>{t("f_login")} <Link className="underline text-mint" href="/login">{t("login")}</Link></p> : (
          <form onSubmit={submit} className="grid gap-3">
            <label className="grid gap-1 text-sm">{t("f_kind")}<select className="input" value={kind} onChange={(e) => setKind(e.target.value)}>{["saran", "kritik", "bug"].map((k) => <option key={k} value={k}>{t("f_" + k)}</option>)}</select></label>
            <label className="grid gap-1 text-sm">{t("f_msg")}<textarea className="input min-h-32" required minLength={5} maxLength={2000} value={message} onChange={(e) => setMessage(e.target.value)} /></label>
            <div className="grid gap-2 text-sm">
              <span>{t("f_photo")}</span>
              {kind === "bug" && <span className="text-xs text-gold/90">{t("f_photo_hint")}</span>}
              <div className="flex flex-wrap items-center gap-2">
                {photos.map((src, i) => (
                  <div key={i} className="relative">
                    {/* eslint-disable-next-line @next/next/no-img-element */}
                    <img src={src} alt="" className="h-20 w-20 rounded-md border border-line object-cover" />
                    <button type="button" onClick={() => setPhotos((p) => p.filter((_, k) => k !== i))} aria-label={t("f_photo_remove")} className="absolute -right-2 -top-2 rounded-full border border-line bg-ink p-1 hover:border-hot"><X size={12} /></button>
                  </div>
                ))}
                {photos.length < MAX_PHOTOS && (
                  <button type="button" onClick={() => fileRef.current?.click()} className="flex h-20 w-20 flex-col items-center justify-center gap-1 rounded-md border border-dashed border-line text-xs text-paper/60 hover:border-mint hover:text-mint"><ImagePlus size={20} />{photos.length}/{MAX_PHOTOS}</button>
                )}
                <input ref={fileRef} type="file" accept="image/*" multiple hidden onChange={pick} />
              </div>
              {note && <span role="status" className="text-xs text-hot">{note}</span>}
            </div>
            {err && <p role="alert" className="text-hot">{t("err_" + err)}</p>}
            {sent && <p role="status" className="text-mint">{sent}</p>}
            <Button disabled={busy}>{t("f_send")}</Button>
          </form>
        )}
      </div>
    </PublicShell>
  );
}
