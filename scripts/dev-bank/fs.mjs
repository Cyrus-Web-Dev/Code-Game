// Full Stack — soal lintas sisi (browser ↔ server). Aturan CORS, cookie, CSP, cache, JWT disimulasikan; URL dijalankan di Node nyata.
import { rnd, ri, pk, shuf, sample, chance, runJS, mk, perturb } from "./engine.mjs";

// ───────── CORS ─────────
const OUT = {
  same: "Same-origin: CORS tidak berlaku, request berhasil",
  ok: "Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript",
  pre: "Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil",
  blockResp: "Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript",
  blockPre: "Preflight gagal: request asli tidak pernah dikirim",
};
export const cors = {
  id: "fs-cors",
  gen: async () => {
    const origin = "https://app.toko.id", target = pk(["https://api.toko.id", "https://api.toko.id", "https://app.toko.id", "http://api.toko.id", "https://api.toko.id:8443"]);
    const method = pk(["GET", "POST", "POST", "PUT", "DELETE", "PATCH"]);
    const hdrs = sample([["Content-Type", "application/json"], ["Authorization", "Bearer abc"], ["X-Token", "t1"], ["Accept", "application/json"]], ri(0, 2));
    const cred = chance(0.5), sOrigin = pk([origin, origin, "*", "https://lain.id", null]);
    const acac = chance(0.6), acam = sample(["GET", "POST", "PUT", "DELETE", "PATCH"], ri(2, 3)), acah = sample(["content-type", "authorization", "x-token"], ri(1, 3));
    const cross = target.split("/")[2] !== origin.split("/")[2] || target.split(":")[0] !== origin.split(":")[0];
    const safeCT = (v) => ["text/plain", "application/x-www-form-urlencoded", "multipart/form-data"].includes(v);
    const nonSafe = hdrs.filter(([n, v]) => !(["Accept"].includes(n) || (n === "Content-Type" && safeCT(v))));
    const simple = ["GET", "HEAD", "POST"].includes(method) && nonSafe.length === 0;
    const originOk = sOrigin === origin || (sOrigin === "*" && !cred); const credOk = !cred || acac; const respOk = originOk && credOk;
    let out;
    if (!cross) out = OUT.same;
    else if (simple) out = respOk ? OUT.ok : OUT.blockResp;
    else { const methOk = ["GET", "HEAD", "POST"].includes(method) || acam.includes(method); const hOk = nonSafe.every(([n]) => acah.includes(n.toLowerCase())); out = respOk && methOk && hOk ? OUT.pre : OUT.blockPre; }
    const pre = !cross ? [] : simple ? [OUT.blockResp, OUT.blockPre] : [OUT.ok, OUT.blockResp, OUT.blockPre];
    const wrongs = shuf(Object.values(OUT).filter((x) => x !== out)).slice(0, 2);
    const call = `// halaman: ${origin}\nfetch("${target}/pesanan", {\n  method: "${method}",${hdrs.length ? `\n  headers: { ${hdrs.map(([n, v]) => `"${n}": "${v}"`).join(", ")} },` : ""}\n  credentials: "${cred ? "include" : "omit"}",\n});`;
    const srv = `// header respons server (preflight dan respons asli sama):\n${sOrigin ? `Access-Control-Allow-Origin: ${sOrigin}` : "(tanpa Access-Control-Allow-Origin)"}\n${acac ? "Access-Control-Allow-Credentials: true\n" : ""}Access-Control-Allow-Methods: ${acam.join(", ")}\nAccess-Control-Allow-Headers: ${acah.join(", ")}`;
    return mk("guess", "Apa yang terjadi?", `${call}\n\n${srv}`, "javascript", out, wrongs,
      `Same-origin = skema+host+port sama. Permintaan 'sederhana' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh '*' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.`,
      "Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?");
  },
};

// ───────── same-origin / same-site / SameSite cookie ─────────
const PSL = ["co.id", "web.id", "ac.id", "github.io", "vercel.app", "com", "id", "org", "net"];
const etld1 = (h) => { const parts = h.split("."); for (let i = 0; i < parts.length; i++) { if (PSL.includes(parts.slice(i).join("."))) return i === 0 ? h : parts.slice(i - 1).join("."); } return h; };
const PAIRS = [["https://app.toko.id", "https://api.toko.id"], ["https://toko.co.id", "https://cdn.toko.co.id"], ["https://ayu.github.io", "https://budi.github.io"], ["https://a.vercel.app", "https://b.vercel.app"], ["https://toko.com:3000", "https://toko.com:8080"], ["https://toko.com", "https://toko.org"], ["https://shop.toko.id", "https://toko.id"], ["https://kampus.ac.id", "https://lab.kampus.ac.id"], ["https://toko.id", "https://toko.id:8443"], ["https://toko.id", "https://toko.web.id"]];
const rel = (a, b) => { const A = new URL(a), B = new URL(b); const so = A.origin === B.origin, ss = etld1(A.hostname) === etld1(B.hostname); return { so, ss, label: so ? "same-origin (dan same-site)" : ss ? "cross-origin tetapi same-site" : "cross-origin dan cross-site" }; };
export const sameSite = {
  id: "fs-samesite",
  gen: async () => {
    const [a, b] = pk(PAIRS); const t = ri(0, 1);
    if (t === 0) { const r = rel(a, b); return mk("guess", "Hubungan kedua URL ini?", `halaman : ${a}\npermintaan: ${b}`, "text", r.label, ["same-origin (dan same-site)", "cross-origin tetapi same-site", "cross-origin dan cross-site"].filter((x) => x !== r.label), `Origin = skema+host+port; site = eTLD+1 (+ skema). ${new URL(a).hostname} → ${etld1(new URL(a).hostname)}, ${new URL(b).hostname} → ${etld1(new URL(b).hostname)}. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.`, "Public Suffix List menentukan batas site."); }
    const kind = pk([["pengguna mengeklik tautan (navigasi top-level GET)", "nav"], ["form POST top-level", "post"], ["fetch() dari JavaScript halaman", "fetch"], ["<img> yang dimuat halaman", "fetch"]]), ss = pk(["Strict", "Lax", "None"]);
    const r = rel(a, b); const sent = r.ss ? true : ss === "None" ? true : ss === "Lax" ? kind[1] === "nav" : false;
    return mk("guess", "Apakah cookie ini ikut dikirim pada permintaan ke " + new URL(b).host + "?", `halaman        : ${a}\n${kind[0]}\ntujuan         : ${b}\nSet-Cookie     : sid=1; SameSite=${ss}${ss === "None" ? "; Secure" : ""}; Domain milik tujuan`, "text", sent ? "Ya, cookie dikirim" : "Tidak, cookie tidak dikirim", [sent ? "Tidak, cookie tidak dikirim" : "Ya, cookie dikirim", "Hanya dikirim jika memakai HTTP/2"].slice(0, 2),
      `Hubungan: ${r.label}. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).`, "Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.");
  },
};

// ───────── scope cookie (Domain/Path/Secure/HttpOnly) ─────────
const pathMatch = (cp, rp) => rp === cp || (rp.startsWith(cp) && (cp.endsWith("/") || rp[cp.length] === "/"));
export const cookieScope = {
  id: "fs-cookie",
  gen: async () => {
    const setPath = pk(["/akun/profil", "/akun/profil", "/keranjang"]), dom = chance(0.5) ? "toko.id" : null, pth = chance(0.5) ? pk(["/akun", "/", "/akun/profil"]) : null, secure = chance(0.5), http = chance(0.5);
    const defPath = setPath.slice(0, setPath.lastIndexOf("/")) || "/"; const cpath = pth ?? defPath;
    const reqs = ["https://shop.toko.id/akun/pengaturan", "https://toko.id/akun/profil/edit", "https://toko.id/akunku", "http://shop.toko.id/akun/pengaturan", "https://shop.toko.id/", "https://api.toko.id/akun"];
    const u = new URL(pk(reqs)); const host = "shop.toko.id";
    const domOk = dom ? u.hostname === dom || u.hostname.endsWith("." + dom) : u.hostname === host;
    const sent = domOk && pathMatch(cpath, u.pathname) && (!secure || u.protocol === "https:");
    const code = `# dari halaman https://${host}${setPath}\nSet-Cookie: id=7${dom ? `; Domain=${dom}` : ""}${pth ? `; Path=${pth}` : ""}${secure ? "; Secure" : ""}${http ? "; HttpOnly" : ""}\n\n# permintaan berikutnya ke:\n${u.href}`;
    const t = chance(0.75);
    return t ? mk("guess", "Apakah cookie ini ikut terkirim pada permintaan tersebut?", code, "http", sent ? "Ya" : "Tidak", [sent ? "Tidak" : "Ya", "Tergantung SameSite saja"], `Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (${defPath}). Path cocok pada batas '/'. Secure butuh https. Hasil: ${sent ? "terkirim" : "tidak terkirim"}.`, "Cek berurutan: host, path (aturan batas '/'), skema.")
      : mk("guess", "Bisakah JavaScript di halaman penyetel membaca cookie ini lewat document.cookie?", `Set-Cookie: id=7${dom ? `; Domain=${dom}` : ""}${secure ? "; Secure" : ""}${http ? "; HttpOnly" : ""}\n// dari halaman https://${host}${setPath}`, "http", http ? "Tidak: HttpOnly menyembunyikannya dari JavaScript" : "Ya, bisa dibaca", [http ? "Ya, bisa dibaca" : "Tidak: hanya server yang bisa", "Hanya jika SameSite=None"], http ? "HttpOnly melarang akses skrip (membatasi dampak XSS) tetapi cookie tetap terkirim ke server." : "Tanpa HttpOnly, skrip pada halaman yang cocok domain/path bisa membacanya (risiko XSS).", "Atribut mana yang mengatur akses dari JavaScript?");
  },
};

// ───────── CSP ─────────
export const csp = {
  id: "fs-csp",
  gen: async () => {
    const tok = sample(["'self'", "https://cdn.toko.id", "'unsafe-inline'", "'nonce-r4nd'", "'unsafe-eval'"], ri(2, 3));
    const header = `Content-Security-Policy: default-src 'none'; script-src ${tok.join(" ")}`;
    const hasNonce = tok.includes("'nonce-r4nd'"), inlineOK = tok.includes("'unsafe-inline'") && !hasNonce;
    const RES = [
      ["A", `<script>inisiasi()</script>`, () => inlineOK],
      ["B", `<script nonce="r4nd">inisiasi()</script>`, () => hasNonce],
      ["C", `<script src="/app.js"></script>  <!-- same-origin -->`, () => tok.includes("'self'") || false],
      ["D", `<script src="https://cdn.toko.id/lib.js"></script>`, () => tok.includes("https://cdn.toko.id")],
      ["E", `<script src="https://evil.example/x.js"></script>`, () => false],
      ["F", `<button onclick="kirim()">OK</button>`, () => inlineOK],
      ["G", `eval("1 + 1")  // di dalam skrip yang diizinkan`, () => tok.includes("'unsafe-eval'")],
    ];
    const items = sample(RES, 5).sort((x, y) => x[0].localeCompare(y[0])); const blocked = items.filter((r) => !r[2]()).map((r) => r[0]);
    const allowed = items.filter((r) => r[2]()).map((r) => r[0]);
    const c = blocked.length ? blocked.join(" ") : "tidak ada";
    const labs = items.map((r) => r[0]); const swapSet = () => { const set = new Set(blocked); if (!set.size || set.size === labs.length) return null; const out = pk([...set]), inn = pk(labs.filter((x) => !set.has(x))); set.delete(out); set.add(inn); return labs.filter((x) => set.has(x)).join(" "); };
    const alts = Array.from({ length: 8 }, swapSet).filter(Boolean); if (!blocked.length) alts.push(labs[0], labs[1]);
    return mk("guess", "Sumber mana saja yang DIBLOKIR oleh kebijakan ini?", `${header}\n\n${items.map((r) => `${r[0]}. ${r[1]}`).join("\n")}`, "http", c, [...new Set(alts)],
      `Diblokir: ${c}. Aturan: skrip inline hanya jika 'unsafe-inline' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh 'unsafe-inline'; eval butuh 'unsafe-eval'; skrip eksternal harus cocok dengan sumber ('self' atau host). default-src 'none' menutup sisanya.`, "Apakah 'unsafe-inline' masih berlaku bila nonce ada?");
  },
};

// ───────── Cache HTTP ─────────
const CO = { mem: "Dilayani dari cache tanpa request ke jaringan", rev: "Request kondisional; server membalas 304 tanpa body", full: "Unduh penuh (200) dari server", swr: "Dilayani dari cache (basi) sekarang, revalidasi di latar belakang" };
export const httpCache = {
  id: "fs-cache",
  gen: async () => {
    const ctx = pk(["browser", "cdn"]), age = pk([30, 120, 600, 3600]), maxAge = pk([60, 300, 600, 3600, null]), sMax = chance(0.35) ? pk([60, 3600, 86400]) : null;
    const dirs = []; const noCache = chance(0.2), noStore = chance(0.12), priv = chance(0.2), swrW = chance(0.25) ? pk([60, 600]) : null, validator = chance(0.7);
    if (noStore) dirs.push("no-store"); if (noCache) dirs.push("no-cache"); if (priv) dirs.push("private"); if (maxAge != null) dirs.push(`max-age=${maxAge}`); if (sMax != null) dirs.push(`s-maxage=${sMax}`); if (swrW != null) dirs.push(`stale-while-revalidate=${swrW}`);
    if (!dirs.length) return null;
    const life = ctx === "cdn" ? (sMax ?? maxAge) : maxAge; let out;
    if (noStore || (ctx === "cdn" && priv)) out = CO.full;
    else if (noCache || life == null) out = validator ? CO.rev : CO.full;
    else if (age < life) out = CO.mem;
    else if (swrW != null && age < life + swrW) out = CO.swr;
    else out = validator ? CO.rev : CO.full;
    const code = `# respons disimpan ${age} detik yang lalu\nCache-Control: ${dirs.join(", ")}\n${validator ? 'ETag: "v7"' : "(tanpa ETag/Last-Modified)"}\n# resource di server TIDAK berubah; permintaan ulang oleh ${ctx === "cdn" ? "CDN (shared cache)" : "browser (private cache), navigasi biasa"}`;
    return mk("guess", "Apa yang terjadi pada permintaan ulang?", code, "http", out, shuf(Object.values(CO).filter((x) => x !== out)).slice(0, 2),
      `no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.`, "Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?");
  },
};

// ───────── Pagination offset vs cursor ─────────
export const pagination = {
  id: "fs-pagination",
  gen: async () => {
    const P = ri(4, 6), top = 100, k = ri(1, 3), mode = pk(["insert", "delete"]), kind = pk(["offset", "cursor"]);
    const items = Array.from({ length: 30 }, (_, i) => top - i); // terbaru dulu
    const p1 = items.slice(0, P); let now = [...items];
    if (mode === "insert") for (let i = 1; i <= k; i++) now.unshift(top + i); else now = now.slice(k);
    const offsetP2 = now.slice(P, 2 * P), cursorP2 = now.filter((x) => x < p1[p1.length - 1]).slice(0, P);
    const norm = items.slice(P, 2 * P);
    const used = kind === "offset" ? offsetP2 : cursorP2;
    const req = kind === "offset" ? `GET /item?limit=${P}&offset=${P}` : `GET /item?limit=${P}&sebelum_id=${p1[p1.length - 1]}`;
    const code = `# urut id menurun (terbaru dulu), halaman = ${P} item\nhalaman 1 → [${p1.join(", ")}]\n# lalu ${mode === "insert" ? `${k} item baru (id ${top + 1}${k > 1 ? `…${top + k}` : ""}) ditambahkan` : `${k} item teratas dihapus`} sebelum halaman 2 diminta\n${req}`;
    const c = `[${used.join(", ")}]`, alts = [`[${(kind === "offset" ? cursorP2 : offsetP2).join(", ")}]`, `[${norm.join(", ")}]`, `[${now.slice(P + 1, 2 * P + 1).join(", ")}]`, `[${now.slice(P - 1, 2 * P - 1).join(", ")}]`];
    return mk("output", "Item apa yang dikembalikan sebagai halaman 2?", code, "text", c, alts,
      kind === "offset" ? `Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: ${mode === "insert" ? "item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat)" : "penghapusan menggeser daftar naik sehingga ada item yang terlewat"}.` : `Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: ${c}.`, "Offset = 'lewati N item dari awal sekarang'; cursor = 'mulai setelah item ini'.");
  },
};

// ───────── Balapan respons (search-as-you-type) ─────────
export const staleResponse = {
  id: "fs-race",
  gen: async () => {
    const q = ["k", "ko", "kop"], t = [0, ri(80, 140), ri(180, 260)], lat = [ri(60, 700), ri(60, 700), ri(60, 700)];
    const arr = t.map((x, i) => x + lat[i]); const last = arr.indexOf(Math.max(...arr)); if (last === 2) return null;
    const lastFired = 2; const naive = q[last], guard = q[lastFired];
    const code = `// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch\n// waktu kirim & latensi respons (ms):\n${q.map((x, i) => `"${x}": kirim t=${t[i]}, latensi ${lat[i]} → tiba t=${arr[i]}`).join("\n")}\n\ninput.oninput = async () => {\n  const data = await cari(input.value);\n  tampilkan(data);          // dijalankan saat respons tiba\n};`;
    const fast = q[lat.indexOf(Math.min(...lat))];
    return mk("guess", "Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?", code, "javascript", `"${naive}" — respons yang tiba paling akhir`, [`"${guard}" — query yang diketik paling akhir`, `"${fast === naive ? q[1] : fast}" — respons yang tiba paling awal`].filter((x) => !x.startsWith(`"${naive}"`)),
      `Urutan tiba: ${[...arr.keys()].sort((a, b) => arr[a] - arr[b]).map((i) => `"${q[i]}"`).join(" → ")}. Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.`, "Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?");
  },
};

// ───────── Retry tanpa idempotensi ─────────
export const retryPay = {
  id: "fs-retry",
  gen: async () => {
    const R = ri(2, 4), dropped = ri(1, R); // percobaan ke-1..dropped: respons hilang/timeout meski server sudah memproses
    const attempts = dropped + 1; if (attempts > R + 1) return null;
    const code = `// klien: timeout 3 detik, retry maksimal ${R} kali\n// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas\n// jaringan menghilangkan respons ${dropped} percobaan pertama; respons percobaan ke-${dropped + 1} sampai\nPOST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key`;
    return mk("output", "Berapa kali saldo pelanggan dipotong?", code, "http", attempts, [1, R, R + 1, attempts + 1].filter((x) => x !== attempts).map(String), `Klien hanya tahu 'tidak ada respons', bukan 'server belum memproses'. Tiap percobaan yang sampai diproses: ${dropped} yang responsnya hilang + 1 yang berhasil = ${attempts}. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).`, "Apakah server tahu request itu retry dari yang sebelumnya?");
  },
};

// ───────── URL (dijalankan di Node) ─────────
export const urlParse = {
  id: "fs-url",
  gen: async () => {
    const p = pk(["toko.id", "api.toko.id", "app.kampus.ac.id"]), seg = sample(["a", "b", "c", "d", "produk", "img"], 3), t = ri(0, 5), n = ri(1, 9);
    const T = [
      `console.log(new URL("../${seg[0]}/x.png?v=${n}#top", "https://${p}/${seg[1]}/${seg[2]}/h.html").href);`,
      `console.log(new URL("//cdn.${p}/${seg[0]}", "https://${p}:8443/${seg[1]}").href);`,
      `const u = new URL("https://${p}:443/cari?tag=a&tag=b&q=kopi+susu&q2=%20x#h");\nconsole.log(u.origin, u.searchParams.getAll("tag").join("|"), u.searchParams.get("q"), u.searchParams.get("q2").length, u.hash);`,
      `console.log(encodeURIComponent("${seg[0]} &=/é"), encodeURI("https://${p}/${seg[1]} x?q=a b&r=é"));`,
      `const s = new URLSearchParams("a=${n}&b=2");\ns.append("a", "x y");\ns.delete("b");\ns.set("c", "&");\nconsole.log(s.toString(), s.getAll("a").length);`,
      `console.log(new URL("?q=${n}", "https://${p}/${seg[1]}/${seg[2]}?lama=1#h").href, new URL("#baru", "https://${p}/${seg[1]}?x=1").href);`,
    ];
    const res = await runJS(T[t], 0); if (!res.length || res[0].startsWith("!")) return null; const c = res[0];
    return mk("output", "Apa output kode ini?", T[t], "javascript", c, perturb(c).concat(perturb(c.replace(/%20/g, "+"))), `Hasil: ${c}. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.`, "Selesaikan path relatif langkah demi langkah dari base URL.");
  },
};

// ───────── Validasi klaim JWT ─────────
export const jwtClaims = {
  id: "fs-jwt",
  gen: async () => {
    const now = 1_760_000_000, skew = pk([0, 30, 60]);
    const sigOk = chance(0.88), exp = now + pk([-300, -45, -10, 20, 3600]), nbf = now + pk([-3600, -20, 10, 90]), iss = pk(["auth.toko.id", "auth.toko.id", "auth.lain.id"]), aud = pk(["api.toko.id", "api.toko.id", "web.toko.id"]);
    let out; if (!sigOk) out = "Ditolak: tanda tangan tidak valid"; else if (now > exp + skew) out = "Ditolak: token kedaluwarsa (exp)"; else if (now + skew < nbf) out = "Ditolak: belum berlaku (nbf)"; else if (iss !== "auth.toko.id") out = "Ditolak: issuer tidak sesuai"; else if (aud !== "api.toko.id") out = "Ditolak: audience tidak sesuai"; else out = "Diterima";
    const ALL = ["Diterima", "Ditolak: tanda tangan tidak valid", "Ditolak: token kedaluwarsa (exp)", "Ditolak: belum berlaku (nbf)", "Ditolak: issuer tidak sesuai", "Ditolak: audience tidak sesuai"];
    const code = `// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud\n// toleransi selisih jam (clock skew) = ${skew} detik\nwaktu_sekarang = ${now}\ntanda_tangan   = ${sigOk ? "VALID" : "TIDAK VALID"}\nklaim = { exp: ${exp}, nbf: ${nbf}, iss: "${iss}", aud: "${aud}" }\n// issuer yang dipercaya: "auth.toko.id"`;
    return mk("guess", "Keputusan verifikasi?", code, "javascript", out, shuf(ALL.filter((x) => x !== out)).slice(0, 2), `Cek berurutan: ${out}. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.`, "Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.");
  },
};

const POOL = [
  ["Menyimpan JWT di localStorage vs cookie HttpOnly: risiko utama masing-masing?", "localStorage.setItem(\"token\", jwt)", "javascript", "localStorage: dapat dibaca skrip XSS; cookie HttpOnly: tidak terbaca JS tetapi rentan CSRF sehingga butuh SameSite/token CSRF", "localStorage: rentan CSRF; cookie HttpOnly: rentan XSS pembaca token", "Keduanya aman sepenuhnya jika memakai HTTPS", "Skrip apa pun di origin dapat membaca localStorage. Cookie dikirim otomatis oleh browser sehingga perlu perlindungan CSRF.", "Siapa yang dapat membaca, dan siapa yang mengirim otomatis?"],
  ["Skenario: notifikasi satu arah dari server ke browser lewat HTTP biasa, perlu auto-reconnect bawaan. Pilihan paling sederhana?", "const es = new EventSource(\"/stream\");", "javascript", "Server-Sent Events (SSE)", "WebSocket dua arah dengan protokol sendiri", "Polling setiap 100 ms", "SSE: aliran satu arah server→klien di atas HTTP dengan reconnect otomatis dan Last-Event-ID.", "Satu arah atau dua arah?"],
  ["Skenario: game papan dua pemain, langkah harus saling terkirim dengan latensi rendah. Pilihan yang tepat?", "const ws = new WebSocket(\"wss://game.toko.id/room/1\");", "javascript", "WebSocket", "Server-Sent Events", "Long polling", "WebSocket menyediakan kanal dua arah full-duplex berlatensi rendah.", "Butuh klien juga mengirim sering."],
  ["Komponen App Router Next.js ini menimbulkan galat. Mengapa?", "// app/page.tsx (Server Component, tanpa 'use client')\nexport default function Page() {\n  const [n, setN] = useState(0);\n  return <button onClick={() => setN(n + 1)}>{n}</button>;\n}", "javascript", "Server Component tidak boleh memakai state/efek/event handler; tambahkan 'use client' atau pindahkan interaktivitas ke komponen klien", "useState hanya boleh di halaman bernama page.tsx", "onClick tidak didukung React 18", "Komponen server dirender di server tanpa interaktivitas klien. Batas klien ditandai 'use client'.", "Di mana komponen ini dieksekusi?"],
  ["Halaman HTTPS memuat skrip dari http://cdn.toko.id/lib.js. Apa yang dilakukan browser modern?", "<script src=\"http://cdn.toko.id/lib.js\"></script>", "html", "Memblokir skrip (mixed content aktif)", "Memuatnya dengan peringatan kuning", "Otomatis mengganti ke HTTP/2", "Sumber aktif (skrip, iframe) lewat HTTP pada halaman HTTPS diblokir karena dapat dimodifikasi penyerang jaringan.", "Skrip adalah konten aktif atau pasif?"],
  ["Fungsi header ini?", "Strict-Transport-Security: max-age=31536000; includeSubDomains", "http", "Memerintahkan browser memakai HTTPS saja untuk host (dan subdomain) tersebut selama setahun", "Mengenkripsi isi cookie", "Mengizinkan CORS dari semua subdomain", "HSTS mencegah downgrade ke HTTP dan stripping SSL pada kunjungan berikutnya.", "Apa yang diingat browser?"],
  ["Pembaruan optimistis gagal di server (422). Apa yang seharusnya dilakukan klien?", "setDaftar([...daftar, itemBaru]);   // optimistis\nawait api.simpan(itemBaru);        // 422", "javascript", "Membatalkan (rollback) ke state sebelumnya dan menampilkan galat validasi", "Membiarkan item tetap tampil agar UI tetap cepat", "Mengulang request tanpa batas sampai berhasil", "UI optimistis harus bisa dikembalikan bila server menolak; ulang tanpa batas pada galat validasi tak berguna.", "Apa kebenaran sumber akhir: UI atau server?"],
  ["Kolom pencarian memicu request di setiap ketikan. Teknik yang tepat agar request dikirim setelah pengguna berhenti mengetik 300 ms?", "input.oninput = () => cari(input.value);", "javascript", "Debounce", "Throttle", "Memoization", "Debounce menunda eksekusi sampai tidak ada pemicu baru dalam jeda tertentu; throttle membatasi frekuensi maksimum.", "Menunggu hening atau membatasi laju?"],
  ["Handler scroll berat dipanggil ratusan kali per detik. Teknik yang membatasi eksekusi maksimal sekali per 100 ms?", "window.addEventListener(\"scroll\", hitungPosisi);", "javascript", "Throttle", "Debounce", "Event delegation", "Throttle menjamin eksekusi berkala selama pemicu berlangsung.", "Tetap berjalan berkala, tetapi lebih jarang."],
  ["Cara yang tepat menghentikan fetch usang saat query berubah di React?", "useEffect(() => {\n  fetch(`/cari?q=${q}`).then(tampil);\n}, [q]);", "javascript", "Buat AbortController di efek, teruskan signal ke fetch, dan panggil abort() pada fungsi cleanup", "Menambahkan setTimeout sebelum fetch", "Menghapus q dari dependensi", "Cleanup efek berjalan sebelum efek berikutnya, cocok untuk membatalkan permintaan lama.", "Fungsi cleanup berjalan sebelum efek berikutnya."],
  ["Mengapa kode ini berbahaya jika konten berasal dari pengguna?", "<div dangerouslySetInnerHTML={{ __html: komentar }} />", "javascript", "HTML/skrip sisipan pengguna ikut dieksekusi (XSS); sanitasi dulu dengan pustaka seperti DOMPurify atau render sebagai teks", "Karena memperlambat render", "Karena React melarang atribut __html", "innerHTML menafsirkan markup mentah. Render teks biasa agar di-escape otomatis.", "Apakah teks atau markup yang dirender?"],
  ["Halaman blog jarang berubah, butuh SEO dan sangat cepat. Strategi render yang paling cocok?", "// Next.js", "javascript", "SSG / ISR: dibangun statis dan disajikan dari CDN, dengan revalidasi berkala bila perlu", "CSR murni dengan data di-fetch setelah load", "SSR pada setiap request tanpa cache", "Konten statis diuntungkan oleh HTML yang sudah jadi di edge; SEO bagus dan latensi minimum.", "Kapan HTML paling murah dibuat?"],
  ["Dasbor pribadi setelah login, data spesifik pengguna, tidak perlu SEO. Strategi render yang paling wajar?", "// Next.js", "javascript", "CSR (atau SSR dinamis berbasis sesi), bukan halaman statis publik", "SSG tanpa autentikasi", "Menyimpan HTML dasbor di CDN publik untuk semua pengguna", "Konten bergantung pengguna tidak boleh dicache bersama. Render di klien atau server per-permintaan dengan cache private.", "Apakah konten sama untuk semua orang?"],
  ["Mengunggah berkas 2 GB lewat API JSON dengan base64 tidak praktis. Pendekatan yang lebih baik?", "POST /upload { \"berkas\": \"<base64 2 GB>\" }", "http", "Presigned URL: klien mengunggah langsung ke object storage (multipart/resumable), server hanya menerbitkan izin dan mencatat metadata", "Memperbesar batas body server menjadi 4 GB", "Memecah base64 menjadi string pendek di URL", "Base64 menambah ±33% ukuran dan memuat seluruh berkas di memori server. Unggah langsung mengurangi beban dan mendukung resume.", "Apakah server perlu menjadi perantara data?"],
  ["Daftar 100 post memicu 100 query penulis di resolver GraphQL. Solusi umum?", "Post.author(post) { return db.user.find(post.authorId) }", "javascript", "DataLoader: mengelompokkan (batch) dan men-cache pencarian per-request menjadi satu query IN (...)", "Menaikkan limit koneksi database", "Mengganti GraphQL dengan REST saja", "Resolver per-field menyebabkan N+1; batching per tick event loop menyatukan ID menjadi satu query.", "Gabungkan ID yang diminta pada tick yang sama."],
  ["Praktik terbaik menyimpan dan mengirim waktu antara server dan klien?", "{ \"dibuat\": \"???\" }", "json", "UTC dalam ISO 8601 dengan penanda zona (mis. 2026-10-19T08:30:00Z), ditampilkan pada zona waktu pengguna di klien", "String waktu lokal server tanpa zona", "Epoch dalam milidetik zona WIB saja", "Waktu tanpa zona ambigu dan rusak saat DST/pindah server. Simpan UTC, format di tepi.", "Zona waktu siapa yang jadi acuan penyimpanan?"],
  ["Harga disimpan sebagai float dan total terkadang 0.30000000000000004. Perbaikan yang tepat?", "const total = 0.1 + 0.2;", "javascript", "Simpan dan hitung dalam satuan bulat terkecil (mis. sen) atau tipe DECIMAL, format saat ditampilkan", "Selalu panggil toFixed(2) di setiap perhitungan", "Pakai double precision lebih besar", "Floating point biner tak merepresentasikan sebagian desimal secara tepat. Uang butuh integer/DECIMAL.", "Apakah 0.1 bisa persis di biner?"],
  ["Refresh token dicuri dan dipakai penyerang. Mitigasi yang mendeteksi pemakaian ganda?", "POST /token { grant_type: \"refresh_token\" }", "http", "Rotasi refresh token dengan deteksi reuse: token lama yang dipakai ulang membatalkan seluruh rantai/sesi", "Menaikkan masa berlaku refresh token menjadi 1 tahun", "Menyimpannya di URL agar mudah dibagikan", "Dengan rotasi, tiap token sekali pakai. Pemakaian ulang menandakan pencurian dan memicu pencabutan.", "Jika dua pihak memakai token yang sama, siapa yang pertama?"],
  ["Aplikasi SPA/mobile tanpa rahasia klien melakukan login OAuth 2.0. Alur yang dianjurkan?", "// client publik", "http", "Authorization Code + PKCE", "Implicit flow (token langsung di URL fragment)", "Resource Owner Password Credentials", "Klien publik memakai code + PKCE (code_verifier/challenge) agar kode yang dicegat tak bisa ditukar. Implicit sudah ditinggalkan.", "Apa yang menggantikan client secret pada klien publik?"],
  ["Halaman akun pengguna (berisi Set-Cookie sesi) ikut di-cache CDN. Dampaknya?", "HTTP/1.1 200 OK\nSet-Cookie: sid=abc123\nCache-Control: public, max-age=300", "http", "Pengguna lain bisa menerima respons/cookie sesi orang lain (kebocoran sesi); gunakan Cache-Control: private/no-store dan jangan cache respons berpersonalisasi", "Tidak ada dampak; CDN mengabaikan Set-Cookie", "Hanya memperlambat first byte", "Cache bersama menyajikan satu respons yang sama ke banyak pengguna. Respons per pengguna harus private.", "Siapa yang menerima salinan cache itu berikutnya?"],
  ["Pengguna PWA tetap melihat versi lama situs setelah deploy. Penyebab paling mungkin?", "navigator.serviceWorker.register(\"/sw.js\")", "javascript", "Service worker lama masih aktif dan menyajikan aset dari cache-nya; perlu strategi update (versi cache, skipWaiting/clients.claim atau prompt muat ulang)", "Browser tidak mendukung versi baru", "DNS belum menyebar", "SW baru menunggu sampai tab yang dikendalikan SW lama ditutup, kecuali skipWaiting dipakai.", "Siapa yang menjawab request sebelum jaringan?"],
  ["Token WebSocket ditaruh di query string. Risiko utamanya?", "new WebSocket(\"wss://x.id/ws?token=\" + jwt)", "javascript", "URL tercatat di log proxy/server dan riwayat sehingga token bocor; lebih baik cookie atau pesan autentikasi pertama", "WebSocket tidak mendukung query string", "Token otomatis kedaluwarsa dalam 1 menit", "URL sering dicatat (access log, monitoring). Rahasia sebaiknya tidak berada di URL.", "Di mana URL biasanya dicatat?"],
  ["Mengapa gambar/skrip bernama app.v123.js bisa diberi 'Cache-Control: public, max-age=31536000, immutable'?", "<script src=\"/app.v123.js\"></script>", "http", "Nama berkas berversi/hash: perubahan konten = nama baru, sehingga salinan lama aman disimpan selamanya", "Karena browser mengabaikan umur cache untuk .js", "Karena immutable membuat server tidak menerima deploy baru", "Cache busting lewat nama berkas memungkinkan umur cache sangat panjang tanpa risiko basi.", "Bagaimana versi baru diminta?"],
];
export const fsCurated = { id: "fs-concept", gen: async () => { const e = pk(POOL); return mk("guess", e[0], e[1], e[2], e[3], [e[4], e[5]], e[6], e[7]); } };
export const FS_CURATED_SIZE = POOL.length;

export const FS_ONLY = [cors, sameSite, cookieScope, csp, httpCache, pagination, staleResponse, retryPay, urlParse, jwtClaims, fsCurated];
