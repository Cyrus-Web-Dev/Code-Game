import type { Config } from "tailwindcss";
import animate from "tailwindcss-animate";
export default {
  content: ["./src/**/*.{ts,tsx}"],
  theme: { extend: {
    colors: { ink: "#15131f", panel: "#1f1c2e", line: "#363150", paper: "#ece6d8", hot: "#ff5c8a", mint: "#6ee7c8", gold: "#f5c451" },
    fontFamily: { sans: ["var(--font-sans)"], mono: ["var(--font-mono)"], display: ["var(--font-display)"] },
  } },
  plugins: [animate],
} satisfies Config;
