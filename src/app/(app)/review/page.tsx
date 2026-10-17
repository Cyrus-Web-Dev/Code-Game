"use client";
import { useEffect, useState } from "react";
import { motion } from "framer-motion";
import { BookOpen, Check, X } from "lucide-react";
import { api } from "@/lib/supabase";
import { useT } from "@/lib/i18n";
import { THEMES, type Level } from "@/lib/config";
import CodeBlock from "@/components/CodeBlock";

type Item = {
  id: string; difficulty: string; prompt: string; code: string; language: string;
  options: string[]; correctIndex: number; chosenIndex: number | null; explanation: string;
};

export default function Review() {
  const t = useT();
  const [items, setItems] = useState<Item[] | null>(null);
  const [open, setOpen] = useState<string | null>(null);

  useEffect(() => { api("/api/review").then((d: any) => setItems(d.items ?? [])); }, []);

  if (!items) return (
    <div className="grid gap-3">
      <div className="skeleton h-10 w-56" />
      {[1,2,3].map(i => <div key={i} className="skeleton h-20" />)}
    </div>
  );

  return (
    <div className="grid gap-6">
      <div>
        <h1 className="font-display text-3xl text-gold flex items-center gap-2">
          <BookOpen size={28} />{t("review_title")}
        </h1>
        <p className="text-sm text-paper/60 mt-1">{t("review_desc")}</p>
      </div>

      {!items.length ? (
        <div className="card text-center py-12 text-paper/50">
          <p className="text-lg mb-1">{t("review_empty")}</p>
          <p className="text-sm">{t("review_empty_hint")}</p>
        </div>
      ) : (
        <div className="grid gap-3">
          {items.map((it, i) => {
            const th = THEMES[it.difficulty as Level] || THEMES.easy;
            const isOpen = open === it.id;
            return (
              <motion.div key={it.id} initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.03 }}
                className="card cursor-pointer" onClick={() => setOpen(isOpen ? null : it.id)}>
                <div className="flex items-start gap-3">
                  <span className="mt-1 h-2.5 w-2.5 rounded-full shrink-0" style={{ background: th.main }} />
                  <div className="flex-1 min-w-0">
                    <p className="font-medium text-sm leading-snug">{it.prompt}</p>
                    <p className="text-xs text-paper/50 mt-1 capitalize">{it.difficulty}</p>
                  </div>
                  <X size={16} className="text-hot shrink-0 mt-1" />
                </div>
                {isOpen && (
                  <div className="mt-4 grid gap-3 border-t border-line pt-4" onClick={(e) => e.stopPropagation()}>
                    <CodeBlock code={it.code} lang={it.language} />
                    <div className="grid gap-2 sm:grid-cols-3">
                      {it.options.map((o, idx) => (
                        <div key={idx} className={`opt-btn text-xs ${
                          idx === it.correctIndex ? "correct" : idx === it.chosenIndex ? "wrong" : "dim"
                        }`}>
                          {idx === it.correctIndex && <Check size={12} className="inline mr-1" />}
                          {idx === it.chosenIndex && idx !== it.correctIndex && <X size={12} className="inline mr-1" />}
                          {o}
                        </div>
                      ))}
                    </div>
                    {it.explanation && <p className="text-sm text-paper/70 rounded-lg bg-ink/40 p-3">{it.explanation}</p>}
                  </div>
                )}
              </motion.div>
            );
          })}
        </div>
      )}
    </div>
  );
}
