-- DIHASILKAN oleh scripts/gen-dev.mjs (frontend, bagian 2/4) — 250 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: content-box;
  width: 400px;
  padding: 0 7px;
  border: 8px solid;
  margin: 0 5px;
}','css','["430","440","424"]'::jsonb,null,1,'content-box: width hanya konten → 400 + 2×7 + 2×8 + 2×5 = 440.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 700px?',null,'.grid { gap: 12px; }
@media (min-width: 640px) { .grid { gap: 16px; } }
@media (max-width: 900px) { .grid { gap: 32px; } }
@media (min-width: 640px) and (max-width: 900px) { .grid { gap: 4px; } }','css','["12","16","4"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 4px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"));
luar.addEventListener("click", (e) => { log("B"); e.stopImmediatePropagation(); });
luar.addEventListener("click", () => log("C"));
tengah.addEventListener("click", () => log("D"));
luar.addEventListener("click", () => log("E"));
tengah.addEventListener("click", () => log("F"), true);','javascript','["F A D B","A D F B","A B D F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: F A D B.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 5; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; isolation: isolate; }
.c2 { position: absolute; z-index: 240; }
/* A dan B bertumpang tindih secara visual */','html','["Tidak bisa ditentukan tanpa ukuran elemen","B (di atas A)","A (di atas B)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=5, B=0.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":36,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':37,''b'':[2,3],''c'':{''d'':null}}","{\"a\":38,\"b\":[2,3],\"c\":{\"d\":undefined}}","{\"a\":37,\"b\":[2,3],\"c\":{\"d\":null}}"]'::jsonb,null,2,'Hasil: {"a":37,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Mitigasi UTAMA untuk kasus ini?
Situs target dimuat dalam iframe transparan; pengguna mengira mengeklik tombol permainan tetapi menekan ''Hapus akun''.',null,'# keamanan aplikasi web','text','["CSP frame-ancestors atau X-Frame-Options agar halaman tidak bisa dibingkai situs lain","Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types","Allowlist origin eksplisit; jangan memantulkan origin sembarang bersama credentials"]'::jsonb,null,0,'Mitigasi yang tepat untuk Clickjacking: CSP frame-ancestors atau X-Frame-Options agar halaman tidak bisa dibingkai situs lain.',null,'Akar masalahnya: Clickjacking.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 10), bad("B", 5), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"rB\",\"fC\"]","err B","ok \"A\""]'::jsonb,null,2,'Promise.any menghasilkan: ok "A". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Berapa lebar akhir (px) item .i3?',null,'.baris { display: flex; width: 800px; gap: 10px; }
.i1 { flex: 3 1 250px; min-width: 0; }
.i2 { flex: 2 3 300px; min-width: 0; }
.i3 { flex: 0 2 100px; min-width: 0; }','css','["100","120","143.33"]'::jsonb,null,0,'Ruang sisa = 800 − gap 20 − Σbasis = 130px dibagi menurut flex-grow (Σ=5) → 100px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. WebdriverIO
2. FastAPI
3. Testing Library
4. Vite
5. Playwright','text','["1, 3, 4","1, 3, 5","1, 2, 3"]'::jsonb,null,1,'Testing Library, Playwright, WebdriverIO adalah alat uji end-to-end/komponen di browser; Vite dan FastAPI termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.4.2" }
// versi yang tersedia di registry:
2.4.2  2.4.3  2.5.2  2.5.3  2.6.3  3.4.2  3.4.3  3.4.4','json','["2.6.3","2.4.3","3.4.4"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.6.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2025, 0, 31));
d.setUTCMonth(1);
console.log(d.toISOString().slice(0, 10));','javascript','["2025-03-01","2025-02-31","2025-03-03"]'::jsonb,null,2,'Hasil: 2025-03-03. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2025 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script type="module" src="chart.js"></script>
  <script src="auth.js"></script>
  <script defer src="app.js"></script>
  <script defer src="api.js"></script>
  <script type="module" src="util.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["auth.js → chart.js → app.js → api.js → util.js","chart.js → auth.js → app.js → api.js → util.js","chart.js → app.js → api.js → util.js → auth.js"]'::jsonb,null,0,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: auth.js → chart.js → app.js → api.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([,].length);
console.log([2] * [3]);
console.log(NaN + "");','javascript','["1 | [object Object] | NaN","1 | 6 | NaN","0 | 6 | NaN"]'::jsonb,null,1,'Hasil nyata: 1 | 6 | NaN. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { return "t4"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["fin | t4","t4 | fin","fin | t5"]'::jsonb,null,0,'Dijalankan: fin | t4.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN((p) => p * 4);
    setN(n + 3);
    setN((p) => p + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["4","7","10"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 7.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_margin_left { to { margin-left: … } }
@keyframes k_transform { to { transform: … } }
@keyframes k_border_radius { to { border-radius: … } }','css','["border-radius < transform < margin-left","margin-left < border-radius < transform","transform < border-radius < margin-left"]'::jsonb,null,2,'transform hanya perlu compositing (di GPU, tanpa layout/paint), border-radius memicu paint ulang, margin-left memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(5);
const q = Object.create(p);
q.n = 10;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["5 true true","false 5 true","5 false true"]'::jsonb,null,2,'Hasil: 5 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 600px; display: flex; gap: 32px; }
.kartu { flex: 0 0 calc((100% - 96px) / 4); }','css','["142","150","126"]'::jsonb,null,2,'(600 − 96) / 4 = 126px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','output','Apa output kode ini?',null,'var skor = 52;
(function () {
  console.log(skor);
  var skor = 53;
})();','javascript','["number","function","undefined"]'::jsonb,null,2,'var di dalam fungsi menutupi variabel luar dan di-hoist sebagai undefined, bukan nilai luar.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 600px;
  gap: 0 24px;
  grid-template-columns: 100px 80px 1fr;
}','css','["420","372","600"]'::jsonb,null,1,'Ruang untuk fr = 600 − gap 48 − track px 180 = 372px dibagi 1 fr → 1fr = 372px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 1.5em; }
.b { font-size: 0.5em; padding-left: 1.5em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","22.5","45"]'::jsonb,null,1,'font-size .a = 20×1.5 = 30px; .b = 30×0.5 = 15px; em pada padding memakai font-size elemen itu sendiri → 1.5×15 = 22.5px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("C");
  queueMicrotask(() => console.log("H"));
});
queueMicrotask(() => console.log("D"));
setTimeout(() => {
  console.log("E");
  Promise.resolve().then(() => console.log("G"));
}, 0);
(async () => {
  console.log("undefined");
  await null;
  console.log("undefined");
})();
setTimeout(() => {
  console.log("undefined");
  Promise.resolve().then(() => console.log("undefined"));
}, 0);','javascript','["C H D E G","undefined D C undefined H E G undefined undefined","undefined C D undefined H E G undefined undefined"]'::jsonb,null,2,'Urutan nyata: undefined C D undefined H E G undefined undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa lebar konten (px) anak ini?',null,'.induk {
  box-sizing: border-box;
  width: 600px;
  padding: 0 36px;
}
.anak { width: 75%; }   /* box-sizing: content-box, tanpa padding */','css','["504","396","450"]'::jsonb,null,1,'Persentase mengacu ke lebar KONTEN induk (528px) → 396px.',null,'Persen mengacu ke content box induk, bukan border box.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 11, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["1 0","30 10","0 0"]'::jsonb,null,1,'Hasil: 30 10. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(3);
  function klik() {
    setN(n + 5);
    setN((p) => p * 4);
    setN(n + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["33","4","9"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=3 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 3 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 4.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 16px; padding-top: 5px; }
.anak  { margin-top: 30px; }','css','["51","30","46"]'::jsonb,null,0,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 16 + 5 + 30 = 51.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(NaN * {});
console.log("a" === 0);
console.log(true + true);','javascript','["NaN | false | 2","0 | false | 2","NaN | true | 2"]'::jsonb,null,0,'Hasil nyata: NaN | false | 2. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1024px?',null,'.grid { gap: 8px; }
@media (min-width: 480px) and (max-width: 1024px) { .grid { gap: 4px; } }
@media (max-width: 1024px) { .grid { gap: 32px; } }
@media (min-width: 480px) { .grid { gap: 24px; } }','css','["8","32","24"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 24px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
$ git restore f.txt','bash','["status: bersih | commit: 2 | isi f.txt: v2","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: v2","status: f.txt ter-staging | commit: 1 | isi f.txt: v2"]'::jsonb,null,0,'Dijalankan di repositori nyata: status: bersih | commit: 2 | isi f.txt: v2. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  p#kartu { color: merah; }
}
@layer base {
  .wrap :where(#kartu, .a) { color: ungu; }
}
.a:where(#kartu, .a) { color: hijau; }
main .a:is(.a, .b) { color: kuning !important; }','html','["kuning","ungu","merah"]'::jsonb,null,0,'p#kartu: (1,0,1) [@layer] → merah; .wrap :where(#kartu, .a): (0,1,0) [@layer] → ungu; .a:where(#kartu, .a): (0,1,0) → hijau; main .a:is(.a, .b): (0,2,1) !important → kuning. Pemenang: kuning. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(harga());
  var harga = function () { return 23; };
} catch (e) { console.log(e.name); }','javascript','["ReferenceError","function","TypeError"]'::jsonb,null,2,'var v di-hoist sebagai undefined, jadi memanggil v() = memanggil undefined → TypeError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 3; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; isolation: isolate; }
.c2 { position: absolute; z-index: 453; }
/* A dan B bertumpang tindih secara visual */','html','["Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)","B (di atas A)"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=3, B=0.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="app.js"></script>
  <script defer src="ui.js"></script>
  <script defer src="map.js"></script>
  <script src="api.js"></script>
  <script defer src="auth.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["app.js → api.js → ui.js → map.js → auth.js","ui.js → map.js → auth.js → app.js → api.js","app.js → ui.js → map.js → api.js → auth.js"]'::jsonb,null,0,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: app.js → api.js → ui.js → map.js → auth.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'.a { font-size: 200%; }
.b { font-size: 1.5em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["144","96","48"]'::jsonb,null,0,'font-size .a = 16×2 = 32px; .b = 32×1.5 = 48px; em pada padding memakai font-size elemen itu sendiri → 3×48 = 144px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Berapa lebar akhir (px) item .i3?',null,'.baris { display: flex; width: 600px; gap: 20px; }
.i1 { flex: 0 2 100px; min-width: 0; }
.i2 { flex: 0 1 200px; min-width: 0; }
.i3 { flex: 1 2 100px; min-width: 0; }','css','["153.33","300","260"]'::jsonb,null,2,'Ruang sisa = 600 − gap 40 − Σbasis = 160px dibagi menurut flex-grow (Σ=1) → 260px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 46,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["139","46","258"]'::jsonb,null,1,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("A"));
queueMicrotask(() => console.log("H"));
setTimeout(() => console.log("F"), 0);
Promise.resolve().then(() => {
  console.log("G");
  queueMicrotask(() => console.log("E"));
});
setTimeout(() => {
  console.log("C");
  Promise.resolve().then(() => console.log("undefined"));
}, 0);','javascript','["A H F G E C","A H G E F undefined C","A H G E F C undefined"]'::jsonb,null,2,'Urutan nyata: A H G E F C undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_width { to { width: … } }
@keyframes k_transform { to { transform: … } }
@keyframes k_background_color { to { background-color: … } }','css','["width < background-color < transform","background-color < transform < width","transform < background-color < width"]'::jsonb,null,2,'transform hanya perlu compositing (di GPU, tanpa layout/paint), background-color memicu paint ulang, width memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 15), ok("B", 10), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"rC\"]","ok \"B\"","err C"]'::jsonb,null,1,'Promise.any menghasilkan: ok "B". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Lebar (px) elemen pada viewport 375px?',null,'.hero { width: clamp(200px, 40vw, 800px); }','css','["800","200","150"]'::jsonb,null,1,'40vw = 150px, lalu dibatasi [200, 800] → 200px.',null,'clamp(min, ideal, max).',null),
('frontend','output','Urutan log lengkap setelah semua langkah di komentar?',null,'function Anak({ id }) {
  useEffect(() => {
    log("C+" + id);
    return () => log("C-" + id);
  }, [id]);
  return null;
}
function Induk() {
  const [id, setId] = useState(1);
  const [, tick] = useState(0);
  useEffect(() => {
    log("P+" + id);
    return () => log("P-" + id);
  }, []);
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)','javascript','["C+1 P+1 C-1 C+2","P+1 C+1 C-1 C+2","C+2 C-1 P+1 C+1"]'::jsonb,null,0,'Hasil: C+1 P+1 C-1 C+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Mengapa header tidak menempel (sticky) saat di-scroll?',null,'.layout { overflow: hidden; }
.header {
  position: sticky;
  top: 0;
}','css','["sticky hanya bekerja pada elemen yang juga diberi z-index positif dan lebar tetap","Ancestor dengan overflow selain visible menjadi scroll container","position: sticky membutuhkan display: flex pada induknya agar bisa menempel saat di-scroll"]'::jsonb,null,1,'Sticky memakai scroll container terdekat. overflow: hidden/auto pada ancestor membuatnya menjadi container yang tidak ikut scroll.',null,'Sticky menempel ke apa?',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(7);
const q = Object.create(p);
q.n = 12;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["8 false true","7 false false","7 false true"]'::jsonb,null,2,'Hasil: 7 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 26], e: null }));','javascript','["{''c'':null,''d'':[null,26],''e'':null}","{\"c\":null,\"d\":[null,26],\"e\":null}","{\"c\":undefined,\"d\":[null,27],\"e\":null}"]'::jsonb,null,1,'Hasil: {"c":null,"d":[null,26],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Mitigasi UTAMA untuk kasus ini?
Penyerang mengisi kolom login dengan '' OR ''1''=''1'' -- dan masuk tanpa password.',null,'# keamanan aplikasi web','text','["Validasi tujuan redirect dengan allowlist atau hanya path relatif","Query berparameter (prepared statement) dan hak akses DB minimum","Hapus catatan DNS yang menggantung saat layanan dinonaktifkan"]'::jsonb,null,1,'Mitigasi yang tepat untuk SQL Injection: Query berparameter (prepared statement) dan hak akses DB minimum.',null,'Akar masalahnya: SQL Injection.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1600.jpg","foto-2000.jpg","foto-640.jpg"]'::jsonb,null,0,'Slot = 50vw × 1024 = 512px CSS; × DPR 3 = 1536px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah baris 4 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Dari daftar ini, nomor mana yang BUKAN alat uji end-to-end/komponen di browser?',null,'1. Cypress
2. Kafka
3. ActiveMQ
4. Playwright
5. WebdriverIO','text','["2 dan 3","1 dan 2 dan 5","1 dan 2 dan 3"]'::jsonb,null,0,'ActiveMQ dan Kafka termasuk kategori lain; Cypress, WebdriverIO, Playwright adalah alat uji end-to-end/komponen di browser.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 0; i < 3; i++) {
  fns.push(() => i * 1);
}
console.log(fns.map((f) => f()).join(","));','javascript','["3,3,3","0,1,2","1,2,3"]'::jsonb,null,0,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 3, jadi semua closure menghasilkan 3.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c4"; } finally { return "f70"; }
}
console.log(f());','javascript','["undefined","f70","f71"]'::jsonb,null,1,'Dijalankan: f70.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.0.3" }
// versi yang tersedia di registry:
2.0.3  2.2.6  3.0.0  3.0.3  3.0.4  3.0.5  3.1.4  3.1.6','json','["2.2.6","3.1.6","2.0.3"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
luar.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"));
tengah.addEventListener("click", (e) => { log("D"); e.stopImmediatePropagation(); });
tombol.addEventListener("click", () => log("E"), true);','javascript','["A B D E","B A E D","A E D"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B A E D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','fill','Lengkapi agar cookie sesi tidak ikut terkirim pada permintaan lintas situs yang bukan navigasi top-level GET:',null,'Set-Cookie: sid=1; HttpOnly; Secure; ____=Lax','http','["SameSite","Path","Domain"]'::jsonb,null,0,'Atribut SameSite=Lax membatasi pengiriman cookie pada konteks lintas situs.',null,'Atribut yang mengatur konteks lintas situs.',null),
('frontend','guess','Berapa lebar kolom ke-4 (px)?',null,'.grid {
  display: grid;
  width: 1200px;
  gap: 0 0px;
  grid-template-columns: 1fr 200px 80px 1fr;
}','css','["600","300","460"]'::jsonb,null,2,'Ruang untuk fr = 1200 − gap 0 − track px 280 = 920px dibagi 2 fr → 1fr = 460px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 4) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(NaN)), JSON.stringify(f(false)));','javascript','["{\"a\":\"dflt\",\"b\":null} {\"a\":\"dflt\",\"b\":false}","{\"a\":null,\"b\":\"dflt\"} {\"a\":false,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}"]'::jsonb,null,1,'Hasil: {"a":null,"b":"dflt"} {"a":false,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Apa output kode ini?',null,'const x = [4,54,78];
x.length = 1;
x[4] = 0;
console.log(x.length, JSON.stringify(x));','javascript','["0],null,null,null,5 [4","6 [4,null,null,null,0]","5 [4,null,null,null,0]"]'::jsonb,null,2,'Dijalankan langsung: 5 [4,null,null,null,0].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Operasi mana yang TIDAK bisa dilakukan di dalam Web Worker?',null,'const w = new Worker("pekerja.js");','javascript','["Memanggil fetch()","Berkirim pesan dengan postMessage","Mengakses document/DOM"]'::jsonb,null,2,'Worker berjalan di thread terpisah tanpa akses DOM, tetapi punya fetch, timer, dan postMessage.',null,'Apa yang dimiliki thread utama tetapi tidak dimiliki worker?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 36, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{''a'':2,''b'':36} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":3,\"b\":36} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":2,\"b\":36} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,2,'Hasil: {"a":2,"b":36} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_background_color { to { background-color: … } }
@keyframes k_margin_left { to { margin-left: … } }
@keyframes k_transform { to { transform: … } }','css','["margin-left < background-color < transform","transform < background-color < margin-left","background-color < transform < margin-left"]'::jsonb,null,1,'transform hanya perlu compositing (di GPU, tanpa layout/paint), background-color memicu paint ulang, margin-left memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 700px?',null,'.grid { gap: 12px; }
@media (min-width: 600px) and (max-width: 700px) { .grid { gap: 32px; } }
@media (max-width: 700px) { .grid { gap: 4px; } }
@media (min-width: 600px) { .grid { gap: 8px; } }','css','["8","4","12"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'.kolom { display: flex; flex-direction: column; }
.x { margin-bottom: 24px; }
.y { margin-top: 30px; }','css','["30","54","24"]'::jsonb,null,1,'Item flex membentuk konteks baru; margin TIDAK menyatu. Jaraknya 24 + (30) = 54px.',null,'Apakah margin item flex bisa collapse?',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-1024.jpg","foto-2000.jpg"]'::jsonb,null,1,'Slot = 40vw × 1024 = 410px CSS; × DPR 2 = 819px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Jenis kerentanan/serangan apa ini?',null,'Kode klien: el.innerHTML = location.hash.slice(1) — payload di fragmen URL dieksekusi tanpa lewat server.','text','["Command Injection","DOM-based XSS","Mass Assignment"]'::jsonb,null,1,'DOM-based XSS: Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('frontend','guess','Perbedaan Continuous Delivery dan Continuous Deployment?',null,'# pipeline CI/CD','text','["Delivery untuk frontend, Deployment untuk backend","Delivery: siap dirilis kapan saja tetapi dirilis dengan persetujuan manual","Tidak ada perbedaan"]'::jsonb,null,1,'Keduanya mengotomatiskan pipeline; perbedaannya ada pada langkah rilis ke produksi: manual versus otomatis.',null,'Siapa yang menekan tombol rilis?',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 2; i < 5; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["20,30,40","50,50,50","30,40,50"]'::jsonb,null,1,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 5, jadi semua closure menghasilkan 50.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Urutan log lengkap setelah semua langkah di komentar?',null,'function Anak({ id }) {
  useEffect(() => {
    log("C+" + id);
    return () => log("C-" + id);
  });
  return null;
}
function Induk() {
  const [id, setId] = useState(1);
  const [, tick] = useState(0);
  useEffect(() => {
    log("P+" + id);
    return () => log("P-" + id);
  });
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)','javascript','["P+1 C+1 P-1 C-1 P+2 C+2","C+1 P+1 C-1 P-1 C+2 P+2","C+1 P+1 C-1 C+2 P-1 P+2"]'::jsonb,null,1,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2023, 0, 30));
d.setUTCMonth(1);
console.log(d.toISOString().slice(0, 10));','javascript','["2023-03-01","2023-02-30","2023-03-02"]'::jsonb,null,2,'Hasil: 2023-03-02. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2023 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pustaka/framework UI?',null,'1. Angular
2. Amazon SQS
3. Svelte
4. Vue
5. Playwright','text','["1, 3, 4","2, 3, 5","3, 4, 5"]'::jsonb,null,0,'Vue, Angular, Svelte adalah pustaka/framework UI; Playwright dan Amazon SQS termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof kuota);
  let kuota = 14;
} catch (e) { console.log(e.name); }','javascript','["ReferenceError","TypeError","undefined"]'::jsonb,null,0,'let ada di TDZ sebelum deklarasi; typeof pun melempar ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(0.1 * 3);
console.log(null == 0);
console.log(undefined == null);','javascript','["0.30000000000000004 | true | true","false | false | true","0.30000000000000004 | false | true"]'::jsonb,null,2,'Hasil nyata: 0.30000000000000004 | false | true. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 0.8em; }
.b { font-size: 1.5em; padding-left: 2em; }
/* <div class="a"><div class="b">…</div></div> */','css','["32","48","40"]'::jsonb,null,1,'font-size .a = 20×0.8 = 16px; .b = 16×1.5 = 24px; em pada padding memakai font-size elemen itu sendiri → 2×24 = 48px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 720px; gap: 0px; }
.i1 { flex: 1 3 300px; min-width: 0; }
.i2 { flex: 0 0 150px; min-width: 0; }
.i3 { flex: 0 1 200px; min-width: 0; }','css','["166.15","150","173.33"]'::jsonb,null,1,'Ruang sisa = 720 − gap 0 − Σbasis = 70px dibagi menurut flex-grow (Σ=1) → 150px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Berapa lebar kolom ke-2 (px)?',null,'.grid {
  display: grid;
  width: 1000px;
  gap: 0 16px;
  grid-template-columns: 160px 1fr 120px;
}','css','["1000","688","720"]'::jsonb,null,1,'Ruang untuk fr = 1000 − gap 32 − track px 280 = 688px dibagi 1 fr → 1fr = 688px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 7) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(false)), JSON.stringify(f(0)));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":false} {\"a\":\"dflt\",\"b\":0}","{\"a\":false,\"b\":\"dflt\"} {\"a\":0,\"b\":\"dflt\"}"]'::jsonb,null,2,'Hasil: {"a":false,"b":"dflt"} {"a":0,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 88;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["88 undefined","88","88 TypeError"]'::jsonb,null,2,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("H"), 0);
Promise.resolve().then(() => {
  console.log("D");
  queueMicrotask(() => console.log("A"));
});
Promise.resolve().then(() => console.log("F"));
Promise.resolve().then(() => {
  console.log("C");
  queueMicrotask(() => console.log("B"));
});
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["D F C undefined A B H undefined","H D A F C B","D F C undefined A B undefined H"]'::jsonb,null,2,'Urutan nyata: D F C undefined A B undefined H. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: content-box;
  width: 200px;
  padding: 0 17px;
  border: 7px solid;
  margin: 0 30px;
}','css','["248","294","308"]'::jsonb,null,2,'content-box: width hanya konten → 200 + 2×17 + 2×7 + 2×30 = 308.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(3)
  .finally(() => 44)
  .then((v) => console.log("v", v));','javascript','["undefined","v 3","v 4"]'::jsonb,null,1,'Dijalankan: v 3.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  :is(.a, .b):where(#kartu, .a) { color: oranye; }
}
main #kartu:where(#kartu, .a) { color: ungu; }
:is(.a, .b) { color: kuning; }
:first-child { color: hijau !important; }','html','["hijau","oranye","ungu"]'::jsonb,null,0,':is(.a, .b):where(#kartu, .a): (0,1,0) [@layer] → oranye; main #kartu:where(#kartu, .a): (1,0,1) → ungu; :is(.a, .b): (0,1,0) → kuning; :first-child: (0,1,0) !important → hijau. Pemenang: hijau. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([bad("A", 10), bad("B", 15), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["err All promises were rejected","err C","ok [\"rA\",\"rB\",\"rC\"]"]'::jsonb,null,2,'Promise.allSettled menghasilkan: ok ["rA","rB","rC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(3);
  function klik() {
    setN(11);
    setN(n + 1);
    setN(n + 1);
    setN((p) => p + 5);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["4","18","9"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=3 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 3 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 9.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.3" }
// versi yang tersedia di registry:
0.0.3  0.0.4  0.0.6  0.1.4  0.2.4  0.2.6  1.0.6  1.2.3','json','["1.2.3","0.0.3","0.0.6"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah baris 9 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
# lalu f.txt diedit dan BELUM di-commit: isinya "wip"
$ git commit --amend -qm "baru"','bash','["status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip","status: f.txt berubah, belum di-staging | commit: 2 | isi f.txt: wip","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip"]'::jsonb,null,1,'Dijalankan di repositori nyata: status: f.txt berubah, belum di-staging | commit: 2 | isi f.txt: wip. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Lebar (px) elemen pada viewport 375px?',null,'.hero { width: clamp(280px, 60vw, 600px); }','css','["280","600","225"]'::jsonb,null,0,'60vw = 225px, lalu dibatasi [280, 600] → 280px.',null,'clamp(min, ideal, max).',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 6; }
.c1 { position: absolute; z-index: 88; }
.p2 { position: relative; z-index: 3; }
.c2 { position: absolute; z-index: 346; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","A (di atas B)","Tidak bisa ditentukan tanpa ukuran elemen"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=6, B=3.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'console.log(new Set([56, "56", 56, NaN, NaN, 39]).size, [NaN].includes(NaN), [NaN].indexOf(NaN));','javascript','["4 false -1","4 true -1","5 true -1"]'::jsonb,null,1,'Dijalankan langsung: 4 true -1.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 8);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 9);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["A.field | A.ctor | B.init 9 | B.field | B.ctor 9","A.field | A.ctor | B.init undefined | B.field | B.ctor 9","B.ctor 9 | B.field | B.init undefined | A.ctor | A.field"]'::jsonb,null,1,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 9. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", (e) => { log("B"); e.stopPropagation(); });
tombol.addEventListener("click", () => log("C"));
tombol.addEventListener("click", () => log("D"));
luar.addEventListener("click", () => log("E"), true);
tengah.addEventListener("click", () => log("F"));','javascript','["E A B C D","A B C D E","B C D"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: E A B C D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="chart.js"></script>
  <script defer src="map.js"></script>
  <script src="util.js"></script>
  <script type="module" src="auth.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["chart.js → map.js → util.js → auth.js","chart.js → util.js → map.js → auth.js","map.js → auth.js → chart.js → util.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: chart.js → util.js → map.js → auth.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
:first-child[data-x].b { color: merah !important; }
.wrap #kartu:is(.a, #kartu)[data-x] { color: ungu; }
@layer base {
  p.a:not(.zzz) { color: kuning; }
}
:is(.a, .b):first-child:where(#kartu, .a) { color: hijau; }','html','["merah","ungu","kuning"]'::jsonb,null,0,':first-child[data-x].b: (0,3,0) !important → merah; .wrap #kartu:is(.a, #kartu)[data-x]: (2,2,0) → ungu; p.a:not(.zzz): (0,2,1) [@layer] → kuning; :is(.a, .b):first-child:where(#kartu, .a): (0,2,0) → hijau. Pemenang: merah. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", () => log("B"));
tengah.addEventListener("click", () => log("C"));
tengah.addEventListener("click", () => log("D"), true);
tombol.addEventListener("click", () => log("E"));','javascript','["B E C D A","A D B E C","A B C D E"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A D B E C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 24px; padding-top: 11px; }
.anak  { margin-top: 40px; }','css','["75","40","64"]'::jsonb,null,0,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 24 + 11 + 40 = 75.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([10, 9, 1].sort());
console.log(1 / 0 - 1 / 0);
console.log("" == 0);','javascript','["[ 1, 10, 9 ] | 0 | true","[ 1, 10, 9 ] | NaN | true","0 | NaN | true"]'::jsonb,null,1,'Hasil nyata: [ 1, 10, 9 ] | NaN | true. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c8"; } finally { return "f30"; }
}
console.log(f());','javascript','["f30","undefined","f31"]'::jsonb,null,0,'Dijalankan: f30.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'(async () => {
  console.log("E");
  await null;
  console.log("A");
})();
Promise.resolve().then(() => console.log("D"));
(async () => {
  console.log("B");
  await null;
  console.log("H");
})();
setTimeout(() => console.log("F"), 0);
queueMicrotask(() => console.log("undefined"));','javascript','["E A D B H F","E B A D H undefined F","E B A D undefined H F"]'::jsonb,null,1,'Urutan nyata: E B A D H undefined F. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1200px?',null,'.grid { gap: 32px; }
@media (min-width: 480px) and (max-width: 900px) { .grid { gap: 12px; } }
@media (min-width: 480px) { .grid { gap: 4px; } }
@media (max-width: 900px) { .grid { gap: 16px; } }','css','["16","32","4"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 4px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 768px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1600.jpg","foto-2000.jpg","foto-800.jpg"]'::jsonb,null,0,'Slot = 90vw × 768 = 691px CSS; × DPR 2 = 1382px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 2; i < 5; i++) {
  fns.push(() => i * 1);
}
console.log(fns.map((f) => f()).join(","));','javascript','["3,4,5","2,3,4","5,5,5"]'::jsonb,null,1,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 5);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 6);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["B.ctor 6 | B.field | B.init undefined | A.ctor | A.field","A.field | A.ctor | B.init 6 | B.field | B.ctor 6","A.field | A.ctor | B.init undefined | B.field | B.ctor 6"]'::jsonb,null,2,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 6. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; }
.c2 { position: absolute; z-index: 81; }
/* A dan B bertumpang tindih secara visual */','html','["A (di atas B)","B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=81.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 6, get() { return this.n; } };
const g = o.get.bind({ n: 108 });
console.log(g.call({ n: 268 }));','javascript','["268","108","6"]'::jsonb,null,1,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
# lalu f.txt diedit dan BELUM di-commit: isinya "wip"
$ git reset --soft HEAD~1','bash','["status: bersih | commit: 1 | isi f.txt: v1","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip","status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip"]'::jsonb,null,2,'Dijalankan di repositori nyata: status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([bad("A", 15), bad("B", 10), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"rB\",\"fC\"]","ok \"C\"","err B"]'::jsonb,null,0,'Promise.allSettled menghasilkan: ok ["rA","rB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2023, 5, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["31 4","0 3","13 2"]'::jsonb,null,0,'Hasil: 31 4. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2023 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: border-box;
  width: 300px;
  padding: 0 4px;
  border: 5px solid;
  margin: 0 28px;
}','css','["364","318","356"]'::jsonb,null,2,'border-box: width sudah mencakup padding & border → 300 + 2×28 margin = 356.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','output','Apa output kode ini?',null,'const a = [118,91,72,102];
a.sort();
console.log(a.join(","));','javascript','["103,118,72,91","91,72,118,102","102,118,72,91"]'::jsonb,null,2,'Dijalankan langsung: 102,118,72,91.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 50, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{''a'':2,''b'':50} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":2,\"b\":50} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":3,\"b\":50} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,1,'Hasil: {"a":2,"b":50} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Apa yang terjadi pada <input> ini saat pengguna mengetik?',null,'<input value={teks} />','javascript','["Nilai disimpan otomatis ke state teks","Input bekerja normal dan teks berubah","Input menjadi hanya-baca efektif"]'::jsonb,null,2,'Input terkontrol selalu menampilkan value dari state. Tanpa onChange yang memperbarui state, ketikan tak mengubah tampilan.',null,'Siapa yang menentukan nilai tampilan pada input terkontrol?',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 1000px; display: flex; gap: 24px; }
.kartu { flex: 0 0 calc((100% - 24px) / 2); }','css','["500","476","488"]'::jsonb,null,2,'(1000 − 24) / 2 = 488px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','guess','Mitigasi UTAMA untuk kasus ini?
Komentar berisi <script> tersimpan di database dan dieksekusi di browser setiap pengunjung yang membuka halaman.',null,'# keamanan aplikasi web','text','["Escape output sesuai konteks + sanitasi HTML + Content-Security-Policy","Periksa kepemilikan/otorisasi di server pada setiap akses objek","Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types"]'::jsonb,null,0,'Mitigasi yang tepat untuk Stored XSS: Escape output sesuai konteks + sanitasi HTML + Content-Security-Policy.',null,'Akar masalahnya: Stored XSS.',null),
('frontend','output','Urutan log lengkap setelah semua langkah di komentar?',null,'function Anak({ id }) {
  useEffect(() => {
    log("C+" + id);
    return () => log("C-" + id);
  }, [id]);
  return null;
}
function Induk() {
  const [id, setId] = useState(1);
  const [, tick] = useState(0);
  useEffect(() => {
    log("P+" + id);
    return () => log("P-" + id);
  }, [id]);
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["C+1 P+1 C-1 C+2 P-1 P+2","C+1 P+1 C-1 P-1 C+2 P+2","P+1 C+1 P-1 C-1 P+2 C+2"]'::jsonb,null,1,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Beda ''tree shaking'' dan ''code splitting''?',null,'# optimasi bundle','text','["Tree shaking membuang kode ekspor yang tak terpakai saat build","Tree shaking memecah bundle, code splitting menghapus kode mati","Keduanya mengompresi gambar"]'::jsonb,null,0,'Tree shaking mengeliminasi kode mati (bergantung pada ES modules); splitting menunda pemuatan bagian yang belum diperlukan.',null,'Membuang vs memecah.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 800px; gap: 0px; }
.i1 { flex: 2 2 300px; min-width: 0; }
.i2 { flex: 3 3 150px; min-width: 0; }
.i3 { flex: 3 1 150px; min-width: 0; }','css','["216.67","200","225"]'::jsonb,null,2,'Ruang sisa = 800 − gap 0 − Σbasis = 200px dibagi menurut flex-grow (Σ=8) → 225px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Berapa lebar kolom ke-1 (px)?',null,'.grid {
  display: grid;
  width: 800px;
  gap: 0 20px;
  grid-template-columns: 3fr 120px 80px 2fr;
}','css','["480","360","324"]'::jsonb,null,2,'Ruang untuk fr = 800 − gap 60 − track px 200 = 540px dibagi 5 fr → 1fr = 108px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="map.js"></script>
  <script defer src="util.js"></script>
  <script src="app.js"></script>
  <script defer src="api.js"></script>
  <script defer src="auth.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["util.js → api.js → auth.js → map.js → app.js","map.js → app.js → util.js → api.js → auth.js","map.js → util.js → app.js → api.js → auth.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: map.js → app.js → util.js → api.js → auth.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 5) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(undefined)), JSON.stringify(f(0)));','javascript','["{\"a\":5,\"b\":5} {\"a\":\"dflt\",\"b\":0}","{\"a\":5,\"b\":5} {\"a\":0,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":0,\"b\":\"dflt\"}"]'::jsonb,null,1,'Hasil: {"a":5,"b":5} {"a":0,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(6);
  function klik() {
    setN(16);
    setN(n + 4);
    setN(n + 1);
    setN((p) => p * 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["63","21","7"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=6 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 6 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 21.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan tooling/framework CSS?',null,'1. Sass
2. PostCSS
3. SQL Server
4. Bulma
5. WebdriverIO','text','["1, 2, 5","1, 2, 4","1, 4, 5"]'::jsonb,null,1,'Bulma, Sass, PostCSS adalah tooling/framework CSS; WebdriverIO dan SQL Server termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.4" }
// versi yang tersedia di registry:
0.0.4  0.0.6  0.0.7  0.1.4  0.1.5  0.1.7  0.2.4  0.2.7','json','["0.0.4","0.2.7","0.0.7"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.7.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output kode ini?',null,'try {
  const o = new Kelas(57);
  class Kelas { constructor(x) { this.x = x; } }
  console.log(o.x);
} catch (e) { console.log(e.name); }','javascript','["ReferenceError","function","TypeError"]'::jsonb,null,0,'class berada di TDZ sebelum deklarasinya → ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_opacity { to { opacity: … } }
@keyframes k_top { to { top: … } }
@keyframes k_visibility { to { visibility: … } }','css','["visibility < opacity < top","top < visibility < opacity","opacity < visibility < top"]'::jsonb,null,2,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), visibility memicu paint ulang, top memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 1.25em; }
.b { font-size: 0.8em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","24","37.5"]'::jsonb,null,0,'font-size .a = 10×1.25 = 12.5px; .b = 12.5×0.8 = 10px; em pada padding memakai font-size elemen itu sendiri → 3×10 = 30px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Lebar (px) elemen pada viewport 320px?',null,'.hero { width: clamp(320px, 80vw, 720px); }','css','["720","256","320"]'::jsonb,null,2,'80vw = 256px, lalu dibatasi [320, 720] → 320px.',null,'clamp(min, ideal, max).',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(9);
const q = Object.create(p);
q.n = 14;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["11 false true","9 true true","9 false true"]'::jsonb,null,2,'Hasil: 9 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','output','Apa output kode ini?',null,'console.log(["90","37","90","79"].map(parseInt).join(","));','javascript','["91,NaN,NaN,NaN","NaN,NaN,NaN,90","90,NaN,NaN,NaN"]'::jsonb,null,2,'Dijalankan langsung: 90,NaN,NaN,NaN.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
tengah.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"), true);
luar.addEventListener("click", (e) => { log("D"); e.stopPropagation(); });
tombol.addEventListener("click", () => log("E"));
tengah.addEventListener("click", () => log("F"), true);','javascript','["C B F E A D","A B C D E F","E A B F C D"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C B F E A D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Mode dev React 18 + StrictMode: berapa kali setup dan cleanup efek ini berjalan setelah mount pertama?',null,'useEffect(() => {
  log("setup");
  return () => log("cleanup");
}, []);','javascript','["setup → setup tanpa cleanup","setup sekali saja","setup → cleanup → setup"]'::jsonb,null,2,'StrictMode di development sengaja menjalankan ulang efek untuk menyingkap cleanup yang hilang. Di produksi hanya sekali.',null,'StrictMode menguji apa pada efek?',null),
('frontend','output','Urutan log lengkap setelah semua langkah di komentar?',null,'function Anak({ id }) {
  useEffect(() => {
    log("C+" + id);
    return () => log("C-" + id);
  }, [id]);
  return null;
}
function Induk() {
  const [id, setId] = useState(1);
  const [, tick] = useState(0);
  useEffect(() => {
    log("P+" + id);
    return () => log("P-" + id);
  });
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)','javascript','["C+1 P+1 C-1 P-1 C+2 P+2","C+1 P+1 C-1 C+2 P-1 P+2","P+1 C+1 P-1 C-1 P+2 C+2"]'::jsonb,null,0,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 61;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["61 undefined","149","61 TypeError"]'::jsonb,null,2,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="util.js"></script>
  <script type="module" src="ui.js"></script>
  <script defer src="app.js"></script>
  <script src="chart.js"></script>
  <script src="map.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["ui.js → app.js → util.js → chart.js → map.js","util.js → chart.js → map.js → ui.js → app.js","util.js → ui.js → app.js → chart.js → map.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: util.js → chart.js → map.js → ui.js → app.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 9; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; z-index: 7; }
.c2 { position: absolute; z-index: 187; }
/* A dan B bertumpang tindih secara visual */','html','["Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)","B (di atas A)"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=9, B=7.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1200px?',null,'.grid { gap: 24px; }
@media (min-width: 768px) { .grid { gap: 16px; } }
@media (max-width: 768px) { .grid { gap: 8px; } }
@media (min-width: 768px) and (max-width: 768px) { .grid { gap: 32px; } }','css','["8","24","16"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 16px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(3);
  function klik() {
    setN((p) => p + 4);
    setN(28);
    setN(n + 4);
    setN((p) => p + 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","34","7"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=3 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 3 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 9.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.1" }
// versi yang tersedia di registry:
0.0.1  0.0.2  0.0.3  0.1.4  0.2.0  0.2.2  1.0.3','json','["1.0.3","0.0.1","0.0.3"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.1.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof harga);
  let harga = 73;
} catch (e) { console.log(e.name); }','javascript','["TypeError","function","ReferenceError"]'::jsonb,null,2,'let ada di TDZ sebelum deklarasi; typeof pun melempar ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 20px; }
.anak  { margin-top: 20px; }','css','["40","20","53"]'::jsonb,null,1,'Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(20, 20) = 20px.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2028, 6, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["0 8","18 1","30 5"]'::jsonb,null,2,'Hasil: 30 5. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2028 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-480.jpg","foto-2000.jpg"]'::jsonb,null,0,'Slot = 40vw × 1024 = 410px CSS; × DPR 3 = 1229px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 1; i < 5; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["2,4,6,8","4,6,8,10","10,10,10,10"]'::jsonb,null,0,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("G");
queueMicrotask(() => console.log("E"));
console.log("C");
queueMicrotask(() => console.log("A"));','javascript','["G C E A","C G E A","G E C A"]'::jsonb,null,0,'Urutan nyata: G C E A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'.a { font-size: 1.5em; }
.b { font-size: 1.25em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["90","48","72"]'::jsonb,null,0,'font-size .a = 16×1.5 = 24px; .b = 24×1.25 = 30px; em pada padding memakai font-size elemen itu sendiri → 3×30 = 90px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(1 / 0 - 1 / 0);
console.log(typeof NaN);
console.log(0.1 * 3);','javascript','["NaN | number | 0.30000000000000004","NaN | 0 | 0.30000000000000004","0 | number | 0.30000000000000004"]'::jsonb,null,0,'Hasil nyata: NaN | number | 0.30000000000000004. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 5), bad("B", 15), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok \"C\"","ok [\"rA\",\"rB\",\"fC\"]"]'::jsonb,null,0,'Promise.race menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
$ git stash','bash','["status: f.txt ter-staging | commit: 1 | isi f.txt: v2","status: bersih | commit: 2 | isi f.txt: v2","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: v2"]'::jsonb,null,1,'Dijalankan di repositori nyata: status: bersih | commit: 2 | isi f.txt: v2. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 3) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(undefined)), JSON.stringify(f(NaN)));','javascript','["{\"a\":3,\"b\":3} {\"a\":\"dflt\",\"b\":null}","{\"a\":3,\"b\":3} {\"a\":null,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":null,\"b\":\"dflt\"}"]'::jsonb,null,1,'Hasil: {"a":3,"b":3} {"a":null,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pengelola state klien?',null,'1. MobX
2. Zustand
3. Next.js
4. MariaDB
5. Redux','text','["2, 4, 5","2, 3, 4","1, 2, 5"]'::jsonb,null,2,'Zustand, Redux, MobX adalah pengelola state klien; Next.js dan MariaDB termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c9"; } finally { return "f68"; }
}
console.log(f());','javascript','["f69","undefined","f68"]'::jsonb,null,2,'Dijalankan: f68.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Berapa lebar akhir (px) item .i3?',null,'.baris { display: flex; width: 900px; gap: 0px; }
.i1 { flex: 1 2 300px; min-width: 0; }
.i2 { flex: 2 3 100px; min-width: 0; }
.i3 { flex: 1 0 250px; min-width: 0; }','css','["333.33","312.5","346.15"]'::jsonb,null,1,'Ruang sisa = 900 − gap 0 − Σbasis = 250px dibagi menurut flex-grow (Σ=4) → 312.5px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','fill','Lengkapi agar berkas berhash dapat disimpan setahun dan tidak pernah divalidasi ulang:',null,'Cache-Control: public, max-age=31536000, ____','http','["no-cache","must-revalidate","immutable"]'::jsonb,null,2,'immutable memberi tahu cache bahwa isi tak akan berubah selama masa segar, sehingga tak perlu revalidasi.',null,'Isi berkas tidak akan berubah.',null),
('frontend','guess','Jenis kerentanan/serangan apa ini?',null,'Penyerang mengisi kolom login dengan '' OR ''1''=''1'' -- dan masuk tanpa password.','text','["Subdomain takeover","Credential Stuffing","SQL Injection"]'::jsonb,null,2,'SQL Injection: Query berparameter (prepared statement) dan hak akses DB minimum.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('frontend','output','Apa output kode ini?',null,'const o = { n: 39, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":79},\"a\":[{\"v\":78}]}","{\"o\":{\"v\":78},\"a\":[{\"v\":78}]}","{''o'':{''v'':78},''a'':[{''v'':78}]}"]'::jsonb,null,1,'Hasil: {"o":{"v":78},"a":[{"v":78}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Berapa lebar kolom ke-2 (px)?',null,'.grid {
  display: grid;
  width: 1000px;
  gap: 0 0px;
  grid-template-columns: 200px 1fr 200px;
}','css','["1000","333.33","600"]'::jsonb,null,2,'Ruang untuk fr = 1000 − gap 0 − track px 400 = 600px dibagi 1 fr → 1fr = 600px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: content-box;
  width: 400px;
  padding: 0 14px;
  border: 1px solid;
  margin: 0 17px;
}','css','["464","430","462"]'::jsonb,null,0,'content-box: width hanya konten → 400 + 2×14 + 2×1 + 2×17 = 464.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_opacity { to { opacity: … } }
@keyframes k_box_shadow { to { box-shadow: … } }
@keyframes k_top { to { top: … } }','css','["opacity < box-shadow < top","top < box-shadow < opacity","box-shadow < opacity < top"]'::jsonb,null,0,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), box-shadow memicu paint ulang, top memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
.wrap :is(.a, .b):not(.zzz) { color: oranye !important; }
@layer base {
  :is(.a, #kartu) { color: hijau !important; }
}
.b#kartu:not(#zzz) { color: ungu; }
@layer base {
  p:not(#zzz) { color: kuning; }
}','html','["oranye","hijau","ungu"]'::jsonb,null,1,'.wrap :is(.a, .b):not(.zzz): (0,3,0) !important → oranye; :is(.a, #kartu): (1,0,0) !important [@layer] → hijau; .b#kartu:not(#zzz): (2,1,0) → ungu; p:not(#zzz): (1,0,1) [@layer] → kuning. Pemenang: hijau. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 25, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["ReferenceError","TypeError","object"]'::jsonb,null,1,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Apa output kode ini?',null,'function stok() { return 73; }
var stok;
console.log(typeof stok, stok());','javascript','["function number","function 73","undefined number"]'::jsonb,null,1,'Deklarasi function diangkat penuh; ''var v;'' tanpa nilai tidak menimpa. Hasilnya function lalu nilai kembaliannya.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.4.4" }
// versi yang tersedia di registry:
2.4.4  2.4.7  2.5.6  2.6.5  2.6.6  3.4.5  3.4.6','json','["2.6.6","3.4.6","2.4.7"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.6.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_transform { to { transform: … } }
@keyframes k_border_width { to { border-width: … } }
@keyframes k_background_color { to { background-color: … } }','css','["border-width < background-color < transform","background-color < transform < border-width","transform < background-color < border-width"]'::jsonb,null,2,'transform hanya perlu compositing (di GPU, tanpa layout/paint), background-color memicu paint ulang, border-width memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 0; i < 4; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["2,4,6,8","8,8,8,8","0,2,4,6"]'::jsonb,null,1,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 4, jadi semua closure menghasilkan 8.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Overlay position: fixed ini tidak menutup viewport penuh, malah terpotong di dalam .panel. Mengapa?',null,'.panel { transform: translateX(0); }
.panel .overlay {
  position: fixed;
  inset: 0;
}','css','["inset: 0 tidak valid untuk position fixed sehingga ditafsirkan sebagai auto","fixed hanya bekerja pada elemen yang menjadi anak langsung dari body","Induk dengan transform menjadi containing block bagi turunan fixed"]'::jsonb,null,2,'transform, perspective, filter, will-change:transform membentuk containing block untuk turunan absolute dan fixed.',null,'Fixed relatif terhadap apa jika ada nenek moyang bertransform?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 6) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(0)), JSON.stringify(f(false)));','javascript','["{\"a\":0,\"b\":\"dflt\"} {\"a\":false,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":0} {\"a\":\"dflt\",\"b\":false}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}"]'::jsonb,null,0,'Hasil: {"a":0,"b":"dflt"} {"a":false,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 599px?',null,'.grid { gap: 4px; }
@media (min-width: 600px) and (max-width: 1024px) { .grid { gap: 16px; } }
@media (max-width: 1024px) { .grid { gap: 12px; } }
@media (min-width: 600px) { .grid { gap: 24px; } }','css','["24","12","4"]'::jsonb,null,1,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 12px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x style="color: oranye">Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
:where(#kartu, .a):is(.a, .b).b { color: ungu; }
main .a.b { color: kuning; }
@layer base {
  main :not(#zzz)#kartu[data-x] { color: hijau; }
}','html','["oranye","kuning","ungu"]'::jsonb,null,0,':where(#kartu, .a):is(.a, .b).b: (0,2,0) → ungu; main .a.b: (0,2,1) → kuning; main :not(#zzz)#kartu[data-x]: (2,1,1) [@layer] → hijau; style inline: (0,0,0) → oranye. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 1000px;
  gap: 0 8px;
  grid-template-columns: 3fr 160px 3fr 200px;
}','css','["308","320","500"]'::jsonb,null,0,'Ruang untuk fr = 1000 − gap 24 − track px 360 = 616px dibagi 6 fr → 1fr = 102.67px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 2);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 3);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["A.field | A.ctor | B.init undefined | B.field | B.ctor 3","A.field | A.ctor | B.init 3 | B.field | B.ctor 3","B.ctor 3 | B.field | B.init undefined | A.ctor | A.field"]'::jsonb,null,0,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 3. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','output','Apa output kode ini?',null,'const x = [17,93,34];
x.length = 1;
x[3] = 0;
console.log(x.length, JSON.stringify(x));','javascript','["5 [17,null,null,0]","4 [17,null,null,0]","0],null,null,4 [17"]'::jsonb,null,1,'Dijalankan langsung: 4 [17,null,null,0].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Urutan log lengkap setelah semua langkah di komentar?',null,'function Anak({ id }) {
  useEffect(() => {
    log("C+" + id);
    return () => log("C-" + id);
  }, []);
  return null;
}
function Induk() {
  const [id, setId] = useState(1);
  const [, tick] = useState(0);
  useEffect(() => {
    log("P+" + id);
    return () => log("P-" + id);
  }, [id]);
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["C+1 P+1 P-1 P+2","P+2 P-1 P+1 C+1","P+1 C+1 P-1 P+2"]'::jsonb,null,0,'Hasil: C+1 P+1 P-1 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. Testing Library
2. PostgreSQL
3. Bulma
4. Playwright
5. Cypress','text','["3, 4, 5","1, 2, 4","1, 4, 5"]'::jsonb,null,2,'Testing Library, Cypress, Playwright adalah alat uji end-to-end/komponen di browser; PostgreSQL dan Bulma termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; isolation: isolate; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; z-index: 8; }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["Tidak bisa ditentukan tanpa ukuran elemen","B (di atas A)","A (di atas B)"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=8.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'(async () => {
  console.log("E");
  await null;
  console.log("D");
})();
console.log("B");
Promise.resolve().then(() => {
  console.log("H");
  queueMicrotask(() => console.log("A"));
});
(async () => {
  console.log("C");
  await null;
  console.log("G");
})();
queueMicrotask(() => console.log("undefined"));','javascript','["E B C D H G undefined A","E D B H A C G","B E C D H G undefined A"]'::jsonb,null,0,'Urutan nyata: E B C D H G undefined A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2023, 0, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["7 1","0 5","31 11"]'::jsonb,null,2,'Hasil: 31 11. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2023 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: border-box;
  width: 240px;
  padding: 0px 14px;
  border: 5px solid;
}','css','["202","278","221"]'::jsonb,null,0,'border-box: konten = 240 − 2×14 − 2×5 = 202.',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 15), bad("B", 10), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err B","ok [\"fA\",\"rB\",\"fC\"]","ok \"C\""]'::jsonb,null,2,'Promise.any menghasilkan: ok "C". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
tengah.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", (e) => { log("C"); e.stopImmediatePropagation(); });
tombol.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"), true);','javascript','["B E D A C","A B C D E","D A B C"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B E D A C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Berapa lebar akhir (px) item .i3?',null,'.baris { display: flex; width: 1000px; gap: 10px; }
.i1 { flex: 1 0 250px; min-width: 0; }
.i2 { flex: 0 1 200px; min-width: 0; }
.i3 { flex: 3 1 150px; min-width: 0; }','css','["435","276.67","450"]'::jsonb,null,0,'Ruang sisa = 1000 − gap 20 − Σbasis = 380px dibagi menurut flex-grow (Σ=4) → 435px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Lebar (px) .kotak?',null,'.induk { width: 800px; }
.kotak { width: min(60%, 500px); }','css','["500","480","864"]'::jsonb,null,1,'60% × 800 = 480px; min() mengambil yang terkecil → 480px.',null,'min() mengambil nilai terkecil.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([1, 2, 3] == "1,2,3");
console.log([] == ![]);
console.log(null == 0);','javascript','["false | true | false","true | true | false","true | false | false"]'::jsonb,null,1,'Hasil nyata: true | true | false. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 60vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-1024.jpg","foto-1280.jpg"]'::jsonb,null,1,'Slot = 90vw × 360 = 324px CSS; × DPR 3 = 972px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(9);
  function klik() {
    setN((p) => p * 4);
    setN(n + 2);
    setN(n + 3);
    setN(n + 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["13","18","45"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=9 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 9 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 13.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 6, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{''a'':2,''b'':6} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":3,\"b\":6} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":2,\"b\":6} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,2,'Hasil: {"a":2,"b":6} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','fill','Lengkapi agar grid otomatis mengisi baris dan menyesuaikan jumlah kolom dengan lebar kontainer:',null,'grid-template-columns: repeat(____, minmax(200px, 1fr));','css','["auto-size","auto-fit","fit-content"]'::jsonb,null,1,'repeat(auto-fit, minmax(…)) membuat sebanyak mungkin kolom yang muat dan merenggangkan sisanya.',null,'Kata kunci repeat() untuk kolom otomatis.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'<div class="x" style="margin-bottom: 20px">X</div>
<div class="y" style="margin-top: 12px">Y</div>
<!-- keduanya block biasa, normal flow -->','html','["32","12","20"]'::jsonb,null,2,'Margin vertikal antar saudara block menyatu: (20, 12) → 20px (positif: ambil terbesar; campuran: dijumlahkan).',null,'Aturan: dua positif → max; dua negatif → min; campuran → jumlah.',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
$ git reset --soft HEAD~1','bash','["status: f.txt ter-staging | commit: 1 | isi f.txt: v2","status: bersih | commit: 1 | isi f.txt: v1","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: v2"]'::jsonb,null,0,'Dijalankan di repositori nyata: status: f.txt ter-staging | commit: 1 | isi f.txt: v2. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(9)
  .finally(() => 70)
  .then((v) => console.log("v", v));','javascript','["v 9","v 10","undefined"]'::jsonb,null,0,'Dijalankan: v 9.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="ui.js"></script>
  <script src="app.js"></script>
  <script defer src="chart.js"></script>
  <script src="auth.js"></script>
  <script defer src="api.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["ui.js → app.js → auth.js → chart.js → api.js","ui.js → app.js → chart.js → auth.js → api.js","chart.js → api.js → ui.js → app.js → auth.js"]'::jsonb,null,0,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → app.js → auth.js → chart.js → api.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 1.5em; }
.b { font-size: 0.5em; padding-left: 2em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","20","15"]'::jsonb,null,2,'font-size .a = 10×1.5 = 15px; .b = 15×0.5 = 7.5px; em pada padding memakai font-size elemen itu sendiri → 2×7.5 = 15px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Urutan log lengkap setelah semua langkah di komentar?',null,'function Anak({ id }) {
  useEffect(() => {
    log("C+" + id);
    return () => log("C-" + id);
  }, [id]);
  return null;
}
function Induk() {
  const [id, setId] = useState(1);
  const [, tick] = useState(0);
  useEffect(() => {
    log("P+" + id);
    return () => log("P-" + id);
  }, [id]);
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)','javascript','["P+1 C+1 P-1 C-1 P+2 C+2","C+1 P+1 C-1 C+2 P-1 P+2","C+1 P+1 C-1 P-1 C+2 P+2"]'::jsonb,null,2,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r4"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["end | f | c r4 | sync","sync | c r4 | f | end","sync | c r5 | f | end"]'::jsonb,null,1,'Dijalankan: sync | c r4 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof skor);
  var skor = 80;
  console.log(typeof skor);
} catch (e) { console.log(e.name); }','javascript','["function number","undefined function","undefined number"]'::jsonb,null,2,'var di-hoist dan bernilai undefined sebelum baris deklarasi; typeof pertama ''undefined'', lalu ''number''.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 7) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(NaN)), JSON.stringify(f(undefined)));','javascript','["{\"a\":\"dflt\",\"b\":null} {\"a\":7,\"b\":7}","{\"a\":null,\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":null,\"b\":\"dflt\"} {\"a\":7,\"b\":7}"]'::jsonb,null,2,'Hasil: {"a":null,"b":"dflt"} {"a":7,"b":7}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: border-box;
  width: 200px;
  padding: 0 16px;
  border: 7px solid;
  margin: 0 29px;
}','css','["258","290","246"]'::jsonb,null,0,'border-box: width sudah mencakup padding & border → 200 + 2×29 margin = 258.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2025, 0, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["31 11","0 11","14 1"]'::jsonb,null,0,'Hasil: 31 11. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2025 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="util.js"></script>
  <script type="module" src="auth.js"></script>
  <script src="ui.js"></script>
  <script defer src="api.js"></script>
  <script defer src="chart.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["util.js → auth.js → api.js → chart.js → ui.js","ui.js → util.js → auth.js → api.js → chart.js","util.js → auth.js → ui.js → api.js → chart.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → util.js → auth.js → api.js → chart.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 5), bad("B", 10), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok [\"rA\",\"rB\",\"fC\"]","ok \"C\""]'::jsonb,null,0,'Promise.all menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN(19);
    setN((p) => p + 5);
    setN(12);
    setN(n + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["2","7","13"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 2.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 768px?',null,'.grid { gap: 24px; }
@media (max-width: 768px) { .grid { gap: 16px; } }
@media (min-width: 768px) { .grid { gap: 4px; } }
@media (min-width: 768px) and (max-width: 768px) { .grid { gap: 32px; } }','css','["4","32","24"]'::jsonb,null,1,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 32px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 95, get() { return this.n; } };
const g = o.get.bind({ n: 184 });
console.log(g.call({ n: 227 }));','javascript','["184","227","95"]'::jsonb,null,0,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Apa output kode ini?',null,'const o = { n: 15, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":31},\"a\":[{\"v\":30}]}","{\"o\":{\"v\":30},\"a\":[{\"v\":30}]}","{''o'':{''v'':30},''a'':[{''v'':30}]}"]'::jsonb,null,1,'Hasil: {"o":{"v":30},"a":[{"v":30}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; transform: translateZ(0); }
.c1 { position: absolute; z-index: 328; }
.p2 { position: relative; z-index: 3; }
.c2 { position: absolute; z-index: 329; }
/* A dan B bertumpang tindih secara visual */','html','["A (di atas B)","B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=3.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 24px; }
.anak  { margin-top: 30px; }','css','["54","60","30"]'::jsonb,null,2,'Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(24, 30) = 30px.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(0 === [0]);
console.log([10, 9, 1].sort());
console.log(null - false);','javascript','["false | [ 1, 10, 9 ] | 0","true | [ 1, 10, 9 ] | 0","false | 5 | 0"]'::jsonb,null,0,'Hasil nyata: false | [ 1, 10, 9 ] | 0. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 6);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 7);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["A.field | A.ctor | B.init undefined | B.field | B.ctor 7","A.field | A.ctor | B.init 7 | B.field | B.ctor 7","B.ctor 7 | B.field | B.init undefined | A.ctor | A.field"]'::jsonb,null,0,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 7. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Dari daftar ini, nomor mana yang BUKAN bundler/build tool?',null,'1. Flask
2. Jotai
3. Vite
4. Parcel
5. Rollup','text','["1 dan 2 dan 4","1 dan 2","2 dan 4 dan 5"]'::jsonb,null,1,'Flask dan Jotai termasuk kategori lain; Rollup, Parcel, Vite adalah bundler/build tool.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('frontend','output','Apa output kode ini?',null,'const a = [30,44,53,57];
a.sort();
console.log(a.join(","));','javascript','["31,44,53,57","30,44,53,57","57,53,44,30"]'::jsonb,null,1,'Dijalankan langsung: 30,44,53,57.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.3.1" }
// versi yang tersedia di registry:
1.3.1  1.3.2  1.3.4  1.4.0  1.4.3  2.3.3  2.4.2  2.5.2','json','["1.3.4","2.5.2","1.4.3"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.4.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("D"), 0);
queueMicrotask(() => console.log("E"));
Promise.resolve().then(() => console.log("H"));
Promise.resolve().then(() => {
  console.log("B");
  queueMicrotask(() => console.log("C"));
});','javascript','["E H B C D","D E H B C","H E B C D"]'::jsonb,null,0,'Urutan nyata: E H B C D. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Server membalas 404 untuk /x. Apa nilai yang tercetak?',null,'try {
  const r = await fetch("/x");
  console.log(r.ok);
} catch (e) {
  console.log("error");
}','javascript','["true — respons diterima sehingga properti ok bernilai benar","error — fetch reject untuk status 4xx maupun 5xx dari server","false — fetch hanya reject karena kegagalan jaringan"]'::jsonb,null,2,'fetch resolve untuk respons HTTP apa pun; periksa r.ok atau r.status. Reject hanya pada kegagalan jaringan/CORS/abort.',null,'Kapan fetch benar-benar reject?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
$ git reset --mixed HEAD~1','bash','["status: f.txt ter-staging | commit: 1 | isi f.txt: v2","status: bersih | commit: 1 | isi f.txt: v1","status: f.txt berubah, belum di-staging | commit"]'::jsonb,null,2,'Dijalankan di repositori nyata: status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: v2. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_font_size { to { font-size: … } }
@keyframes k_visibility { to { visibility: … } }
@keyframes k_transform { to { transform: … } }','css','["transform < visibility < font-size","visibility < transform < font-size","font-size < visibility < transform"]'::jsonb,null,0,'transform hanya perlu compositing (di GPU, tanpa layout/paint), visibility memicu paint ulang, font-size memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x style="color: merah">Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
.wrap .b#kartu { color: biru; }
#kartu:first-child.a { color: kuning; }
@layer base {
  p[data-x] { color: oranye; }
}','html','["biru","kuning","merah"]'::jsonb,null,2,'.wrap .b#kartu: (1,2,0) → biru; #kartu:first-child.a: (1,2,0) → kuning; p[data-x]: (0,1,1) [@layer] → oranye; style inline: (0,0,0) → merah. Pemenang: merah. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 1; i < 4; i++) {
  fns.push(() => i * 1);
}
console.log(fns.map((f) => f()).join(","));','javascript','["4,4,4","1,2,3","2,3,4"]'::jsonb,null,1,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Andi ingin membuat aplikasi mobile Android+iOS dengan satu basis kode. Laptopnya lemah untuk Android Studio dan ia hanya menguasai JavaScript/TypeScript. Pilihan paling masuk akal?',null,'# kendala: spesifikasi rendah, keahlian JS','text','["Django + Python (merender UI native lewat template)","React Native + TypeScript","Laravel + PHP (menghasilkan aplikasi native langsung)"]'::jsonb,null,1,'Laravel/Django adalah kerangka sisi server; keduanya tidak menghasilkan UI native. React Native menulis UI memakai JS/TS dan menjalankannya lintas platform.',null,'Mana yang menghasilkan UI di perangkat?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", (e) => { log("A"); e.stopImmediatePropagation(); });
tombol.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"));
tombol.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"), true);
luar.addEventListener("click", () => log("F"), true);','javascript','["F E B D A","B D A","A B D E F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: F E B D A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-1024.jpg","foto-480.jpg"]'::jsonb,null,0,'Slot = 100vw × 390 = 390px CSS; × DPR 2 = 780px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Berapa lebar kolom ke-4 (px)?',null,'.grid {
  display: grid;
  width: 960px;
  gap: 0 8px;
  grid-template-columns: 100px 80px 120px 2fr;
}','css','["660","960","636"]'::jsonb,null,2,'Ruang untuk fr = 960 − gap 24 − track px 300 = 636px dibagi 2 fr → 1fr = 318px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 500px; display: flex; gap: 16px; }
.kartu { flex: 0 0 calc((100% - 16px) / 2); }','css','["242","250","234"]'::jsonb,null,0,'(500 − 16) / 2 = 242px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','guess','Berapa lebar akhir (px) item .i1?',null,'.baris { display: flex; width: 900px; gap: 20px; }
.i1 { flex: 0 2 300px; min-width: 0; }
.i2 { flex: 1 0 200px; min-width: 0; }
.i3 { flex: 0 2 250px; min-width: 0; }','css','["300","336.67","344"]'::jsonb,null,0,'Ruang sisa = 900 − gap 40 − Σbasis = 110px dibagi menurut flex-grow (Σ=1) → 300px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 75%; }
.b { font-size: 1.5em; padding-left: 1.5em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","22.5","33.75"]'::jsonb,null,2,'font-size .a = 20×0.75 = 15px; .b = 15×1.5 = 22.5px; em pada padding memakai font-size elemen itu sendiri → 1.5×22.5 = 33.75px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah baris 9 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 800px; gap: 20px; }
.i1 { flex: 2 0 100px; min-width: 0; }
.i2 { flex: 3 3 250px; min-width: 0; }
.i3 { flex: 2 3 200px; min-width: 0; }','css','["320","340","357.14"]'::jsonb,null,1,'Ruang sisa = 800 − gap 40 − Σbasis = 210px dibagi menurut flex-grow (Σ=7) → 340px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.1" }
// versi yang tersedia di registry:
0.0.1  0.0.2  0.0.3  0.1.1  0.1.2  1.0.3  1.1.1  1.2.0','json','["0.0.3","0.0.1","1.2.0"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(4);
  function klik() {
    setN((p) => p * 3);
    setN((p) => p + 3);
    setN(n + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["8","16","5"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=4 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 4 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 5.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log({} + []);
console.log(0 + 5);
console.log((() => {}).length);','javascript','["[object Object] | 5 | 0","[object Object] | [object Object] | 0","false | 5 | 0"]'::jsonb,null,0,'Hasil nyata: [object Object] | 5 | 0. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 0; i < 3; i++) {
  fns.push(() => i * 1);
}
console.log(fns.map((f) => f()).join(","));','javascript','["1,2,3","0,1,2","3,3,3"]'::jsonb,null,1,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Urutan log lengkap setelah semua langkah di komentar?',null,'function Anak({ id }) {
  useEffect(() => {
    log("C+" + id);
    return () => log("C-" + id);
  });
  return null;
}
function Induk() {
  const [id, setId] = useState(1);
  const [, tick] = useState(0);
  useEffect(() => {
    log("P+" + id);
    return () => log("P-" + id);
  }, []);
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)','javascript','["P+1 C+1 C-1 C+2","C+2 C-1 P+1 C+1","C+1 P+1 C-1 C+2"]'::jsonb,null,2,'Hasil: C+1 P+1 C-1 C+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 3], e: null }));','javascript','["{''c'':null,''d'':[null,3],''e'':null}","{\"c\":undefined,\"d\":[null,4],\"e\":null}","{\"c\":null,\"d\":[null,3],\"e\":null}"]'::jsonb,null,2,'Hasil: {"c":null,"d":[null,3],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2025, 6, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["0 1","30 5","25 1"]'::jsonb,null,1,'Hasil: 30 5. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2025 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_border_radius { to { border-radius: … } }
@keyframes k_margin_left { to { margin-left: … } }
@keyframes k_opacity { to { opacity: … } }','css','["border-radius < opacity < margin-left","opacity < border-radius < margin-left","margin-left < border-radius < opacity"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), border-radius memicu paint ulang, margin-left memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 20px; padding-top: 8px; }
.anak  { margin-top: 40px; }','css','["40","68","60"]'::jsonb,null,1,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 20 + 8 + 40 = 68.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 15), ok("B", 10), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err C","ok [\"rA\",\"fB\",\"rC\"]","ok \"B\""]'::jsonb,null,0,'Promise.race menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", (e) => { log("C"); e.stopImmediatePropagation(); });
luar.addEventListener("click", () => log("D"), true);','javascript','["A C","A B C D","B D A C"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B D A C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-640.jpg","foto-800.jpg","foto-1600.jpg"]'::jsonb,null,0,'Slot = 40vw × 1440 = 576px CSS; × DPR 1 = 576px fisik → kandidat terkecil yang ≥ itu: 640w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Berapa lebar konten (px) anak ini?',null,'.induk {
  box-sizing: content-box;
  width: 800px;
  padding: 0 34px;
}
.anak { width: 60%; }   /* box-sizing: content-box, tanpa padding */','css','["520.8","480","439.2"]'::jsonb,null,1,'Persentase mengacu ke lebar KONTEN induk (800px) → 480px.',null,'Persen mengacu ke content box induk, bukan border box.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. WebdriverIO
2. MobX
3. Testing Library
4. Sass
5. Playwright','text','["1, 3, 5","1, 2, 3","1, 4, 5"]'::jsonb,null,0,'Playwright, WebdriverIO, Testing Library adalah alat uji end-to-end/komponen di browser; MobX dan Sass termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'.a { font-size: 1.25em; }
.b { font-size: 0.8em; padding-left: 1.5em; }
/* <div class="a"><div class="b">…</div></div> */','css','["24","19.2","30"]'::jsonb,null,0,'font-size .a = 16×1.25 = 20px; .b = 20×0.8 = 16px; em pada padding memakai font-size elemen itu sendiri → 1.5×16 = 24px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 89, get() { return this.n; } };
const g = o.get.bind({ n: 128 });
console.log(g.call({ n: 237 }));','javascript','["237","128","89"]'::jsonb,null,1,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script type="module" src="chart.js"></script>
  <script src="ui.js"></script>
  <script src="app.js"></script>
  <script defer src="util.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["chart.js → util.js → ui.js → app.js","ui.js → app.js → chart.js → util.js","chart.js → ui.js → app.js → util.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → app.js → chart.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; opacity: .9; }
.c1 { position: absolute; z-index: 291; }
.p2 { position: relative; transform: translateZ(0); }
.c2 { position: absolute; z-index: 483; }
/* A dan B bertumpang tindih secara visual */','html','["Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)","B (di atas A)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=0 (seri → yang belakangan di DOM menang).',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 1);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 2);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["A.field | A.ctor | B.init undefined | B.field | B.ctor 2","B.ctor 2 | B.field | B.init undefined | A.ctor | A.field","A.field | A.ctor | B.init 2 | B.field | B.ctor 2"]'::jsonb,null,0,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 2. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Perbedaan waktu eksekusi useLayoutEffect dan useEffect?',null,'useLayoutEffect(() => ukurTinggi(), []);
useEffect(() => kirimAnalitik(), []);','javascript','["Keduanya sama persis; hanya beda nama dan sama-sama berjalan sebelum browser melukis","useEffect berjalan sebelum DOM diperbarui, sedangkan useLayoutEffect setelah paint","useLayoutEffect berjalan sinkron setelah mutasi DOM dan sebelum browser melukis"]'::jsonb,null,2,'Layout effect memblokir paint sehingga cocok untuk mengukur/menyesuaikan DOM; efek biasa tidak memblokir paint.',null,'Mana yang menghalangi pelukisan layar?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
main [data-x] { color: ungu; }
#kartu { color: kuning; }
.wrap :is(.a, #kartu)[data-x] { color: merah; }','html','["ungu","kuning","merah"]'::jsonb,null,2,'main [data-x]: (0,1,1) → ungu; #kartu: (1,0,0) → kuning; .wrap :is(.a, #kartu)[data-x]: (1,2,0) → merah. Pemenang: merah. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 4) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(0)), JSON.stringify(f(null)));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":0} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":0,\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}"]'::jsonb,null,2,'Hasil: {"a":0,"b":"dflt"} {"a":"dflt","b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 1000px; display: flex; gap: 48px; }
.kartu { flex: 0 0 calc((100% - 144px) / 4); }','css','["238","214","250"]'::jsonb,null,1,'(1000 − 144) / 4 = 214px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','output','Apa output kode ini?',null,'try {
  const o = new Kelas(32);
  class Kelas { constructor(x) { this.x = x; } }
  console.log(o.x);
} catch (e) { console.log(e.name); }','javascript','["ReferenceError","TypeError","undefined"]'::jsonb,null,0,'class berada di TDZ sebelum deklarasinya → ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null);
