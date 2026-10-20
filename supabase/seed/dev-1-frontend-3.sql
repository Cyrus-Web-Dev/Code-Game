-- DIHASILKAN oleh scripts/gen-dev.mjs (frontend, bagian 3/4) — 250 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('frontend','output','Apa output kode ini?',null,'console.log(new Set([10, "10", 10, NaN, NaN, 86]).size, [NaN].includes(NaN), [NaN].indexOf(NaN));','javascript','["5 true -1","4 false -1","4 true -1"]'::jsonb,null,2,'Dijalankan langsung: 4 true -1.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1024px?',null,'.grid { gap: 4px; }
@media (min-width: 768px) { .grid { gap: 32px; } }
@media (max-width: 1024px) { .grid { gap: 12px; } }
@media (min-width: 768px) and (max-width: 1024px) { .grid { gap: 16px; } }','css','["32","4","16"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 16px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Berapa lebar kolom ke-1 (px)?',null,'.grid {
  display: grid;
  width: 960px;
  gap: 0 8px;
  grid-template-columns: 2fr 80px 3fr 3fr;
}','css','["220","214","240"]'::jsonb,null,1,'Ruang untuk fr = 960 − gap 24 − track px 80 = 856px dibagi 8 fr → 1fr = 107px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Efek :hover pada kartu ''menempel'' setelah disentuh di layar sentuh. Praktik yang tepat?',null,'.kartu:hover { transform: scale(1.05); }','css','["Tambahkan !important","Ganti :hover dengan :visited","Bungkus dalam @media"]'::jsonb,null,2,'Di layar sentuh, :hover bisa tertinggal setelah tap. (hover: hover) mendeteksi kemampuan hover.',null,'Fitur media apa yang menanyakan kemampuan input?',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { return "t6"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["fin | t7","fin | t6","t6 | fin"]'::jsonb,null,1,'Dijalankan: fin | t6.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("C");
Promise.resolve().then(() => console.log("F"));
(async () => {
  console.log("E");
  await null;
  console.log("D");
})();
setTimeout(() => console.log("H"), 0);','javascript','["C E F D H","C F E D H","E C F D H"]'::jsonb,null,0,'Urutan nyata: C E F D H. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa lebar akhir (px) item .i3?',null,'.baris { display: flex; width: 1000px; gap: 0px; }
.i1 { flex: 0 3 300px; min-width: 0; }
.i2 { flex: 2 0 250px; min-width: 0; }
.i3 { flex: 3 0 150px; min-width: 0; }','css','["330","214.29","250"]'::jsonb,null,0,'Ruang sisa = 1000 − gap 0 − Σbasis = 300px dibagi menurut flex-grow (Σ=5) → 330px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.1" }
// versi yang tersedia di registry:
0.0.1  0.0.2  0.0.3  0.1.2  0.2.1  1.1.3','json','["0.0.1","0.0.3","1.1.3"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 1000px; display: flex; gap: 16px; }
.kartu { flex: 0 0 calc((100% - 48px) / 4); }','css','["246","238","250"]'::jsonb,null,1,'(1000 − 48) / 4 = 238px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 9 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','fill','Lengkapi agar permintaan fetch lama dibatalkan oleh pengendali:',null,'const ctrl = new AbortController();
fetch(url, { ____: ctrl.signal });
ctrl.abort();','javascript','["signal","abort","cancel"]'::jsonb,null,0,'Opsi fetch yang menerima AbortSignal bernama signal.',null,'Nama opsi sama dengan properti AbortController.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; opacity: .9; }
.c1 { position: absolute; z-index: 451; }
.p2 { position: relative; transform: translateZ(0); }
.c2 { position: absolute; z-index: 510; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,0,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=0 (seri → yang belakangan di DOM menang).',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'try {
  const o = new Kelas(58);
  class Kelas { constructor(x) { this.x = x; } }
  console.log(o.x);
} catch (e) { console.log(e.name); }','javascript','["58","TypeError","ReferenceError"]'::jsonb,null,2,'class berada di TDZ sebelum deklarasinya → ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="api.js"></script>
  <script defer src="ui.js"></script>
  <script src="app.js"></script>
  <script defer src="chart.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["api.js → ui.js → chart.js → app.js","app.js → api.js → ui.js → chart.js","api.js → ui.js → app.js → chart.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: app.js → api.js → ui.js → chart.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'.kolom { display: flex; flex-direction: column; }
.x { margin-bottom: 16px; }
.y { margin-top: 30px; }','css','["30","46","16"]'::jsonb,null,1,'Item flex membentuk konteks baru; margin TIDAK menyatu. Jaraknya 16 + (30) = 46px.',null,'Apakah margin item flex bisa collapse?',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 7);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 8);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["B.ctor 8 | B.field | B.init undefined | A.ctor | A.field","A.field | A.ctor | B.init undefined | B.field | B.ctor 8","A.field | A.ctor | B.init 8 | B.field | B.ctor 8"]'::jsonb,null,1,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 8. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
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
  });
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)','javascript','["C+1 P+1 P-1 P+2","P+2 P-1 P+1 C+1","P+1 C+1 P-1 P+2"]'::jsonb,null,0,'Hasil: C+1 P+1 P-1 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'(async () => {
  console.log("E");
  await null;
  console.log("A");
})();
Promise.resolve().then(() => console.log("B"));
(async () => {
  console.log("C");
  await null;
  console.log("G");
})();
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("H"));
});
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["E C A B G F undefined H undefined","E C B A G F undefined H undefined","E A B C G F H"]'::jsonb,null,0,'Urutan nyata: E C A B G F undefined H undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2025, 0, 30));
d.setUTCMonth(1);
console.log(d.toISOString().slice(0, 10));','javascript','["2025-02-30","2025-03-01","2025-03-02"]'::jsonb,null,2,'Hasil: 2025-03-02. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2025 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 74, get() { return this.n; } };
const g = o.get.bind({ n: 130 });
console.log(g.call({ n: 255 }));','javascript','["74","255","130"]'::jsonb,null,2,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: content-box;
  width: 240px;
  padding: 3px 15px;
  border: 3px solid;
}','css','["276","240","222"]'::jsonb,null,1,'content-box: konten = 240 (width = konten).',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-800.jpg","foto-480.jpg"]'::jsonb,null,1,'Slot = 90vw × 390 = 351px CSS; × DPR 2 = 702px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(4);
  function klik() {
    setN(n + 1);
    setN(n + 1);
    setN((p) => p * 2);
    setN(18);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["6","18","5"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=4 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 4 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 18.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([] == ![]);
console.log(Object.is(-0, 0));
console.log("10" > "9");','javascript','["true | false | false","false | false | false","true | true | false"]'::jsonb,null,0,'Hasil nyata: true | false | false. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_height { to { height: … } }
@keyframes k_transform { to { transform: … } }
@keyframes k_border_radius { to { border-radius: … } }','css','["height < border-radius < transform","border-radius < transform < height","transform < border-radius < height"]'::jsonb,null,2,'transform hanya perlu compositing (di GPU, tanpa layout/paint), border-radius memicu paint ulang, height memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 960px;
  gap: 0 24px;
  grid-template-columns: 3fr 80px 2fr 3fr;
}','css','["240","202","220"]'::jsonb,null,1,'Ruang untuk fr = 960 − gap 72 − track px 80 = 808px dibagi 8 fr → 1fr = 101px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 3) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(NaN)), JSON.stringify(f([])));','javascript','["{\"a\":\"dflt\",\"b\":null} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":null,\"b\":\"dflt\"} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":[],\"b\":[],\"c\":0}"]'::jsonb,null,1,'Hasil: {"a":null,"b":"dflt"} {"a":[],"b":[],"c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", (e) => { log("A"); e.stopPropagation(); });
tombol.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"), true);','javascript','["A B D","D B A","A B"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: D B A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 480px?',null,'.grid { gap: 24px; }
@media (max-width: 1024px) { .grid { gap: 32px; } }
@media (min-width: 480px) { .grid { gap: 12px; } }
@media (min-width: 480px) and (max-width: 1024px) { .grid { gap: 8px; } }','css','["8","12","24"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Apa output kode ini?',null,'console.log(new Set([29, "29", 29, NaN, NaN, 95]).size, [NaN].includes(NaN), [NaN].indexOf(NaN));','javascript','["4 false -1","4 true -1","5 true -1"]'::jsonb,null,1,'Dijalankan langsung: 4 true -1.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Mengapa klik pada <span> di dalam <li> tidak menjalankan aksi?',null,'daftar.addEventListener("click", (e) => {
  if (e.target.matches("li")) pilih(e.target);
});
// <li><span>Kopi</span></li>','javascript','["matches() hanya bekerja pada elemen dengan id","e.target adalah <span>","Event click tidak bubbling dari span"]'::jsonb,null,1,'Delegasi event memakai target asli. Pakai closest() untuk naik ke elemen yang dimaksud.',null,'Siapa e.target saat teks di dalam span diklik?',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 1; i < 5; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["2,4,6,8","10,10,10,10","4,6,8,10"]'::jsonb,null,1,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 5, jadi semua closure menghasilkan 10.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([ok("A", 10), ok("B", 5), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["err C","ok [\"fA\",\"fB\",\"rC\"]","ok \"B\""]'::jsonb,null,1,'Promise.allSettled menghasilkan: ok ["fA","fB","rC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 150%; }
.b { font-size: 0.5em; padding-left: 2em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","40","60"]'::jsonb,null,0,'font-size .a = 20×1.5 = 30px; .b = 30×0.5 = 15px; em pada padding memakai font-size elemen itu sendiri → 2×15 = 30px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 22], e: null }));','javascript','["{\"c\":undefined,\"d\":[null,23],\"e\":null}","{''c'':null,''d'':[null,22],''e'':null}","{\"c\":null,\"d\":[null,22],\"e\":null}"]'::jsonb,null,2,'Hasil: {"c":null,"d":[null,22],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
:first-child { color: hijau; }
:is(.a, #kartu):is(.a, .b) { color: oranye; }
@layer base {
  :not(.zzz) { color: biru; }
}
:not(.zzz) { color: kuning; }','html','["biru","hijau","oranye"]'::jsonb,null,2,':first-child: (0,1,0) → hijau; :is(.a, #kartu):is(.a, .b): (1,1,0) → oranye; :not(.zzz): (0,1,0) [@layer] → biru; :not(.zzz): (0,1,0) → kuning. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. React
2. Amazon SQS
3. Testing Library
4. WebdriverIO
5. Playwright','text','["3, 4, 5","2, 4, 5","1, 2, 4"]'::jsonb,null,0,'Testing Library, Playwright, WebdriverIO adalah alat uji end-to-end/komponen di browser; React dan Amazon SQS termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { return "t8"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["t8 | fin","fin | t8","fin | t9"]'::jsonb,null,1,'Dijalankan: fin | t8.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2028, 9, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["4 11","0 7","30 8"]'::jsonb,null,2,'Hasil: 30 8. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2028 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Apa output kode ini?',null,'console.log(["25","91","69","37"].map(parseInt).join(","));','javascript','["NaN,NaN,NaN,25","26,NaN,NaN,NaN","25,NaN,NaN,NaN"]'::jsonb,null,2,'Dijalankan langsung: 25,NaN,NaN,NaN.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script type="module" src="util.js"></script>
  <script src="auth.js"></script>
  <script defer src="app.js"></script>
  <script defer src="chart.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["util.js → auth.js → app.js → chart.js","auth.js → util.js → app.js → chart.js","util.js → app.js → chart.js → auth.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: auth.js → util.js → app.js → chart.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1200px?',null,'.grid { gap: 32px; }
@media (min-width: 480px) { .grid { gap: 4px; } }
@media (min-width: 480px) and (max-width: 768px) { .grid { gap: 16px; } }
@media (max-width: 768px) { .grid { gap: 8px; } }','css','["4","32","8"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 4px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(9);
  function klik() {
    setN((p) => p * 2);
    setN(n + 1);
    setN(n + 4);
    setN(n + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["17","12","26"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=9 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 9 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 12.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Berapa lebar kolom ke-1 (px)?',null,'.grid {
  display: grid;
  width: 600px;
  gap: 0 16px;
  grid-template-columns: 1fr 160px 2fr 80px;
}','css','["120","200","104"]'::jsonb,null,2,'Ruang untuk fr = 600 − gap 48 − track px 240 = 312px dibagi 3 fr → 1fr = 104px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.4.4" }
// versi yang tersedia di registry:
1.4.4  1.4.5  1.4.6  1.5.6  1.6.5  2.4.4','json','["2.4.4","1.4.6","1.6.5"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.4.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 9 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 0.75em; }
.b { font-size: 2em; padding-left: 1em; }
/* <div class="a"><div class="b">…</div></div> */','css','["10","15","7.5"]'::jsonb,null,1,'font-size .a = 10×0.75 = 7.5px; .b = 7.5×2 = 15px; em pada padding memakai font-size elemen itu sendiri → 1×15 = 15px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 16, get() { return this.n; } };
const g = o.get.bind({ n: 123 });
console.log(g.call({ n: 296 }));','javascript','["123","296","16"]'::jsonb,null,0,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log("a" + " ");
console.log(3 + 4 + "5");
console.log("b" + "a" + +"a" + "a");','javascript','["true | 75 | baNaNa","a  | 75 | baNaNa","a  | true | baNaNa"]'::jsonb,null,1,'Hasil nyata: a  | 75 | baNaNa. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berapa lebar akhir (px) item .i1?',null,'.baris { display: flex; width: 720px; gap: 0px; }
.i1 { flex: 0 0 150px; min-width: 0; }
.i2 { flex: 3 3 300px; min-width: 0; }
.i3 { flex: 2 2 100px; min-width: 0; }','css','["196.36","150","206.67"]'::jsonb,null,1,'Ruang sisa = 720 − gap 0 − Σbasis = 170px dibagi menurut flex-grow (Σ=5) → 150px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_transform { to { transform: … } }
@keyframes k_display { to { display: … } }
@keyframes k_color { to { color: … } }','css','["transform < color < display","display < color < transform","color < transform < display"]'::jsonb,null,0,'transform hanya perlu compositing (di GPU, tanpa layout/paint), color memicu paint ulang, display memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-640.jpg","foto-480.jpg"]'::jsonb,null,2,'Slot = 40vw × 1024 = 410px CSS; × DPR 1 = 410px fisik → kandidat terkecil yang ≥ itu: 480w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Mengapa .kartu runtuh dan tidak membungkus gambarnya?',null,'.kartu { border: 1px solid; }
.kartu img { float: left; }','css','["float hanya berlaku pada elemen inline sehingga gambar tidak dihitung oleh induk","Anak yang di-float keluar dari alur sehingga induk tidak menghitung tingginya","border 1px membuat tinggi otomatis menjadi 0 sehingga isi tampak runtuh"]'::jsonb,null,1,'Float dikeluarkan dari normal flow; induk tidak ''membungkusnya'' kecuali membentuk BFC (flow-root, overflow, dll.).',null,'Apakah induk menghitung tinggi anak yang di-float?',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 500px; display: flex; gap: 32px; }
.kartu { flex: 0 0 calc((100% - 96px) / 4); }','css','["117","101","125"]'::jsonb,null,1,'(500 − 96) / 4 = 101px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("D");
  Promise.resolve().then(() => console.log("C"));
}, 0);
Promise.resolve().then(() => console.log("F"));
(async () => {
  console.log("A");
  await null;
  console.log("H");
})();
setTimeout(() => console.log("B"), 0);','javascript','["D C F A H B","A F H D C B","F A H D C B"]'::jsonb,null,1,'Urutan nyata: A F H D C B. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
tengah.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"));
tengah.addEventListener("click", (e) => { log("D"); e.stopImmediatePropagation(); });
luar.addEventListener("click", () => log("E"));','javascript','["A B D","B D","A B D C E"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A B D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 2; i < 6; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["6,8,10,12","12,12,12,12","4,6,8,10"]'::jsonb,null,2,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 5) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f("")), JSON.stringify(f(false)));','javascript','["{\"a\":\"dflt\",\"b\":\"\",\"c\":0} {\"a\":\"dflt\",\"b\":false}","{\"a\":\"\",\"b\":\"dflt\",\"c\":0} {\"a\":false,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":\"dflt\",\"c\":0} {\"a\":\"dflt\",\"b\":\"dflt\"}"]'::jsonb,null,1,'Hasil: {"a":"","b":"dflt","c":0} {"a":false,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'.kolom { display: flex; flex-direction: column; }
.x { margin-bottom: 10px; }
.y { margin-top: 20px; }','css','["30","20","10"]'::jsonb,null,0,'Item flex membentuk konteks baru; margin TIDAK menyatu. Jaraknya 10 + (20) = 30px.',null,'Apakah margin item flex bisa collapse?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":20,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':21,''b'':[2,3],''c'':{''d'':null}}","{\"a\":21,\"b\":[2,3],\"c\":{\"d\":null}}","{\"a\":22,\"b\":[2,3],\"c\":{\"d\":undefined}}"]'::jsonb,null,1,'Hasil: {"a":21,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
.wrap :where(#kartu, .a)[data-x] { color: oranye; }
.wrap p:not(#zzz):is(.a, .b) { color: merah; }
@layer base {
  main :first-child:not(.zzz) { color: kuning !important; }
}','html','["merah","kuning","oranye"]'::jsonb,null,1,'.wrap :where(#kartu, .a)[data-x]: (0,2,0) → oranye; .wrap p:not(#zzz):is(.a, .b): (1,2,1) → merah; main :first-child:not(.zzz): (0,2,1) !important [@layer] → kuning. Pemenang: kuning. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; isolation: isolate; }
.c1 { position: absolute; z-index: 106; }
.p2 { position: relative; z-index: 5; }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,0,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=5.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'try {
  const o = new Kelas(40);
  class Kelas { constructor(x) { this.x = x; } }
  console.log(o.x);
} catch (e) { console.log(e.name); }','javascript','["function","TypeError","ReferenceError"]'::jsonb,null,2,'class berada di TDZ sebelum deklarasinya → ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 15), bad("B", 5), bad("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err All promises were rejected","ok [\"rA\",\"rB\",\"rC\"]","err B"]'::jsonb,null,2,'Promise.all menghasilkan: err B. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 4);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 5);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["A.field | A.ctor | B.init 5 | B.field | B.ctor 5","A.field | A.ctor | B.init undefined | B.field | B.ctor 5","B.ctor 5 | B.field | B.init undefined | A.ctor | A.field"]'::jsonb,null,1,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 5. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Berapa lebar konten (px) anak ini?',null,'.induk {
  box-sizing: border-box;
  width: 400px;
  padding: 0 26px;
}
.anak { width: 50%; }   /* box-sizing: content-box, tanpa padding */','css','["174","200","226"]'::jsonb,null,0,'Persentase mengacu ke lebar KONTEN induk (348px) → 174px.',null,'Persen mengacu ke content box induk, bukan border box.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. Playwright
2. WebdriverIO
3. Testing Library
4. MobX
5. SvelteKit','text','["1, 3, 4","3, 4, 5","1, 2, 3"]'::jsonb,null,2,'WebdriverIO, Testing Library, Playwright adalah alat uji end-to-end/komponen di browser; SvelteKit dan MobX termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Mengetuk <input> di iPhone membuat halaman ter-zoom otomatis. Penyebab umum dan perbaikannya?',null,'input { font-size: 14px; }','css','["meta charset salah","Atribut autocomplete hilang","Font input di bawah 16px memicu auto-zoom iOS"]'::jsonb,null,2,'Safari iOS memperbesar halaman saat fokus pada input berfont < 16px.',null,'Ukuran font minimal input pada iOS?',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(1)
  .then((v) => { throw new Error("e" + v); })
  .then(() => console.log("A"))
  .catch((e) => e.message)
  .then((m) => console.log("B", m));','javascript','["B e2","B e1","undefined"]'::jsonb,null,1,'Dijalankan: B e1.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Apa output kode ini?',null,'try {
  const o = new Kelas(88);
  class Kelas { constructor(x) { this.x = x; } }
  console.log(o.x);
} catch (e) { console.log(e.name); }','javascript','["89","TypeError","ReferenceError"]'::jsonb,null,2,'class berada di TDZ sebelum deklarasinya → ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah baris 7 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1600.jpg","foto-480.jpg","foto-1280.jpg"]'::jsonb,null,2,'Slot = 100vw × 390 = 390px CSS; × DPR 3 = 1170px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 4; }
.c1 { position: absolute; z-index: 400; }
.p2 { position: relative; }
.c2 { position: absolute; z-index: 616; }
/* A dan B bertumpang tindih secara visual */','html','["A (di atas B)","B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=4, B=616.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x style="color: oranye">Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  main :is(.a, .b) { color: kuning; }
}
@layer base {
  :first-child:not(.zzz) { color: merah; }
}
@layer base {
  :not(#zzz)#kartu { color: ungu; }
}
:not(.zzz) { color: oranye; }','html','["kuning","merah","oranye"]'::jsonb,null,2,'main :is(.a, .b): (0,1,1) [@layer] → kuning; :first-child:not(.zzz): (0,2,0) [@layer] → merah; :not(#zzz)#kartu: (2,0,0) [@layer] → ungu; :not(.zzz): (0,1,0) → oranye; style inline: (0,0,0) → oranye. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Dari daftar ini, nomor mana yang BUKAN tooling/framework CSS?',null,'1. Firestore
2. Bootstrap
3. Express
4. Bulma
5. Tailwind CSS','text','["1 dan 3","2 dan 3 dan 5","1 dan 2 dan 4"]'::jsonb,null,0,'Firestore dan Express termasuk kategori lain; Tailwind CSS, Bulma, Bootstrap adalah tooling/framework CSS.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log("5" * [1,2]);
console.log("5" - - "2");
console.log([1,2] - false);','javascript','["NaN | 7 | NaN","NaN | false | NaN","0 | 7 | NaN"]'::jsonb,null,0,'Hasil nyata: NaN | 7 | NaN. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(3);
const q = Object.create(p);
q.n = 8;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["3 false false","4 false true","3 false true"]'::jsonb,null,2,'Hasil: 3 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','output','Apa output kode ini?',null,'console.log(["27","13","119","96","60","90"].map(parseInt).join(","));','javascript','["27,NaN,3,NaN,NaN,NaN","28,NaN,3,NaN,NaN,NaN","NaN,NaN,NaN,3,NaN,27"]'::jsonb,null,0,'Dijalankan langsung: 27,NaN,3,NaN,NaN,NaN.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.0.0" }
// versi yang tersedia di registry:
1.0.0  1.0.1  1.0.3  1.1.2  1.2.2  1.2.3  2.1.0  2.1.1','json','["2.1.1","1.2.3","1.0.3"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(9);
  function klik() {
    setN(17);
    setN(n + 3);
    setN((p) => p + 4);
    setN((p) => p + 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["12","28","20"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=9 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 9 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 20.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Lebar (px) elemen pada viewport 1024px?',null,'.hero { width: clamp(200px, 60vw, 600px); }','css','["600","200","614.4"]'::jsonb,null,0,'60vw = 614.4px, lalu dibatasi [200, 600] → 600px.',null,'clamp(min, ideal, max).',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 92, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["TypeError","ReferenceError","132"]'::jsonb,null,0,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_opacity { to { opacity: … } }
@keyframes k_background_color { to { background-color: … } }
@keyframes k_height { to { height: … } }','css','["background-color < opacity < height","opacity < background-color < height","height < background-color < opacity"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), background-color memicu paint ulang, height memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berapa lebar konten (px) anak ini?',null,'.induk {
  box-sizing: border-box;
  width: 500px;
  padding: 0 10px;
}
.anak { width: 75%; }   /* box-sizing: content-box, tanpa padding */','css','["375","390","360"]'::jsonb,null,2,'Persentase mengacu ke lebar KONTEN induk (480px) → 360px.',null,'Persen mengacu ke content box induk, bukan border box.',null),
('frontend','output','Apa output kode ini?',null,'const a = Date.UTC(2028, 2, 1), b = Date.UTC(2028, 1, 1);
console.log((a - b) / 86400000);','javascript','["28","30","29"]'::jsonb,null,2,'Hasil: 29. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2028 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 6) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(false)), JSON.stringify(f([])));','javascript','["{\"a\":false,\"b\":\"dflt\"} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":\"dflt\",\"b\":false} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":[],\"b\":[],\"c\":0}"]'::jsonb,null,0,'Hasil: {"a":false,"b":"dflt"} {"a":[],"b":[],"c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(1)
  .finally(() => 57)
  .then((v) => console.log("v", v));','javascript','["v 1","undefined","v 2"]'::jsonb,null,0,'Dijalankan: v 1.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'<div class="x" style="margin-bottom: 16px">X</div>
<div class="y" style="margin-top: 8px">Y</div>
<!-- keduanya block biasa, normal flow -->','html','["8","16","24"]'::jsonb,null,1,'Margin vertikal antar saudara block menyatu: (16, 8) → 16px (positif: ambil terbesar; campuran: dijumlahkan).',null,'Aturan: dua positif → max; dua negatif → min; campuran → jumlah.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 0; i < 4; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["8,8,8,8","2,4,6,8","0,2,4,6"]'::jsonb,null,2,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 10), ok("B", 5), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"B\"","err A","ok [\"rA\",\"fB\",\"rC\"]"]'::jsonb,null,1,'Promise.all menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'.a { font-size: 0.5em; }
.b { font-size: 1.25em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["24","30","48"]'::jsonb,null,1,'font-size .a = 16×0.5 = 8px; .b = 8×1.25 = 10px; em pada padding memakai font-size elemen itu sendiri → 3×10 = 30px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 35, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{''a'':2,''b'':35} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":2,\"b\":35} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":3,\"b\":35} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,1,'Hasil: {"a":2,"b":35} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Apa yang tampil di layar setelah tombol diklik sekali?',null,'const [o, setO] = useState({ n: 1 });
function klik() {
  o.n++;
  setO(o);
}
return <button onClick={klik}>{o.n}</button>;','javascript','["Tetap 1: referensi objek sama, React membatalkan render karena Object.is(o, o)","Error: state tidak boleh dimutasi, sehingga React melempar pengecualian saat setO dipanggil","2, karena o.n sudah bertambah dan React membaca nilai terbaru dari objek yang sama"]'::jsonb,null,0,'Objek dimutasi lalu didaftarkan ulang dengan referensi yang sama; React menganggap tidak ada perubahan dan tidak merender. Buat objek baru: setO({ ...o, n: o.n + 1 }).',null,'Apakah React membandingkan isi objek?',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 1000px;
  gap: 0 0px;
  grid-template-columns: 200px 2fr 2fr 120px;
}','css','["250","340","500"]'::jsonb,null,1,'Ruang untuk fr = 1000 − gap 0 − track px 320 = 680px dibagi 4 fr → 1fr = 170px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','fill','Lengkapi agar CORS dengan cookie diizinkan:',null,'Access-Control-Allow-____: true','http','["Credentials","Cookies","Headers"]'::jsonb,null,0,'Allow-Credentials: true diperlukan agar browser mengizinkan respons dibaca pada permintaan ber-credentials.',null,'Apa yang diizinkan terkirim bersama permintaan?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
luar.addEventListener("click", () => log("B"));
tombol.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"));','javascript','["A C E B D","A B C D E","C E A B D"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A C E B D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="ui.js"></script>
  <script defer src="app.js"></script>
  <script src="map.js"></script>
  <script type="module" src="auth.js"></script>
  <script defer src="util.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["ui.js → map.js → app.js → auth.js → util.js","app.js → auth.js → util.js → ui.js → map.js","ui.js → app.js → map.js → auth.js → util.js"]'::jsonb,null,0,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → map.js → app.js → auth.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("A"));
setTimeout(() => {
  console.log("E");
  Promise.resolve().then(() => console.log("C"));
}, 0);
(async () => {
  console.log("B");
  await null;
  console.log("H");
})();
queueMicrotask(() => console.log("undefined"));','javascript','["B A H undefined E C","A E C B H","A B H undefined E C"]'::jsonb,null,0,'Urutan nyata: B A H undefined E C. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 600px; gap: 10px; }
.i1 { flex: 3 1 100px; min-width: 0; }
.i2 { flex: 0 1 200px; min-width: 0; }
.i3 { flex: 1 1 200px; min-width: 0; }','css','["232","200","226.67"]'::jsonb,null,1,'Ruang sisa = 600 − gap 20 − Σbasis = 80px dibagi menurut flex-grow (Σ=4) → 200px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 701px?',null,'.grid { gap: 12px; }
@media (min-width: 640px) and (max-width: 700px) { .grid { gap: 16px; } }
@media (max-width: 700px) { .grid { gap: 4px; } }
@media (min-width: 640px) { .grid { gap: 8px; } }','css','["4","8","12"]'::jsonb,null,1,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Apa output kode ini?',null,'try {
  const o = new Kelas(39);
  class Kelas { constructor(x) { this.x = x; } }
  console.log(o.x);
} catch (e) { console.log(e.name); }','javascript','["39","ReferenceError","TypeError"]'::jsonb,null,1,'class berada di TDZ sebelum deklarasinya → ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 50%; }
.b { font-size: 1.5em; padding-left: 2em; }
/* <div class="a"><div class="b">…</div></div> */','css','["20","40","30"]'::jsonb,null,2,'font-size .a = 20×0.5 = 10px; .b = 10×1.5 = 15px; em pada padding memakai font-size elemen itu sendiri → 2×15 = 30px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"));
tombol.addEventListener("click", () => log("D"), true);','javascript','["D A B C","A B C D","B D A C"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B D A C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: content-box;
  width: 400px;
  padding: 6px 7px;
  border: 4px solid;
}','css','["389","400","422"]'::jsonb,null,1,'content-box: konten = 400 (width = konten).',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 7) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f("")), JSON.stringify(f(0)));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\",\"c\":0} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":\"\",\"b\":\"dflt\",\"c\":0} {\"a\":0,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":\"\",\"c\":0} {\"a\":\"dflt\",\"b\":0}"]'::jsonb,null,1,'Hasil: {"a":"","b":"dflt","c":0} {"a":0,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r5"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["end | f | c r5 | sync","sync | c r6 | f | end","sync | c r5 | f | end"]'::jsonb,null,2,'Dijalankan: sync | c r5 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-1600.jpg","foto-1024.jpg"]'::jsonb,null,0,'Slot = 50vw × 1440 = 720px CSS; × DPR 1 = 720px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Manakah yang menjaga ruang tata letak DAN menyembunyikan elemen dari pembaca layar serta fokus/klik?',null,'.a { display: none; }
.b { visibility: hidden; }
.c { opacity: 0; }','css','[".b (visibility: hidden)",".c (opacity: 0; elemen transparan)",".a (display: none; elemen hilang)"]'::jsonb,null,0,'visibility:hidden mempertahankan ruang tetapi elemen tidak bisa difokus/diklik dan keluar dari pohon aksesibilitas. opacity:0 masih bisa difokus dan diklik. display:none membuang ruang.',null,'Mana yang mempertahankan ruang tapi tidak interaktif?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 4 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.3.1" }
// versi yang tersedia di registry:
1.3.1  1.3.2  1.3.4  1.4.4  1.5.0  1.5.2  1.5.3  2.3.0','json','["1.5.3","1.3.4","2.3.0"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.3.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output kode ini?',null,'const a = Array(2).map((_, i) => i * 2);
console.log(a.length, a.filter(() => true).length, JSON.stringify(a));','javascript','["2 0 [null,null]","null],2 0 [null","3 0 [null,null]"]'::jsonb,null,0,'Dijalankan langsung: 2 0 [null,null].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; transform: translateZ(0); }
.c1 { position: absolute; z-index: 613; }
.p2 { position: relative; transform: translateZ(0); }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)","B (di atas A)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=0 (seri → yang belakangan di DOM menang).',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Elemen setinggi 100vh tertutup bilah alamat browser mobile dan sebagian terpotong. Perbaikan yang tepat?',null,'.hero { height: 100vh; }','css','["Gunakan satuan viewport dinamis","Naikkan z-index menjadi 9999","Tambahkan overflow: scroll pada body"]'::jsonb,null,0,'vh dihitung terhadap viewport terbesar (toolbar tersembunyi); dvh mengikuti viewport aktual saat toolbar tampil/hilang.',null,'Satuan mana yang mengikuti toolbar dinamis?',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'<div class="x" style="margin-bottom: 24px">X</div>
<div class="y" style="margin-top: 8px">Y</div>
<!-- keduanya block biasa, normal flow -->','html','["24","32","8"]'::jsonb,null,0,'Margin vertikal antar saudara block menyatu: (24, 8) → 24px (positif: ambil terbesar; campuran: dijumlahkan).',null,'Aturan: dua positif → max; dua negatif → min; campuran → jumlah.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="chart.js"></script>
  <script src="map.js"></script>
  <script defer src="auth.js"></script>
  <script src="api.js"></script>
  <script defer src="util.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["chart.js → map.js → auth.js → api.js → util.js","chart.js → map.js → api.js → auth.js → util.js","auth.js → util.js → chart.js → map.js → api.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: chart.js → map.js → api.js → auth.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Dari daftar ini, nomor mana yang BUKAN pustaka/framework UI?',null,'1. Angular
2. React
3. Laravel
4. CouchDB
5. Svelte','text','["3 dan 4","1 dan 2 dan 4","1 dan 2 dan 3"]'::jsonb,null,0,'CouchDB dan Laravel termasuk kategori lain; Angular, Svelte, React adalah pustaka/framework UI.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(3);
  function klik() {
    setN((p) => p + 5);
    setN(30);
    setN(n + 1);
    setN((p) => p + 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["4","33","6"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=3 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 3 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 6.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 800px; gap: 10px; }
.i1 { flex: 3 2 300px; min-width: 0; }
.i2 { flex: 2 0 200px; min-width: 0; }
.i3 { flex: 3 3 200px; min-width: 0; }','css','["225","220","226.67"]'::jsonb,null,1,'Ruang sisa = 800 − gap 20 − Σbasis = 80px dibagi menurut flex-grow (Σ=8) → 220px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 5), ok("B", 10), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok \"B\"","ok [\"rA\",\"fB\",\"rC\"]"]'::jsonb,null,0,'Promise.all menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_opacity { to { opacity: … } }
@keyframes k_padding { to { padding: … } }
@keyframes k_box_shadow { to { box-shadow: … } }','css','["padding < box-shadow < opacity","opacity < box-shadow < padding","box-shadow < opacity < padding"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), box-shadow memicu paint ulang, padding memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berapa lebar kolom ke-1 (px)?',null,'.grid {
  display: grid;
  width: 960px;
  gap: 0 24px;
  grid-template-columns: 3fr 100px 120px;
}','css','["692","740","960"]'::jsonb,null,0,'Ruang untuk fr = 960 − gap 48 − track px 220 = 692px dibagi 3 fr → 1fr = 230.67px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 599px?',null,'.grid { gap: 24px; }
@media (min-width: 600px) and (max-width: 1024px) { .grid { gap: 4px; } }
@media (min-width: 600px) { .grid { gap: 32px; } }
@media (max-width: 1024px) { .grid { gap: 16px; } }','css','["32","24","16"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 16px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("D");
  Promise.resolve().then(() => console.log("H"));
}, 0);
setTimeout(() => console.log("A"), 0);
Promise.resolve().then(() => console.log("B"));
(async () => {
  console.log("E");
  await null;
  console.log("G");
})();
console.log("undefined");','javascript','["undefined E B G D H A","D H A B E G","E undefined B G D H A"]'::jsonb,null,2,'Urutan nyata: E undefined B G D H A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2025, 0, 29));
d.setUTCMonth(1);
console.log(d.toISOString().slice(0, 10));','javascript','["2025-03-01","2025-02-29","2025-03-06"]'::jsonb,null,0,'Hasil: 2025-03-01. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2025 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(4);
const q = Object.create(p);
q.n = 9;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["4 false true","6 false true","4 false false"]'::jsonb,null,0,'Hasil: 4 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  .wrap :where(#kartu, .a)#kartu:not(#zzz) { color: oranye !important; }
}
.b:not(.zzz) { color: ungu; }
.wrap :is(.a, #kartu) { color: kuning; }
p { color: merah !important; }','html','["kuning","ungu","oranye"]'::jsonb,null,2,'.wrap :where(#kartu, .a)#kartu:not(#zzz): (2,1,0) !important [@layer] → oranye; .b:not(.zzz): (0,2,0) → ungu; .wrap :is(.a, #kartu): (1,1,0) → kuning; p: (0,0,1) !important → merah. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 22, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["ReferenceError","173","TypeError"]'::jsonb,null,2,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 1; i < 5; i++) {
  fns.push(() => i * 1);
}
console.log(fns.map((f) => f()).join(","));','javascript','["5,5,5,5","2,3,4,5","1,2,3,4"]'::jsonb,null,2,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":24,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':25,''b'':[2,3],''c'':{''d'':null}}","{\"a\":26,\"b\":[2,3],\"c\":{\"d\":undefined}}","{\"a\":25,\"b\":[2,3],\"c\":{\"d\":null}}"]'::jsonb,null,2,'Hasil: {"a":25,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(typeof NaN);
console.log([,].length);
console.log(null >= 0);','javascript','["number | NaN | true","false | 1 | true","number | 1 | true"]'::jsonb,null,2,'Hasil nyata: number | 1 | true. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 500px; display: flex; gap: 32px; }
.kartu { flex: 0 0 calc((100% - 32px) / 2); }','css','["234","250","218"]'::jsonb,null,0,'(500 − 32) / 2 = 234px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([1, 2] + [3]);
console.log(parseInt("0x1f"));
console.log([1,2] === {});','javascript','["NaN | 31 | false","1,23 | 31 | false","1,23 | true | false"]'::jsonb,null,1,'Hasil nyata: 1,23 | 31 | false. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":25,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{\"a\":26,\"b\":[2,3],\"c\":{\"d\":null}}","{\"a\":27,\"b\":[2,3],\"c\":{\"d\":undefined}}","{''a'':26,''b'':[2,3],''c'':{''d'':null}}"]'::jsonb,null,0,'Hasil: {"a":26,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 4, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["23 8","30 3","0 10"]'::jsonb,null,1,'Hasil: 30 3. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berapa lebar akhir (px) item .i3?',null,'.baris { display: flex; width: 600px; gap: 20px; }
.i1 { flex: 0 0 150px; min-width: 0; }
.i2 { flex: 2 1 150px; min-width: 0; }
.i3 { flex: 3 0 250px; min-width: 0; }','css','["253.33","280","256"]'::jsonb,null,2,'Ruang sisa = 600 − gap 40 − Σbasis = 10px dibagi menurut flex-grow (Σ=5) → 256px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: content-box;
  width: 200px;
  padding: 0 7px;
  border: 5px solid;
  margin: 0 16px;
}','css','["256","246","224"]'::jsonb,null,0,'content-box: width hanya konten → 200 + 2×7 + 2×5 + 2×16 = 256.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="map.js"></script>
  <script src="api.js"></script>
  <script src="app.js"></script>
  <script defer src="util.js"></script>
  <script src="ui.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["api.js → app.js → ui.js → map.js → util.js","map.js → api.js → app.js → util.js → ui.js","map.js → util.js → api.js → app.js → ui.js"]'::jsonb,null,0,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: api.js → app.js → ui.js → map.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 0.8em; }
.b { font-size: 1.5em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["60","48","72"]'::jsonb,null,2,'font-size .a = 20×0.8 = 16px; .b = 16×1.5 = 24px; em pada padding memakai font-size elemen itu sendiri → 3×24 = 72px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 640px?',null,'.grid { gap: 32px; }
@media (min-width: 640px) and (max-width: 700px) { .grid { gap: 16px; } }
@media (min-width: 640px) { .grid { gap: 12px; } }
@media (max-width: 700px) { .grid { gap: 8px; } }','css','["32","12","8"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 24px; padding-top: 14px; }
.anak  { margin-top: 20px; }','css','["58","24","44"]'::jsonb,null,0,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 24 + 14 + 20 = 58.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output kode ini?',null,'const a = [43,10,75,20,52,51];
const r = a.splice(0, 2, 938);
console.log(JSON.stringify(a), JSON.stringify(r));','javascript','["[938,75,20,52,51] [43,10]","10],51] [43,52,20,75,[938","[939,75,20,52,51] [43,10]"]'::jsonb,null,0,'Dijalankan langsung: [938,75,20,52,51] [43,10].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 4) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(NaN)), JSON.stringify(f(0)));','javascript','["{\"a\":\"dflt\",\"b\":null} {\"a\":\"dflt\",\"b\":0}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":null,\"b\":\"dflt\"} {\"a\":0,\"b\":\"dflt\"}"]'::jsonb,null,2,'Hasil: {"a":null,"b":"dflt"} {"a":0,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Berapa kali efek ini berjalan selama komponen sering dirender ulang?',null,'useEffect(() => {
  ambilData(opsi);
}, [{ halaman: 1 }]);','javascript','["Tidak pernah, karena objek tidak boleh dijadikan dependensi dan React mengabaikannya saat membandingkan dependensi","Setiap render, karena literal objek baru dibuat tiap render sehingga Object.is selalu false","Hanya sekali, saat mount, karena nilainya selalu { halaman: 1 } sehingga React menganggapnya tidak berubah antar render"]'::jsonb,null,1,'Dependensi dibandingkan dengan Object.is (referensi untuk objek). Literal objek di dalam render adalah referensi baru tiap kali.',null,'Bandingkan dengan Object.is, bukan isi.',null),
('frontend','output','Apa output kode ini?',null,'var skor = 29;
(function () {
  console.log(skor);
  var skor = 30;
})();','javascript','["undefined","function","number"]'::jsonb,null,0,'var di dalam fungsi menutupi variabel luar dan di-hoist sebagai undefined, bukan nilai luar.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(8)
  .then((v) => { throw new Error("e" + v); })
  .then(() => console.log("A"))
  .catch((e) => e.message)
  .then((m) => console.log("B", m));','javascript','["B e9","B e8","undefined"]'::jsonb,null,1,'Dijalankan: B e8.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("H"), 0);
Promise.resolve().then(() => console.log("A"));
Promise.resolve().then(() => console.log("E"));
setTimeout(() => {
  console.log("F");
  Promise.resolve().then(() => console.log("G"));
}, 0);
queueMicrotask(() => console.log("D"));','javascript','["A E D H F G","H A E F G D","A D E H F G"]'::jsonb,null,0,'Urutan nyata: A E D H F G. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 600px;
  gap: 0 20px;
  grid-template-columns: 120px 80px 3fr 100px;
}','css','["300","240","600"]'::jsonb,null,1,'Ruang untuk fr = 600 − gap 60 − track px 300 = 240px dibagi 3 fr → 1fr = 80px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 60vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-480.jpg","foto-1600.jpg"]'::jsonb,null,0,'Slot = 90vw × 390 = 351px CSS; × DPR 3 = 1053px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 45;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["45 TypeError","45 undefined","289"]'::jsonb,null,0,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan tooling/framework CSS?',null,'1. Bulma
2. Tailwind CSS
3. Bootstrap
4. Rails
5. Memcached','text','["2, 3, 4","1, 2, 3","1, 2, 4"]'::jsonb,null,1,'Tailwind CSS, Bulma, Bootstrap adalah tooling/framework CSS; Memcached dan Rails termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(3);
  function klik() {
    setN((p) => p + 4);
    setN(n + 1);
    setN((p) => p + 5);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","4","13"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=3 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 3 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 9.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_opacity { to { opacity: … } }
@keyframes k_margin_left { to { margin-left: … } }
@keyframes k_background_color { to { background-color: … } }','css','["margin-left < background-color < opacity","opacity < background-color < margin-left","background-color < opacity < margin-left"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), background-color memicu paint ulang, margin-left memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  .wrap #kartu:first-child.b { color: kuning; }
}
:where(#kartu, .a) { color: ungu; }
main :where(#kartu, .a) { color: merah !important; }
.a#kartu:not(#zzz) { color: biru; }','html','["kuning","ungu","merah"]'::jsonb,null,2,'.wrap #kartu:first-child.b: (1,3,0) [@layer] → kuning; :where(#kartu, .a): (0,0,0) → ungu; main :where(#kartu, .a): (0,0,1) !important → merah; .a#kartu:not(#zzz): (2,1,0) → biru. Pemenang: merah. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 5), bad("B", 10), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok [\"rA\",\"rB\",\"fC\"]","ok \"C\""]'::jsonb,null,0,'Promise.race menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", (e) => { log("A"); e.stopPropagation(); });
luar.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"), true);','javascript','["B C E A","A B C E","A"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B C E A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Halaman tampil seperti versi desktop yang diperkecil di HP (teks sangat kecil). Penyebab paling mungkin?',null,'<head>
  <title>Toko</title>
</head>','html','["Tidak memakai flexbox","Tidak ada <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">","Gambar terlalu besar"]'::jsonb,null,1,'Tanpa meta viewport, browser mobile merender pada lebar virtual desktop lalu mengecilkannya; media query pun tidak bereaksi seperti yang diharapkan.',null,'Lebar layout yang dipakai browser mobile saat tak diberi tahu?',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; transform: translateZ(0); }
.c1 { position: absolute; z-index: 441; }
.p2 { position: relative; opacity: .9; }
.c2 { position: absolute; z-index: 585; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,0,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=0 (seri → yang belakangan di DOM menang).',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.3.2" }
// versi yang tersedia di registry:
1.3.2  1.3.3  1.3.5  1.5.3  1.5.4  2.3.0  2.3.5  2.5.5','json','["1.3.5","2.5.5","1.5.4"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.5.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 2; i < 6; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["60,60,60,60","30,40,50,60","20,30,40,50"]'::jsonb,null,0,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 6, jadi semua closure menghasilkan 60.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Lebar (px) .kotak?',null,'.induk { width: 500px; }
.kotak { width: min(75%, 500px); }','css','["1080","500","375"]'::jsonb,null,2,'75% × 500 = 375px; min() mengambil yang terkecil → 375px.',null,'min() mengambil nilai terkecil.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 8; }
.c1 { position: absolute; z-index: 573; }
.p2 { position: relative; z-index: 9; }
.c2 { position: absolute; z-index: 11; }
/* A dan B bertumpang tindih secara visual */','html','["A (di atas B)","Tidak bisa ditentukan tanpa ukuran elemen","B (di atas A)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=8, B=9.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Berapa lebar akhir (px) item .i1?',null,'.baris { display: flex; width: 800px; gap: 0px; }
.i1 { flex: 0 0 100px; min-width: 0; }
.i2 { flex: 2 2 250px; min-width: 0; }
.i3 { flex: 3 3 250px; min-width: 0; }','css','["133.33","166.67","100"]'::jsonb,null,2,'Ruang sisa = 800 − gap 0 − Σbasis = 200px dibagi menurut flex-grow (Σ=5) → 100px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":17,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':18,''b'':[2,3],''c'':{''d'':null}}","{\"a\":18,\"b\":[2,3],\"c\":{\"d\":null}}","{\"a\":19,\"b\":[2,3],\"c\":{\"d\":undefined}}"]'::jsonb,null,1,'Hasil: {"a":18,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-1600.jpg","foto-800.jpg"]'::jsonb,null,2,'Slot = 50vw × 1440 = 720px CSS; × DPR 1 = 720px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  [data-x] { color: merah; }
}
:not(#zzz) { color: hijau; }
main :not(.zzz) { color: biru; }','html','["hijau","merah","biru"]'::jsonb,null,0,'[data-x]: (0,1,0) [@layer] → merah; :not(#zzz): (1,0,0) → hijau; main :not(.zzz): (0,1,1) → biru. Pemenang: hijau. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: border-box;
  width: 400px;
  padding: 4px 18px;
  border: 6px solid;
}','css','["448","376","352"]'::jsonb,null,2,'border-box: konten = 400 − 2×18 − 2×6 = 352.',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','output','Apa output kode ini?',null,'const a = [82,110,24,96,112];
const r = a.splice(2, 1, 817);
console.log(JSON.stringify(a), JSON.stringify(r));','javascript','["112] [24],96,817,110,[82","[83,110,817,96,112] [24]","[82,110,817,96,112] [24]"]'::jsonb,null,2,'Dijalankan langsung: [82,110,817,96,112] [24].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(stok());
  var stok = function () { return 64; };
} catch (e) { console.log(e.name); }','javascript','["function","ReferenceError","TypeError"]'::jsonb,null,2,'var v di-hoist sebagai undefined, jadi memanggil v() = memanggil undefined → TypeError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("B");
(async () => {
  console.log("C");
  await null;
  console.log("E");
})();
Promise.resolve().then(() => console.log("H"));
console.log("D");
Promise.resolve().then(() => console.log("A"));','javascript','["B C E H D A","B C D E H A","B C D H E A"]'::jsonb,null,1,'Urutan nyata: B C D E H A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r8"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["end | f | c r8 | sync","sync | c r8 | f | end","sync | c r9 | f | end"]'::jsonb,null,1,'Dijalankan: sync | c r8 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_visibility { to { visibility: … } }
@keyframes k_border_width { to { border-width: … } }
@keyframes k_opacity { to { opacity: … } }','css','["visibility < opacity < border-width","border-width < visibility < opacity","opacity < visibility < border-width"]'::jsonb,null,2,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), visibility memicu paint ulang, border-width memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 2) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f("")), JSON.stringify(f(null)));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\",\"c\":0} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":\"\",\"c\":0} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":\"\",\"b\":\"dflt\",\"c\":0} {\"a\":\"dflt\",\"b\":\"dflt\"}"]'::jsonb,null,2,'Hasil: {"a":"","b":"dflt","c":0} {"a":"dflt","b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'.kolom { display: flex; flex-direction: column; }
.x { margin-bottom: 20px; }
.y { margin-top: 30px; }','css','["50","30","20"]'::jsonb,null,0,'Item flex membentuk konteks baru; margin TIDAK menyatu. Jaraknya 20 + (30) = 50px.',null,'Apakah margin item flex bisa collapse?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([ok("A", 15), bad("B", 10), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"C\"","err B","ok [\"fA\",\"rB\",\"fC\"]"]'::jsonb,null,1,'Promise.all menghasilkan: err B. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(5);
  function klik() {
    setN(n + 3);
    setN(21);
    setN((p) => p + 2);
    setN((p) => p * 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["8","69","10"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=5 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 5 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 69.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 49;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["49 undefined","235","49 TypeError"]'::jsonb,null,2,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"));
tengah.addEventListener("click", (e) => { log("D"); e.stopPropagation(); });
tengah.addEventListener("click", () => log("E"));
tombol.addEventListener("click", () => log("F"), true);','javascript','["A B F D E","B F A D E","A B D E F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A B F D E.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 200%; }
.b { font-size: 1.5em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["60","30","90"]'::jsonb,null,2,'font-size .a = 10×2 = 20px; .b = 20×1.5 = 30px; em pada padding memakai font-size elemen itu sendiri → 3×30 = 90px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Lebar (px) .kotak?',null,'.induk { width: 500px; }
.kotak { width: min(75%, 300px); }','css','["375","281.25","300"]'::jsonb,null,2,'75% × 500 = 375px; min() mengambil yang terkecil → 300px.',null,'min() mengambil nilai terkecil.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 480px?',null,'.grid { gap: 8px; }
@media (min-width: 480px) and (max-width: 1024px) { .grid { gap: 12px; } }
@media (max-width: 1024px) { .grid { gap: 32px; } }
@media (min-width: 480px) { .grid { gap: 24px; } }','css','["24","8","32"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 24px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Berapa lebar kolom ke-2 (px)?',null,'.grid {
  display: grid;
  width: 1000px;
  gap: 0 16px;
  grid-template-columns: 100px 1fr 1fr;
}','css','["450","500","434"]'::jsonb,null,2,'Ruang untuk fr = 1000 − gap 32 − track px 100 = 868px dibagi 2 fr → 1fr = 434px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Berapa kali komponen dirender akibat satu klik ini (React 18)?',null,'function klik() {
  setA(1);
  setB(2);
  setC(3);
}','javascript','["Satu render: update dalam satu event handler dibatch otomatis","Tiga render, satu untuk setiap pemanggilan setState di handler","Dua render: satu untuk setA dan satu gabungan setB dan setC"]'::jsonb,null,0,'React 18 melakukan automatic batching untuk semua pembaruan (juga di promise/timeout), menjadi satu render.',null,'Apa itu batching?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="auth.js"></script>
  <script type="module" src="map.js"></script>
  <script defer src="api.js"></script>
  <script src="ui.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["ui.js → api.js → map.js → auth.js","auth.js → map.js → api.js → ui.js","ui.js → auth.js → map.js → api.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → auth.js → map.js → api.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(null >= 0);
console.log(typeof NaN);
console.log([] < " ");','javascript','["true | number | true","true | false | true","false | number | true"]'::jsonb,null,0,'Hasil nyata: true | number | true. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.1.0  0.1.2  0.1.3  1.0.3  1.0.4  1.1.2','json','["0.0.2","0.0.3","1.1.2"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pengelola state klien?',null,'1. Redux
2. Jotai
3. Zustand
4. Sass
5. SolidJS','text','["1, 3, 4","1, 2, 3","1, 3, 5"]'::jsonb,null,1,'Jotai, Zustand, Redux adalah pengelola state klien; Sass dan SolidJS termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 0; i < 4; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["40,40,40,40","10,20,30,40","0,10,20,30"]'::jsonb,null,0,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 4, jadi semua closure menghasilkan 40.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 8, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["0 8","31 7","23 10"]'::jsonb,null,1,'Hasil: 31 7. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Apa output kode ini?',null,'console.log(["32","24","82","105","88"].map(parseInt).join(","));','javascript','["32,NaN,NaN,3,NaN","33,NaN,NaN,3,NaN","NaN,3,NaN,NaN,32"]'::jsonb,null,0,'Dijalankan langsung: 32,NaN,NaN,3,NaN.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2023, 8, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["1 10","0 5","31 7"]'::jsonb,null,2,'Hasil: 31 7. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2023 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 2; }
.c1 { position: absolute; z-index: 661; }
.p2 { position: relative; z-index: 1; }
.c2 { position: absolute; z-index: 190; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=2, B=1.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.4.1" }
// versi yang tersedia di registry:
3.4.1  3.4.2  3.5.0  3.5.1  4.4.4  4.5.0  4.5.2  4.5.3','json','["3.5.1","4.5.3","3.4.2"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.4.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(typeof NaN);
console.log("5" - - "2");
console.log("" >= "5");','javascript','["number | 7 | false","[object Object] | 7 | false","number | 0 | false"]'::jsonb,null,0,'Hasil nyata: number | 7 | false. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 900px; gap: 10px; }
.i1 { flex: 2 0 150px; min-width: 0; }
.i2 { flex: 3 1 250px; min-width: 0; }
.i3 { flex: 0 0 100px; min-width: 0; }','css','["376.67","490","478"]'::jsonb,null,2,'Ruang sisa = 900 − gap 20 − Σbasis = 380px dibagi menurut flex-grow (Σ=5) → 478px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  .wrap :where(#kartu, .a).a { color: hijau; }
}
.wrap p[data-x]:first-child { color: ungu !important; }
:not(#zzz) { color: oranye !important; }','html','["oranye","hijau","ungu"]'::jsonb,null,0,'.wrap :where(#kartu, .a).a: (0,2,0) [@layer] → hijau; .wrap p[data-x]:first-child: (0,3,1) !important → ungu; :not(#zzz): (1,0,0) !important → oranye. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 72,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["195","238","72"]'::jsonb,null,2,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="chart.js"></script>
  <script type="module" src="api.js"></script>
  <script defer src="util.js"></script>
  <script src="app.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["app.js → util.js → api.js → chart.js","chart.js → api.js → util.js → app.js","app.js → chart.js → api.js → util.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: app.js → chart.js → api.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pengelola state klien?',null,'1. Pinia
2. Zustand
3. esbuild
4. Memcached
5. Jotai','text','["1, 2, 5","2, 3, 4","1, 3, 4"]'::jsonb,null,0,'Jotai, Zustand, Pinia adalah pengelola state klien; esbuild dan Memcached termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Berapa lebar kolom ke-1 (px)?',null,'.grid {
  display: grid;
  width: 1200px;
  gap: 0 0px;
  grid-template-columns: 1fr 80px 1fr 80px;
}','css','["520","600","300"]'::jsonb,null,0,'Ruang untuk fr = 1200 − gap 0 − track px 160 = 1040px dibagi 2 fr → 1fr = 520px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"));
tombol.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"));
tombol.addEventListener("click", () => log("F"), true);','javascript','["A D E F B C","A B C D E F","F A D E B C"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: F A D E B C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(6)
  .finally(() => 60)
  .then((v) => console.log("v", v));','javascript','["v 7","undefined","v 6"]'::jsonb,null,2,'Dijalankan: v 6.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: border-box;
  width: 300px;
  padding: 0px 15px;
  border: 7px solid;
}','css','["256","278","344"]'::jsonb,null,0,'border-box: konten = 300 − 2×15 − 2×7 = 256.',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','guess','Mengapa angka ini terbaca string dan bukan angka saat memakai <input type="number">?',null,'const v = e.target.value;
console.log(typeof v);','javascript','["value elemen input selalu string","typeof mengembalikan ''number'' pada input type number","Karena atribut type=\"number\" belum didukung browser"]'::jsonb,null,0,'Properti .value selalu string, apa pun tipe inputnya. valueAsNumber memberi angka.',null,'Tipe apa yang dikembalikan properti value?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 10), bad("B", 5), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"rB\",\"rC\"]","err B","err All promises were rejected"]'::jsonb,null,1,'Promise.race menghasilkan: err B. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 125%; }
.b { font-size: 0.8em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["37.5","30","24"]'::jsonb,null,1,'font-size .a = 10×1.25 = 12.5px; .b = 12.5×0.8 = 10px; em pada padding memakai font-size elemen itu sendiri → 3×10 = 30px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof harga);
  var harga = 5;
  console.log(typeof harga);
} catch (e) { console.log(e.name); }','javascript','["undefined number","undefined function","function number"]'::jsonb,null,0,'var di-hoist dan bernilai undefined sebelum baris deklarasi; typeof pertama ''undefined'', lalu ''number''.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output kode ini?',null,'const o = { n: 6, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":13},\"a\":[{\"v\":12}]}","{''o'':{''v'':12},''a'':[{''v'':12}]}","{\"o\":{\"v\":12},\"a\":[{\"v\":12}]}"]'::jsonb,null,2,'Hasil: {"o":{"v":12},"a":[{"v":12}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Lebar (px) .kotak?',null,'.induk { width: 600px; }
.kotak { width: min(60%, 300px); }','css','["300","864","360"]'::jsonb,null,0,'60% × 600 = 360px; min() mengambil yang terkecil → 300px.',null,'min() mengambil nilai terkecil.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 0; i < 3; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["30,30,30","10,20,30","0,10,20"]'::jsonb,null,2,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 60vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-1280.jpg","foto-1600.jpg"]'::jsonb,null,0,'Slot = 60vw × 1440 = 864px CSS; × DPR 1 = 864px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 700px?',null,'.grid { gap: 4px; }
@media (min-width: 600px) and (max-width: 700px) { .grid { gap: 32px; } }
@media (min-width: 600px) { .grid { gap: 16px; } }
@media (max-width: 700px) { .grid { gap: 8px; } }','css','["8","4","16"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_display { to { display: … } }
@keyframes k_border_radius { to { border-radius: … } }
@keyframes k_opacity { to { opacity: … } }','css','["opacity < border-radius < display","display < border-radius < opacity","border-radius < opacity < display"]'::jsonb,null,0,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), border-radius memicu paint ulang, display memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("C"));
Promise.resolve().then(() => {
  console.log("A");
  queueMicrotask(() => console.log("D"));
});
setTimeout(() => console.log("H"), 0);
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("undefined"));
});
queueMicrotask(() => console.log("undefined"));','javascript','["C A undefined F D undefined H","C A D H F","C A F undefined D undefined H"]'::jsonb,null,2,'Urutan nyata: C A F undefined D undefined H. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN((p) => p * 3);
    setN(n + 1);
    setN((p) => p * 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["2","12","6"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 6.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 9) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(undefined)), JSON.stringify(f("")));','javascript','["{\"a\":9,\"b\":9} {\"a\":\"\",\"b\":\"dflt\",\"c\":0}","{\"a\":9,\"b\":9} {\"a\":\"dflt\",\"b\":\"\",\"c\":0}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"\",\"b\":\"dflt\",\"c\":0}"]'::jsonb,null,0,'Hasil: {"a":9,"b":9} {"a":"","b":"dflt","c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 16px; }
.anak  { margin-top: 40px; }','css','["62","56","40"]'::jsonb,null,2,'Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(16, 40) = 40px.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 23, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{\"a\":2,\"b\":23} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{''a'':2,''b'':23} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":3,\"b\":23} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,0,'Hasil: {"a":2,"b":23} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  :is(.a, #kartu) { color: kuning; }
}
@layer base {
  :not(#zzz).b { color: hijau; }
}
main :is(.a, .b) { color: oranye !important; }','html','["kuning","hijau","oranye"]'::jsonb,null,2,':is(.a, #kartu): (1,0,0) [@layer] → kuning; :not(#zzz).b: (1,1,0) [@layer] → hijau; main :is(.a, .b): (0,1,1) !important → oranye. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => console.log("B"));
queueMicrotask(() => console.log("D"));
console.log("H");
queueMicrotask(() => console.log("C"));
console.log("E");','javascript','["E H B D C","B D H C E","H E B D C"]'::jsonb,null,2,'Urutan nyata: H E B D C. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Dari daftar ini, nomor mana yang BUKAN alat uji end-to-end/komponen di browser?',null,'1. Playwright
2. Astro
3. SQLAlchemy
4. Cypress
5. WebdriverIO','text','["1 dan 2 dan 5","3 dan 4 dan 5","2 dan 3"]'::jsonb,null,2,'Astro dan SQLAlchemy termasuk kategori lain; Cypress, WebdriverIO, Playwright adalah alat uji end-to-end/komponen di browser.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 640px?',null,'.grid { gap: 8px; }
@media (min-width: 640px) { .grid { gap: 24px; } }
@media (max-width: 700px) { .grid { gap: 12px; } }
@media (min-width: 640px) and (max-width: 700px) { .grid { gap: 16px; } }','css','["8","24","16"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 16px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_height { to { height: … } }
@keyframes k_transform { to { transform: … } }
@keyframes k_color { to { color: … } }','css','["height < color < transform","color < transform < height","transform < color < height"]'::jsonb,null,2,'transform hanya perlu compositing (di GPU, tanpa layout/paint), color memicu paint ulang, height memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 60vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-1024.jpg","foto-1600.jpg"]'::jsonb,null,1,'Slot = 60vw × 1440 = 864px CSS; × DPR 1 = 864px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 2; i < 5; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["4,6,8","6,8,10","10,10,10"]'::jsonb,null,0,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.4.0" }
// versi yang tersedia di registry:
1.4.0  1.4.1  1.5.2  1.6.0  1.6.1  2.4.0','json','["1.4.1","1.6.1","2.4.0"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.4.1.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(false - []);
console.log("5" - - "2");
console.log(undefined < false);','javascript','["NaN | 7 | false","0 | [object Object] | false","0 | 7 | false"]'::jsonb,null,2,'Hasil nyata: 0 | 7 | false. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 2em; }
.b { font-size: 0.5em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","60","15"]'::jsonb,null,0,'font-size .a = 10×2 = 20px; .b = 20×0.5 = 10px; em pada padding memakai font-size elemen itu sendiri → 3×10 = 30px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(4)
  .finally(() => 15)
  .then((v) => console.log("v", v));','javascript','["v 4","undefined","v 5"]'::jsonb,null,0,'Dijalankan: v 4.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(kuota());
  var kuota = function () { return 6; };
} catch (e) { console.log(e.name); }','javascript','["ReferenceError","TypeError","number"]'::jsonb,null,1,'var v di-hoist sebagai undefined, jadi memanggil v() = memanggil undefined → TypeError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 5), bad("B", 10), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok [\"rA\",\"rB\",\"rC\"]","err All promises were rejected"]'::jsonb,null,0,'Promise.race menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Apa dampak atribut ini bagi pengguna keyboard dan pembaca layar?',null,'<button aria-hidden="true">Hapus</button>','html','["Tidak ada dampak; aria-hidden hanya memengaruhi gaya visual dan tidak dibaca pembaca layar","Tombol tidak bisa difokus dan tidak terlihat oleh siapa pun, termasuk pengguna keyboard","Tombol tetap bisa difokus keyboard tetapi disembunyikan dari pembaca layar — fokus ''hantu''"]'::jsonb,null,2,'aria-hidden menghapus dari pohon aksesibilitas tetapi tidak menghapus kemampuan fokus. Jangan dipakai pada elemen interaktif.',null,'Apakah aria-hidden mengubah urutan Tab?',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 0, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["0 9","1 2","31 11"]'::jsonb,null,2,'Hasil: 31 11. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 900px; gap: 10px; }
.i1 { flex: 0 1 300px; min-width: 0; }
.i2 { flex: 2 2 150px; min-width: 0; }
.i3 { flex: 1 3 100px; min-width: 0; }','css','["370","383.33","260"]'::jsonb,null,0,'Ruang sisa = 900 − gap 20 − Σbasis = 330px dibagi menurut flex-grow (Σ=3) → 370px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Berapa lebar kolom ke-1 (px)?',null,'.grid {
  display: grid;
  width: 1000px;
  gap: 0 0px;
  grid-template-columns: 2fr 100px 160px 2fr;
}','css','["500","250","370"]'::jsonb,null,2,'Ruang untuk fr = 1000 − gap 0 − track px 260 = 740px dibagi 4 fr → 1fr = 185px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'console.log(["52","69","52","13","73"].map(parseInt).join(","));','javascript','["52,NaN,NaN,1,NaN","NaN,1,NaN,NaN,52","53,NaN,NaN,1,NaN"]'::jsonb,null,0,'Dijalankan langsung: 52,NaN,NaN,1,NaN.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 16px; padding-top: 9px; }
.anak  { margin-top: 40px; }','css','["65","40","56"]'::jsonb,null,0,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 16 + 9 + 40 = 65.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="auth.js"></script>
  <script src="util.js"></script>
  <script src="api.js"></script>
  <script type="module" src="app.js"></script>
  <script src="chart.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["auth.js → util.js → api.js → app.js → chart.js","auth.js → app.js → util.js → api.js → chart.js","util.js → api.js → chart.js → auth.js → app.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: util.js → api.js → chart.js → auth.js → app.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 72;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["72 undefined","72 TypeError","197"]'::jsonb,null,1,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: border-box;
  width: 400px;
  padding: 0 19px;
  border: 8px solid;
  margin: 0 25px;
}','css','["488","454","450"]'::jsonb,null,2,'border-box: width sudah mencakup padding & border → 400 + 2×25 margin = 450.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 5; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; }
.c2 { position: absolute; z-index: 864; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,0,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=5, B=864.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 8) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f("0")), JSON.stringify(f(false)));','javascript','["{\"a\":\"0\",\"b\":\"0\",\"c\":1} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":\"0\",\"b\":\"0\",\"c\":1} {\"a\":\"dflt\",\"b\":false}","{\"a\":\"0\",\"b\":\"0\",\"c\":1} {\"a\":false,\"b\":\"dflt\"}"]'::jsonb,null,2,'Hasil: {"a":"0","b":"0","c":1} {"a":false,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(7);
  function klik() {
    setN((p) => p + 4);
    setN((p) => p + 5);
    setN(n + 2);
    setN((p) => p * 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["54","9","27"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=7 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 7 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 27.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Lebar (px) elemen pada viewport 768px?',null,'.hero { width: clamp(320px, 80vw, 720px); }','css','["614.4","320","720"]'::jsonb,null,0,'80vw = 614.4px, lalu dibatasi [320, 720] → 614.4px.',null,'clamp(min, ideal, max).',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
tengah.addEventListener("click", (e) => { log("B"); e.stopPropagation(); }, true);
luar.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"));
tengah.addEventListener("click", () => log("F"), true);','javascript','["C B F","B C F","E A B D F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C B F.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(NaN < 5);
console.log(undefined === " ");
console.log([0] === " ");','javascript','["true | false | false","false | true | false","false | false | false"]'::jsonb,null,2,'Hasil nyata: false | false | false. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="api.js"></script>
  <script defer src="auth.js"></script>
  <script src="ui.js"></script>
  <script type="module" src="app.js"></script>
  <script src="map.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["ui.js → map.js → api.js → auth.js → app.js","api.js → auth.js → app.js → ui.js → map.js","api.js → auth.js → ui.js → app.js → map.js"]'::jsonb,null,0,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → map.js → api.js → auth.js → app.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null);
