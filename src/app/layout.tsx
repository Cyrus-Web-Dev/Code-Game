import "./globals.css";
import type { Metadata, Viewport } from "next";
import { Space_Grotesk, JetBrains_Mono, Fraunces } from "next/font/google";
import Providers from "@/components/Providers";
const sans = Space_Grotesk({ subsets: ["latin"], variable: "--font-sans" });
const mono = JetBrains_Mono({ subsets: ["latin"], variable: "--font-mono" });
const display = Fraunces({ subsets: ["latin"], variable: "--font-display" });
export const metadata: Metadata = { title: "Kode Tebak", description: "Tebak bahasa pemrograman atau framework dari potongan kode." };
export const viewport: Viewport = { themeColor: "#15131f" };
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="id"><body className={`${sans.variable} ${mono.variable} ${display.variable}`}><Providers>{children}</Providers></body></html>
  );
}
