// Frontend — famili JavaScript runtime. Semua jawaban = hasil menjalankan kode di Node.
import { rnd, ri, pk, shuf, sample, chance, runJS, mk, L } from "./engine.mjs";

const lines = (a) => a.join(" ");
const tokPerturb = (line) => { const t = line.split(" "); const out = new Set(); for (let k = 0; k < 6; k++) { const u = [...t]; const i = ri(0, u.length - 1); const j = ri(0, u.length - 1); if (rnd() < 0.5) [u[i], u[j]] = [u[j], u[i]]; else u[i] = u[i] === "true" ? "false" : u[i] === "false" ? "true" : /^\d+$/.test(u[i]) ? String(+u[i] + ri(1, 2)) : u[i] === "undefined" ? "null" : u[i]; if (u.join(" ") !== line) out.add(u.join(" ")); } return [...out]; };
const kindOf = (x) => (/^\d/.test(x) ? "n" : /Error/.test(x) ? "e" : "w");
const likeFirst = (c, pool) => { const k = kindOf(String(c).split(" ")[0]), wc = String(c).split(" ").length; const rest = pool.filter((x) => x !== c); const score = (x) => (kindOf(x.split(" ")[0]) === k ? 0 : 2) + (x.split(" ").length === wc ? 0 : 1); return shuf(rest).sort((a, b) => score(a) - score(b)); };
const swapAdj = (a) => { const b = [...a]; if (b.length < 2) return b; const i = ri(0, b.length - 2); [b[i], b[i + 1]] = [b[i + 1], b[i]]; return b; };

export const eventLoop = {
  id: "fe-eventloop",
  gen: async () => {
    const letters = sample("ABCDEFGH".split(""), ri(5, 7));
    let li = 0; const nx = () => letters[li++];
    const kinds = ["sync", "timeout", "then", "micro", "asyncfn", "thenNested", "timeoutNested"];
    const parts = []; const n = ri(4, 5);
    for (let i = 0; i < n; i++) {
      const k = pk(kinds), a = nx();
      if (k === "sync") parts.push(`console.log("${a}");`);
      else if (k === "timeout") parts.push(`setTimeout(() => console.log("${a}"), 0);`);
      else if (k === "then") parts.push(`Promise.resolve().then(() => console.log("${a}"));`);
      else if (k === "micro") parts.push(`queueMicrotask(() => console.log("${a}"));`);
      else if (k === "asyncfn") { const b = nx(); parts.push(`(async () => {\n  console.log("${a}");\n  await null;\n  console.log("${b}");\n})();`); }
      else if (k === "thenNested") { const b = nx(); parts.push(`Promise.resolve().then(() => {\n  console.log("${a}");\n  queueMicrotask(() => console.log("${b}"));\n});`); }
      else { const b = nx(); parts.push(`setTimeout(() => {\n  console.log("${a}");\n  Promise.resolve().then(() => console.log("${b}"));\n}, 0);`); }
    }
    const code = parts.join("\n");
    const res = await runJS(code);
    if (res.length < 4 || res.some((x) => x.startsWith("!"))) return null;
    const src = [...code.matchAll(/console\.log\("([A-H])"\)/g)].map((m) => m[1]); // urutan tulis di sumber
    const wrongTimer = [...res.filter((x) => !code.includes(`setTimeout(() => console.log("${x}")`)), ...res.filter((x) => code.includes(`setTimeout(() => console.log("${x}")`))];
    return mk("output", "Urutan output kode ini saat dijalankan di browser/Node?", code, "javascript", lines(res), [lines(src), lines(swapAdj(res)), lines(wrongTimer)],
      `Urutan nyata: ${lines(res)}. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.`,
      "Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.");
  },
};

export const closureLoop = {
  id: "fe-closure",
  gen: async () => {
    const decl = pk(["var", "let"]), s = ri(0, 2), e = s + ri(3, 4), k = pk([1, 2, 10]);
    const body = (d) => `const fns = [];\nfor (${d} i = ${s}; i < ${e}; i++) {\n  fns.push(() => i * ${k});\n}\nconsole.log(fns.map((f) => f()).join(","));`;
    const [a] = await runJS(body(decl)); const [b] = await runJS(body(decl === "var" ? "let" : "var"));
    const shifted = Array.from({ length: e - s }, (_, j) => (s + j + 1) * k).join(",");
    return mk("output", "Apa output kode ini?", body(decl), "javascript", a, [b, shifted],
      decl === "var" ? `var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = ${e}, jadi semua closure menghasilkan ${e * k}.` : `let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.`,
      "Berapa banyak variabel i yang sebenarnya ada?");
  },
};

export const thisBinding = {
  id: "fe-this",
  gen: async () => {
    const V = ri(2, 99), W = ri(100, 199), Z = ri(200, 299);
    const t = ri(0, 4);
    const codes = [
      `"use strict";\nconst o = { n: ${V}, get() { return this.n; } };\nconst g = o.get;\ntry { console.log(g()); } catch (e) { console.log(e.name); }`,
      `"use strict";\nconst o = {\n  n: ${V},\n  list() { return [1].map(() => this.n)[0]; },\n};\nconsole.log(o.list());`,
      `"use strict";\nconst o = { n: ${V}, get() { return this.n; } };\nconst g = o.get.bind({ n: ${W} });\nconsole.log(g.call({ n: ${Z} }));`,
      `"use strict";\nclass A {\n  n = ${V};\n  h = () => this.n;\n  m() { return this.n; }\n}\nconst { h, m } = new A();\ntry { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }`,
      `"use strict";\nfunction buat() {\n  return { n: ${V}, get: () => this.n };\n}\nconst o = buat.call({ n: ${W} });\nconsole.log(o.get(), o.n);`,
    ];
    const code = codes[t]; const [a] = await runJS(code);
    const pool = [String(V), String(W), String(Z), "undefined", "TypeError", `${V} TypeError`, `${V} undefined`, "object", "ReferenceError"];
    const why = [
      "g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.",
      "Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().",
      "bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.",
      "h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.",
      "Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.",
    ][t];
    return mk("output", "Apa output kode ini?", code, "javascript", a, likeFirst(a, pool), why, "Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?");
  },
};

export const hoisting = {
  id: "fe-hoist",
  gen: async () => {
    const v = pk(["harga", "stok", "skor", "kuota"]), n = ri(2, 90), t = ri(0, 5);
    const codes = [
      `try {\n  console.log(typeof ${v});\n  var ${v} = ${n};\n  console.log(typeof ${v});\n} catch (e) { console.log(e.name); }`,
      `try {\n  console.log(typeof ${v});\n  let ${v} = ${n};\n} catch (e) { console.log(e.name); }`,
      `function ${v}() { return ${n}; }\nvar ${v};\nconsole.log(typeof ${v}, ${v}());`,
      `try {\n  console.log(${v}());\n  var ${v} = function () { return ${n}; };\n} catch (e) { console.log(e.name); }`,
      `try {\n  const o = new Kelas(${n});\n  class Kelas { constructor(x) { this.x = x; } }\n  console.log(o.x);\n} catch (e) { console.log(e.name); }`,
      `var ${v} = ${n};\n(function () {\n  console.log(${v});\n  var ${v} = ${n + 1};\n})();`,
    ];
    const [a] = await runJS(codes[t]); const res = (await runJS(codes[t])).join(" ");
    const pool = ["undefined", "ReferenceError", "TypeError", "number", "function", "undefined number", "function number", String(n), String(n + 1), "undefined function"];
    return mk("output", "Apa output kode ini?", codes[t], "javascript", res, likeFirst(res, pool),
      ["var di-hoist dan bernilai undefined sebelum baris deklarasi; typeof pertama 'undefined', lalu 'number'.", "let ada di TDZ sebelum deklarasi; typeof pun melempar ReferenceError.", "Deklarasi function diangkat penuh; 'var v;' tanpa nilai tidak menimpa. Hasilnya function lalu nilai kembaliannya.", "var v di-hoist sebagai undefined, jadi memanggil v() = memanggil undefined → TypeError.", "class berada di TDZ sebelum deklarasinya → ReferenceError.", "var di dalam fungsi menutupi variabel luar dan di-hoist sebagai undefined, bukan nilai luar."][t],
      "Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?");
  },
};

const OPERANDS = ["[]", "{}", '"5"', "5", "null", "undefined", "true", "false", '"a"', "[1]", "[1,2]", '""', "0", "NaN", '" "', "[[]]", "[0]"];
const OPS = ["+", "-", "*", "==", "<", ">=", "==="];
export const coercion = {
  id: "fe-coercion",
  gen: async () => {
    const CLASSIC = ["[] + {}", "[] == ![]", '"b" + "a" + +"a" + "a"', "0.1 + 0.2 === 0.3", "typeof null", "[1, 2] + [3]", '"3" + 4 + 5', '3 + 4 + "5"', "null == 0", "null >= 0", "undefined == null", "[10, 9, 1].sort()", '"10" > "9"', '+"  42  "', 'parseInt("0x1f")', "1 / 0 - 1 / 0", "[] + []", "{} + []", "[0] == false", '"" == 0', "NaN != NaN", "[2] * [3]", 'true + true', '"5" - - "2"', "typeof NaN", "[,].length", "-0 === 0", "Object.is(-0, 0)", "9007199254740993 === 9007199254740992", "0.1 * 3", "[1, 2, 3] == \"1,2,3\"", "(() => {}).length", "[...\"ab\"].length + \"ab\".length"];
    const exprs = Array.from({ length: 7 }, () => (chance(0.65) ? pk(CLASSIC) : `${pk(OPERANDS)} ${pk(OPS)} ${pk(OPERANDS)}`));
    const chosen = [];
    const vals = [];
    for (const ex of exprs) { const r = await runJS(`console.log(String(${ex}))`, 0); if (r[0] && !r[0].startsWith("!")) { chosen.push(ex); vals.push(r[0]); } if (chosen.length === 3) break; }
    if (chosen.length < 3) return null;
    const code = chosen.map((c) => `console.log(${c});`).join("\n");
    const outs = []; for (const c of chosen) outs.push((await runJS(`console.log(${c})`, 0))[0]);
    const correct = outs.join(" | ");
    const alts = vals.filter((v) => !outs.includes(v));
    const bad = (i) => outs.map((o, j) => (j === i ? (o === "true" ? "false" : o === "false" ? "true" : o === "NaN" ? "0" : pk(["NaN", "true", "false", "0", "[object Object]", "5"].filter((x) => x !== o))) : o)).join(" | ");
    return mk("output", "Apa output tiga baris ini (urut, dipisah |)?", code, "javascript", correct, [bad(0), bad(1), bad(2)].filter((x) => x !== correct),
      `Hasil nyata: ${correct}. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.`,
      "Terapkan ToPrimitive: [] → \"\", {} → \"[object Object]\". + vs - berbeda perilakunya.");
  },
};

export const arrayObject = {
  id: "fe-array",
  gen: async () => {
    const t = ri(0, 8), a = Array.from({ length: ri(4, 6) }, () => ri(1, 120));
    const T = [
      () => `const a = [${a}];\na.sort();\nconsole.log(a.join(","));`,
      () => `console.log(${JSON.stringify(a.map(String))}.map(parseInt).join(","));`,
      () => { const i = ri(0, 2), d = ri(1, 2), x = ri(500, 999); return `const a = [${a}];\nconst r = a.splice(${i}, ${d}, ${x});\nconsole.log(JSON.stringify(a), JSON.stringify(r));`; },
      () => `const o = { b: 1, 20: "x", a: 2, 3: "y", 100: "z" };\nconsole.log(Object.keys(o).join(","));`,
      () => { const n = ri(2, 5); return `const a = Array(${n}).map((_, i) => i * 2);\nconsole.log(a.length, a.filter(() => true).length, JSON.stringify(a));`; },
      () => `const s = { n: { x: ${a[0]} }, y: ${a[1]} };\nconst c = { ...s };\nc.n.x++; c.y++;\nconsole.log(s.n.x, s.y);`,
      () => `const x = [${a.slice(0, 3)}];\nx.length = ${ri(1, 2)};\nx[${ri(3, 4)}] = 0;\nconsole.log(x.length, JSON.stringify(x));`,
      () => `try {\n  console.log([].reduce((p, c) => p + c));\n} catch (e) { console.log(e.name); }\nconsole.log([].reduce((p, c) => p + c, ${a[0]}));`,
      () => `console.log(new Set([${a[0]}, "${a[0]}", ${a[0]}, NaN, NaN, ${a[1]}]).size, [NaN].includes(NaN), [NaN].indexOf(NaN));`,
    ];
    const code = T[t](); const res = await runJS(code);
    if (!res.length || res[0].startsWith("!")) return null;
    const correct = res.join(" | ");
    const wr = [res.map((x) => x.replace(/\d+/, (m) => String(+m + 1))).join(" | "), res.map((x) => x.split(",").reverse().join(",")).join(" | "), res.map((x) => x.replace(/NaN/g, "0").replace(/true/, "false")).join(" | ")];
    return mk("output", "Apa output kode ini?", code, "javascript", correct, wr, `Dijalankan langsung: ${correct}.`, "Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.");
  },
};

export const nullish = {
  id: "fe-nullish",
  gen: async () => {
    const vals = ["0", '""', "false", "null", "undefined", "NaN", "[]", '"0"'];
    const [x, y] = sample(vals, 2), d = ri(2, 9);
    const mkc = (A, B, def) => `const f = (v${def ? ` = ${d}` : ""}) => ({ a: v ${A} "dflt", b: v ${B} "dflt", c: v?.length });\nconsole.log(JSON.stringify(f(${x})), JSON.stringify(f(${y})));`;
    const code = mkc("??", "||", true);
    const res = await runJS(code); if (!res.length || res[0].startsWith("!")) return null;
    const alt = await runJS(mkc("||", "??", true)), alt2 = await runJS(mkc("??", "||", false)), alt3 = await runJS(mkc("||", "||", true));
    return mk("output", "Apa output kode ini?", code, "javascript", res[0], [alt[0], alt2[0], alt3[0]], `Hasil: ${res[0]}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.`, "Parameter default aktif untuk apa saja? Bedakan ?? dan ||.");
  },
};

export const promiseComb = {
  id: "fe-promise",
  gen: async () => {
    const m = pk(["all", "allSettled", "race", "any"]), ds = shuf([5, 10, 15]), st = Array.from({ length: 3 }, () => chance(0.4));
    if (m === "all" || m === "any") st[ri(0, 2)] = m === "all";
    const mkT = (i) => `${st[i] ? "bad" : "ok"}("${"ABC"[i]}", ${ds[i]})`;
    const head = `const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));\nconst bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));\n`;
    const build = (mm) => `${head}Promise.${mm}([${[0, 1, 2].map(mkT).join(", ")}])\n  .then((r) => console.log("ok", JSON.stringify(${mm === "allSettled" ? 'r.map((x) => x.status[0] + (x.value ?? x.reason.message))' : "r"})))\n  .catch((e) => console.log("err", e.message));`;
    const code = build(m); const res = await runJS(code, 90);
    if (!res.length || res[0].startsWith("!")) return null;
    const others = []; for (const mm of ["all", "allSettled", "race", "any"].filter((x) => x !== m)) others.push((await runJS(build(mm), 90))[0]);
    return mk("output", "Apa output kode ini?", code, "javascript", res[0], others,
      `Promise.${m} menghasilkan: ${res[0]}. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.`,
      "Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?");
  },
};

export const asyncFlow = {
  id: "fe-async",
  gen: async () => {
    const t = ri(0, 4), a = ri(1, 9), b = ri(10, 99);
    const T = [
      `function f() {\n  try { return "t${a}"; } finally { console.log("fin"); }\n}\nconsole.log(f());`,
      `function f() {\n  try { throw new Error("x"); } catch { return "c${a}"; } finally { return "f${b}"; }\n}\nconsole.log(f());`,
      `Promise.resolve(${a})\n  .then((v) => { throw new Error("e" + v); })\n  .then(() => console.log("A"))\n  .catch((e) => e.message)\n  .then((m) => console.log("B", m));`,
      `Promise.resolve(${a})\n  .finally(() => ${b})\n  .then((v) => console.log("v", v));`,
      `(async () => {\n  try {\n    await Promise.reject(new Error("r${a}"));\n  } catch (e) {\n    console.log("c", e.message);\n  } finally {\n    console.log("f");\n  }\n  console.log("end");\n})();\nconsole.log("sync");`,
    ];
    const res = await runJS(T[t]); if (!res.length || res[0].startsWith("!")) return null; const c = res.join(" | ");
    const w = [res.slice().reverse().join(" | "), res.map((x) => x.replace(/\d+/, (m) => String(+m + 1))).join(" | "), res.slice(0, -1).join(" | ") || "undefined"];
    return mk("output", "Apa output kode ini?", T[t], "javascript", c, w, `Dijalankan: ${c}.`, "return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.");
  },
};

export const protoClass = {
  id: "fe-class",
  gen: async () => {
    const n = ri(1, 9), t = ri(0, 2);
    const T = [
      `class A {\n  x = (console.log("A.field"), ${n});\n  constructor() { console.log("A.ctor"); this.init(); }\n  init() { console.log("A.init"); }\n}\nclass B extends A {\n  y = (console.log("B.field"), ${n + 1});\n  constructor() { super(); console.log("B.ctor", this.y); }\n  init() { console.log("B.init", this.y); }\n}\nnew B();`,
      `class A {\n  static c = 0;\n  constructor() { A.c++; this.id = A.c; }\n  get tag() { return "A" + this.id; }\n}\nclass B extends A { get tag() { return super.tag + "b"; } }\nconst x = new A(), y = new B(), z = new B();\nconsole.log(x.tag, y.tag, z.tag, A.c, y instanceof A, Object.getPrototypeOf(B) === A);`,
      `function P(n) { this.n = n; }\nP.prototype.get = function () { return this.n; };\nconst p = new P(${n});\nconst q = Object.create(p);\nq.n = ${n + 5};\ndelete q.n;\nconsole.log(q.get(), q.hasOwnProperty("n"), "get" in q);`,
    ];
    const res = await runJS(T[t]); if (!res.length || res[0].startsWith("!")) return null; const c = res.join(" | ");
    const wr = res.length > 1 ? [res.slice().reverse().join(" | "), res.map((x) => x.replace(/undefined/g, String(n + 1)).replace(/true/g, "false")).join(" | "), swapAdj(res).join(" | ")] : tokPerturb(res[0]);
    return mk("output", "Apa output kode ini (baris dipisah |)?", T[t], "javascript", c, wr,
      `Hasil: ${c}. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.`, "Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?");
  },
};

export const jsonQuirks = {
  id: "fe-json",
  gen: async () => {
    const n = ri(1, 50), t = ri(0, 3);
    const T = [
      `console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, ${n}], e: null }));`,
      `const o = { n: ${n}, toJSON() { return { v: this.n * 2 }; } };\nconsole.log(JSON.stringify({ o, a: [o] }));`,
      `console.log(JSON.stringify({ b: ${n}, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\\u00e9\\n"));`,
      `console.log(JSON.stringify(JSON.parse('{"a":${n},"b":[1,2],"c":{"d":null}}', (k, v) => (typeof v === "number" ? v + 1 : v))));`,
    ];
    const res = await runJS(T[t]); if (!res.length || res[0].startsWith("!")) return null;
    const c = res[0];
    return mk("output", "Apa output kode ini?", T[t], "javascript", c, [c.replace(/null/, "undefined").replace(/\d+/, (m) => String(+m + 1)), c.replace(/"/g, "'"), c.replace(/[{}\[\]]/g, "")],
      `Hasil: ${c}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.`, "Bedakan perlakuan undefined di objek vs di array.");
  },
};

export const dateUTC = {
  id: "fe-date",
  gen: async () => {
    const y = pk([2023, 2024, 2025, 2028]), d = ri(29, 31), t = ri(0, 2);
    const T = [
      `const d = new Date(Date.UTC(${y}, 0, ${d}));\nd.setUTCMonth(1);\nconsole.log(d.toISOString().slice(0, 10));`,
      `const d = new Date(Date.UTC(${y}, ${ri(0, 11)}, 0));\nconsole.log(d.getUTCDate(), d.getUTCMonth());`,
      `const a = Date.UTC(${y}, 2, 1), b = Date.UTC(${y}, 1, 1);\nconsole.log((a - b) / 86400000);`,
    ];
    const res = await runJS(T[t]); const c = res[0];
    return mk("output", "Apa output kode ini?", T[t], "javascript", c, t === 0 ? ["" + y + "-02-" + d, "" + y + "-03-01", "" + y + "-03-0" + ri(4, 9)] : t === 1 ? [`${ri(1, 28)} ${ri(0, 11)}`, `0 ${ri(0, 11)}`, `31 ${ri(0, 11)}`] : ["28", "29", "30", "31"].filter((x) => x !== c),
      `Hasil: ${c}. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari ${y} punya ${(Date.UTC(y, 2, 1) - Date.UTC(y, 1, 1)) / 86400000} hari.`, "Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?");
  },
};

export const FE_JS = [eventLoop, closureLoop, thisBinding, hoisting, coercion, arrayObject, nullish, promiseComb, asyncFlow, protoClass, jsonQuirks, dateUTC];
