#!/usr/bin/env node
// Membuat data halaman Informasi tambahan: src/data/security-extra.json (tools non-pentest) dan src/data/roles.json (peran developer).
import { writeFileSync, readFileSync, mkdirSync } from "node:fs";
import { EXTRA, GROUPS, LEGACY_GROUP } from "./security-extra.mjs";
import { ROLES, COMPARE, FAQ } from "./role-info.mjs";
const L2 = (a) => ({ id: a[0], en: a[1] });
const legacy = JSON.parse(readFileSync(new URL("../src/data/security-tools.json", import.meta.url), "utf8")).map((x) => x.name.toLowerCase());
const errs = [];
const legacyNames = new Set(JSON.parse(readFileSync(new URL("../src/data/security-tools.json", import.meta.url), "utf8")).map((x) => x.name));
for (const [grp, names] of Object.entries(LEGACY_GROUP)) for (const n of names) if (!legacyNames.has(n)) errs.push(`LEGACY_GROUP: '${n}' tidak ada di security-tools.json`);
const tools = EXTRA.map(([name, group, cat, site, cmd, purpose, goal, use, tip]) => {
  if (legacy.includes(name.toLowerCase())) errs.push("duplikat dengan tools lama: " + name);
  if (!GROUPS[group]) errs.push("grup tak dikenal: " + name);
  if (!/^https:\/\//.test(site)) errs.push("situs harus https: " + name);
  return { name, group, cat, site, cmd, purpose: L2(purpose), goal: L2(goal), use: L2(use), tip: L2(tip) };
});
const roles = { roles: ROLES.map((r) => ({ id: r.id, icon: r.icon, color: r.color, name: L2(r.name), tagline: L2(r.tagline), what: L2(r.what), does: r.does.map(L2), skills: r.skills, tools: r.tools, day: r.day.map(L2), path: r.path.map(L2), pitfalls: r.pitfalls.map(L2), security: r.security.map(L2), secTools: r.secTools, master: L2(r.master) })),
  compare: COMPARE.map(([row, f, b, s]) => ({ row: L2(row), frontend: L2(f), backend: L2(b), fullstack: L2(s) })), faq: FAQ.map(([q, a]) => ({ q: L2(q), a: L2(a) })) };
const all = new Set([...legacy, ...tools.map((t) => t.name.toLowerCase())]);
for (const r of roles.roles) for (const n of r.secTools) if (!all.has(n.toLowerCase())) errs.push(`secTools '${n}' di peran ${r.id} tidak ada di data tools`);
if (errs.length) { console.error("GALAT:\n" + errs.join("\n")); process.exit(1); }
mkdirSync(new URL("../src/data/", import.meta.url), { recursive: true });
writeFileSync(new URL("../src/data/security-extra.json", import.meta.url), JSON.stringify({ legacy: Object.fromEntries(Object.entries(LEGACY_GROUP).flatMap(([g, ns]) => ns.map((n) => [n, g]))), groups: Object.fromEntries(Object.entries(GROUPS).map(([k, v]) => [k, { id: v.id, en: v.en }])), tools }));
writeFileSync(new URL("../src/data/roles.json", import.meta.url), JSON.stringify(roles));
console.log({ toolsBaru: tools.length, toolsLama: legacy.length, peran: roles.roles.length, banding: roles.compare.length, faq: roles.faq.length });
