import Link from "next/link";
import type { LucideIcon } from "lucide-react";
import { cn } from "@/lib/utils";
type P = { icon: LucideIcon; children: React.ReactNode; href?: string; onClick?: () => void; primary?: boolean };
export default function MenuButton({ icon: Icon, children, href, onClick, primary }: P) {
  const cls = cn("flex w-full items-center justify-center gap-3 rounded-full border px-6 py-3 text-sm font-semibold transition focus-visible:outline focus-visible:outline-2 focus-visible:outline-gold",
    primary ? "border-gold bg-gradient-to-b from-[#f6d58e] to-[#d9a94d] text-ink hover:brightness-110" : "border-gold/40 bg-[#3a2a5c]/60 text-paper hover:border-gold hover:bg-[#4a3772]/70");
  const inner = <><Icon size={18} aria-hidden />{children}</>;
  return href ? <Link href={href} className={cls}>{inner}</Link> : <button onClick={onClick} className={cls}>{inner}</button>;
}
