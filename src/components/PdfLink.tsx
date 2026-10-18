"use client";
import { useEffect, useState, type ReactNode } from "react";
import { PDFDownloadLink } from "@react-pdf/renderer";
import ProfilePdf from "./ProfilePdf";
import { dict } from "@/lib/i18n";
import type { Lang } from "@/lib/config";

// Foto kini berupa URL (/api/avatar?v=...) yang di-cache browser; react-pdf butuh data URL, jadi dikonversi dulu.
export default function PdfLink({ d, lang }: { d: any; lang: Lang }) {
  const T = dict[lang], url: string | null = d.profile.avatar_url || null;
  const [avatar, setAvatar] = useState<string | null | undefined>(undefined);
  useEffect(() => {
    let off = false;
    if (!url || url.startsWith("data:")) { setAvatar(url); return; }
    fetch(url).then((r) => (r.ok ? r.blob() : Promise.reject())).then((b) => new Promise<string>((res, rej) => { const fr = new FileReader(); fr.onload = () => res(String(fr.result)); fr.onerror = rej; fr.readAsDataURL(b); }))
      .then((v) => { if (!off) setAvatar(v); }).catch(() => { if (!off) setAvatar(null); });
    return () => { off = true; };
  }, [url]);
  if (avatar === undefined) return <span className="btn opacity-50">…</span>;
  const data = { ...d, profile: { ...d.profile, avatar_url: avatar } };
  return <PDFDownloadLink className="btn" document={<ProfilePdf d={data} lang={lang} />} fileName={`profil-${d.profile.username}.pdf`}>{(({ loading }: { loading: boolean }) => (loading ? T.p_pdf_wait : T.p_pdf)) as unknown as ReactNode}</PDFDownloadLink>;
}
