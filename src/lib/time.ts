/** Format "x menit/jam/hari lalu" dari selisih detik, memakai kamus i18n (t). */
export function agoText(seconds: number | null | undefined, t: (k: string, v?: Record<string, string | number>) => string) {
  if (seconds == null) return "";
  const s = Math.max(0, seconds);
  if (s < 60) return t("ago_now");
  if (s < 3600) return t("ago_min", { n: Math.floor(s / 60) });
  if (s < 86400) return t("ago_hour", { n: Math.floor(s / 3600) });
  return t("ago_day", { n: Math.floor(s / 86400) });
}
