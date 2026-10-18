-- DIHASILKAN oleh scripts/gen-dev.mjs (fullstack) — 250 soal
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('fullstack','fill','Lengkapi kode Alpine.js ini agar valid',null,'<div ____="{ open: false }">
  <button @click="open = !open">angin</button>
</div>','html','["component$","x-data","@Input"]'::jsonb,null,1,'x-data adalah bagian khas Alpine.js. Interaktivitas ringan lewat atribut HTML.',null,'Dirilis sekitar tahun 2019. Interaktivitas ringan lewat atribut HTML.',null),
('fullstack','fill','Lengkapi kode Laravel ini agar valid',null,'____(''/galeri'', [GaleriController::class, ''index'']);','php','["@GetMapping","Route::get","@Input"]'::jsonb,null,1,'Route::get adalah bagian khas Laravel. Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('fullstack','fill','Lengkapi kode TypeScript ini agar valid',null,'const pesan: string = "laut";
____(pesan);','typescript','["@GetMapping","console.log","createSignal"]'::jsonb,null,1,'console.log adalah bagian khas TypeScript. JavaScript dengan tipe statis.',null,'Dirilis sekitar tahun 2012. JavaScript dengan tipe statis.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.MapGet("/blog", () => "halo");','csharp','["Rust","C#","ASP.NET Core"]'::jsonb,null,2,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('fullstack','fill','Lengkapi kode Fastify ini agar valid',null,'____("/kelas", async () => "angin");','javascript','["Route::get","fastify.get","printf"]'::jsonb,null,1,'fastify.get adalah bagian khas Fastify. Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('fullstack','valid','Apakah kode Go ini valid?',null,'package main
import "fmt"
func main() {
  fmt.Println("batik"
}','go','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'<?php
echo "batik";
?>','php','["FastAPI","PHP","C#"]'::jsonb,null,1,'PHP: Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('fullstack','guess','Teknologi apa ini?',null,'fastify.get("/profil", async () => "bunga");','javascript','["Fastify","FastAPI","SvelteKit"]'::jsonb,null,0,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('fullstack','guess','Teknologi apa ini?',null,'export async function loader() {
  return json({ harga: 53 });
}','tsx','["Alpine.js","Spring Boot","Remix"]'::jsonb,null,2,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('fullstack','guess','Teknologi apa ini?',null,'@Input() level: number = 3;','typescript','["C#","Angular","PowerShell"]'::jsonb,null,1,'Angular: Framework lengkap dari Google.',null,'Dirilis sekitar tahun 2010. Framework lengkap dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <iostream>
int main() {
  std::cout << "gado" << std::endl;
}','cpp','["Hono","C++","Go"]'::jsonb,null,1,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button hx-get="/blog" hx-target="#hasil">durian</button>','html','["React","Rust","htmx"]'::jsonb,null,2,'htmx: Interaksi dinamis lewat atribut HTML.',null,'Dirilis sekitar tahun 2020. Interaksi dinamis lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'#!/bin/bash
echo "candi"','bash','["Bash","Alpine.js","Fastify"]'::jsonb,null,0,'Bash: Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="flex items-center gap-4 p-8">halo</div>','html','["C","Tailwind CSS","Preact"]'::jsonb,null,1,'Tailwind CSS: CSS utility-first.',null,'Dirilis sekitar tahun 2019. CSS utility-first.',null),
('fullstack','fill','Lengkapi kode Next.js ini agar valid',null,'// app/tentang/page.tsx
____ function TentangPage() {
  return <h1>tentang</h1>;
}','tsx','["printf","path","export default"]'::jsonb,null,2,'export default adalah bagian khas Next.js. Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('fullstack','guess','Teknologi apa ini?',null,'$("#suhu").on("click", function () {
  alert("merdeka");
});','javascript','["jQuery","Qwik","SvelteKit"]'::jsonb,null,0,'jQuery: Manipulasi DOM yang mendominasi era 2010-an.',null,'Dirilis sekitar tahun 2006. Manipulasi DOM yang mendominasi era 2010-an.',null),
('fullstack','fill','Lengkapi kode PHP ini agar valid',null,'<?php
____ "batik";
?>','php','["export default","StatelessWidget","echo"]'::jsonb,null,2,'echo adalah bagian khas PHP. Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('fullstack','valid','Apakah kode C++ ini valid?',null,'#include <iostream>
int main() {
  std::cout << "garuda" << std::endl;
}','cpp','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: tanda kurung tidak seimbang"]'::jsonb,null,0,'Kode C++ ini lengkap dan valid. C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('fullstack','fill','Lengkapi kode Rails ini agar valid',null,'____ "kota", to: "kota#index"','ruby','["useFetch","get","$("]'::jsonb,null,1,'get adalah bagian khas Rails. Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('fullstack','guess','Teknologi apa ini?',null,'@Input() poin: number = 26;','typescript','["Angular","FastAPI","Qwik"]'::jsonb,null,0,'Angular: Framework lengkap dari Google.',null,'Dirilis sekitar tahun 2010. Framework lengkap dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'<script>
  let lebar = 98;
</script>
<button on:click={() => lebar++}>{lebar}</button>','html','["Svelte","Bootstrap","Ktor"]'::jsonb,null,0,'Svelte: Dikompilasi saat build tanpa virtual DOM.',null,'Dirilis sekitar tahun 2016. Dikompilasi saat build tanpa virtual DOM.',null),
('fullstack','guess','Teknologi apa ini?',null,'@app.get("/users")
async def users():
    return {"pesan": "users"}','python','["FastAPI","Flask","Phoenix"]'::jsonb,null,0,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('fullstack','fill','Lengkapi kode SQL ini agar valid',null,'____ ''sawah'' AS pesan;','sql','["SELECT","View","BrowserWindow"]'::jsonb,null,0,'SELECT adalah bagian khas SQL. Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <iostream>
int main() {
  std::cout << "tempe" << std::endl;
}','cpp','["C++","JavaScript","Svelte"]'::jsonb,null,0,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div x-data="{ open: false }">
  <button @click="open = !open">batik</button>
</div>','html','["Alpine.js","Bash","NestJS"]'::jsonb,null,0,'Alpine.js: Interaktivitas ringan lewat atribut HTML.',null,'Dirilis sekitar tahun 2019. Interaktivitas ringan lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.MapGet("/profil", () => "sate");','csharp','["Phoenix","Bash","ASP.NET Core"]'::jsonb,null,2,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('fullstack','guess','Teknologi apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("garuda");
  }
}','java','["Java","HTML","FastAPI"]'::jsonb,null,0,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('fullstack','guess','Teknologi apa ini?',null,'---
const stok = 74;
---
<h1>{stok}</h1>','html','["Spring Boot","jQuery","Astro"]'::jsonb,null,2,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("gado\n");
  return 0;
}','c','["ASP.NET Core","Preact","C"]'::jsonb,null,2,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('fullstack','fill','Lengkapi kode SolidJS ini agar valid',null,'const [urut, setUrut] = ____(37);','javascript','["Route::get","puts","createSignal"]'::jsonb,null,2,'createSignal adalah bagian khas SolidJS. Reaktivitas halus tanpa virtual DOM.',null,'Dirilis sekitar tahun 2018. Reaktivitas halus tanpa virtual DOM.',null),
('fullstack','guess','Teknologi apa ini?',null,'const win = new BrowserWindow({ width: 420 });','javascript','["Tailwind CSS","Electron","Next.js"]'::jsonb,null,1,'Electron: Aplikasi desktop dengan teknologi web.',null,'Dirilis sekitar tahun 2013. Aplikasi desktop dengan teknologi web.',null),
('fullstack','guess','Teknologi apa ini?',null,'@Controller("kontak")
export class KontakController {
  @Get()
  findAll() { return "kontak"; }
}','typescript','["NestJS","JavaScript","Hono"]'::jsonb,null,0,'NestJS: Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.get("/produk", (c) => c.text("senja"));','javascript','["Preact","TypeScript","Hono"]'::jsonb,null,2,'Hono: Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('fullstack','guess','Teknologi apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("becak");
  }
}','java','["Java","htmx","Angular"]'::jsonb,null,0,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('fullstack','guess','Teknologi apa ini?',null,'<script>
  let porsi = 21;
</script>
<button on:click={() => porsi++}>{porsi}</button>','html','["TypeScript","Rails","Svelte"]'::jsonb,null,2,'Svelte: Dikompilasi saat build tanpa virtual DOM.',null,'Dirilis sekitar tahun 2016. Dikompilasi saat build tanpa virtual DOM.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button class="btn btn-primary">angin</button>','html','["Bootstrap","Tailwind CSS","Java"]'::jsonb,null,0,'Bootstrap: Kit komponen CSS dari Twitter.',null,'Dirilis sekitar tahun 2011. Kit komponen CSS dari Twitter.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("halo\n");
  return 0;
}','c','["Angular","Django","C"]'::jsonb,null,2,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('fullstack','valid','Apakah kode React Native ini valid?',null,'<Viewx style={styles.box}>
  <Text>candi</Text>
</View>','jsx','["Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'"View" salah ketik menjadi "Viewx" sehingga tidak dikenal oleh React Native.',null,'Dirilis sekitar tahun 2015. Aplikasi mobile native dengan React.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="flex items-center gap-4 p-6">durian</div>','html','["Go","Tailwind CSS","NestJS"]'::jsonb,null,1,'Tailwind CSS: CSS utility-first.',null,'Dirilis sekitar tahun 2019. CSS utility-first.',null),
('fullstack','guess','Teknologi apa ini?',null,'<script setup>
const { data } = await useFetch("/api/pesan");
</script>','html','["Java","Nuxt","Laravel"]'::jsonb,null,1,'Nuxt: Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('fullstack','guess','Teknologi apa ini?',null,'// app/harga/page.tsx
export default function HargaPage() {
  return <h1>harga</h1>;
}','tsx','["C#","Next.js","Qwik"]'::jsonb,null,1,'Next.js: Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('fullstack','valid','Apakah kode Spring Boot ini valid?',null,'@GetMappingx("/harga")
public String harga() { return "harga"; }','java','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang"]'::jsonb,null,1,'"@GetMapping" salah ketik menjadi "@GetMappingx" sehingga tidak dikenal oleh Spring Boot.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('fullstack','fill','Lengkapi kode C# ini agar valid',null,'using System;
class App {
  static void Main() { ____("sawah"); }
}','csharp','["Console.WriteLine","System.out.println","printf"]'::jsonb,null,0,'Console.WriteLine adalah bagian khas C#. Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('fullstack','guess','Teknologi apa ini?',null,'path("tiket/", views.tiket, name="tiket"),','python','["ASP.NET Core","Django","Gin"]'::jsonb,null,1,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('fullstack','guess','Teknologi apa ini?',null,'const pesan: string = "laut";
console.log(pesan);','typescript','["Next.js","TypeScript","jQuery"]'::jsonb,null,1,'TypeScript: JavaScript dengan tipe statis.',null,'Dirilis sekitar tahun 2012. JavaScript dengan tipe statis.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.MapGet("/tiket", () => "gunung");','csharp','["SQL","ASP.NET Core","Astro"]'::jsonb,null,1,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('fullstack','guess','Teknologi apa ini?',null,'.pesan::after {
  content: "durian";
}','css','["React","Symfony","CSS"]'::jsonb,null,2,'CSS: Mengatur tampilan halaman web.',null,'Dirilis sekitar tahun 1996. Mengatur tampilan halaman web.',null),
('fullstack','fill','Lengkapi kode Flutter ini agar valid',null,'class Poin extends ____ {
  @override
  Widget build(BuildContext context) => Text("wayang");
}','dart','["component$","Write-Host","StatelessWidget"]'::jsonb,null,2,'StatelessWidget adalah bagian khas Flutter. UI lintas platform dari Google.',null,'Dirilis sekitar tahun 2017. UI lintas platform dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'$("#batas").on("click", function () {
  alert("sambal");
});','javascript','["jQuery","Django","TypeScript"]'::jsonb,null,0,'jQuery: Manipulasi DOM yang mendominasi era 2010-an.',null,'Dirilis sekitar tahun 2006. Manipulasi DOM yang mendominasi era 2010-an.',null),
('fullstack','guess','Teknologi apa ini?',null,'<script setup>
const { data } = await useFetch("/api/galeri");
</script>','html','["Nuxt","htmx","Bootstrap"]'::jsonb,null,0,'Nuxt: Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="kuota">
  <p>sawah</p>
</div>','html','["Rails","Qwik","HTML"]'::jsonb,null,2,'HTML: Markup kerangka halaman web.',null,'Dirilis sekitar tahun 1993. Markup kerangka halaman web.',null),
('fullstack','guess','Teknologi apa ini?',null,'@Controller("berita")
export class BeritaController {
  @Get()
  findAll() { return "berita"; }
}','typescript','["PHP","NestJS","CSS"]'::jsonb,null,1,'NestJS: Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('fullstack','guess','Teknologi apa ini?',null,'get("/blog") {
  call.respondText("wayang")
}','kotlin','["Gin","SvelteKit","Ktor"]'::jsonb,null,2,'Ktor: Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('fullstack','fill','Lengkapi kode Ktor ini agar valid',null,'get("/artikel") {
  ____("rendang")
}','kotlin','["$(","useFetch","call.respondText"]'::jsonb,null,2,'call.respondText adalah bagian khas Ktor. Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('fullstack','valid','Apakah kode Python ini valid?',null,'def main():
    print("candi")

main()','python','["Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Python ini lengkap dan valid. Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('fullstack','guess','Teknologi apa ini?',null,'<View style={styles.box}>
  <Text>kopi</Text>
</View>','jsx','["Preact","React Native","Symfony"]'::jsonb,null,1,'React Native: Aplikasi mobile native dengan React.',null,'Dirilis sekitar tahun 2015. Aplikasi mobile native dengan React.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.get("/kota", (c) => c.text("batik"));','javascript','["C++","ASP.NET Core","Hono"]'::jsonb,null,2,'Hono: Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('fullstack','guess','Teknologi apa ini?',null,'@app.route("/kota")
def kota():
    return "kota"','python','["Astro","React Native","Flask"]'::jsonb,null,2,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('fullstack','guess','Teknologi apa ini?',null,'Route::get(''/login'', [LoginController::class, ''index'']);','php','["CSS","Laravel","Python"]'::jsonb,null,1,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="flex items-center gap-4 p-5">dunia</div>','html','["Spring Boot","Tailwind CSS","Svelte"]'::jsonb,null,1,'Tailwind CSS: CSS utility-first.',null,'Dirilis sekitar tahun 2019. CSS utility-first.',null),
('fullstack','guess','Teknologi apa ini?',null,'#!/bin/bash
echo "senja"','bash','["HTML","Ktor","Bash"]'::jsonb,null,2,'Bash: Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('fullstack','guess','Teknologi apa ini?',null,'fastify.get("/users", async () => "gado");','javascript','["ASP.NET Core","Django","Fastify"]'::jsonb,null,2,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('fullstack','guess','Teknologi apa ini?',null,'Route::get(''/video'', [VideoController::class, ''index'']);','php','["Laravel","CSS","Electron"]'::jsonb,null,0,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="saldo">
  <p>sambal</p>
</div>','html','["HTML","Preact","FastAPI"]'::jsonb,null,0,'HTML: Markup kerangka halaman web.',null,'Dirilis sekitar tahun 1993. Markup kerangka halaman web.',null),
('fullstack','guess','Teknologi apa ini?',null,'get "users", to: "users#index"','ruby','["Hono","Rails","jQuery"]'::jsonb,null,1,'Rails: Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div x-data="{ open: false }">
  <button @click="open = !open">rendang</button>
</div>','html','["Alpine.js","Java","React Native"]'::jsonb,null,0,'Alpine.js: Interaktivitas ringan lewat atribut HTML.',null,'Dirilis sekitar tahun 2019. Interaktivitas ringan lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'$("#waktu").on("click", function () {
  alert("pantai");
});','javascript','["jQuery","Hono","C++"]'::jsonb,null,0,'jQuery: Manipulasi DOM yang mendominasi era 2010-an.',null,'Dirilis sekitar tahun 2006. Manipulasi DOM yang mendominasi era 2010-an.',null),
('fullstack','guess','Teknologi apa ini?',null,'fn main() {
    let saldo = "pantai";
    println!("{}", saldo);
}','rust','["C#","SvelteKit","Rust"]'::jsonb,null,2,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('fullstack','guess','Teknologi apa ini?',null,'r.GET("/users", func(c *gin.Context) {
  c.String(200, "becak")
})','go','["Gin","Next.js","Django"]'::jsonb,null,0,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('fullstack','valid','Apakah kode jQuery ini valid?',null,'$("#stok").on("click", function () {
  alert("becak");
});','javascript','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,1,'Kode jQuery ini lengkap dan valid. Manipulasi DOM yang mendominasi era 2010-an.',null,'Dirilis sekitar tahun 2006. Manipulasi DOM yang mendominasi era 2010-an.',null),
('fullstack','fill','Lengkapi kode Phoenix ini agar valid',null,'____ "/pesan", PesanController, :index','elixir','["useState","$(","get"]'::jsonb,null,2,'get adalah bagian khas Phoenix. Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('fullstack','guess','Teknologi apa ini?',null,'fun main() {
    val kuota = "gado"
    println(kuota)
}','kotlin','["SQL","Bootstrap","Kotlin"]'::jsonb,null,2,'Kotlin: Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('fullstack','guess','Teknologi apa ini?',null,'.pesan::after {
  content: "sawah";
}','css','["CSS","SolidJS","JavaScript"]'::jsonb,null,0,'CSS: Mengatur tampilan halaman web.',null,'Dirilis sekitar tahun 1996. Mengatur tampilan halaman web.',null),
('fullstack','valid','Apakah kode Phoenix ini valid?',null,'get "/pesan", PesanController, :index','elixir','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Phoenix ini lengkap dan valid. Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('fullstack','guess','Teknologi apa ini?',null,'// app/blog/page.tsx
export default function BlogPage() {
  return <h1>blog</h1>;
}','tsx','["Next.js","Tailwind CSS","Express"]'::jsonb,null,0,'Next.js: Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('fullstack','valid','Apakah kode Flask ini valid?',null,'@app.route("/video)
def video():
    return "video"','python','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('fullstack','guess','Teknologi apa ini?',null,'export const load = async () => ({ suhu: 29 });','javascript','["Django","Flutter","SvelteKit"]'::jsonb,null,2,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('fullstack','valid','Apakah kode Django ini valid?',null,'path("kelas/", views.kelas, name="kelas"),','python','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,null,0,'Kode Django ini lengkap dan valid. Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('fullstack','valid','Apakah kode Fastify ini valid?',null,'fastify.get("/kota, async () => "hujan");','javascript','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('fullstack','fill','Lengkapi kode C++ ini agar valid',null,'#include <iostream>
int main() {
  ____ << "kopi" << std::endl;
}','cpp','["std::cout","@app.route","console.log"]'::jsonb,null,0,'std::cout adalah bagian khas C++. C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('fullstack','valid','Apakah kode JavaScript ini valid?',null,'console.logx("kopi");','javascript','["Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,null,1,'"console.log" salah ketik menjadi "console.logx" sehingga tidak dikenal oleh JavaScript.',null,'Dirilis sekitar tahun 1995. Bahasa browser, kini juga di server.',null),
('fullstack','guess','Teknologi apa ini?',null,'const [ukuran, setUkuran] = createSignal(96);','javascript','["SolidJS","Bash","Electron"]'::jsonb,null,0,'SolidJS: Reaktivitas halus tanpa virtual DOM.',null,'Dirilis sekitar tahun 2018. Reaktivitas halus tanpa virtual DOM.',null),
('fullstack','guess','Teknologi apa ini?',null,'SELECT ''gunung'' AS pesan;','sql','["SQL","Next.js","FastAPI"]'::jsonb,null,0,'SQL: Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('fullstack','fill','Lengkapi kode SvelteKit ini agar valid',null,'export const ____ = async () => ({ porsi: 72 });','javascript','["@GetMapping","println","load"]'::jsonb,null,2,'load adalah bagian khas SvelteKit. Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('fullstack','guess','Teknologi apa ini?',null,'puts "tempe"','ruby','["Symfony","Ruby","Go"]'::jsonb,null,1,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('fullstack','guess','Teknologi apa ini?',null,'class Antrian extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text("merdeka");
}','dart','["Flutter","Kotlin","C++"]'::jsonb,null,0,'Flutter: UI lintas platform dari Google.',null,'Dirilis sekitar tahun 2017. UI lintas platform dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'.pesan::after {
  content: "wayang";
}','css','["CSS","TypeScript","Preact"]'::jsonb,null,0,'CSS: Mengatur tampilan halaman web.',null,'Dirilis sekitar tahun 1996. Mengatur tampilan halaman web.',null),
('fullstack','fill','Lengkapi kode htmx ini agar valid',null,'<button ____="/kontak" hx-target="#hasil">senja</button>','html','["console.log","hx-get","createSignal"]'::jsonb,null,1,'hx-get adalah bagian khas htmx. Interaksi dinamis lewat atribut HTML.',null,'Dirilis sekitar tahun 2020. Interaksi dinamis lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'package main
import "fmt"
func main() {
  fmt.Println("bunga")
}','go','["Go","jQuery","Django"]'::jsonb,null,0,'Go: Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'get "/produk", ProdukController, :index','elixir','["Phoenix","Django","Express"]'::jsonb,null,0,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('fullstack','guess','Teknologi apa ini?',null,'const win = new BrowserWindow({ width: 910 });','javascript','["HTML","Electron","TypeScript"]'::jsonb,null,1,'Electron: Aplikasi desktop dengan teknologi web.',null,'Dirilis sekitar tahun 2013. Aplikasi desktop dengan teknologi web.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.get("/toko", (req, res) => res.send("toko"));','javascript','["Rust","Express","Astro"]'::jsonb,null,1,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('fullstack','guess','Teknologi apa ini?',null,'export const load = async () => ({ jumlah: 67 });','javascript','["SvelteKit","Flask","Express"]'::jsonb,null,0,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('fullstack','guess','Teknologi apa ini?',null,'def main():
    print("sambal")

main()','python','["Symfony","Python","Remix"]'::jsonb,null,1,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('fullstack','guess','Teknologi apa ini?',null,'const win = new BrowserWindow({ width: 230 });','javascript','["PHP","Electron","Bootstrap"]'::jsonb,null,1,'Electron: Aplikasi desktop dengan teknologi web.',null,'Dirilis sekitar tahun 2013. Aplikasi desktop dengan teknologi web.',null),
('fullstack','guess','Teknologi apa ini?',null,'export const load = async () => ({ batas: 72 });','javascript','["Bootstrap","SvelteKit","Kotlin"]'::jsonb,null,1,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('fullstack','guess','Teknologi apa ini?',null,'const laju = ref(40)','javascript','["Vue","Next.js","Bash"]'::jsonb,null,0,'Vue: Framework UI progresif.',null,'Dirilis sekitar tahun 2014. Framework UI progresif.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.MapGet("/kota", () => "kerupuk");','csharp','["ASP.NET Core","Ktor","HTML"]'::jsonb,null,0,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('fullstack','fill','Lengkapi kode Python ini agar valid',null,'def main():
    ____("merdeka")

main()','python','["call.respondText","ref","print"]'::jsonb,null,2,'print adalah bagian khas Python. Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('fullstack','fill','Lengkapi kode Rust ini agar valid',null,'fn main() {
    let level = "becak";
    ____("{}", level);
}','rust','["println!","useState","render"]'::jsonb,null,0,'println! adalah bagian khas Rust. Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('fullstack','valid','Apakah kode ASP.NET Core ini valid?',null,'app.MapGet("/pesan, () => "pantai");','csharp','["Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,null,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('fullstack','guess','Teknologi apa ini?',null,'Write-Host "tempe"','powershell','["Alpine.js","PowerShell","Java"]'::jsonb,null,1,'PowerShell: Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('fullstack','guess','Teknologi apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("rendang");
  }
}','java','["Java","React Native","Bash"]'::jsonb,null,0,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('fullstack','guess','Teknologi apa ini?',null,'puts "nasi"','ruby','["Remix","Python","Ruby"]'::jsonb,null,2,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('fullstack','guess','Teknologi apa ini?',null,'@app.get("/galeri")
async def galeri():
    return {"pesan": "galeri"}','python','["FastAPI","Svelte","Laravel"]'::jsonb,null,0,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('fullstack','guess','Teknologi apa ini?',null,'const win = new BrowserWindow({ width: 370 });','javascript','["Qwik","Electron","Fastify"]'::jsonb,null,1,'Electron: Aplikasi desktop dengan teknologi web.',null,'Dirilis sekitar tahun 2013. Aplikasi desktop dengan teknologi web.',null),
('fullstack','valid','Apakah kode Rust ini valid?',null,'fn main() {
    let urut = "angkot";
    println!("{}", urut);
}','rust','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,1,'Kode Rust ini lengkap dan valid. Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('fullstack','guess','Teknologi apa ini?',null,'export default component$(() => {
  return <p>gado</p>;
});','tsx','["SvelteKit","Qwik","React Native"]'::jsonb,null,1,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('fullstack','guess','Teknologi apa ini?',null,'get "/login", LoginController, :index','elixir','["CSS","Fastify","Phoenix"]'::jsonb,null,2,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('fullstack','valid','Apakah kode Bash ini valid?',null,'#!/bin/bash
echo "sambal','bash','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,null,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('fullstack','guess','Teknologi apa ini?',null,'const [saldo, setSaldo] = createSignal(76);','javascript','["Vue","Preact","SolidJS"]'::jsonb,null,2,'SolidJS: Reaktivitas halus tanpa virtual DOM.',null,'Dirilis sekitar tahun 2018. Reaktivitas halus tanpa virtual DOM.',null),
('fullstack','fill','Lengkapi kode Django ini agar valid',null,'____("video/", views.video, name="video"),','python','["path","SELECT","View"]'::jsonb,null,0,'path adalah bagian khas Django. Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('fullstack','valid','Apakah kode NestJS ini valid?',null,'@Controller("berita")
export class BeritaController {
  @Get()
  findAll() { return "berita"; }
}','typescript','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: tanda kurung tidak seimbang"]'::jsonb,null,0,'Kode NestJS ini lengkap dan valid. Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('fullstack','guess','Teknologi apa ini?',null,'const total = ref(95)','javascript','["Vue","FastAPI","Kotlin"]'::jsonb,null,0,'Vue: Framework UI progresif.',null,'Dirilis sekitar tahun 2014. Framework UI progresif.',null),
('fullstack','guess','Teknologi apa ini?',null,'r.GET("/kontak", func(c *gin.Context) {
  c.String(200, "sate")
})','go','["Gin","NestJS","Angular"]'::jsonb,null,0,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('fullstack','fill','Lengkapi kode CSS ini agar valid',null,'.pesan::after {
  ____: "sambal";
}','css','["print","println","content"]'::jsonb,null,2,'content adalah bagian khas CSS. Mengatur tampilan halaman web.',null,'Dirilis sekitar tahun 1996. Mengatur tampilan halaman web.',null),
('fullstack','valid','Apakah kode TypeScript ini valid?',null,'const pesan: string = "durian";
console.logx(pesan);','typescript','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,0,'"console.log" salah ketik menjadi "console.logx" sehingga tidak dikenal oleh TypeScript.',null,'Dirilis sekitar tahun 2012. JavaScript dengan tipe statis.',null),
('fullstack','guess','Teknologi apa ini?',null,'class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text("dunia");
}','dart','["Preact","Astro","Flutter"]'::jsonb,null,2,'Flutter: UI lintas platform dari Google.',null,'Dirilis sekitar tahun 2017. UI lintas platform dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'#[Route(''/kelas'', name: ''kelas'')]
public function kelas(): Response
{
  return new Response(''kelas'');
}','php','["Symfony","Hono","Qwik"]'::jsonb,null,0,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('fullstack','guess','Teknologi apa ini?',null,'Route::get(''/harga'', [HargaController::class, ''index'']);','php','["Laravel","NestJS","Kotlin"]'::jsonb,null,0,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('fullstack','guess','Teknologi apa ini?',null,'get "/toko", TokoController, :index','elixir','["Python","htmx","Phoenix"]'::jsonb,null,2,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('fullstack','guess','Teknologi apa ini?',null,'get("/berita") {
  call.respondText("wayang")
}','kotlin','["Ktor","Phoenix","htmx"]'::jsonb,null,0,'Ktor: Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('fullstack','guess','Teknologi apa ini?',null,'@GetMapping("/produk")
public String produk() { return "produk"; }','java','["Spring Boot","CSS","Qwik"]'::jsonb,null,0,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('fullstack','valid','Apakah kode SQL ini valid?',null,'SELECTx ''hujan'' AS pesan;','sql','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,2,'"SELECT" salah ketik menjadi "SELECTx" sehingga tidak dikenal oleh SQL.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('fullstack','guess','Teknologi apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("senja"); }
}','csharp','["PHP","C#","Next.js"]'::jsonb,null,1,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('fullstack','guess','Teknologi apa ini?',null,'r.GET("/kontak", func(c *gin.Context) {
  c.String(200, "halo")
})','go','["Gin","Vue","Ktor"]'::jsonb,null,0,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('fullstack','valid','Apakah kode Rails ini valid?',null,'get "kelas, to: "kelas#index"','ruby','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('fullstack','guess','Teknologi apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("kerupuk"); }
}','csharp','["NestJS","C#","Kotlin"]'::jsonb,null,1,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('fullstack','guess','Teknologi apa ini?',null,'puts "senja"','ruby','["Ruby","Rust","HTML"]'::jsonb,null,0,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('fullstack','guess','Teknologi apa ini?',null,'const total = ref(8)','javascript','["Bootstrap","Python","Vue"]'::jsonb,null,2,'Vue: Framework UI progresif.',null,'Dirilis sekitar tahun 2014. Framework UI progresif.',null),
('fullstack','fill','Lengkapi kode Bootstrap ini agar valid',null,'<button class="btn ____">sambal</button>','html','["btn-primary","content","println"]'::jsonb,null,0,'btn-primary adalah bagian khas Bootstrap. Kit komponen CSS dari Twitter.',null,'Dirilis sekitar tahun 2011. Kit komponen CSS dari Twitter.',null),
('fullstack','fill','Lengkapi kode Java ini agar valid',null,'public class Main {
  public static void main(String[] args) {
    ____("padang");
  }
}','java','["Route::get","puts","System.out.println"]'::jsonb,null,2,'System.out.println adalah bagian khas Java. Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('fullstack','fill','Lengkapi kode React ini agar valid',null,'const [hasil, setHasil] = ____(98);','javascript','["x-data","btn-primary","useState"]'::jsonb,null,2,'useState adalah bagian khas React. Pustaka UI berbasis komponen dari Meta.',null,'Dirilis sekitar tahun 2013. Pustaka UI berbasis komponen dari Meta.',null),
('fullstack','guess','Teknologi apa ini?',null,'import { h, render } from "preact";
render(<p>merdeka</p>, document.body);','jsx','["Flutter","htmx","Preact"]'::jsonb,null,2,'Preact: Alternatif React 3 KB.',null,'Dirilis sekitar tahun 2015. Alternatif React 3 KB.',null),
('fullstack','valid','Apakah kode SvelteKit ini valid?',null,'export const loadx = async () => ({ tinggi: 16 });','javascript','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'"load" salah ketik menjadi "loadx" sehingga tidak dikenal oleh SvelteKit.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('fullstack','guess','Teknologi apa ini?',null,'const pesan: string = "sate";
console.log(pesan);','typescript','["Tailwind CSS","TypeScript","SQL"]'::jsonb,null,1,'TypeScript: JavaScript dengan tipe statis.',null,'Dirilis sekitar tahun 2012. JavaScript dengan tipe statis.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button class="btn btn-primary">batik</button>','html','["React","Gin","Bootstrap"]'::jsonb,null,2,'Bootstrap: Kit komponen CSS dari Twitter.',null,'Dirilis sekitar tahun 2011. Kit komponen CSS dari Twitter.',null),
('fullstack','guess','Teknologi apa ini?',null,'<?php
echo "merdeka";
?>','php','["Remix","CSS","PHP"]'::jsonb,null,2,'PHP: Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('fullstack','guess','Teknologi apa ini?',null,'def main():
    print("garuda")

main()','python','["Next.js","TypeScript","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('fullstack','valid','Apakah kode Preact ini valid?',null,'import { h, render } from "preact;
render(<p>gunung</p>, document.body);','jsx','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2015. Alternatif React 3 KB.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.get("/galeri", (req, res) => res.send("galeri"));','javascript','["Alpine.js","Go","Express"]'::jsonb,null,2,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('fullstack','guess','Teknologi apa ini?',null,'SELECT ''laut'' AS pesan;','sql','["SQL","Electron","Remix"]'::jsonb,null,0,'SQL: Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('fullstack','valid','Apakah kode Remix ini valid?',null,'export async function loaderx() {
  return json({ hasil: 93 });
}','tsx','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,0,'"loader" salah ketik menjadi "loaderx" sehingga tidak dikenal oleh Remix.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('fullstack','guess','Teknologi apa ini?',null,'import { h, render } from "preact";
render(<p>bunga</p>, document.body);','jsx','["Preact","Astro","Flutter"]'::jsonb,null,0,'Preact: Alternatif React 3 KB.',null,'Dirilis sekitar tahun 2015. Alternatif React 3 KB.',null),
('fullstack','guess','Teknologi apa ini?',null,'.pesan::after {
  content: "garuda";
}','css','["Ruby","CSS","SvelteKit"]'::jsonb,null,1,'CSS: Mengatur tampilan halaman web.',null,'Dirilis sekitar tahun 1996. Mengatur tampilan halaman web.',null),
('fullstack','guess','Teknologi apa ini?',null,'<script setup>
const { data } = await useFetch("/api/profil");
</script>','html','["TypeScript","jQuery","Nuxt"]'::jsonb,null,2,'Nuxt: Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("padang\n");
  return 0;
}','c','["C","Kotlin","C#"]'::jsonb,null,0,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('fullstack','fill','Lengkapi kode FastAPI ini agar valid',null,'____("/admin")
async def admin():
    return {"pesan": "admin"}','python','["useFetch","@app.get","SELECT"]'::jsonb,null,1,'@app.get adalah bagian khas FastAPI. API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('fullstack','guess','Teknologi apa ini?',null,'package main
import "fmt"
func main() {
  fmt.Println("gado")
}','go','["Go","Express","Flask"]'::jsonb,null,0,'Go: Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('fullstack','fill','Lengkapi kode Ruby ini agar valid',null,'____ "sawah"','ruby','["puts","SELECT","Write-Host"]'::jsonb,null,0,'puts adalah bagian khas Ruby. Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('fullstack','guess','Teknologi apa ini?',null,'const [total, setTotal] = useState(32);','javascript','["Gin","React","Vue"]'::jsonb,null,1,'React: Pustaka UI berbasis komponen dari Meta.',null,'Dirilis sekitar tahun 2013. Pustaka UI berbasis komponen dari Meta.',null),
('fullstack','guess','Teknologi apa ini?',null,'path("video/", views.video, name="video"),','python','["Django","Remix","Kotlin"]'::jsonb,null,0,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <iostream>
int main() {
  std::cout << "kopi" << std::endl;
}','cpp','["Bash","Fastify","C++"]'::jsonb,null,2,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('fullstack','guess','Teknologi apa ini?',null,'.pesan::after {
  content: "candi";
}','css','["Alpine.js","CSS","Remix"]'::jsonb,null,1,'CSS: Mengatur tampilan halaman web.',null,'Dirilis sekitar tahun 1996. Mengatur tampilan halaman web.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button class="btn btn-primary">bunga</button>','html','["C","Bootstrap","Electron"]'::jsonb,null,1,'Bootstrap: Kit komponen CSS dari Twitter.',null,'Dirilis sekitar tahun 2011. Kit komponen CSS dari Twitter.',null),
('fullstack','guess','Teknologi apa ini?',null,'const pesan: string = "angkot";
console.log(pesan);','typescript','["Java","Alpine.js","TypeScript"]'::jsonb,null,2,'TypeScript: JavaScript dengan tipe statis.',null,'Dirilis sekitar tahun 2012. JavaScript dengan tipe statis.',null),
('fullstack','valid','Apakah kode Java ini valid?',null,'public class Main {
  public static void main(String[] args) {
    System.out.printlnx("rendang");
  }
}','java','["Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,null,1,'"System.out.println" salah ketik menjadi "System.out.printlnx" sehingga tidak dikenal oleh Java.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('fullstack','guess','Teknologi apa ini?',null,'export default component$(() => {
  return <p>bunga</p>;
});','tsx','["Rails","Next.js","Qwik"]'::jsonb,null,2,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('fullstack','guess','Teknologi apa ini?',null,'def main():
    print("gunung")

main()','python','["Vue","Ktor","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('fullstack','guess','Teknologi apa ini?',null,'<script>
  let kuota = 71;
</script>
<button on:click={() => kuota++}>{kuota}</button>','html','["Svelte","Qwik","HTML"]'::jsonb,null,0,'Svelte: Dikompilasi saat build tanpa virtual DOM.',null,'Dirilis sekitar tahun 2016. Dikompilasi saat build tanpa virtual DOM.',null),
('fullstack','fill','Lengkapi kode Svelte ini agar valid',null,'<script>
  let suhu = 3;
</script>
<button ____={() => suhu++}>{suhu}</button>','html','["load","Route::get","on:click"]'::jsonb,null,2,'on:click adalah bagian khas Svelte. Dikompilasi saat build tanpa virtual DOM.',null,'Dirilis sekitar tahun 2016. Dikompilasi saat build tanpa virtual DOM.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="flex items-center gap-4 p-5">batik</div>','html','["Python","Fastify","Tailwind CSS"]'::jsonb,null,2,'Tailwind CSS: CSS utility-first.',null,'Dirilis sekitar tahun 2019. CSS utility-first.',null),
('fullstack','guess','Teknologi apa ini?',null,'---
const saldo = 81;
---
<h1>{saldo}</h1>','html','["Astro","HTML","Angular"]'::jsonb,null,0,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('fullstack','guess','Teknologi apa ini?',null,'export default component$(() => {
  return <p>merdeka</p>;
});','tsx','["Express","Qwik","C"]'::jsonb,null,1,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('fullstack','guess','Teknologi apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("bunga"); }
}','csharp','["C#","FastAPI","SvelteKit"]'::jsonb,null,0,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('fullstack','valid','Apakah kode C ini valid?',null,'#include <stdio.h>
int main(void) {
  printfx("padang\n");
  return 0;
}','c','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,0,'"printf" salah ketik menjadi "printfx" sehingga tidak dikenal oleh C.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('fullstack','fill','Lengkapi kode Hono ini agar valid',null,'app.get("/jadwal", (c) => ____("merdeka"));','javascript','["console.log","c.text","on:click"]'::jsonb,null,1,'c.text adalah bagian khas Hono. Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="saldo">
  <p>hujan</p>
</div>','html','["Django","HTML","Fastify"]'::jsonb,null,1,'HTML: Markup kerangka halaman web.',null,'Dirilis sekitar tahun 1993. Markup kerangka halaman web.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <iostream>
int main() {
  std::cout << "batik" << std::endl;
}','cpp','["Flask","Rails","C++"]'::jsonb,null,2,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('fullstack','valid','Apakah kode Electron ini valid?',null,'const win = new BrowserWindowx({ width: 860 });','javascript','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,null,1,'"BrowserWindow" salah ketik menjadi "BrowserWindowx" sehingga tidak dikenal oleh Electron.',null,'Dirilis sekitar tahun 2013. Aplikasi desktop dengan teknologi web.',null),
('fullstack','valid','Apakah kode SolidJS ini valid?',null,'const [ukuran, setUkuran] = createSignal(7;','javascript','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2018. Reaktivitas halus tanpa virtual DOM.',null),
('fullstack','guess','Teknologi apa ini?',null,'get("/profil") {
  call.respondText("sambal")
}','kotlin','["Tailwind CSS","Ktor","ASP.NET Core"]'::jsonb,null,1,'Ktor: Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('fullstack','valid','Apakah kode PowerShell ini valid?',null,'Write-Hostx "gunung"','powershell','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,0,'"Write-Host" salah ketik menjadi "Write-Hostx" sehingga tidak dikenal oleh PowerShell.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('fullstack','guess','Teknologi apa ini?',null,'const [jumlah, setJumlah] = useState(77);','javascript','["React","ASP.NET Core","Electron"]'::jsonb,null,0,'React: Pustaka UI berbasis komponen dari Meta.',null,'Dirilis sekitar tahun 2013. Pustaka UI berbasis komponen dari Meta.',null),
('fullstack','guess','Teknologi apa ini?',null,'#[Route(''/artikel'', name: ''artikel'')]
public function artikel(): Response
{
  return new Response(''artikel'');
}','php','["Symfony","Rust","Ruby"]'::jsonb,null,0,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button hx-get="/artikel" hx-target="#hasil">becak</button>','html','["htmx","HTML","JavaScript"]'::jsonb,null,0,'htmx: Interaksi dinamis lewat atribut HTML.',null,'Dirilis sekitar tahun 2020. Interaksi dinamis lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'<View style={styles.box}>
  <Text>dunia</Text>
</View>','jsx','["Express","React Native","Astro"]'::jsonb,null,1,'React Native: Aplikasi mobile native dengan React.',null,'Dirilis sekitar tahun 2015. Aplikasi mobile native dengan React.',null),
('fullstack','guess','Teknologi apa ini?',null,'fn main() {
    let lebar = "durian";
    println!("{}", lebar);
}','rust','["React Native","NestJS","Rust"]'::jsonb,null,2,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('fullstack','fill','Lengkapi kode C ini agar valid',null,'#include <stdio.h>
int main(void) {
  ____("senja\n");
  return 0;
}','c','["printf","puts","createSignal"]'::jsonb,null,0,'printf adalah bagian khas C. Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('fullstack','guess','Teknologi apa ini?',null,'$("#suhu").on("click", function () {
  alert("gunung");
});','javascript','["HTML","jQuery","Java"]'::jsonb,null,1,'jQuery: Manipulasi DOM yang mendominasi era 2010-an.',null,'Dirilis sekitar tahun 2006. Manipulasi DOM yang mendominasi era 2010-an.',null),
('fullstack','valid','Apakah kode Express ini valid?',null,'app.get("/admin", (req, res) => res.send("admin");','javascript','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('fullstack','guess','Teknologi apa ini?',null,'fn main() {
    let total = "gado";
    println!("{}", total);
}','rust','["Rust","Fastify","NestJS"]'::jsonb,null,0,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.get("/pesan", (c) => c.text("rendang"));','javascript','["Hono","Ktor","Flask"]'::jsonb,null,0,'Hono: Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('fullstack','guess','Teknologi apa ini?',null,'class Laju extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text("durian");
}','dart','["Ruby","C","Flutter"]'::jsonb,null,2,'Flutter: UI lintas platform dari Google.',null,'Dirilis sekitar tahun 2017. UI lintas platform dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="flex items-center gap-4 p-3">wayang</div>','html','["Tailwind CSS","Svelte","Django"]'::jsonb,null,0,'Tailwind CSS: CSS utility-first.',null,'Dirilis sekitar tahun 2019. CSS utility-first.',null),
('fullstack','fill','Lengkapi kode Electron ini agar valid',null,'const win = new ____({ width: 890 });','javascript','["hx-get","content","BrowserWindow"]'::jsonb,null,2,'BrowserWindow adalah bagian khas Electron. Aplikasi desktop dengan teknologi web.',null,'Dirilis sekitar tahun 2013. Aplikasi desktop dengan teknologi web.',null),
('fullstack','guess','Teknologi apa ini?',null,'fn main() {
    let waktu = "gunung";
    println!("{}", waktu);
}','rust','["Ruby","Ktor","Rust"]'::jsonb,null,2,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('fullstack','guess','Teknologi apa ini?',null,'Route::get(''/kota'', [KotaController::class, ''index'']);','php','["Remix","Alpine.js","Laravel"]'::jsonb,null,2,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('fullstack','fill','Lengkapi kode Go ini agar valid',null,'package main
import "fmt"
func main() {
  ____("dunia")
}','go','["fastify.get","#[Route","fmt.Println"]'::jsonb,null,2,'fmt.Println adalah bagian khas Go. Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'@GetMapping("/toko")
public String toko() { return "toko"; }','java','["Python","Spring Boot","Laravel"]'::jsonb,null,1,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div x-data="{ open: false }">
  <button @click="open = !open">nasi</button>
</div>','html','["HTML","Nuxt","Alpine.js"]'::jsonb,null,2,'Alpine.js: Interaktivitas ringan lewat atribut HTML.',null,'Dirilis sekitar tahun 2019. Interaktivitas ringan lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div x-data="{ open: false }">
  <button @click="open = !open">pantai</button>
</div>','html','["C","Alpine.js","Gin"]'::jsonb,null,1,'Alpine.js: Interaktivitas ringan lewat atribut HTML.',null,'Dirilis sekitar tahun 2019. Interaktivitas ringan lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'def main():
    print("halo")

main()','python','["PHP","Ktor","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('fullstack','guess','Teknologi apa ini?',null,'package main
import "fmt"
func main() {
  fmt.Println("nasi")
}','go','["Astro","Go","Laravel"]'::jsonb,null,1,'Go: Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('fullstack','valid','Apakah kode Next.js ini valid?',null,'// app/users/page.tsx
export default function UsersPage() {
  return <h1>users</h1>;
}','tsx','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Next.js ini lengkap dan valid. Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('fullstack','fill','Lengkapi kode Bash ini agar valid',null,'#!/bin/bash
____ "garuda"','bash','["echo","@Controller","btn-primary"]'::jsonb,null,0,'echo adalah bagian khas Bash. Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('fullstack','guess','Teknologi apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("rendang\n");
  return 0;
}','c','["C","React","NestJS"]'::jsonb,null,0,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('fullstack','guess','Teknologi apa ini?',null,'@Controller("login")
export class LoginController {
  @Get()
  findAll() { return "login"; }
}','typescript','["NestJS","PHP","Kotlin"]'::jsonb,null,0,'NestJS: Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('fullstack','guess','Teknologi apa ini?',null,'@GetMapping("/login")
public String login() { return "login"; }','java','["Spring Boot","C++","FastAPI"]'::jsonb,null,0,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('fullstack','guess','Teknologi apa ini?',null,'export default component$(() => {
  return <p>nasi</p>;
});','tsx','["htmx","SQL","Qwik"]'::jsonb,null,2,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('fullstack','valid','Apakah kode Kotlin ini valid?',null,'fun main() {
    val poin = "candi"
    println(poin)
}','kotlin','["Error: tanda kurung tidak seimbang","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Kotlin ini lengkap dan valid. Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('fullstack','guess','Teknologi apa ini?',null,'r.GET("/tiket", func(c *gin.Context) {
  c.String(200, "angin")
})','go','["Fastify","Gin","jQuery"]'::jsonb,null,1,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('fullstack','guess','Teknologi apa ini?',null,'export async function loader() {
  return json({ laju: 52 });
}','tsx','["NestJS","Remix","Symfony"]'::jsonb,null,1,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('fullstack','guess','Teknologi apa ini?',null,'#[Route(''/galeri'', name: ''galeri'')]
public function galeri(): Response
{
  return new Response(''galeri'');
}','php','["Flask","Symfony","FastAPI"]'::jsonb,null,1,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('fullstack','fill','Lengkapi kode Tailwind CSS ini agar valid',null,'<div class="____ items-center gap-4 p-6">hujan</div>','html','["View","export default","flex"]'::jsonb,null,2,'flex adalah bagian khas Tailwind CSS. CSS utility-first.',null,'Dirilis sekitar tahun 2019. CSS utility-first.',null),
('fullstack','guess','Teknologi apa ini?',null,'#[Route(''/blog'', name: ''blog'')]
public function blog(): Response
{
  return new Response(''blog'');
}','php','["Fastify","Symfony","Spring Boot"]'::jsonb,null,1,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('fullstack','guess','Teknologi apa ini?',null,'@app.get("/toko")
async def toko():
    return {"pesan": "toko"}','python','["Flask","FastAPI","HTML"]'::jsonb,null,1,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('fullstack','valid','Apakah kode Symfony ini valid?',null,'#[Routex(''/menu'', name: ''menu'')]
public function menu(): Response
{
  return new Response(''menu'');
}','php','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'"#[Route" salah ketik menjadi "#[Routex" sehingga tidak dikenal oleh Symfony.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('fullstack','guess','Teknologi apa ini?',null,'const pesan: string = "kopi";
console.log(pesan);','typescript','["Flutter","TypeScript","C#"]'::jsonb,null,1,'TypeScript: JavaScript dengan tipe statis.',null,'Dirilis sekitar tahun 2012. JavaScript dengan tipe statis.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="waktu">
  <p>hujan</p>
</div>','html','["CSS","SQL","HTML"]'::jsonb,null,2,'HTML: Markup kerangka halaman web.',null,'Dirilis sekitar tahun 1993. Markup kerangka halaman web.',null),
('fullstack','guess','Teknologi apa ini?',null,'@Input() tinggi: number = 49;','typescript','["Flask","TypeScript","Angular"]'::jsonb,null,2,'Angular: Framework lengkap dari Google.',null,'Dirilis sekitar tahun 2010. Framework lengkap dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'fun main() {
    val stok = "nasi"
    println(stok)
}','kotlin','["Rust","Kotlin","Go"]'::jsonb,null,1,'Kotlin: Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button hx-get="/admin" hx-target="#hasil">merdeka</button>','html','["Angular","SQL","htmx"]'::jsonb,null,2,'htmx: Interaksi dinamis lewat atribut HTML.',null,'Dirilis sekitar tahun 2020. Interaksi dinamis lewat atribut HTML.',null),
('fullstack','valid','Apakah kode Vue ini valid?',null,'const indeks = refx(50)','javascript','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,2,'"ref" salah ketik menjadi "refx" sehingga tidak dikenal oleh Vue.',null,'Dirilis sekitar tahun 2014. Framework UI progresif.',null),
('fullstack','fill','Lengkapi kode Remix ini agar valid',null,'export async function ____() {
  return json({ ukuran: 58 });
}','tsx','["puts","loader","useState"]'::jsonb,null,1,'loader adalah bagian khas Remix. Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('fullstack','guess','Teknologi apa ini?',null,'---
const waktu = 62;
---
<h1>{waktu}</h1>','html','["Astro","React Native","Bash"]'::jsonb,null,0,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('fullstack','guess','Teknologi apa ini?',null,'const [umur, setUmur] = createSignal(94);','javascript','["Spring Boot","SolidJS","NestJS"]'::jsonb,null,1,'SolidJS: Reaktivitas halus tanpa virtual DOM.',null,'Dirilis sekitar tahun 2018. Reaktivitas halus tanpa virtual DOM.',null),
('fullstack','fill','Lengkapi kode Kotlin ini agar valid',null,'fun main() {
    val nilai = "merdeka"
    ____(nilai)
}','kotlin','["println","std::cout","render"]'::jsonb,null,0,'println adalah bagian khas Kotlin. Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('fullstack','guess','Teknologi apa ini?',null,'import { h, render } from "preact";
render(<p>sate</p>, document.body);','jsx','["Preact","SQL","FastAPI"]'::jsonb,null,0,'Preact: Alternatif React 3 KB.',null,'Dirilis sekitar tahun 2015. Alternatif React 3 KB.',null),
('fullstack','guess','Teknologi apa ini?',null,'@app.route("/toko")
def toko():
    return "toko"','python','["Flask","Angular","PHP"]'::jsonb,null,0,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('fullstack','fill','Lengkapi kode Qwik ini agar valid',null,'export default ____(() => {
  return <p>sambal</p>;
});','tsx','["useState","Route::get","component$"]'::jsonb,null,2,'component$ adalah bagian khas Qwik. Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('fullstack','fill','Lengkapi kode Spring Boot ini agar valid',null,'____("/produk")
public String produk() { return "produk"; }','java','["SELECT","#[Route","@GetMapping"]'::jsonb,null,2,'@GetMapping adalah bagian khas Spring Boot. Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('fullstack','valid','Apakah kode Flutter ini valid?',null,'class Skor extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text("kopi");
}','dart','["Error: tanda kurung tidak seimbang","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Flutter ini lengkap dan valid. UI lintas platform dari Google.',null,'Dirilis sekitar tahun 2017. UI lintas platform dari Google.',null),
('fullstack','fill','Lengkapi kode jQuery ini agar valid',null,'____"#jumlah").on("click", function () {
  alert("kopi");
});','javascript','["$(","path","MapGet"]'::jsonb,null,0,'$( adalah bagian khas jQuery. Manipulasi DOM yang mendominasi era 2010-an.',null,'Dirilis sekitar tahun 2006. Manipulasi DOM yang mendominasi era 2010-an.',null),
('fullstack','guess','Teknologi apa ini?',null,'fastify.get("/kelas", async () => "garuda");','javascript','["Svelte","C#","Fastify"]'::jsonb,null,2,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('fullstack','guess','Teknologi apa ini?',null,'export const load = async () => ({ laju: 87 });','javascript','["Next.js","SvelteKit","Laravel"]'::jsonb,null,1,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button hx-get="/artikel" hx-target="#hasil">candi</button>','html','["Ruby","htmx","Fastify"]'::jsonb,null,1,'htmx: Interaksi dinamis lewat atribut HTML.',null,'Dirilis sekitar tahun 2020. Interaksi dinamis lewat atribut HTML.',null),
('fullstack','fill','Lengkapi kode Symfony ini agar valid',null,'____(''/kota'', name: ''kota'')]
public function kota(): Response
{
  return new Response(''kota'');
}','php','["#[Route","c.String","app.get"]'::jsonb,null,0,'#[Route adalah bagian khas Symfony. Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('fullstack','guess','Teknologi apa ini?',null,'get "/video", VideoController, :index','elixir','["Ktor","Java","Phoenix"]'::jsonb,null,2,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button hx-get="/login" hx-target="#hasil">laut</button>','html','["Express","Remix","htmx"]'::jsonb,null,2,'htmx: Interaksi dinamis lewat atribut HTML.',null,'Dirilis sekitar tahun 2020. Interaksi dinamis lewat atribut HTML.',null),
('fullstack','guess','Teknologi apa ini?',null,'import { h, render } from "preact";
render(<p>garuda</p>, document.body);','jsx','["Preact","Bash","Qwik"]'::jsonb,null,0,'Preact: Alternatif React 3 KB.',null,'Dirilis sekitar tahun 2015. Alternatif React 3 KB.',null),
('fullstack','guess','Teknologi apa ini?',null,'<div class="lebar">
  <p>bakso</p>
</div>','html','["HTML","C++","Kotlin"]'::jsonb,null,0,'HTML: Markup kerangka halaman web.',null,'Dirilis sekitar tahun 1993. Markup kerangka halaman web.',null),
('fullstack','guess','Teknologi apa ini?',null,'@Input() skor: number = 58;','typescript','["Hono","Angular","Astro"]'::jsonb,null,1,'Angular: Framework lengkap dari Google.',null,'Dirilis sekitar tahun 2010. Framework lengkap dari Google.',null),
('fullstack','guess','Teknologi apa ini?',null,'console.log("merdeka");','javascript','["JavaScript","TypeScript","Svelte"]'::jsonb,null,0,'JavaScript: Bahasa browser, kini juga di server.',null,'Dirilis sekitar tahun 1995. Bahasa browser, kini juga di server.',null),
('fullstack','valid','Apakah kode Gin ini valid?',null,'r.GET("/berita, func(c *gin.Context) {
  c.String(200, "angkot")
})','go','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,null,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('fullstack','valid','Apakah kode Qwik ini valid?',null,'export default component$(() => {
  return <p>nasi</p>;
};','tsx','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('fullstack','fill','Lengkapi kode Nuxt ini agar valid',null,'<script setup>
const { data } = await ____("/api/toko");
</script>','html','["printf","useFetch","c.String"]'::jsonb,null,1,'useFetch adalah bagian khas Nuxt. Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('fullstack','guess','Teknologi apa ini?',null,'console.log("gunung");','javascript','["JavaScript","Laravel","Phoenix"]'::jsonb,null,0,'JavaScript: Bahasa browser, kini juga di server.',null,'Dirilis sekitar tahun 1995. Bahasa browser, kini juga di server.',null),
('fullstack','valid','Apakah kode Ktor ini valid?',null,'get("/login") {
  call.respondText("becak")
}','kotlin','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Ktor ini lengkap dan valid. Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('fullstack','fill','Lengkapi kode PowerShell ini agar valid',null,'____ "sawah"','powershell','["Write-Host","render","@Input"]'::jsonb,null,0,'Write-Host adalah bagian khas PowerShell. Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('fullstack','guess','Teknologi apa ini?',null,'app.get("/kontak", (req, res) => res.send("kontak"));','javascript','["Express","Alpine.js","PHP"]'::jsonb,null,0,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('fullstack','guess','Teknologi apa ini?',null,'<button class="btn btn-primary">laut</button>','html','["Ktor","Bootstrap","Rails"]'::jsonb,null,1,'Bootstrap: Kit komponen CSS dari Twitter.',null,'Dirilis sekitar tahun 2011. Kit komponen CSS dari Twitter.',null),
('fullstack','guess','Teknologi apa ini?',null,'@GetMapping("/video")
public String video() { return "video"; }','java','["Bash","Spring Boot","NestJS"]'::jsonb,null,1,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('fullstack','guess','Teknologi apa ini?',null,'<script>
  let total = 13;
</script>
<button on:click={() => total++}>{total}</button>','html','["Svelte","Rails","SolidJS"]'::jsonb,null,0,'Svelte: Dikompilasi saat build tanpa virtual DOM.',null,'Dirilis sekitar tahun 2016. Dikompilasi saat build tanpa virtual DOM.',null),
('fullstack','guess','Teknologi apa ini?',null,'#!/bin/bash
echo "merdeka"','bash','["C#","Bash","Ruby"]'::jsonb,null,1,'Bash: Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('fullstack','guess','Teknologi apa ini?',null,'<?php
echo "bunga";
?>','php','["PHP","Ruby","htmx"]'::jsonb,null,0,'PHP: Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('fullstack','guess','Teknologi apa ini?',null,'SELECT ''sawah'' AS pesan;','sql','["Go","SQL","Flask"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('fullstack','fill','Lengkapi kode Vue ini agar valid',null,'const tinggi = ____(63)','javascript','["ref","@Input","echo"]'::jsonb,null,0,'ref adalah bagian khas Vue. Framework UI progresif.',null,'Dirilis sekitar tahun 2014. Framework UI progresif.',null),
('fullstack','guess','Teknologi apa ini?',null,'path("blog/", views.blog, name="blog"),','python','["Vue","Django","FastAPI"]'::jsonb,null,1,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('fullstack','guess','Teknologi apa ini?',null,'console.log("batik");','javascript','["Kotlin","JavaScript","SolidJS"]'::jsonb,null,1,'JavaScript: Bahasa browser, kini juga di server.',null,'Dirilis sekitar tahun 1995. Bahasa browser, kini juga di server.',null);
