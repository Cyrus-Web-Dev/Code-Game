-- DIHASILKAN oleh scripts/gen-dev.mjs (frontend, bagian 1/4) — 250 soal HARD MODE (v2.4)
-- Bagian 1 menonaktifkan soal Developer Mode lama (v2.1–v2.3) untuk peran ini; jalankan SEMUA bagian.
update questions set active = false where difficulty = 'frontend';
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-2000.jpg","foto-1024.jpg","foto-480.jpg"]'::jsonb,null,1,'Slot = 40vw × 1024 = 410px CSS; × DPR 2 = 819px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Portofolio foto menampilkan ratusan gambar resolusi tinggi dan lambat dibuka. Dua teknik yang paling berdampak?',null,'<img src="foto-4k.jpg">  <!-- ×300 -->','html','["loading=\"lazy\" untuk gambar di bawah lipatan + srcset/format modern","Mengubah semua gambar menjadi font ikon","Memasang HTTPS pada domain"]'::jsonb,null,0,'Lazy loading menunda gambar di luar layar; srcset/format modern mengurangi byte yang diunduh. HTTPS tidak mempercepat muatan gambar.',null,'Kurangi apa yang diunduh dan kapan diunduh.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("C");
  Promise.resolve().then(() => console.log("G"));
}, 0);
Promise.resolve().then(() => {
  console.log("A");
  queueMicrotask(() => console.log("B"));
});
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("undefined"));
});
queueMicrotask(() => console.log("undefined"));
Promise.resolve().then(() => console.log("undefined"));','javascript','["C G A B F","A F undefined undefined B undefined G C","A F undefined undefined B undefined C G"]'::jsonb,null,2,'Urutan nyata: A F undefined undefined B undefined C G. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 40px; }
.anak  { margin-top: 20px; }','css','["60","40","71"]'::jsonb,null,1,'Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(40, 20) = 40px.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_transform { to { transform: … } }
@keyframes k_border_radius { to { border-radius: … } }
@keyframes k_top { to { top: … } }','css','["top < border-radius < transform","border-radius < transform < top","transform < border-radius < top"]'::jsonb,null,2,'transform hanya perlu compositing (di GPU, tanpa layout/paint), border-radius memicu paint ulang, top memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.0.3" }
// versi yang tersedia di registry:
3.0.3  3.1.3  3.1.4  3.1.6  3.2.3  3.2.6  4.0.5  4.2.5','json','["3.0.3","4.2.5","3.2.6"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof skor);
  let skor = 67;
} catch (e) { console.log(e.name); }','javascript','["TypeError","67","ReferenceError"]'::jsonb,null,2,'let ada di TDZ sebelum deklarasi; typeof pun melempar ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"));
luar.addEventListener("click", (e) => { log("B"); e.stopPropagation(); });
tombol.addEventListener("click", () => log("C"), true);
luar.addEventListener("click", () => log("D"), true);
tombol.addEventListener("click", () => log("E"), true);
luar.addEventListener("click", () => log("F"));','javascript','["D C E A B F","A B C D E F","C E A B D F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: D C E A B F.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 70, get() { return this.n; } };
const g = o.get.bind({ n: 126 });
console.log(g.call({ n: 239 }));','javascript','["126","239","70"]'::jsonb,null,0,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c8"; } finally { return "f93"; }
}
console.log(f());','javascript','["f93","undefined","f94"]'::jsonb,null,0,'Dijalankan: f93.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 800px; display: flex; gap: 48px; }
.kartu { flex: 0 0 calc((100% - 144px) / 4); }','css','["200","188","164"]'::jsonb,null,2,'(800 − 144) / 4 = 164px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','guess','Setelah klik, apakah komponen render ulang dan apa yang tampil?',null,'const ref = useRef(0);
function klik() { ref.current++; }
return <button onClick={klik}>{ref.current}</button>;','javascript','["Error karena ref tidak boleh diubah","Render ulang dan tampil 1","Tidak render ulang"]'::jsonb,null,2,'Ref adalah wadah mutable di luar siklus render. Mengubah .current tidak memberi tahu React.',null,'Apakah mengubah ref menjadwalkan render?',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(2);
const q = Object.create(p);
q.n = 7;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["2 true true","2 false true","false 2 true"]'::jsonb,null,1,'Hasil: 2 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
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
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["P+1 C+1 P-1 P+2 P-2 P+2","C+1 P+1 P-1 P+2 P-2 P+2","P+2 P-2 P+2 P-1 P+1 C+1"]'::jsonb,null,1,'Hasil: C+1 P+1 P-1 P+2 P-2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="app.js"></script>
  <script src="auth.js"></script>
  <script defer src="ui.js"></script>
  <script defer src="util.js"></script>
  <script src="chart.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["app.js → auth.js → ui.js → util.js → chart.js","ui.js → util.js → app.js → auth.js → chart.js","app.js → auth.js → chart.js → ui.js → util.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: app.js → auth.js → chart.js → ui.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Berapa lebar kolom ke-4 (px)?',null,'.grid {
  display: grid;
  width: 1200px;
  gap: 0 16px;
  grid-template-columns: 120px 1fr 80px 1fr;
}','css','["500","476","600"]'::jsonb,null,1,'Ruang untuk fr = 1200 − gap 48 − track px 200 = 952px dibagi 2 fr → 1fr = 476px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 639px?',null,'.grid { gap: 16px; }
@media (min-width: 640px) { .grid { gap: 24px; } }
@media (min-width: 640px) and (max-width: 900px) { .grid { gap: 4px; } }
@media (max-width: 900px) { .grid { gap: 8px; } }','css','["8","16","24"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 29], e: null }));','javascript','["{''c'':null,''d'':[null,29],''e'':null}","{\"c\":undefined,\"d\":[null,30],\"e\":null}","{\"c\":null,\"d\":[null,29],\"e\":null}"]'::jsonb,null,2,'Hasil: {"c":null,"d":[null,29],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','output','Apa output kode ini?',null,'const a = Date.UTC(2024, 2, 1), b = Date.UTC(2024, 1, 1);
console.log((a - b) / 86400000);','javascript','["30","28","29"]'::jsonb,null,2,'Hasil: 29. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(9007199254740993 === 9007199254740992);
console.log([10, 9, 1].sort());
console.log("5" - NaN);','javascript','["true | [ 1, 10, 9 ] | NaN","true | 0 | NaN","false | [ 1, 10, 9 ] | NaN"]'::jsonb,null,0,'Hasil nyata: true | [ 1, 10, 9 ] | NaN. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 2em; }
.b { font-size: 1.25em; padding-left: 1.5em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","37.5","15"]'::jsonb,null,1,'font-size .a = 10×2 = 20px; .b = 20×1.25 = 25px; em pada padding memakai font-size elemen itu sendiri → 1.5×25 = 37.5px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 1000px; gap: 10px; }
.i1 { flex: 3 3 250px; min-width: 0; }
.i2 { flex: 1 2 100px; min-width: 0; }
.i3 { flex: 1 3 300px; min-width: 0; }','css','["170","210","166"]'::jsonb,null,2,'Ruang sisa = 1000 − gap 20 − Σbasis = 330px dibagi menurut flex-grow (Σ=5) → 166px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; }
.c1 { position: absolute; z-index: 795; }
.p2 { position: relative; opacity: .9; }
.c2 { position: absolute; z-index: 835; }
/* A dan B bertumpang tindih secara visual */','html','["A (di atas B)","B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen"]'::jsonb,null,0,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=795, B=0.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 0; i < 4; i++) {
  fns.push(() => i * 1);
}
console.log(fns.map((f) => f()).join(","));','javascript','["0,1,2,3","4,4,4,4","1,2,3,4"]'::jsonb,null,1,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 4, jadi semua closure menghasilkan 4.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 7) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(undefined)), JSON.stringify(f(NaN)));','javascript','["{\"a\":7,\"b\":7} {\"a\":null,\"b\":\"dflt\"}","{\"a\":7,\"b\":7} {\"a\":\"dflt\",\"b\":null}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":null,\"b\":\"dflt\"}"]'::jsonb,null,0,'Hasil: {"a":7,"b":7} {"a":null,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN(18);
    setN(n + 5);
    setN((p) => p * 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["46","13","26"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 26.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 5), ok("B", 10), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"fB\",\"rC\"]","err A","ok \"B\""]'::jsonb,null,1,'Promise.race menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
# lalu f.txt diedit dan BELUM di-commit: isinya "wip"
$ git restore f.txt','bash','["status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip","status: bersih | commit: 2 | isi f.txt: v2","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip"]'::jsonb,null,1,'Dijalankan di repositori nyata: status: bersih | commit: 2 | isi f.txt: v2. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x style="color: merah">Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
:is(.a, .b).a[data-x] { color: oranye; }
:first-child:is(.a, #kartu) { color: kuning !important; }
p#kartu { color: ungu; }','html','["oranye","ungu","kuning"]'::jsonb,null,2,':is(.a, .b).a[data-x]: (0,3,0) → oranye; :first-child:is(.a, #kartu): (1,1,0) !important → kuning; p#kartu: (1,0,1) → ungu; style inline: (0,0,0) → merah. Pemenang: kuning. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Jenis kerentanan/serangan apa ini?',null,'Komentar berisi <script> tersimpan di database dan dieksekusi di browser setiap pengunjung yang membuka halaman.','text','["Command Injection","Stored XSS","Open Redirect"]'::jsonb,null,1,'Stored XSS: Escape output sesuai konteks + sanitasi HTML + Content-Security-Policy.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pengelola state klien?',null,'1. Redux
2. Jotai
3. RavenDB
4. MySQL
5. MobX','text','["1, 2, 5","2, 4, 5","3, 4, 5"]'::jsonb,null,0,'Redux, MobX, Jotai adalah pengelola state klien; MySQL dan RavenDB termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Berapa lebar konten (px) anak ini?',null,'.induk {
  box-sizing: border-box;
  width: 500px;
  padding: 0 25px;
}
.anak { width: 25%; }   /* box-sizing: content-box, tanpa padding */','css','["137.5","125","112.5"]'::jsonb,null,2,'Persentase mengacu ke lebar KONTEN induk (450px) → 112.5px.',null,'Persen mengacu ke content box induk, bukan border box.',null),
('frontend','output','Apa output kode ini?',null,'const a = Array(4).map((_, i) => i * 2);
console.log(a.length, a.filter(() => true).length, JSON.stringify(a));','javascript','["4 0 [null,null,null,null]","5 0 [null,null,null,null]","null],null,null,4 0 [null"]'::jsonb,null,0,'Dijalankan langsung: 4 0 [null,null,null,null].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 3; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; z-index: 6; }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["Tidak bisa ditentukan tanpa ukuran elemen","B (di atas A)","A (di atas B)"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=3, B=6.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c3"; } finally { return "f49"; }
}
console.log(f());','javascript','["undefined","f49","f50"]'::jsonb,null,1,'Dijalankan: f49.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 30px; padding-top: 15px; }
.anak  { margin-top: 40px; }','css','["70","40","85"]'::jsonb,null,2,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 30 + 15 + 40 = 85.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','guess','Gambar LCP (di atas lipatan) diberi atribut berikut. Dampaknya terhadap LCP?',null,'<img src="hero.avif" loading="lazy" alt="">','html','["Mempercepat LCP karena menghemat bandwidth","Tidak ada dampak; lazy hanya berlaku di bawah 100px","Memperlambat LCP"]'::jsonb,null,2,'Elemen yang menjadi LCP jangan di-lazy-load; beri fetchpriority="high". Lazy loading ditujukan untuk gambar di bawah lipatan.',null,'Gambar mana yang harus dimuat paling dulu?',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.0.5  0.1.0  0.1.2  0.2.2  1.0.5','json','["0.0.5","1.0.5","0.0.2"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_transform { to { transform: … } }
@keyframes k_font_size { to { font-size: … } }
@keyframes k_box_shadow { to { box-shadow: … } }','css','["box-shadow < transform < font-size","font-size < box-shadow < transform","transform < box-shadow < font-size"]'::jsonb,null,2,'transform hanya perlu compositing (di GPU, tanpa layout/paint), box-shadow memicu paint ulang, font-size memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','guess','Berapa lebar kolom ke-2 (px)?',null,'.grid {
  display: grid;
  width: 600px;
  gap: 0 20px;
  grid-template-columns: 80px 2fr 200px 100px;
}','css','["600","160","220"]'::jsonb,null,1,'Ruang untuk fr = 600 − gap 60 − track px 380 = 160px dibagi 2 fr → 1fr = 80px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'const o = { b: 1, 20: "x", a: 2, 3: "y", 100: "z" };
console.log(Object.keys(o).join(","));','javascript','["a,b,100,20,3","3,20,100,b,a","4,20,100,b,a"]'::jsonb,null,1,'Dijalankan langsung: 3,20,100,b,a.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 8) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(0)), JSON.stringify(f("")));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\",\"c\":0}","{\"a\":0,\"b\":\"dflt\"} {\"a\":\"\",\"b\":\"dflt\",\"c\":0}","{\"a\":\"dflt\",\"b\":0} {\"a\":\"dflt\",\"b\":\"\",\"c\":0}"]'::jsonb,null,1,'Hasil: {"a":0,"b":"dflt"} {"a":"","b":"dflt","c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([..."ab"].length + "ab".length);
console.log([0] == false);
console.log([10, 9, 1].sort());','javascript','["true | true | [ 1, 10, 9 ]","4 | true | [ 1, 10, 9 ]","4 | false | [ 1, 10, 9 ]"]'::jsonb,null,1,'Hasil nyata: 4 | true | [ 1, 10, 9 ]. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: border-box;
  width: 300px;
  padding: 0 11px;
  border: 3px solid;
  margin: 0 23px;
}','css','["368","346","328"]'::jsonb,null,1,'border-box: width sudah mencakup padding & border → 300 + 2×23 margin = 346.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
$ git commit --amend -qm "baru"','bash','["status: bersih | commit: 2 | isi f.txt: v2","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: v2","status: f.txt ter-staging | commit: 1 | isi f.txt: v2"]'::jsonb,null,0,'Dijalankan di repositori nyata: status: bersih | commit: 2 | isi f.txt: v2. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 8 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([ok("A", 10), bad("B", 5), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err B","ok \"A\"","ok [\"fA\",\"rB\",\"fC\"]"]'::jsonb,null,0,'Promise.race menghasilkan: err B. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Berapa lebar akhir (px) item .i1?',null,'.baris { display: flex; width: 720px; gap: 0px; }
.i1 { flex: 0 0 200px; min-width: 0; }
.i2 { flex: 1 0 200px; min-width: 0; }
.i3 { flex: 3 2 150px; min-width: 0; }','css','["200","261.82","256.67"]'::jsonb,null,0,'Ruang sisa = 720 − gap 0 − Σbasis = 170px dibagi menurut flex-grow (Σ=4) → 200px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Jenis kerentanan/serangan apa ini?',null,'Situs target dimuat dalam iframe transparan; pengguna mengira mengeklik tombol permainan tetapi menekan ''Hapus akun''.','text','["Clickjacking","Credential Stuffing","Subdomain takeover"]'::jsonb,null,0,'Clickjacking: CSP frame-ancestors atau X-Frame-Options agar halaman tidak bisa dibingkai situs lain.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
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
  }, [id]);
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["C+1 P+1 C-1 P-1 C+2 P+2 C-2 C+2","P+1 C+1 P-1 C-1 P+2 C+2 C-2 C+2","C+1 P+1 C-1 C+2 P-1 P+2 C-2 C+2"]'::jsonb,null,0,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2 C-2 C+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Dari daftar ini, nomor mana yang BUKAN tooling/framework CSS?',null,'1. React
2. Bulma
3. MobX
4. Sass
5. Tailwind CSS','text','["1 dan 3 dan 5","1 dan 3","1 dan 2 dan 3"]'::jsonb,null,1,'MobX dan React termasuk kategori lain; Tailwind CSS, Sass, Bulma adalah tooling/framework CSS.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
#kartu { color: ungu; }
:not(.zzz):is(.a, #kartu) { color: merah !important; }
p { color: oranye; }','html','["oranye","ungu","merah"]'::jsonb,null,2,'#kartu: (1,0,0) → ungu; :not(.zzz):is(.a, #kartu): (1,1,0) !important → merah; p: (0,0,1) → oranye. Pemenang: merah. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 1; i < 4; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["10,20,30","20,30,40","40,40,40"]'::jsonb,null,0,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Lebar (px) elemen pada viewport 1440px?',null,'.hero { width: clamp(280px, 80vw, 600px); }','css','["280","1152","600"]'::jsonb,null,2,'80vw = 1152px, lalu dibatasi [280, 600] → 600px.',null,'clamp(min, ideal, max).',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-800.jpg","foto-480.jpg"]'::jsonb,null,1,'Slot = 90vw × 360 = 324px CSS; × DPR 2 = 648px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof harga);
  var harga = 86;
  console.log(typeof harga);
} catch (e) { console.log(e.name); }','javascript','["undefined number","function number","undefined function"]'::jsonb,null,0,'var di-hoist dan bernilai undefined sebelum baris deklarasi; typeof pertama ''undefined'', lalu ''number''.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script src="map.js"></script>
  <script defer src="auth.js"></script>
  <script defer src="api.js"></script>
  <script type="module" src="ui.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["auth.js → api.js → ui.js → map.js","map.js → ui.js → api.js → auth.js","map.js → auth.js → api.js → ui.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: map.js → auth.js → api.js → ui.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 3);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 4);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["A.field | A.ctor | B.init undefined | B.field | B.ctor 4","A.field | A.ctor | B.init 4 | B.field | B.ctor 4","B.ctor 4 | B.field | B.init undefined | A.ctor | A.field"]'::jsonb,null,0,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 4. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
tombol.addEventListener("click", () => log("B"));
tombol.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"), true);','javascript','["A B C D","B C A D","D C B A"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: D C B A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output kode ini?',null,'const a = Date.UTC(2025, 2, 1), b = Date.UTC(2025, 1, 1);
console.log((a - b) / 86400000);','javascript','["28","29","30"]'::jsonb,null,0,'Hasil: 28. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2025 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 769px?',null,'.grid { gap: 4px; }
@media (max-width: 768px) { .grid { gap: 32px; } }
@media (min-width: 600px) and (max-width: 768px) { .grid { gap: 24px; } }
@media (min-width: 600px) { .grid { gap: 16px; } }','css','["16","32","4"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 16px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Apa output kode ini?',null,'const o = { n: 45, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{''o'':{''v'':90},''a'':[{''v'':90}]}","{\"o\":{\"v\":90},\"a\":[{\"v\":90}]}","{\"o\":{\"v\":91},\"a\":[{\"v\":90}]}"]'::jsonb,null,1,'Hasil: {"o":{"v":90},"a":[{"v":90}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN(n + 3);
    setN((p) => p + 4);
    setN(n + 5);
    setN((p) => p + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["21","13","14"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 14.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 36,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["252","116","36"]'::jsonb,null,2,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("F"));
queueMicrotask(() => console.log("D"));
Promise.resolve().then(() => console.log("C"));
setTimeout(() => {
  console.log("E");
  Promise.resolve().then(() => console.log("A"));
}, 0);
queueMicrotask(() => console.log("H"));','javascript','["F D C E H A","F D C E A H","F D C H E A"]'::jsonb,null,2,'Urutan nyata: F D C H E A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Apa itu ''technical debt''?',null,'# jargon rekayasa','text','["Jumlah bug yang tercatat di issue tracker","Biaya tambahan di masa depan akibat jalan pintas desain/kode saat ini","Utang uang perusahaan kepada vendor server"]'::jsonb,null,1,'Metafora utang: jalan pintas mempercepat sekarang tetapi menambah biaya perubahan kelak.',null,'Apa ''bunga''-nya?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 50%; }
.b { font-size: 0.8em; padding-left: 1em; }
/* <div class="a"><div class="b">…</div></div> */','css','["8","20","10"]'::jsonb,null,0,'font-size .a = 20×0.5 = 10px; .b = 10×0.8 = 8px; em pada padding memakai font-size elemen itu sendiri → 1×8 = 8px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: border-box;
  width: 400px;
  padding: 9px 5px;
  border: 4px solid;
}','css','["418","391","382"]'::jsonb,null,2,'border-box: konten = 400 − 2×5 − 2×4 = 382.',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("C");
  queueMicrotask(() => console.log("G"));
});
(async () => {
  console.log("H");
  await null;
  console.log("A");
})();
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("D"));
});
queueMicrotask(() => console.log("undefined"));
console.log("undefined");','javascript','["C G H A F D","H undefined C A undefined F G D","H undefined C A F undefined G D"]'::jsonb,null,2,'Urutan nyata: H undefined C A F undefined G D. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([bad("A", 10), ok("B", 15), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"fB\",\"fC\"]","err A","ok \"C\""]'::jsonb,null,0,'Promise.allSettled menghasilkan: ok ["rA","fB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 75, get: () => this.n };
}
const o = buat.call({ n: 122 });
console.log(o.get(), o.n);','javascript','["75 undefined","122 75","75 TypeError"]'::jsonb,null,1,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 200%; }
.b { font-size: 0.8em; padding-left: 1.5em; }
/* <div class="a"><div class="b">…</div></div> */','css','["30","24","15"]'::jsonb,null,1,'font-size .a = 10×2 = 20px; .b = 20×0.8 = 16px; em pada padding memakai font-size elemen itu sendiri → 1.5×16 = 24px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.4.4" }
// versi yang tersedia di registry:
3.4.4  3.4.5  3.4.6  3.5.5  3.6.6  4.4.5  4.4.7  4.6.5','json','["3.6.6","4.6.5","3.4.6"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.4.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
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
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["C+1 P+1 C-1 P-1 C+2 P+2 C-2 P-2 C+2 P+2","P+1 C+1 P-1 C-1 P+2 C+2 P-2 C-2 P+2 C+2","C+1 P+1 C-1 C+2 P-1 P+2 C-2 C+2 P-2 P+2"]'::jsonb,null,0,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2 C-2 P-2 C+2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 9) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(0)), JSON.stringify(f("")));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\",\"c\":0}","{\"a\":0,\"b\":\"dflt\"} {\"a\":\"\",\"b\":\"dflt\",\"c\":0}","{\"a\":\"dflt\",\"b\":0} {\"a\":\"dflt\",\"b\":\"\",\"c\":0}"]'::jsonb,null,1,'Hasil: {"a":0,"b":"dflt"} {"a":"","b":"dflt","c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Apa output kode ini?',null,'const a = [108,85,32,98,79];
const r = a.splice(2, 1, 932);
console.log(JSON.stringify(a), JSON.stringify(r));','javascript','["79] [32],98,932,85,[108","[109,85,932,98,79] [32]","[108,85,932,98,79] [32]"]'::jsonb,null,2,'Dijalankan langsung: [108,85,932,98,79] [32].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="util.js"></script>
  <script src="chart.js"></script>
  <script type="module" src="ui.js"></script>
  <script defer src="api.js"></script>
  <script defer src="app.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["util.js → chart.js → ui.js → api.js → app.js","util.js → ui.js → api.js → app.js → chart.js","chart.js → util.js → ui.js → api.js → app.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: chart.js → util.js → ui.js → api.js → app.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(1);
const q = Object.create(p);
q.n = 6;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["1 true true","1 false true","2 false true"]'::jsonb,null,1,'Hasil: 1 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Aplikasi chat harus menampilkan pesan baru ke layar tanpa refresh dan tanpa polling terus-menerus; pengguna juga mengirim pesan sering. Teknologi kunci?',null,'# kebutuhan: dua arah, latensi rendah','text','["WebSocket (mis. Socket.io) untuk kanal dua arah persisten","REST dengan GET berkala tiap 100 ms","localStorage untuk saling bertukar pesan antarpengguna"]'::jsonb,null,0,'WebSocket menyediakan kanal dua arah; polling boros dan lambat; localStorage tidak lintas perangkat/pengguna.',null,'Satu arah atau dua arah?',null),
('frontend','guess','Mitigasi UTAMA untuk kasus ini?
Setelah login, /login?next=https://evil.example mengarahkan pengguna ke situs lain yang tampak resmi.',null,'# keamanan aplikasi web','text','["Validasi tujuan redirect dengan allowlist atau hanya path relatif","Hindari shell: pakai API/argumen terpisah (subprocess dengan list) dan validasi input","SameSite pada cookie sesi dan token CSRF anti-pemalsuan"]'::jsonb,null,0,'Mitigasi yang tepat untuk Open Redirect: Validasi tujuan redirect dengan allowlist atau hanya path relatif.',null,'Akar masalahnya: Open Redirect.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; opacity: .9; }
.c1 { position: absolute; z-index: auto; }
.p2 { position: relative; isolation: isolate; }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["A (di atas B)","B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=0 (seri → yang belakangan di DOM menang).',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Lebar (px) elemen pada viewport 414px?',null,'.hero { width: clamp(200px, 60vw, 600px); }','css','["600","200","248.4"]'::jsonb,null,2,'60vw = 248.4px, lalu dibatasi [200, 600] → 248.4px.',null,'clamp(min, ideal, max).',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(2);
  function klik() {
    setN((p) => p + 5);
    setN(n + 2);
    setN(30);
    setN(n + 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["32","11","4"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=2 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 2 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 4.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 1; i < 4; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["4,6,8","8,8,8","2,4,6"]'::jsonb,null,2,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Berapa lebar akhir (px) item .i1?',null,'.baris { display: flex; width: 800px; gap: 20px; }
.i1 { flex: 1 0 100px; min-width: 0; }
.i2 { flex: 0 1 300px; min-width: 0; }
.i3 { flex: 3 2 100px; min-width: 0; }','css','["175","165","186.67"]'::jsonb,null,1,'Ruang sisa = 800 − gap 40 − Σbasis = 260px dibagi menurut flex-grow (Σ=4) → 165px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan tooling/framework CSS?',null,'1. Bootstrap
2. PostCSS
3. Rollup
4. Tailwind CSS
5. Next.js','text','["1, 2, 3","1, 4, 5","1, 2, 4"]'::jsonb,null,2,'Bootstrap, Tailwind CSS, PostCSS adalah tooling/framework CSS; Rollup dan Next.js termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Berapa lebar kolom ke-1 (px)?',null,'.grid {
  display: grid;
  width: 960px;
  gap: 0 20px;
  grid-template-columns: 3fr 3fr 160px 200px;
}','css','["300","270","480"]'::jsonb,null,1,'Ruang untuk fr = 960 − gap 60 − track px 360 = 540px dibagi 6 fr → 1fr = 90px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(NaN * 5);
console.log(null >= 0);
console.log([,].length);','javascript','["NaN | true | 1","0 | true | 1","NaN | false | 1"]'::jsonb,null,0,'Hasil nyata: NaN | true | 1. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 901px?',null,'.grid { gap: 16px; }
@media (min-width: 768px) and (max-width: 900px) { .grid { gap: 4px; } }
@media (min-width: 768px) { .grid { gap: 8px; } }
@media (max-width: 900px) { .grid { gap: 12px; } }','css','["16","12","8"]'::jsonb,null,2,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
$ git revert --no-edit HEAD','bash','["status: f.txt ter-staging | commit: 2 | isi f.txt: v1","status: f.txt ter-staging | commit: 1 | isi f.txt: v2","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: v2"]'::jsonb,null,0,'Dijalankan di repositori nyata: status: f.txt ter-staging | commit: 2 | isi f.txt: v1. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", () => log("B"));
tengah.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"));
luar.addEventListener("click", () => log("E"), true);','javascript','["E A C B D","A B C D E","B D A C E"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: E A C B D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Klik tombol ini dalam <form> menyebabkan apa?',null,'<form onsubmit="kirim()">
  <button onclick="tampilkanKamus()">Kamus</button>
</form>','html','["Hanya tampilkanKamus() berjalan karena handler onclick mencegah pengiriman form","Form ikut ter-submit karena <button> tanpa type bertipe submit secara default","Tombol tidak berfungsi sama sekali jika tidak diberi atribut type yang eksplisit"]'::jsonb,null,1,'Default type tombol dalam form adalah submit. Tulis type="button" untuk tombol non-submit.',null,'Apa tipe default <button>?',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_visibility { to { visibility: … } }
@keyframes k_margin_left { to { margin-left: … } }
@keyframes k_transform { to { transform: … } }','css','["margin-left < visibility < transform","transform < visibility < margin-left","visibility < transform < margin-left"]'::jsonb,null,1,'transform hanya perlu compositing (di GPU, tanpa layout/paint), visibility memicu paint ulang, margin-left memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":5,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{\"a\":6,\"b\":[2,3],\"c\":{\"d\":null}}","{\"a\":7,\"b\":[2,3],\"c\":{\"d\":undefined}}","{''a'':6,''b'':[2,3],''c'':{''d'':null}}"]'::jsonb,null,0,'Hasil: {"a":6,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','output','Apa output kode ini?',null,'Promise.resolve(5)
  .then((v) => { throw new Error("e" + v); })
  .then(() => console.log("A"))
  .catch((e) => e.message)
  .then((m) => console.log("B", m));','javascript','["B e5","undefined","B e6"]'::jsonb,null,0,'Dijalankan: B e5.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'.kolom { display: flex; flex-direction: column; }
.x { margin-bottom: 16px; }
.y { margin-top: 20px; }','css','["16","36","20"]'::jsonb,null,1,'Item flex membentuk konteks baru; margin TIDAK menyatu. Jaraknya 16 + (20) = 36px.',null,'Apakah margin item flex bisa collapse?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah baris 1 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 0, 31));
d.setUTCMonth(1);
console.log(d.toISOString().slice(0, 10));','javascript','["2024-02-31","2024-03-01","2024-03-02"]'::jsonb,null,2,'Hasil: 2024-03-02. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 60vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-640.jpg","foto-1280.jpg","foto-2000.jpg"]'::jsonb,null,1,'Slot = 60vw × 1024 = 614px CSS; × DPR 2 = 1229px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'function skor() { return 34; }
var skor;
console.log(typeof skor, skor());','javascript','["undefined function","function number","function 34"]'::jsonb,null,2,'Deklarasi function diangkat penuh; ''var v;'' tanpa nilai tidak menimpa. Hasilnya function lalu nilai kembaliannya.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
:first-child { color: biru; }
.wrap :is(.a, .b) { color: oranye; }
main :not(#zzz).a { color: merah; }','html','["biru","oranye","merah"]'::jsonb,null,2,':first-child: (0,1,0) → biru; .wrap :is(.a, .b): (0,2,0) → oranye; main :not(#zzz).a: (1,1,1) → merah. Pemenang: merah. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Judul harus 32px di laptop, 24px di HP, dan berubah mulus di antaranya tanpa breakpoint. Solusi CSS yang paling tepat?',null,'h1 { font-size: ???; }','css','["font-size: calc(32px - 100vw)","font-size: clamp(1.5rem, 1rem + 2vw, 2rem)","@media (max-width: 600px) { h1 { font-size: 24px } }"]'::jsonb,null,1,'clamp() membatasi nilai cair antara minimum dan maksimum; media query menghasilkan lompatan, bukan transisi mulus.',null,'Mana yang menghasilkan nilai cair berbatas?',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 6) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(0)), JSON.stringify(f("")));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\",\"c\":0}","{\"a\":\"dflt\",\"b\":0} {\"a\":\"dflt\",\"b\":\"\",\"c\":0}","{\"a\":0,\"b\":\"dflt\"} {\"a\":\"\",\"b\":\"dflt\",\"c\":0}"]'::jsonb,null,2,'Hasil: {"a":0,"b":"dflt"} {"a":"","b":"dflt","c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.0.4" }
// versi yang tersedia di registry:
1.0.4  1.0.5  1.0.6  1.1.7  1.2.5  2.0.4  2.0.6  2.2.7','json','["1.0.6","1.2.5","2.2.7"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.2.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
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
  }, [id]);
  return <Anak id={id} />;
}
// 1) mount  2) setId(2)','javascript','["C+1 P+1 C-1 C+2 P-1 P+2","P+1 C+1 P-1 C-1 P+2 C+2","C+1 P+1 C-1 P-1 C+2 P+2"]'::jsonb,null,2,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 1.5em; }
.b { font-size: 1.25em; padding-left: 1em; }
/* <div class="a"><div class="b">…</div></div> */','css','["10","18.75","15"]'::jsonb,null,1,'font-size .a = 10×1.5 = 15px; .b = 15×1.25 = 18.75px; em pada padding memakai font-size elemen itu sendiri → 1×18.75 = 18.75px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 0; i < 4; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["40,40,40,40","0,10,20,30","10,20,30,40"]'::jsonb,null,1,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="api.js"></script>
  <script defer src="map.js"></script>
  <script defer src="chart.js"></script>
  <script defer src="util.js"></script>
  <script src="ui.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["ui.js → util.js → chart.js → map.js → api.js","api.js → map.js → chart.js → util.js → ui.js","ui.js → api.js → map.js → chart.js → util.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → api.js → map.js → chart.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 800px; display: flex; gap: 32px; }
.kartu { flex: 0 0 calc((100% - 96px) / 4); }','css','["176","200","192"]'::jsonb,null,0,'(800 − 96) / 4 = 176px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','guess','Mengapa .modal tetap di bawah .banner padahal z-index-nya jauh lebih besar?',null,'.banner { position: relative; z-index: 1; }
.modal  { z-index: 9999; }  /* static */','css','["z-index maksimum yang diizinkan adalah 100","z-index tidak berlaku pada elemen static",".banner otomatis selalu di atas semua elemen"]'::jsonb,null,1,'z-index hanya bekerja pada elemen yang diposisikan (relative/absolute/fixed/sticky) atau item flex/grid.',null,'Syarat agar z-index berlaku?',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof harga);
  let harga = 71;
} catch (e) { console.log(e.name); }','javascript','["ReferenceError","TypeError","71"]'::jsonb,null,0,'let ada di TDZ sebelum deklarasi; typeof pun melempar ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([] + {});
console.log("b" + "a" + +"a" + "a");
console.log("10" > "9");','javascript','["[object Object] | baNaNa | false","[object Object] | 0 | false","true | baNaNa | false"]'::jsonb,null,0,'Hasil nyata: [object Object] | baNaNa | false. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. Cypress
2. Testing Library
3. Eloquent
4. Playwright
5. REST','text','["1, 3, 5","1, 2, 4","1, 3, 4"]'::jsonb,null,1,'Cypress, Playwright, Testing Library adalah alat uji end-to-end/komponen di browser; REST dan Eloquent termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 76, get: () => this.n };
}
const o = buat.call({ n: 145 });
console.log(o.get(), o.n);','javascript','["145 76","76 undefined","76 TypeError"]'::jsonb,null,0,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 0, 29));
d.setUTCMonth(1);
console.log(d.toISOString().slice(0, 10));','javascript','["2024-02-29","2024-03-05","2024-03-01"]'::jsonb,null,0,'Hasil: 2024-02-29. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: border-box;
  width: 240px;
  padding: 0 18px;
  border: 8px solid;
  margin: 0 12px;
}','css','["300","292","264"]'::jsonb,null,2,'border-box: width sudah mencakup padding & border → 240 + 2×12 margin = 264.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(3);
  function klik() {
    setN(26);
    setN((p) => p + 2);
    setN(n + 1);
    setN((p) => p + 5);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","4","34"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=3 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 3 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 9.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 768px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-2000.jpg","foto-320.jpg"]'::jsonb,null,0,'Slot = 40vw × 768 = 307px CSS; × DPR 3 = 922px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(8);
const q = Object.create(p);
q.n = 13;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["true false 8","8 false true","false 8 true"]'::jsonb,null,1,'Hasil: 8 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Jenis kerentanan/serangan apa ini?',null,'Setelah login, /login?next=https://evil.example mengarahkan pengguna ke situs lain yang tampak resmi.','text','["SQL Injection","Stored XSS","Open Redirect"]'::jsonb,null,2,'Open Redirect: Validasi tujuan redirect dengan allowlist atau hanya path relatif.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
# lalu f.txt diedit dan BELUM di-commit: isinya "wip"
$ git reset --mixed HEAD~1','bash','["status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip","status: bersih | commit: 1 | isi f.txt: v1"]'::jsonb,null,1,'Dijalankan di repositori nyata: status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 34], e: null }));','javascript','["{\"c\":null,\"d\":[null,34],\"e\":null}","{\"c\":undefined,\"d\":[null,35],\"e\":null}","{''c'':null,''d'':[null,34],''e'':null}"]'::jsonb,null,0,'Hasil: {"c":null,"d":[null,34],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_font_size { to { font-size: … } }
@keyframes k_border_radius { to { border-radius: … } }
@keyframes k_opacity { to { opacity: … } }','css','["opacity < border-radius < font-size","font-size < border-radius < opacity","border-radius < opacity < font-size"]'::jsonb,null,0,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), border-radius memicu paint ulang, font-size memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { return "t9"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["fin | t10","t9 | fin","fin | t9"]'::jsonb,null,2,'Dijalankan: fin | t9.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Berapa lebar akhir (px) item .i1?',null,'.baris { display: flex; width: 1000px; gap: 0px; }
.i1 { flex: 0 3 100px; min-width: 0; }
.i2 { flex: 1 2 200px; min-width: 0; }
.i3 { flex: 2 0 250px; min-width: 0; }','css','["181.82","250","100"]'::jsonb,null,2,'Ruang sisa = 1000 − gap 0 − Σbasis = 450px dibagi menurut flex-grow (Σ=3) → 100px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; opacity: .9; }
.c1 { position: absolute; z-index: 757; }
.p2 { position: relative; opacity: .9; }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,0,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=0, B=0 (seri → yang belakangan di DOM menang).',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
:is(.a, #kartu):not(#zzz) { color: merah !important; }
[data-x] { color: ungu !important; }
.wrap :is(.a, .b)#kartu { color: hijau !important; }
.wrap :where(#kartu, .a):not(#zzz):is(.a, .b) { color: biru !important; }','html','["ungu","hijau","merah"]'::jsonb,null,2,':is(.a, #kartu):not(#zzz): (2,0,0) !important → merah; [data-x]: (0,1,0) !important → ungu; .wrap :is(.a, .b)#kartu: (1,2,0) !important → hijau; .wrap :where(#kartu, .a):not(#zzz):is(.a, .b): (1,2,0) !important → biru. Pemenang: merah. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
luar.addEventListener("click", () => log("B"));
tengah.addEventListener("click", (e) => { log("C"); e.stopPropagation(); });
tombol.addEventListener("click", () => log("D"));','javascript','["D C","A D C","A C D"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A D C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output kode ini?',null,'const a = [67,106,49,73];
a.sort();
console.log(a.join(","));','javascript','["73,67,49,106","106,49,67,73","107,49,67,73"]'::jsonb,null,1,'Dijalankan langsung: 106,49,67,73.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?',null,'.kolom { display: flex; flex-direction: column; }
.x { margin-bottom: 10px; }
.y { margin-top: 12px; }','css','["12","22","10"]'::jsonb,null,1,'Item flex membentuk konteks baru; margin TIDAK menyatu. Jaraknya 10 + (12) = 22px.',null,'Apakah margin item flex bisa collapse?',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1000px?',null,'.grid { gap: 16px; }
@media (min-width: 480px) and (max-width: 768px) { .grid { gap: 12px; } }
@media (min-width: 480px) { .grid { gap: 8px; } }
@media (max-width: 768px) { .grid { gap: 32px; } }','css','["8","32","16"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("H"));
});
Promise.resolve().then(() => console.log("C"));
setTimeout(() => {
  console.log("E");
  Promise.resolve().then(() => console.log("B"));
}, 0);
(async () => {
  console.log("D");
  await null;
  console.log("A");
})();
console.log("undefined");','javascript','["D undefined F C A H E B","F H C E B D A","D undefined F C A E H B"]'::jsonb,null,0,'Urutan nyata: D undefined F C A H E B. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Berapa lebar kolom ke-4 (px)?',null,'.grid {
  display: grid;
  width: 800px;
  gap: 0 20px;
  grid-template-columns: 1fr 1fr 200px 3fr;
}','css','["324","360","480"]'::jsonb,null,0,'Ruang untuk fr = 800 − gap 60 − track px 200 = 540px dibagi 5 fr → 1fr = 108px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 15), ok("B", 5), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"fC\"]","ok \"B\"","ok [\"A\",\"B\",\"C\"]"]'::jsonb,null,1,'Promise.any menghasilkan: ok "B". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 8 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 15], e: null }));','javascript','["{\"c\":undefined,\"d\":[null,16],\"e\":null}","{\"c\":null,\"d\":[null,15],\"e\":null}","{''c'':null,''d'':[null,15],''e'':null}"]'::jsonb,null,1,'Hasil: {"c":null,"d":[null,15],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_outline_color { to { outline-color: … } }
@keyframes k_opacity { to { opacity: … } }
@keyframes k_top { to { top: … } }','css','["top < outline-color < opacity","opacity < outline-color < top","outline-color < opacity < top"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), outline-color memicu paint ulang, top memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'function P(n) { this.n = n; }
P.prototype.get = function () { return this.n; };
const p = new P(6);
const q = Object.create(p);
q.n = 11;
delete q.n;
console.log(q.get(), q.hasOwnProperty("n"), "get" in q);','javascript','["6 false true","7 false true","6 false false"]'::jsonb,null,0,'Hasil: 6 false true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 62.5%; }
.a { font-size: 200%; }
.b { font-size: 1.25em; padding-left: 3em; }
/* <div class="a"><div class="b">…</div></div> */','css','["75","30","60"]'::jsonb,null,0,'font-size .a = 10×2 = 20px; .b = 20×1.25 = 25px; em pada padding memakai font-size elemen itu sendiri → 3×25 = 75px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 1200px;
  gap: 0 0px;
  grid-template-columns: 160px 2fr 3fr 120px;
}','css','["300","720","552"]'::jsonb,null,2,'Ruang untuk fr = 1200 − gap 0 − track px 280 = 920px dibagi 5 fr → 1fr = 184px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?',null,'.kotak {
  box-sizing: border-box;
  width: 360px;
  padding: 0 24px;
  border: 2px solid;
  margin: 0 24px;
}','css','["408","456","412"]'::jsonb,null,0,'border-box: width sudah mencakup padding & border → 360 + 2×24 margin = 408.',null,'Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 600px; gap: 10px; }
.i1 { flex: 0 1 150px; min-width: 0; }
.i2 { flex: 1 1 250px; min-width: 0; }
.i3 { flex: 0 3 100px; min-width: 0; }','css','["350","276.67","330"]'::jsonb,null,2,'Ruang sisa = 600 − gap 20 − Σbasis = 80px dibagi menurut flex-grow (Σ=1) → 330px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 8) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(null)), JSON.stringify(f(0)));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":0,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":0}","{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}"]'::jsonb,null,0,'Hasil: {"a":"dflt","b":"dflt"} {"a":0,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Setelah 5 detik berjalan, angka yang tampil adalah?',null,'const [n, setN] = useState(0);
useEffect(() => {
  const id = setInterval(() => setN(n + 1), 1000);
  return () => clearInterval(id);
}, []);
return <p>{n}</p>;','javascript','["1 — closure interval menangkap n = 0 dari render pertama, jadi selalu mengeset 1","0 — closure menangkap n = 0 dan tidak pernah memicu pembaruan state apa pun","5 — interval berjalan lima kali dan setiap tick menambah n dari nilai terbarunya"]'::jsonb,null,0,'Dependensi [] membuat efek (dan closure n=0) hanya dibuat sekali. Gunakan setN((p) => p + 1) atau pasang n di dependensi.',null,'Nilai n yang mana yang dilihat callback interval?',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("C");
  Promise.resolve().then(() => console.log("D"));
}, 0);
setTimeout(() => console.log("H"), 0);
setTimeout(() => console.log("F"), 0);
setTimeout(() => {
  console.log("A");
  Promise.resolve().then(() => console.log("undefined"));
}, 0);','javascript','["C D H F A undefined","C D F H A undefined","C D H F A"]'::jsonb,null,0,'Urutan nyata: C D H F A undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 31,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["105","228","31"]'::jsonb,null,2,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 1000px?',null,'.grid { gap: 16px; }
@media (min-width: 480px) { .grid { gap: 24px; } }
@media (min-width: 480px) and (max-width: 768px) { .grid { gap: 32px; } }
@media (max-width: 768px) { .grid { gap: 12px; } }','css','["16","24","12"]'::jsonb,null,1,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 24px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.3.0" }
// versi yang tersedia di registry:
3.3.0  3.3.3  3.4.0  3.5.1  3.5.2  4.3.2  4.5.3','json','["3.5.2","4.5.3","3.3.3"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.3.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log([[]] == undefined);
console.log([..."ab"].length + "ab".length);
console.log([2] * [3]);','javascript','["false | 4 | 6","false | NaN | 6","true | 4 | 6"]'::jsonb,null,0,'Hasil nyata: false | 4 | 6. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof kuota);
  let kuota = 79;
} catch (e) { console.log(e.name); }','javascript','["ReferenceError","79","TypeError"]'::jsonb,null,0,'let ada di TDZ sebelum deklarasi; typeof pun melempar ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  .wrap :not(.zzz)[data-x] { color: hijau; }
}
:where(#kartu, .a):not(.zzz) { color: kuning; }
:is(.a, .b) { color: oranye !important; }
main #kartu { color: biru; }','html','["hijau","oranye","kuning"]'::jsonb,null,1,'.wrap :not(.zzz)[data-x]: (0,3,0) [@layer] → hijau; :where(#kartu, .a):not(.zzz): (0,1,0) → kuning; :is(.a, .b): (0,1,0) !important → oranye; main #kartu: (1,0,1) → biru. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 1; i < 5; i++) {
  fns.push(() => i * 1);
}
console.log(fns.map((f) => f()).join(","));','javascript','["5,5,5,5","1,2,3,4","2,3,4,5"]'::jsonb,null,0,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 5, jadi semua closure menghasilkan 5.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"));','javascript','["D A C B","A B C D","B C D A"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B C D A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Dari daftar ini, nomor mana yang BUKAN tooling/framework CSS?',null,'1. Bootstrap
2. Next.js
3. Prisma
4. Tailwind CSS
5. Sass','text','["2 dan 3 dan 5","2 dan 3","2 dan 3 dan 4"]'::jsonb,null,1,'Prisma dan Next.js termasuk kategori lain; Bootstrap, Sass, Tailwind CSS adalah tooling/framework CSS.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 768px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-1600.jpg","foto-800.jpg"]'::jsonb,null,2,'Slot = 50vw × 768 = 384px CSS; × DPR 2 = 768px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c2"; } finally { return "f47"; }
}
console.log(f());','javascript','["f47","undefined","f48"]'::jsonb,null,0,'Dijalankan: f47.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','guess','Mitigasi UTAMA untuk kasus ini?
Kode klien: el.innerHTML = location.hash.slice(1) — payload di fragmen URL dieksekusi tanpa lewat server.',null,'# keamanan aplikasi web','text','["Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor","Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types","Allowlist tujuan, blokir alamat internal/metadata, dan jangan ikuti redirect ke jaringan privat"]'::jsonb,null,1,'Mitigasi yang tepat untuk DOM-based XSS: Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types.',null,'Akar masalahnya: DOM-based XSS.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([ok("A", 5), bad("B", 10), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err B","ok \"A\"","ok [\"fA\",\"rB\",\"fC\"]"]'::jsonb,null,0,'Promise.all menghasilkan: err B. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 24px; }
.anak  { margin-top: 20px; }','css','["44","24","51"]'::jsonb,null,1,'Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(24, 20) = 24px.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
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
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["P+1 C+1 P-1 C-1 P+2 C+2 P-2 P+2","C+1 P+1 C-1 P-1 C+2 P+2 P-2 P+2","C+1 P+1 C-1 C+2 P-1 P+2 P-2 P+2"]'::jsonb,null,1,'Hasil: C+1 P+1 C-1 P-1 C+2 P+2 P-2 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Dalam pengembangan, ''refactoring'' yang benar berarti?',null,'# praktik rekayasa perangkat lunak','text','["Menambah fitur baru sambil merapikan kode","Menstrukturkan ulang kode internal tanpa mengubah perilaku yang teramati","Menulis ulang seluruh aplikasi dengan bahasa baru dari nol"]'::jsonb,null,1,'Refactoring menjaga perilaku tetap sama; tes menjadi jaring pengaman. Menambah fitur atau menulis ulang total bukan refactoring.',null,'Apa yang tidak boleh berubah?',null),
('frontend','output','Apa output kode ini?',null,'console.log(["83","52","49","8"].map(parseInt).join(","));','javascript','["NaN,NaN,NaN,83","84,NaN,NaN,NaN","83,NaN,NaN,NaN"]'::jsonb,null,2,'Dijalankan langsung: 83,NaN,NaN,NaN.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="app.js"></script>
  <script type="module" src="chart.js"></script>
  <script src="util.js"></script>
  <script type="module" src="api.js"></script>
  <script type="module" src="map.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["app.js → chart.js → util.js → api.js → map.js","app.js → chart.js → api.js → map.js → util.js","util.js → app.js → chart.js → api.js → map.js"]'::jsonb,null,2,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: util.js → app.js → chart.js → api.js → map.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Lebar (px) elemen pada viewport 1280px?',null,'.hero { width: clamp(320px, 40vw, 600px); }','css','["320","512","600"]'::jsonb,null,1,'40vw = 512px, lalu dibatasi [320, 600] → 512px.',null,'clamp(min, ideal, max).',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2024, 0, 30));
d.setUTCMonth(1);
console.log(d.toISOString().slice(0, 10));','javascript','["2024-03-01","2024-02-30","2024-03-06"]'::jsonb,null,0,'Hasil: 2024-03-01. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2024 punya 29 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
# lalu f.txt diedit dan BELUM di-commit: isinya "wip"
$ git reset --hard HEAD~1','bash','["status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip","status: bersih | commit: 1 | isi f.txt: v1","status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip"]'::jsonb,null,1,'Dijalankan di repositori nyata: status: bersih | commit: 1 | isi f.txt: v1. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; }
.c1 { position: absolute; z-index: 771; }
.p2 { position: relative; z-index: 8; }
.c2 { position: absolute; z-index: 269; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=771, B=8.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(5);
  function klik() {
    setN((p) => p * 3);
    setN(n + 1);
    setN(n + 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","20","10"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=5 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 5 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 9.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  x = (console.log("A.field"), 9);
  constructor() { console.log("A.ctor"); this.init(); }
  init() { console.log("A.init"); }
}
class B extends A {
  y = (console.log("B.field"), 10);
  constructor() { super(); console.log("B.ctor", this.y); }
  init() { console.log("B.init", this.y); }
}
new B();','javascript','["B.ctor 10 | B.field | B.init undefined | A.ctor | A.field","A.field | A.ctor | B.init undefined | B.field | B.ctor 10","A.field | A.ctor | B.init 10 | B.field | B.ctor 10"]'::jsonb,null,1,'Hasil: A.field | A.ctor | B.init undefined | B.field | B.ctor 10. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
# lalu f.txt diedit dan BELUM di-commit: isinya "wip"
$ git revert --no-edit HEAD','bash','["status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip","status: f.txt berubah, belum di-staging | commit: 2 | isi f.txt: wip","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip"]'::jsonb,null,1,'Dijalankan di repositori nyata: status: f.txt berubah, belum di-staging | commit: 2 | isi f.txt: wip. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan bundler/build tool?',null,'1. Parcel
2. esbuild
3. React
4. Nginx
5. Vite','text','["1, 2, 5","1, 3, 5","2, 4, 5"]'::jsonb,null,0,'esbuild, Parcel, Vite adalah bundler/build tool; React dan Nginx termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','output','Apa output kode ini?',null,'function stok() { return 85; }
var stok;
console.log(typeof stok, stok());','javascript','["function 85","function number","undefined number"]'::jsonb,null,0,'Deklarasi function diangkat penuh; ''var v;'' tanpa nilai tidak menimpa. Hasilnya function lalu nilai kembaliannya.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 1; }
.c1 { position: absolute; z-index: 149; }
.p2 { position: relative; }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","Tidak bisa ditentukan tanpa ukuran elemen","A (di atas B)"]'::jsonb,null,2,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=1, B=0.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 0.5em; }
.b { font-size: 1.5em; padding-left: 1em; }
/* <div class="a"><div class="b">…</div></div> */','css','["20","15","10"]'::jsonb,null,1,'font-size .a = 20×0.5 = 10px; .b = 10×1.5 = 15px; em pada padding memakai font-size elemen itu sendiri → 1×15 = 15px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 15), ok("B", 10), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"B\"","ok [\"rA\",\"fB\",\"rC\"]","err C"]'::jsonb,null,2,'Promise.all menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r2"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["sync | c r2 | f | end","end | f | c r2 | sync","sync | c r3 | f | end"]'::jsonb,null,0,'Dijalankan: sync | c r2 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 8) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(false)), JSON.stringify(f(undefined)));','javascript','["{\"a\":false,\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":false,\"b\":\"dflt\"} {\"a\":8,\"b\":8}","{\"a\":\"dflt\",\"b\":false} {\"a\":8,\"b\":8}"]'::jsonb,null,1,'Hasil: {"a":false,"b":"dflt"} {"a":8,"b":8}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x style="color: kuning">Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  .a:is(.a, #kartu).b { color: merah; }
}
p[data-x].b { color: hijau; }
p#kartu:is(.a, #kartu) { color: ungu; }
main p#kartu[data-x] { color: kuning; }','html','["merah","kuning","hijau"]'::jsonb,null,1,'.a:is(.a, #kartu).b: (1,2,0) [@layer] → merah; p[data-x].b: (0,2,1) → hijau; p#kartu:is(.a, #kartu): (2,0,1) → ungu; main p#kartu[data-x]: (1,1,2) → kuning; style inline: (0,0,0) → kuning. Pemenang: kuning. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Apa efek pemanggilan ini pada state komponen?',null,'function urutkan() {
  daftar.sort((a, b) => a - b);
  setDaftar(daftar);
}','javascript','["Array diurutkan di tempat","Render ulang dengan array terurut","sort() mengembalikan salinan sehingga state tidak berubah"]'::jsonb,null,0,'Array.prototype.sort memutasi array asal dan mengembalikan referensi yang sama. Salin dulu: [...daftar].sort(...).',null,'Apakah sort() membuat array baru?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", (e) => { log("B"); e.stopPropagation(); });
luar.addEventListener("click", () => log("C"), true);
luar.addEventListener("click", () => log("D"), true);
tombol.addEventListener("click", () => log("E"), true);','javascript','["A C D E B","A B C D E","B E"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A C D E B.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','guess','Mitigasi UTAMA untuk kasus ini?
Tautan /cari?q=<script>…</script> membuat halaman memantulkan input itu ke HTML tanpa menyimpannya.',null,'# keamanan aplikasi web','text','["Escape output sesuai konteks dan validasi input; CSP sebagai lapis tambahan","Periksa kepemilikan/otorisasi di server pada setiap akses objek","Allowlist origin eksplisit; jangan memantulkan origin sembarang bersama credentials"]'::jsonb,null,0,'Mitigasi yang tepat untuk Reflected XSS: Escape output sesuai konteks dan validasi input; CSP sebagai lapis tambahan.',null,'Akar masalahnya: Reflected XSS.',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 768px?',null,'.grid { gap: 4px; }
@media (min-width: 600px) and (max-width: 768px) { .grid { gap: 12px; } }
@media (max-width: 768px) { .grid { gap: 8px; } }
@media (min-width: 600px) { .grid { gap: 24px; } }','css','["24","4","8"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 24px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="api.js"></script>
  <script defer src="map.js"></script>
  <script src="ui.js"></script>
  <script defer src="app.js"></script>
  <script type="module" src="chart.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["api.js → map.js → app.js → chart.js → ui.js","ui.js → api.js → map.js → app.js → chart.js","api.js → map.js → ui.js → app.js → chart.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ui.js → api.js → map.js → app.js → chart.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','output','Apa output kode ini?',null,'const d = new Date(Date.UTC(2023, 3, 0));
console.log(d.getUTCDate(), d.getUTCMonth());','javascript','["0 8","18 11","31 2"]'::jsonb,null,2,'Hasil: 31 2. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2023 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Berapa lebar kolom ke-3 (px)?',null,'.grid {
  display: grid;
  width: 1200px;
  gap: 0 20px;
  grid-template-columns: 120px 120px 3fr 1fr;
}','css','["900","675","720"]'::jsonb,null,1,'Ruang untuk fr = 1200 − gap 60 − track px 240 = 900px dibagi 4 fr → 1fr = 225px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.1.0" }
// versi yang tersedia di registry:
1.1.0  1.1.1  1.3.1  1.3.3  2.1.0  2.1.1  2.1.2  2.2.3','json','["1.1.1","2.2.3","1.3.3"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.3.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: content-box;
  width: 400px;
  padding: 3px 6px;
  border: 2px solid;
}','css','["416","392","400"]'::jsonb,null,2,'content-box: konten = 400 (width = konten).',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','guess','Berapa lebar akhir (px) item .i1?',null,'.baris { display: flex; width: 800px; gap: 20px; }
.i1 { flex: 2 0 100px; min-width: 0; }
.i2 { flex: 0 2 300px; min-width: 0; }
.i3 { flex: 0 2 250px; min-width: 0; }','css','["136.67","250","210"]'::jsonb,null,2,'Ruang sisa = 800 − gap 40 − Σbasis = 110px dibagi menurut flex-grow (Σ=2) → 210px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 7], e: null }));','javascript','["{\"c\":null,\"d\":[null,7],\"e\":null}","{\"c\":undefined,\"d\":[null,8],\"e\":null}","{''c'':null,''d'':[null,7],''e'':null}"]'::jsonb,null,0,'Hasil: {"c":null,"d":[null,7],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_opacity { to { opacity: … } }
@keyframes k_background_color { to { background-color: … } }
@keyframes k_padding { to { padding: … } }','css','["background-color < opacity < padding","padding < background-color < opacity","opacity < background-color < padding"]'::jsonb,null,2,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), background-color memicu paint ulang, padding memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 2; i < 6; i++) {
  fns.push(() => i * 2);
}
console.log(fns.map((f) => f()).join(","));','javascript','["6,8,10,12","12,12,12,12","4,6,8,10"]'::jsonb,null,1,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 6, jadi semua closure menghasilkan 12.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 8, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["ReferenceError","TypeError","undefined"]'::jsonb,null,1,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(9);
  function klik() {
    setN(18);
    setN(n + 4);
    setN((p) => p * 3);
    setN(n + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["12","16","69"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=9 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 9 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 12.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 10px; padding-top: 5px; }
.anak  { margin-top: 30px; }','css','["30","40","45"]'::jsonb,null,2,'Padding memisahkan margin induk dan anak, jadi tidak collapse: 10 + 5 + 30 = 45.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
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
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["P+1 C+1 C-1 C+2","C+2 C-1 P+1 C+1","C+1 P+1 C-1 C+2"]'::jsonb,null,2,'Hasil: C+1 P+1 C-1 C+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Lebar (px) satu kartu?',null,'.baris { width: 1000px; display: flex; gap: 16px; }
.kartu { flex: 0 0 calc((100% - 16px) / 2); }','css','["500","492","484"]'::jsonb,null,1,'(1000 − 16) / 2 = 492px.',null,'100% mengacu ke lebar kontainer .baris.',null),
('frontend','output','Apa output kode ini?',null,'const x = [42,75,19];
x.length = 1;
x[3] = 0;
console.log(x.length, JSON.stringify(x));','javascript','["5 [42,null,null,0]","4 [42,null,null,0]","0],null,null,4 [42"]'::jsonb,null,1,'Dijalankan langsung: 4 [42,null,null,0].',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 60vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-1024.jpg","foto-800.jpg"]'::jsonb,null,2,'Slot = 100vw × 360 = 360px CSS; × DPR 2 = 720px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("B");
  Promise.resolve().then(() => console.log("G"));
}, 0);
(async () => {
  console.log("C");
  await null;
  console.log("H");
})();
Promise.resolve().then(() => {
  console.log("A");
  queueMicrotask(() => console.log("E"));
});
Promise.resolve().then(() => console.log("undefined"));','javascript','["C H A undefined E B G","B G C H A E","C H A undefined E G B"]'::jsonb,null,0,'Urutan nyata: C H A undefined E B G. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(-0 === 0);
console.log(typeof null);
console.log(true + true);','javascript','["false | object | 2","true | object | 2","true | 5 | 2"]'::jsonb,null,1,'Hasil nyata: true | object | 2. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','guess','Toko online butuh halaman produk yang diindeks mesin pencari, cepat dimuat pertama kali, dan stoknya harus segar. Pendekatan paling seimbang?',null,'# kebutuhan: SEO + kesegaran data','text','["SSR atau ISR (HTML dirender di server/edge, stok diambil saat render atau divalidasi ulang berkala)","CSR murni; data diambil setelah JavaScript dimuat","Halaman statis yang dibangun sekali setahun"]'::jsonb,null,0,'Perayap butuh HTML berisi konten; data stok yang berubah menuntut render dinamis atau revalidasi periodik.',null,'Apa yang dilihat perayap pada CSR murni?',null),
('frontend','output','Apa output kode ini?',null,'console.log(["102","69","89","33","17","41"].map(parseInt).join(","));','javascript','["21,1,NaN,NaN,NaN,102","103,NaN,NaN,NaN,1,21","102,NaN,NaN,NaN,1,21"]'::jsonb,null,2,'Dijalankan langsung: 102,NaN,NaN,NaN,1,21.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 13,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["112","277","13"]'::jsonb,null,2,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan alat uji end-to-end/komponen di browser?',null,'1. Testing Library
2. Cypress
3. Caddy
4. TypeORM
5. WebdriverIO','text','["1, 2, 4","1, 2, 5","2, 4, 5"]'::jsonb,null,1,'Cypress, Testing Library, WebdriverIO adalah alat uji end-to-end/komponen di browser; Caddy dan TypeORM termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('frontend','guess','Berapa nilai padding-left (px) yang dipakai .b?',null,'html { font-size: 125%; }
.a { font-size: 1.25em; }
.b { font-size: 2em; padding-left: 1em; }
/* <div class="a"><div class="b">…</div></div> */','css','["20","50","25"]'::jsonb,null,1,'font-size .a = 20×1.25 = 25px; .b = 25×2 = 50px; em pada padding memakai font-size elemen itu sendiri → 1×50 = 50px.',null,'em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.',null),
('frontend','guess','Berapa lebar akhir (px) item .i2?',null,'.baris { display: flex; width: 1000px; gap: 10px; }
.i1 { flex: 0 3 100px; min-width: 0; }
.i2 { flex: 3 2 200px; min-width: 0; }
.i3 { flex: 1 3 250px; min-width: 0; }','css','["343.33","537.5","522.5"]'::jsonb,null,2,'Ruang sisa = 1000 − gap 20 − Σbasis = 430px dibagi menurut flex-grow (Σ=4) → 522.5px.',null,'Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.',null),
('frontend','output','Apa output kode ini?',null,'function f() {
  try { return "t2"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["t2 | fin","fin | t3","fin | t2"]'::jsonb,null,2,'Dijalankan: fin | t2.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
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
// 1) mount  2) setId(2)','javascript','["P+2 P-1 P+1 C+1","C+1 P+1 P-1 P+2","P+1 C+1 P-1 P+2"]'::jsonb,null,1,'Hasil: C+1 P+1 P-1 P+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):',null,'/* animasi memakai salah satu properti: */
@keyframes k_font_size { to { font-size: … } }
@keyframes k_opacity { to { opacity: … } }
@keyframes k_outline_color { to { outline-color: … } }','css','["font-size < outline-color < opacity","opacity < outline-color < font-size","outline-color < opacity < font-size"]'::jsonb,null,1,'opacity hanya perlu compositing (di GPU, tanpa layout/paint), outline-color memicu paint ulang, font-size memicu layout lalu paint lalu composite — paling mahal.',null,'Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?',null),
('frontend','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 29, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{\"a\":2,\"b\":29} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":3,\"b\":29} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{''a'':2,''b'':29} [''1970-01-01T00:00:00.000Z''] ''é\\n''"]'::jsonb,null,0,'Hasil: {"a":2,"b":29} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('frontend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.3.3" }
// versi yang tersedia di registry:
2.3.3  2.3.4  2.3.6  2.4.0  2.5.0  3.3.3  3.3.6  3.5.5','json','["2.5.0","2.3.6","3.5.5"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.3.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('frontend','guess','Gambar hero dimuat tanpa dimensi dan konten di bawahnya melompat turun. Metrik Core Web Vitals mana yang memburuk?',null,'<img src="hero.jpg" alt="">
<h1>Judul</h1>','html','["LCP (Largest Contentful Paint)","CLS (Cumulative Layout Shift)","INP (Interaction to Next Paint)"]'::jsonb,null,1,'Lompatan tata letak yang tak diharapkan diukur CLS. Beri atribut width/height atau aspect-ratio agar ruang dicadangkan.',null,'Metrik mana yang mengukur pergeseran visual?',null),
('frontend','guess','Berapa lebar kolom ke-2 (px)?',null,'.grid {
  display: grid;
  width: 800px;
  gap: 0 20px;
  grid-template-columns: 2fr 1fr 120px 200px;
}','css','["140","266.67","160"]'::jsonb,null,0,'Ruang untuk fr = 800 − gap 60 − track px 320 = 420px dibagi 3 fr → 1fr = 140px.',null,'Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 7) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(NaN)), JSON.stringify(f(0)));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":\"dflt\",\"b\":\"dflt\"}","{\"a\":null,\"b\":\"dflt\"} {\"a\":0,\"b\":\"dflt\"}","{\"a\":\"dflt\",\"b\":null} {\"a\":\"dflt\",\"b\":0}"]'::jsonb,null,1,'Hasil: {"a":null,"b":"dflt"} {"a":0,"b":"dflt"}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','output','Urutan eksekusi skrip (tanpa async)?',null,'<body>
  <script defer src="auth.js"></script>
  <script src="api.js"></script>
  <script defer src="map.js"></script>
  <script src="app.js"></script>
  <script defer src="util.js"></script>
</body>
<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->','html','["auth.js → api.js → map.js → app.js → util.js","api.js → app.js → auth.js → map.js → util.js","auth.js → map.js → util.js → api.js → app.js"]'::jsonb,null,1,'Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: api.js → app.js → auth.js → map.js → util.js.',null,'Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.',null),
('frontend','guess','Berapa lebar area konten (px) elemen ini?',null,'.kotak {
  box-sizing: border-box;
  width: 300px;
  padding: 9px 17px;
  border: 4px solid;
}','css','["342","279","258"]'::jsonb,null,2,'border-box: konten = 300 − 2×17 − 2×4 = 258.',null,'Pada border-box, padding dan border memakan jatah width.',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
$ git reset --hard HEAD~1','bash','["status: f.txt ter-staging | commit: 1 | isi f.txt: v2","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: v2","status: bersih | commit: 1 | isi f.txt: v1"]'::jsonb,null,2,'Dijalankan di repositori nyata: status: bersih | commit: 1 | isi f.txt: v1. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah baris 4 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
main :is(.a, .b).a { color: oranye; }
@layer base {
  :is(.a, .b)#kartu { color: biru; }
}
.wrap p { color: merah; }','html','["oranye","biru","merah"]'::jsonb,null,0,'main :is(.a, .b).a: (0,2,1) → oranye; :is(.a, .b)#kartu: (1,1,0) [@layer] → biru; .wrap p: (0,1,1) → merah. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 40px; }
.anak  { margin-top: 40px; }','css','["85","40","80"]'::jsonb,null,1,'Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(40, 40) = 40px.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (let i = 2; i < 6; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["20,30,40,50","60,60,60,60","30,40,50,60"]'::jsonb,null,0,'let membuat binding baru untuk setiap iterasi, sehingga tiap closure menangkap nilai i miliknya sendiri.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
('frontend','guess','Lebar (px) elemen pada viewport 414px?',null,'.hero { width: clamp(280px, 40vw, 600px); }','css','["165.6","280","600"]'::jsonb,null,1,'40vw = 165.6px, lalu dibatasi [280, 600] → 280px.',null,'clamp(min, ideal, max).',null),
('frontend','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN((p) => p + 3);
    setN(n + 1);
    setN(17);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","17","12"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 17.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('frontend','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'(async () => {
  console.log("F");
  await null;
  console.log("C");
})();
queueMicrotask(() => console.log("B"));
setTimeout(() => {
  console.log("A");
  Promise.resolve().then(() => console.log("G"));
}, 0);
queueMicrotask(() => console.log("undefined"));','javascript','["F C B undefined A G","F C B A G","F C B undefined G A"]'::jsonb,null,0,'Urutan nyata: F C B undefined A G. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('frontend','guess','Elemen mana yang tampil paling atas?',null,'<div class="p1"><span class="c1">A</span></div>
<div class="p2"><span class="c2">B</span></div>

.p1 { position: relative; z-index: 9; }
.c1 { position: absolute; z-index: 954; }
.p2 { position: relative; transform: translateZ(0); }
.c2 { position: absolute; z-index: auto; }
/* A dan B bertumpang tindih secara visual */','html','["B (di atas A)","A (di atas B)","Tidak bisa ditentukan tanpa ukuran elemen"]'::jsonb,null,1,'Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=9, B=0.',null,'Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.',null),
('frontend','output','Apa output kode ini (baris dipisah |)?',null,'class A {
  static c = 0;
  constructor() { A.c++; this.id = A.c; }
  get tag() { return "A" + this.id; }
}
class B extends A { get tag() { return super.tag + "b"; } }
const x = new A(), y = new B(), z = new B();
console.log(x.tag, y.tag, z.tag, A.c, y instanceof A, Object.getPrototypeOf(B) === A);','javascript','["A1 A2b true 3 A3b true","A1 true A3b 3 A2b true","A1 A2b A3b 3 true true"]'::jsonb,null,2,'Hasil: A1 A2b A3b 3 true true. Field kelas turunan baru diinisialisasi SETELAH super() selesai, sehingga init() yang dipanggil dari ctor induk melihat y = undefined.',null,'Kapan tepatnya field kelas turunan diinisialisasi dibanding konstruktor induk?',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 60vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-1024.jpg","foto-1280.jpg"]'::jsonb,null,1,'Slot = 90vw × 360 = 324px CSS; × DPR 3 = 972px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('frontend','output','Apa output kode ini?',null,'try {
  console.log(typeof skor);
  let skor = 74;
} catch (e) { console.log(e.name); }','javascript','["TypeError","74","ReferenceError"]'::jsonb,null,2,'let ada di TDZ sebelum deklarasi; typeof pun melempar ReferenceError.',null,'Apa yang terjadi pada deklarasi var, let, function, dan class SEBELUM barisnya dieksekusi?',null),
('frontend','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", (e) => { log("A"); e.stopImmediatePropagation(); });
luar.addEventListener("click", () => log("B"));
tombol.addEventListener("click", () => log("C"));
tengah.addEventListener("click", () => log("D"), true);
tombol.addEventListener("click", () => log("E"));
tengah.addEventListener("click", () => log("F"), true);','javascript','["C E D F A","A C D E F","D F C E A"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: D F C E A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('frontend','output','Apa output tiga baris ini (urut, dipisah |)?',null,'console.log(null < []);
console.log(parseInt("0x1f"));
console.log(typeof NaN);','javascript','["false | 31 | number","false | NaN | number","true | 31 | number"]'::jsonb,null,0,'Hasil nyata: false | 31 | number. Operator + memilih penyambungan string jika salah satu operand string/objek (lewat ToPrimitive); - dan * selalu numerik; == memakai algoritma coercion abstrak sedangkan === tidak.',null,'Terapkan ToPrimitive: [] → "", {} → "[object Object]". + vs - berbeda perilakunya.',null),
('frontend','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([ok("A", 5), ok("B", 15), bad("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"rC\"]","err C","ok \"A\""]'::jsonb,null,0,'Promise.allSettled menghasilkan: ok ["fA","fB","rC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('frontend','output','Apa output kode ini?',null,'const a = Date.UTC(2023, 2, 1), b = Date.UTC(2023, 1, 1);
console.log((a - b) / 86400000);','javascript','["28","29","30"]'::jsonb,null,0,'Hasil: 28. Date melakukan overflow: tanggal yang tak ada digeser ke bulan berikutnya; hari ke-0 = hari terakhir bulan sebelumnya; Februari 2023 punya 28 hari.',null,'Overflow tanggal tidak error — ia menggeser bulan. Tahun kabisat?',null),
('frontend','guess','Fungsi utama ''feature flag'' dalam praktik CI/CD?',null,'if (flag(''checkout-baru'')) { tampilkanBaru(); }','javascript','["Mengompresi bundle","Memisahkan deploy dari rilis","Menandai fitur yang gagal di tes unit"]'::jsonb,null,1,'Flag memungkinkan peluncuran bertahap, uji A/B, dan tombol darurat (kill switch) tanpa rilis ulang.',null,'Deploy dan rilis adalah dua hal yang berbeda.',null),
('frontend','guess','Jenis kerentanan/serangan apa ini?',null,'Tautan /cari?q=<script>…</script> membuat halaman memantulkan input itu ke HTML tanpa menyimpannya.','text','["SSRF","CORS salah konfigurasi","Reflected XSS"]'::jsonb,null,2,'Reflected XSS: Escape output sesuai konteks dan validasi input; CSP sebagai lapis tambahan.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('frontend','guess','Nilai gap (px) .grid pada lebar viewport tepat 320px?',null,'.grid { gap: 4px; }
@media (max-width: 768px) { .grid { gap: 8px; } }
@media (min-width: 768px) and (max-width: 768px) { .grid { gap: 24px; } }
@media (min-width: 768px) { .grid { gap: 16px; } }','css','["8","4","16"]'::jsonb,null,0,'Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: 8px.',null,'Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.',null),
('frontend','output','Apa output kode ini?',null,'"use strict";
const o = { n: 2, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["TypeError","125","ReferenceError"]'::jsonb,null,0,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('frontend','output','Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?',null,'# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)
# lalu f.txt diedit dan BELUM di-commit: isinya "wip"
$ git stash','bash','["status: f.txt (staging + perubahan lanjutan) | commit: 1 | isi f.txt: wip","status: f.txt berubah, belum di-staging | commit: 1 | isi f.txt: wip","status: bersih | commit: 2 | isi f.txt: v2"]'::jsonb,null,2,'Dijalankan di repositori nyata: status: bersih | commit: 2 | isi f.txt: v2. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.',null,'Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?',null),
('frontend','guess','Joko membuat kasir dengan HTML + Tailwind + JavaScript murni. Data hilang setiap halaman dimuat ulang. Apa yang paling tepat ditambahkan?',null,'tambahBarang(item) { daftar.push(item); render(); }','javascript','["Mengganti Tailwind dengan Bootstrap","Framework CSS yang lebih baru","Penyimpanan persisten"]'::jsonb,null,2,'Array di memori hilang saat halaman dimuat ulang. Persistensi butuh penyimpanan di luar memori halaman: server+DB untuk data bersama, atau penyimpanan browser untuk data lokal.',null,'Di mana data hidup setelah refresh?',null),
('frontend','output','Apa output kode ini?',null,'console.log(new Set([115, "115", 115, NaN, NaN, 26]).size, [NaN].includes(NaN), [NaN].indexOf(NaN));','javascript','["4 false -1","5 true -1","4 true -1"]'::jsonb,null,2,'Dijalankan langsung: 4 true -1.',null,'Ingat default sort() = urutan string; Object.keys mengurutkan kunci integer dulu; spread hanya salinan dangkal.',null),
('frontend','guess','Pada lebar kontainer berapa aturan @container ini berlaku?',null,'.kartu-wrap { container-type: inline-size; }
@container (min-width: 400px) {
  .kartu { display: flex; }
}','css','["Ketika lebar viewport ≥ 400px","Ketika lebar .kartu itu sendiri ≥ 400px","Ketika lebar .kartu-wrap"]'::jsonb,null,2,'Container query bergantung pada ukuran leluhur yang ditandai container-type, bukan viewport dan bukan elemen yang di-style itu sendiri.',null,'Yang diukur adalah leluhur yang mana?',null),
('frontend','guess','Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?',null,'.induk { margin-top: 20px; }
.anak  { margin-top: 40px; }','css','["60","40","73"]'::jsonb,null,1,'Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(20, 40) = 40px.',null,'Apa yang mencegah margin induk dan anak pertama menyatu?',null),
('frontend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 4 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('frontend','output','Apa output kode ini?',null,'const f = (v = 7) => ({ a: v ?? "dflt", b: v || "dflt", c: v?.length });
console.log(JSON.stringify(f(false)), JSON.stringify(f([])));','javascript','["{\"a\":\"dflt\",\"b\":\"dflt\"} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":false,\"b\":\"dflt\"} {\"a\":[],\"b\":[],\"c\":0}","{\"a\":\"dflt\",\"b\":false} {\"a\":[],\"b\":[],\"c\":0}"]'::jsonb,null,1,'Hasil: {"a":false,"b":"dflt"} {"a":[],"b":[],"c":0}. Parameter default hanya aktif untuk undefined (bukan null); ?? hanya menangkap null/undefined, sedangkan || menangkap semua nilai falsy.',null,'Parameter default aktif untuk apa saja? Bedakan ?? dan ||.',null),
('frontend','guess','Warna teks akhir elemen <p> ini?',null,'<main class="wrap">
  <p id="kartu" class="a b" data-x>Halo</p>
</main>

/* urutan sumber dari atas ke bawah */
@layer base {
  :where(#kartu, .a):is(.a, .b):not(.zzz) { color: biru; }
}
@layer base {
  main :not(#zzz) { color: hijau; }
}
.b.a { color: oranye; }','html','["biru","hijau","oranye"]'::jsonb,null,2,':where(#kartu, .a):is(.a, .b):not(.zzz): (0,2,0) [@layer] → biru; main :not(#zzz): (1,0,1) [@layer] → hijau; .b.a: (0,2,0) → oranye. Pemenang: oranye. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.',null,'Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.',null),
('frontend','output','Apa output kode ini?',null,'const fns = [];
for (var i = 1; i < 4; i++) {
  fns.push(() => i * 10);
}
console.log(fns.map((f) => f()).join(","));','javascript','["40,40,40","10,20,30","20,30,40"]'::jsonb,null,0,'var hanya punya satu binding i di fungsi; saat fns dipanggil, loop sudah selesai dan i = 4, jadi semua closure menghasilkan 40.',null,'Berapa banyak variabel i yang sebenarnya ada?',null),
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
// 1) mount  2) setId(2)  3) tick(1) (id tetap 2)','javascript','["C+2 C-2 C+2 C-1 P+1 C+1","P+1 C+1 C-1 C+2 C-2 C+2","C+1 P+1 C-1 C+2 C-2 C+2"]'::jsonb,null,2,'Hasil: C+1 P+1 C-1 C+2 C-2 C+2. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.',null,'Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.',null),
('frontend','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-2000.jpg","foto-640.jpg"]'::jsonb,null,0,'Slot = 50vw × 1024 = 512px CSS; × DPR 2 = 1024px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null);
