"use client";
import { useEffect, useState } from "react";
export default function CodeBlock({ code, lang }: { code: string; lang?: string }) {
  const [html, setHtml] = useState("");
  useEffect(() => {
    let off = false;
    (async () => {
      const { codeToHtml } = await import("shiki");
      let out: string;
      try { out = await codeToHtml(code, { lang: lang || "text", theme: "tokyo-night" }); }
      catch { out = await codeToHtml(code, { lang: "text", theme: "tokyo-night" }); }
      if (!off) setHtml(out);
    })();
    return () => { off = true; };
  }, [code, lang]);
  if (!html) return <pre className="shiki font-mono whitespace-pre-wrap">{code}</pre>;
  return <div dangerouslySetInnerHTML={{ __html: html }} />;
}
