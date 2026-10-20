-- DIHASILKAN oleh scripts/gen-dev.mjs (frontend, bagian 4/4) — 50 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('frontend','guess','Berapa lebar konten (px) anak ini?',null,'.induk {
  box-sizing: border-box;
  width: 500px;
  padding: 0 16px;
}
.anak { width: 75%; }   /* box-sizing: content-box, tanpa padding */','css','["375","399","351"]'::jsonb,null,2,'Persentase mengacu ke lebar KONTEN induk (468px) → 351px.',null,'Persen mengacu ke content box induk, bukan border box.',null),
('frontend','guess','Berapa lebar akhir (px) item .i3?',null,'.baris { display: flex; width: 600px; gap: 20px; }
.i1 { flex: 0 1 200px; min-width: 0; }
.i2 { flex: 1 0 150px; min-width: 0; }
.i3 { flex: 0 3 200px; min-width: 0; }','css','["203.33","203.64","200"]'::jsonb,null,2,'Ruang sisa = 600 − gap 40 − Σbasis = 10px dibagi menurut flex-grow (Σ=1) → 200px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-1600.jpg","foto-2000.jpg"]'::jsonb,null,1,'Slot = 50vw × 1440 = 720px CSS; × DPR 2 = 1440px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 10], e: null }));','javascript','["{''c'':null,''d'':[null,10],''e'':null}","{\"c\":undefined,\"d\":[null,11],\"e\":null}","{\"c\":null,\"d\":[null,10],\"e\":null}"]'::jsonb,null,2,'Hasil: {"c":null,"d":[null,10],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. WebdriverIO
2. Playwright
3. Spring Boot
4. Cypress
5. Prisma','text','["1, 3, 4","1, 4, 5","1, 2, 4"]'::jsonb,null,2,'Cypress, Playwright, WebdriverIO adalah alat uji end-to-end/komponen di browser; Spring Boot dan Prisma termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 8) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f("")), JSON.stringify(f(undefined)));','javascript','["{\"a\":\"\",\"b\":\"dflt\",\"c\":0} {\"a\":8,\"b\":8}","{\"a\":\"dflt\",\"b\":\"\",\"c\":0} {\"a\":8,\"b\":8}","{\"a\":\"\",\"b\":\"dflt\",\"c\":0} {\"a\":\"dflt\",\"b\":\"dflt\"}"]'::jsonb,null,0,'Hasil: {"a":"","b":"dflt","c":0} {"a":8,"b":8}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'<div class="x" style="margin-bottom: 24px">X</div>
<div class="y" style="margin-top: -20px">Y</div>
<!-- keduanya block biasa, normal flow -->','html','["4","20","24"]'::jsonb,null,0,'Margin vertikal antar saudara block menyatu: (24, -20) → 4px (positif: ambil terbesar; campuran: dijumlahkan).',null,'Aturan: dua positif → max; dua negatif → min; campuran → jumlah.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 48, get() { return this.n; } };
const g = o.get.bind({ n: 126 });
console.log(g.call({ n: 294 }));','javascript','["48","294","126"]'::jsonb,null,2,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
:first-child[data-x].a { color: hijau; }
.wrap #kartu.a { color: oranye; }
main :not(#zzz).a { color: merah; }','html','["oranye","hijau","merah"]'::jsonb,null,0,':first-child[data-x].a: (0,3,0) → hijau; .wrap #kartu.a: (1,2,0) → oranye; main :not(#zzz).a: (1,1,1) → merah. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; }
.c1 { position: absolute; z-index: 513; }
.p2 { position: relative; }
.c2 { position: absolute; z-index: 985; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,0,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=513, B=985.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.4  0.1.0  0.1.5  0.2.4  0.2.5  1.0.5  1.1.4','json','["0.0.2","1.1.4","0.0.4"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(3);
  function klik() {
    setN((p) => p * 4);
    setN(n + 3);
    setN((p) => p + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","18","6"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=3 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 3 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 9.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Mengapa tinggi elemen anak tidak memenuhi layar?',null,'html, body { }
.induk { }
.anak { height: 100%; }','css','["Tinggi persen butuh tinggi induk yang eksplisit","height: 100% hanya bisa dipakai dengan box-sizing: border-box","Elemen anak harus position: absolute"]'::jsonb,null,0,'Persentase tinggi mengacu ke tinggi blok penampung yang pasti. Beri tinggi pada rantai induk (html, body) atau pakai min-height: 100vh / dvh.',null,'Persen terhadap apa, kalau induknya auto?',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 1200px;
  gap: 0 20px;
  grid-template-columns: 120px 3fr 2fr;
}','css','["432","416","480"]'::jsonb,null,1,'Ruang untuk fr = 1200 − gap 40 − track px 120 = 1040px dibagi 5 fr → 1fr = 208px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 3, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["2 1","31 2","0 6"]'::jsonb,null,1,'Hasil: 31 2. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 2em; }
.b { font-size: 1.25em; padding-left: 2em; }
/* <div class="a"><div class="b">…</div></div> */','css','["40","80","100"]'::jsonb,null,2,'font-size .a = 20×2 = 40px; .b = 40×1.25 = 50px; em pada padding memakai font-size elemen itu sendiri → 2×50 = 100px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_border_radius { to { border-radius: … } }
@keyframes k_border_width { to { border-width: … } }
@keyframes k_opacity { to { opacity: … } }','css','["border-width < border-radius < opacity","opacity < border-radius < border-width","border-radius < opacity < border-width"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), border-radius memicu paint ulang, border-width memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { return "t5"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["fin | t6","t5 | fin","fin | t5"]'::jsonb,null,2,'Dijalankan: fin | t5.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 500px; display: flex; gap: 16px; }
.kartu { flex: 0 0 calc((100% - 32px) / 3); }','css','["156","166.67","161.33"]'::jsonb,null,0,'(500 − 32) / 3 = 156px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("A");
setTimeout(() => {
  console.log("H");
  Promise.resolve().then(() => console.log("B"));
}, 0);
queueMicrotask(() => console.log("E"));
setTimeout(() => {
  console.log("G");
  Promise.resolve().then(() => console.log("C"));
}, 0);','javascript','["A H B E G C","A E H B G C","A E H B C G"]'::jsonb,null,1,'Urutan nyata: A E H B G C. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 599px?',null,'.grid { gap: 16px; }
@media (max-width: 1024px) { .grid { gap: 24px; } }
@media (min-width: 600px) and (max-width: 1024px) { .grid { gap: 4px; } }
@media (min-width: 600px) { .grid { gap: 32px; } }','css','["16","24","32"]'::jsonb,null,1,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 24px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([ok("A", 15), ok("B", 5), bad("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"rC\"]","ok \"B\"","err C"]'::jsonb,null,2,'Promise.all menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Apa output kode ini?',null,'var stok = 76;
(function () {
  console.log(stok);
  var stok = 77;
})();','javascript','["number","undefined","function"]'::jsonb,null,1,'var di dalam fungsi menutupi variabel luar dan di-hoist sebagai undefined, bukan nilai luar.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output kode ini?',null,'console.log(["101","55","6","107"].map(parseInt).join(","));','javascript','["101,NaN,NaN,3","102,NaN,NaN,3","3,NaN,NaN,101"]'::jsonb,null,0,'Dijalankan langsung: 101,NaN,NaN,3.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
tengah.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"), true);
tengah.addEventListener("click", () => log("E"));','javascript','["C B A D E","A B C D E","A D B E C"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C B A D E.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 1; i < 5; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["20,30,40,50","10,20,30,40","50,50,50,50"]'::jsonb,null,2,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 5, jadi semua closure menghasilkan 50.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; transform: translateZ(0); }
.c1 { position: absolute; z-index: 271; }
.p2 { position: relative; z-index: 3; }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["A (di atas B)","Tidak bisa ditentukan tanpa ukuran elemen","B (di atas A)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=3.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Berapa lebar konten (px) anak ini?',null,'.induk {
  box-sizing: content-box;
  width: 500px;
  padding: 0 12px;
}
.anak { width: 25%; }   /* box-sizing: content-box, tanpa padding */','css','["119","125","131"]'::jsonb,null,1,'Persentase mengacu ke lebar KONTEN induk (500px) → 125px.',null,'Persen mengacu ke content box induk, bukan border box.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 5) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f("")), JSON.stringify(f([])));','javascript','["{\"a\":\"\",\"b\":\"dflt\",\"c\":0} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":\"dflt\",\"b\":\"dflt\",\"c\":0} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":\"dflt\",\"b\":\"\",\"c\":0} {\"a\":[],\"b\":[],\"c\":0}"]'::jsonb,null,0,'Hasil: {"a":"","b":"dflt","c":0} {"a":[],"b":[],"c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. Playwright
2. Hibernate
3. Webpack
4. Testing Library
5. WebdriverIO','text','["1, 2, 3","2, 3, 4","1, 4, 5"]'::jsonb,null,2,'WebdriverIO, Playwright, Testing Library adalah alat uji end-to-end/komponen di browser; Webpack dan Hibernate termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1000px?',null,'.grid { gap: 24px; }
@media (min-width: 600px) and (max-width: 1024px) { .grid { gap: 16px; } }
@media (max-width: 1024px) { .grid { gap: 8px; } }
@media (min-width: 600px) { .grid { gap: 12px; } }','css','["24","12","8"]'::jsonb,null,1,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 12px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", () => log("B"));
tombol.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"));
tombol.addEventListener("click", () => log("F"));','javascript','["A C B E F D","A B C D E F","A B C E F D"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A C B E F D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN((p) => p + 3);
    setN(n + 5);
    setN(n + 3);
    setN((p) => p + 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["8","16","4"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 8.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-2000.jpg","foto-480.jpg","foto-1280.jpg"]'::jsonb,null,2,'Slot = 40vw × 1024 = 410px CSS; × DPR 3 = 1229px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.1.0" }
// versi yang tersedia di registry:
3.1.0  3.1.2  3.2.0  3.2.1  4.1.2  4.3.0  4.3.1','json','["4.3.1","3.2.1","3.1.2"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.1.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 2; i < 5; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["30,40,50","50,50,50","20,30,40"]'::jsonb,null,2,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'const a = Array(3).map((_, i) => i * 2);
console.log(a.length, a.filter(() => true).length, JSON.stringify(a));','javascript','["3 0 [null,null,null]","4 0 [null,null,null]","null],null,3 0 [null"]'::jsonb,null,0,'Dijalankan langsung: 3 0 [null,null,null].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="api.js"></script>
  <script src="chart.js"></script>
  <script defer src="ui.js"></script>
  <script defer src="util.js"></script>
  <script type="module" src="auth.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["chart.js → api.js → ui.js → util.js → auth.js","api.js → chart.js → ui.js → util.js → auth.js","api.js → ui.js → util.js → auth.js → chart.js"]'::jsonb,null,0,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: chart.js → api.js → ui.js → util.js → auth.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(undefined + null);
console.log(undefined === NaN);
console.log([10, 9, 1].sort());','javascript','["NaN | false | [ 1, 10, 9 ]","NaN | true | [ 1, 10, 9 ]","0 | false | [ 1, 10, 9 ]"]'::jsonb,null,0,'Hasil nyata: NaN | false | [ 1, 10, 9 ]. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 16px; padding-top: 14px; }
.anak  { margin-top: 40px; }','css','["56","40","70"]'::jsonb,null,2,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 16 + 14 + 40 = 70.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 50%; }
.b { font-size: 0.5em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["15","7.5","30"]'::jsonb,null,1,'font-size .a = 10×0.5 = 5px; .b = 5×0.5 = 2.5px; em pada padding memakai font-size elemen itu sendiri → 3×2.5 = 7.5px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c1"; } finally { return "f60"; }
}
console.log(f());','javascript','["f60","undefined","f61"]'::jsonb,null,0,'Dijalankan: f60.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Dua tab berasal dari origin yang sama. Tab A menulis ke localStorage. Apa yang terjadi di tab B?',null,'localStorage.setItem("tema", "gelap");','javascript','["Tab A dan B sama-sama menerima event ''storage''","Tidak ada yang terjadi; localStorage terisolasi per tab","Tab B menerima event ''storage''"]'::jsonb,null,2,'localStorage dibagi seluruh tab satu origin; event storage dikirim ke dokumen lain, bukan ke dokumen yang menulis.',null,'Siapa yang diberi tahu?',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 600px; gap: 20px; }
.i1 { flex: 2 3 150px; min-width: 0; }
.i2 { flex: 0 1 250px; min-width: 0; }
.i3 { flex: 2 3 150px; min-width: 0; }','css','["254.55","250","253.33"]'::jsonb,null,1,'Ruang sisa = 600 − gap 40 − Σbasis = 10px dibagi menurut flex-grow (Σ=4) → 250px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_opacity { to { opacity: … } }
@keyframes k_top { to { top: … } }
@keyframes k_color { to { color: … } }','css','["top < color < opacity","opacity < color < top","color < opacity < top"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), color memicu paint ulang, top memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":49,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':50,''b'':[2,3],''c'':{''d'':null}}","{\"a\":50,\"b\":[2,3],\"c\":{\"d\":null}}","{\"a\":51,\"b\":[2,3],\"c\":{\"d\":undefined}}"]'::jsonb,null,1,'Hasil: {"a":50,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 600px; display: flex; gap: 48px; }
.kartu { flex: 0 0 calc((100% - 48px) / 2); }','css','["252","300","276"]'::jsonb,null,2,'(600 − 48) / 2 = 276px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("C"), 0);
Promise.resolve().then(() => console.log("D"));
Promise.resolve().then(() => {
  console.log("B");
  queueMicrotask(() => console.log("E"));
});
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("G"));
});','javascript','["D B E F G C","D B F E G C","C D B E F G"]'::jsonb,null,1,'Urutan nyata: D B F E G C. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null);
