"use client";
import { Instagram, Mail, MessageCircle } from "lucide-react";
import PublicShell from "@/components/PublicShell";
import { useT } from "@/lib/i18n";

// GANTI dengan kontak asli developer sebelum deploy.
const CONTACT = {
  instagram: "https://instagram.com/cyrus_van_helheim",
  email: "lordkeyaruga01@gmail.com",
  whatsapp: "https://wa.me/62812xxxxxxx", // format internasional tanpa "+" atau "0" di depan
};

export default function Contact() {
  const t = useT();
  const links = [
    { href: CONTACT.instagram, icon: Instagram, label: "Instagram", color: "#E1306C" },
    { href: CONTACT.email, icon: Mail, label: t("c_email"), color: "#f5c451" },
    { href: CONTACT.whatsapp, icon: MessageCircle, label: "WhatsApp", color: "#25D366" },
  ];
  return (
    <PublicShell>
      <h1 className="font-display text-3xl">{t("c_title")}</h1>
      <p className="mt-2 text-sm text-paper/70">{t("c_desc")}</p>
      <div className="mt-6 grid gap-3">
        {links.map((l) => (
          <a key={l.label} href={l.href} target="_blank" rel="noopener noreferrer"
            className="card flex items-center gap-3 no-underline text-paper transition hover:border-gold/60">
            <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full" style={{ background: l.color + "22", color: l.color }}>
              <l.icon size={18} />
            </span>
            <span className="font-semibold">{l.label}</span>
          </a>
        ))}
      </div>
      <p className="mt-6 text-xs text-paper/50">{t("c_note")}</p>
    </PublicShell>
  );
}
