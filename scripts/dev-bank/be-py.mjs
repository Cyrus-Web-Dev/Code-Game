// Backend — Python (dijalankan di python3 sungguhan) dan Node (proses nyata untuk process.nextTick).
import { spawnSync } from "node:child_process";
import { ri, pk, shuf, sample, chance, mk, runPy, perturb } from "./engine.mjs";

const py = (code) => { const r = runPy(code); return r && r.length ? r : null; };
const finish = (code, hintExp, hint, extraAlts = []) => {
  const r = py(code); if (!r) return null; const c = r.join(" | ");
  const alts = [...extraAlts.map((x) => py(x)).filter(Boolean).map((x) => x.join(" | ")).filter((x) => x !== c), ...perturb(c)];
  return mk("output", "Apa output kode Python ini?", code, "python", c, alts, `${hintExp} Hasil: ${c}.`, hint);
};

export const pyTraps = {
  id: "be-python",
  gen: async () => {
    const t = ri(0, 11), n = ri(2, 5), k = ri(1, 9), nm = pk(["tas", "daftar", "rak", "keranjang"]);
    const T = [
      () => finish(`def tambah(x, ${nm}=[]):\n    ${nm}.append(x)\n    return len(${nm})\n\nprint(tambah(${k}), tambah(${k + 1}), tambah(${k + 2}, []), tambah(${k + 3}))`, "Nilai default dievaluasi SEKALI saat fungsi didefinisikan, jadi list default dipakai bersama antar panggilan; list yang dikirim eksplisit tidak ikut.", "Kapan nilai default dievaluasi?"),
      () => finish(`fs = [lambda: i * ${k} for i in range(${n})]\ngs = [lambda i=i: i * ${k} for i in range(${n})]\nprint([f() for f in fs], [g() for g in gs])`, "Closure Python mengikat variabel (late binding), bukan nilainya; default argumen menangkap nilai saat definisi.", "Kapan i dibaca oleh lambda?"),
      () => finish(`a = [[0] * ${n}] * 2\na[0][${n - 1}] = ${k}\nb = [[0] * ${n} for _ in range(2)]\nb[0][${n - 1}] = ${k}\nprint(a == b, a, b)`, "[[0]*n]*2 menggandakan referensi ke SATU list yang sama; comprehension membuat list baru tiap iterasi.", "Berapa objek list yang sebenarnya dibuat?"),
      () => finish(`def f():\n    try:\n        return "try"\n    finally:\n        print("fin")\n\ndef g():\n    for i in range(${n}):\n        try:\n            if i == ${n - 1}: return i\n        finally:\n            continue\n    return "akhir"\n\nprint(f(), g())`, "finally selalu berjalan sebelum return keluar; continue/return di finally membatalkan return yang sedang tertunda.", "Apa yang terjadi pada return yang tertunda saat finally menjalankan continue?"),
      () => finish(`g = (x * ${k} for x in range(${n}))\nprint(sum(g), list(g), sum(g) == 0)`, "Generator hanya bisa dilalui sekali; setelah habis, iterasi berikutnya kosong.", "Apakah generator bisa diulang?"),
      () => finish(`print(round(${ri(0, 6)}.5), round(${ri(0, 6)}.5), round(-0.5), ${k}.0 // 2, -${k} // 2, -${k} % 3, divmod(-${k}, 3))`, "round() memakai pembulatan bankir (setengah ke genap); // adalah floor division sehingga hasil negatif dibulatkan ke bawah; % mengikuti tanda pembagi.", "Pembulatan .5 ke genap; // membulatkan ke -∞."),
      () => finish(`class Keranjang:\n    isi = []\n    def __init__(self, n):\n        self.n = n\n    def tambah(self, x):\n        self.isi.append(x)\n        self.n += 1\na, b = Keranjang(${k}), Keranjang(${k + 1})\na.tambah("x"); b.tambah("y"); b.tambah("z")\nprint(a.isi, a.n, b.n, Keranjang.n if hasattr(Keranjang, "n") else "tak ada")`, "isi adalah atribut kelas yang dipakai bersama; self.n += 1 membuat atribut instance baru, tidak mengubah kelas.", "Atribut kelas vs atribut instance."),
      () => finish(`x = ${k}\ndef f():\n    try:\n        print(x)\n    except UnboundLocalError:\n        print("unbound")\n    x = ${k + 1}\nf()\nprint([x for x in range(${n})][-1], x)`, "Variabel yang ditugaskan di dalam fungsi bersifat lokal di SELURUH fungsi sehingga membaca sebelum tugas melempar UnboundLocalError; comprehension punya scope sendiri.", "Satu fungsi, satu scope lokal: kapan Python memutuskan variabel itu lokal?"),
      () => finish(`kata = ["kopi", "teh", "susu", "air", "jus", "kola"]\nprint(sorted(kata, key=len), sorted(kata, key=lambda s: (-len(s), s))[:${n}])`, "sorted() stabil: elemen dengan kunci sama mempertahankan urutan semula.", "Apa arti sort stabil?"),
      () => finish(`def a(f):\n    def w(*x):\n        print("a"); return f(*x)\n    return w\ndef b(f):\n    def w(*x):\n        print("b"); return f(*x)\n    return w\n@a\n@b\ndef hitung(v):\n    return v * ${k}\nprint(hitung(${n}))`, "Dekorator ditumpuk dari bawah ke atas saat dibungkus, tetapi saat dipanggil lapisan paling luar (a) berjalan lebih dulu.", "Siapa pembungkus terluar?"),
      () => finish(`d = {"a": ${k}, "b": ${k + 1}}\nd.pop("a"); d["a"] = ${k + 2}\nx = {**d, "b": 0, "c": 1}\nprint(list(d), x, d.setdefault("z", ${n}), d.get("q", -1))`, "Dict menjaga urutan penyisipan; kunci yang dihapus lalu dimasukkan lagi pindah ke akhir; {**d, ...} menimpa dengan nilai belakangan.", "Urutan dict = urutan penyisipan."),
      () => finish(`a = list(range(${n * 3}))\nprint(a[::-${ri(2, 3)}], a[-${n}:-1], a[${n}:100][:2], a[::${n}])`, "Slicing aman terhadap batas; langkah negatif menelusuri dari belakang dan indeks negatif dihitung dari akhir.", "Hitung indeks negatif dari akhir list."),
    ];
    return T[t]();
  },
};

// Node asli (bukan vm) agar process.nextTick tersedia.
export const nodeTicks = {
  id: "be-node",
  gen: async () => {
    const lab = sample("ABCDEFG".split(""), 5); let i = 0; const L = () => lab[i++];
    const parts = []; for (let k = 0; k < ri(4, 5); k++) { const a = L(); parts.push(pk([`console.log("${a}");`, `process.nextTick(() => console.log("${a}"));`, `Promise.resolve().then(() => console.log("${a}"));`, `queueMicrotask(() => console.log("${a}"));`, `process.nextTick(() => { console.log("${a}"); Promise.resolve().then(() => console.log("${L()}")); });`])); }
    const code = parts.join("\n");
    const r = spawnSync("node", ["-e", code], { encoding: "utf8", timeout: 4000 }); if (r.status !== 0) return null;
    const out = r.stdout.trim().split("\n"); const c = out.join(" ");
    const src = [...code.matchAll(/console\.log\("([A-G])"\)/g)].map((m) => m[1]).join(" ");
    const noTick = out.slice().sort().join(" ");
    return mk("output", "Urutan output kode Node.js (CommonJS) ini?", code, "javascript", c, [src, noTick, ...perturb(c)],
      `Urutan: ${c}. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.`, "Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?");
  },
};

export const BE_PY = [pyTraps, nodeTicks];
