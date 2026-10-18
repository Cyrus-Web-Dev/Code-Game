-- DIHASILKAN oleh scripts/gen-dev.mjs (backend) — 250 soal
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('backend','guess','Teknologi backend apa ini?',null,'def main():
    print("kerupuk")

main()','python','["PowerShell","Ktor","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('backend','guess','Teknologi backend apa ini?',null,'def main():
    print("hujan")

main()','python','["Fastify","Next.js","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('backend','guess','Teknologi backend apa ini?',null,'def main():
    print("tempe")

main()','python','["NestJS","Python","Phoenix"]'::jsonb,null,1,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('backend','guess','Teknologi backend apa ini?',null,'def main():
    print("sambal")

main()','python','["Symfony","Phoenix","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('backend','fill','Lengkapi kode Python ini agar valid',null,'def main():
    ____("rendang")

main()','python','["load","print","println"]'::jsonb,null,1,'print adalah bagian khas Python. Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('backend','valid','Apakah kode Python ini valid?',null,'def main():
    print("bunga)

main()','python','["Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,null,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('backend','guess','Teknologi backend apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("hujan");
  }
}','java','["Java","Rails","Bash"]'::jsonb,null,0,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','guess','Teknologi backend apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("bakso");
  }
}','java','["Qwik","Java","C#"]'::jsonb,null,1,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','guess','Teknologi backend apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("gunung");
  }
}','java','["Next.js","Java","Ruby"]'::jsonb,null,1,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','guess','Teknologi backend apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("angkot");
  }
}','java','["Next.js","Fastify","Java"]'::jsonb,null,2,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','fill','Lengkapi kode Java ini agar valid',null,'public class Main {
  public static void main(String[] args) {
    ____("wayang");
  }
}','java','["println","System.out.println","#[Route"]'::jsonb,null,1,'System.out.println adalah bagian khas Java. Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','valid','Apakah kode Java ini valid?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("dunia";
  }
}','java','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: tanda kurung tidak seimbang"]'::jsonb,null,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("wayang\n");
  return 0;
}','c','["Express","C","Ktor"]'::jsonb,null,1,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("candi\n");
  return 0;
}','c','["Python","C","Remix"]'::jsonb,null,1,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("pantai\n");
  return 0;
}','c','["C","Next.js","Qwik"]'::jsonb,null,0,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("bunga\n");
  return 0;
}','c','["PowerShell","C++","C"]'::jsonb,null,2,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('backend','fill','Lengkapi kode C ini agar valid',null,'#include <stdio.h>
int main(void) {
  ____("halo\n");
  return 0;
}','c','["print","printf","@app.get"]'::jsonb,null,1,'printf adalah bagian khas C. Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('backend','valid','Apakah kode C ini valid?',null,'#include <stdio.h>
int main(void) {
  printf("durian\n");
  return 0;
}','c','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: string tidak ditutup"]'::jsonb,null,0,'Kode C ini lengkap dan valid. Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <iostream>
int main() {
  std::cout << "kerupuk" << std::endl;
}','cpp','["Qwik","C++","SvelteKit"]'::jsonb,null,1,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <iostream>
int main() {
  std::cout << "merdeka" << std::endl;
}','cpp','["Java","C++","Next.js"]'::jsonb,null,1,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <iostream>
int main() {
  std::cout << "gado" << std::endl;
}','cpp','["Remix","C#","C++"]'::jsonb,null,2,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <iostream>
int main() {
  std::cout << "kopi" << std::endl;
}','cpp','["SQL","Nuxt","C++"]'::jsonb,null,2,'C++: C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('backend','fill','Lengkapi kode C++ ini agar valid',null,'#include <iostream>
int main() {
  ____ << "rendang" << std::endl;
}','cpp','["print","Console.WriteLine","std::cout"]'::jsonb,null,2,'std::cout adalah bagian khas C++. C dengan OOP dan kontrol performa.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('backend','valid','Apakah kode C++ ini valid?',null,'#include <iostream>
int main( {
  std::cout << "candi" << std::endl;
}','cpp','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 1985. C dengan OOP dan kontrol performa.',null),
('backend','guess','Teknologi backend apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("hujan"); }
}','csharp','["Flask","SvelteKit","C#"]'::jsonb,null,2,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('backend','guess','Teknologi backend apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("sawah"); }
}','csharp','["C#","Qwik","Rails"]'::jsonb,null,0,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('backend','guess','Teknologi backend apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("nasi"); }
}','csharp','["Hono","C#","Next.js"]'::jsonb,null,1,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('backend','guess','Teknologi backend apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("bunga"); }
}','csharp','["C#","Next.js","Gin"]'::jsonb,null,0,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('backend','fill','Lengkapi kode C# ini agar valid',null,'using System;
class App {
  static void Main() { ____("padang"); }
}','csharp','["component$","Console.WriteLine","app.get"]'::jsonb,null,1,'Console.WriteLine adalah bagian khas C#. Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('backend','valid','Apakah kode C# ini valid?',null,'using System;
class App {
  static void Main() { Console.WriteLine("kerupuk"); }
}','csharp','["Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode C# ini lengkap dan valid. Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('backend','guess','Teknologi backend apa ini?',null,'<?php
echo "angin";
?>','php','["Qwik","Nuxt","PHP"]'::jsonb,null,2,'PHP: Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('backend','guess','Teknologi backend apa ini?',null,'<?php
echo "laut";
?>','php','["C","Next.js","PHP"]'::jsonb,null,2,'PHP: Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('backend','guess','Teknologi backend apa ini?',null,'<?php
echo "pantai";
?>','php','["C++","SvelteKit","PHP"]'::jsonb,null,2,'PHP: Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('backend','guess','Teknologi backend apa ini?',null,'<?php
echo "senja";
?>','php','["ASP.NET Core","SvelteKit","PHP"]'::jsonb,null,2,'PHP: Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('backend','fill','Lengkapi kode PHP ini agar valid',null,'<?php
____ "padang";
?>','php','["System.out.println","std::cout","echo"]'::jsonb,null,2,'echo adalah bagian khas PHP. Bahasa server web paling populer.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('backend','valid','Apakah kode PHP ini valid?',null,'<?php
echox "sawah";
?>','php','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,0,'"echo" salah ketik menjadi "echox" sehingga tidak dikenal oleh PHP.',null,'Dirilis sekitar tahun 1995. Bahasa server web paling populer.',null),
('backend','guess','Teknologi backend apa ini?',null,'puts "gunung"','ruby','["Hono","Ruby","C++"]'::jsonb,null,1,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','guess','Teknologi backend apa ini?',null,'puts "kerupuk"','ruby','["NestJS","Ruby","Ktor"]'::jsonb,null,1,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','guess','Teknologi backend apa ini?',null,'puts "sambal"','ruby','["Ruby","Hono","Rails"]'::jsonb,null,0,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','guess','Teknologi backend apa ini?',null,'puts "bakso"','ruby','["Ruby","Laravel","Astro"]'::jsonb,null,0,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','fill','Lengkapi kode Ruby ini agar valid',null,'____ "pantai"','ruby','["puts","@Controller","get"]'::jsonb,null,0,'puts adalah bagian khas Ruby. Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','valid','Apakah kode Ruby ini valid?',null,'puts "dunia"','ruby','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,1,'Kode Ruby ini lengkap dan valid. Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','guess','Teknologi backend apa ini?',null,'package main
import "fmt"
func main() {
  fmt.Println("kerupuk")
}','go','["Bash","C#","Go"]'::jsonb,null,2,'Go: Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('backend','guess','Teknologi backend apa ini?',null,'package main
import "fmt"
func main() {
  fmt.Println("nasi")
}','go','["Go","C#","Python"]'::jsonb,null,0,'Go: Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('backend','guess','Teknologi backend apa ini?',null,'package main
import "fmt"
func main() {
  fmt.Println("halo")
}','go','["Laravel","Go","Ktor"]'::jsonb,null,1,'Go: Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('backend','guess','Teknologi backend apa ini?',null,'package main
import "fmt"
func main() {
  fmt.Println("bunga")
}','go','["Go","Rust","Phoenix"]'::jsonb,null,0,'Go: Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('backend','fill','Lengkapi kode Go ini agar valid',null,'package main
import "fmt"
func main() {
  ____("sate")
}','go','["std::cout","fastify.get","fmt.Println"]'::jsonb,null,2,'fmt.Println adalah bagian khas Go. Sederhana dan konkuren; dibuat di Google.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('backend','valid','Apakah kode Go ini valid?',null,'package main
import "fmt"
func main() {
  fmt.Println("sambal"
}','go','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: string tidak ditutup"]'::jsonb,null,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('backend','guess','Teknologi backend apa ini?',null,'#!/bin/bash
echo "durian"','bash','["Bash","Nuxt","Fastify"]'::jsonb,null,0,'Bash: Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('backend','guess','Teknologi backend apa ini?',null,'#!/bin/bash
echo "nasi"','bash','["Bash","Java","C#"]'::jsonb,null,0,'Bash: Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('backend','guess','Teknologi backend apa ini?',null,'#!/bin/bash
echo "batik"','bash','["NestJS","Bash","Ruby"]'::jsonb,null,1,'Bash: Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('backend','guess','Teknologi backend apa ini?',null,'#!/bin/bash
echo "candi"','bash','["Phoenix","Astro","Bash"]'::jsonb,null,2,'Bash: Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('backend','fill','Lengkapi kode Bash ini agar valid',null,'#!/bin/bash
____ "durian"','bash','["#[Route","print","echo"]'::jsonb,null,2,'echo adalah bagian khas Bash. Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('backend','valid','Apakah kode Bash ini valid?',null,'#!/bin/bash
echo "angin"','bash','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,1,'Kode Bash ini lengkap dan valid. Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('backend','guess','Teknologi backend apa ini?',null,'SELECT ''sate'' AS pesan;','sql','["SQL","Qwik","Nuxt"]'::jsonb,null,0,'SQL: Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('backend','guess','Teknologi backend apa ini?',null,'SELECT ''bunga'' AS pesan;','sql','["Python","SQL","PHP"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('backend','guess','Teknologi backend apa ini?',null,'SELECT ''kopi'' AS pesan;','sql','["Astro","SQL","Hono"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('backend','guess','Teknologi backend apa ini?',null,'SELECT ''bakso'' AS pesan;','sql','["Kotlin","SQL","FastAPI"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('backend','fill','Lengkapi kode SQL ini agar valid',null,'____ ''gado'' AS pesan;','sql','["printf","SELECT","Console.WriteLine"]'::jsonb,null,1,'SELECT adalah bagian khas SQL. Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('backend','valid','Apakah kode SQL ini valid?',null,'SELECTx ''laut'' AS pesan;','sql','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,2,'"SELECT" salah ketik menjadi "SELECTx" sehingga tidak dikenal oleh SQL.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('backend','guess','Teknologi backend apa ini?',null,'// app/berita/page.tsx
export default function BeritaPage() {
  return <h1>berita</h1>;
}','tsx','["Astro","Next.js","C#"]'::jsonb,null,1,'Next.js: Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','guess','Teknologi backend apa ini?',null,'// app/users/page.tsx
export default function UsersPage() {
  return <h1>users</h1>;
}','tsx','["Ktor","C#","Next.js"]'::jsonb,null,2,'Next.js: Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','guess','Teknologi backend apa ini?',null,'// app/blog/page.tsx
export default function BlogPage() {
  return <h1>blog</h1>;
}','tsx','["C","Next.js","Ktor"]'::jsonb,null,1,'Next.js: Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','guess','Teknologi backend apa ini?',null,'// app/galeri/page.tsx
export default function GaleriPage() {
  return <h1>galeri</h1>;
}','tsx','["Kotlin","Rust","Next.js"]'::jsonb,null,2,'Next.js: Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','fill','Lengkapi kode Next.js ini agar valid',null,'// app/login/page.tsx
____ function LoginPage() {
  return <h1>login</h1>;
}','tsx','["export default","SELECT","fmt.Println"]'::jsonb,null,0,'export default adalah bagian khas Next.js. Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','valid','Apakah kode Next.js ini valid?',null,'// app/galeri/page.tsx
export defaultx function GaleriPage() {
  return <h1>galeri</h1>;
}','tsx','["Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,null,1,'"export default" salah ketik menjadi "export defaultx" sehingga tidak dikenal oleh Next.js.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','guess','Teknologi backend apa ini?',null,'<script setup>
const { data } = await useFetch("/api/blog");
</script>','html','["PowerShell","Qwik","Nuxt"]'::jsonb,null,2,'Nuxt: Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('backend','guess','Teknologi backend apa ini?',null,'<script setup>
const { data } = await useFetch("/api/kontak");
</script>','html','["Nuxt","SvelteKit","Rails"]'::jsonb,null,0,'Nuxt: Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('backend','guess','Teknologi backend apa ini?',null,'<script setup>
const { data } = await useFetch("/api/galeri");
</script>','html','["Laravel","Java","Nuxt"]'::jsonb,null,2,'Nuxt: Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('backend','guess','Teknologi backend apa ini?',null,'<script setup>
const { data } = await useFetch("/api/profil");
</script>','html','["Django","Nuxt","Python"]'::jsonb,null,1,'Nuxt: Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('backend','fill','Lengkapi kode Nuxt ini agar valid',null,'<script setup>
const { data } = await ____("/api/artikel");
</script>','html','["component$","useFetch","load"]'::jsonb,null,1,'useFetch adalah bagian khas Nuxt. Framework Vue full-stack.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('backend','valid','Apakah kode Nuxt ini valid?',null,'<script setup>
const { data } = await useFetchx("/api/produk");
</script>','html','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,null,1,'"useFetch" salah ketik menjadi "useFetchx" sehingga tidak dikenal oleh Nuxt.',null,'Dirilis sekitar tahun 2016. Framework Vue full-stack.',null),
('backend','guess','Teknologi backend apa ini?',null,'---
const waktu = 71;
---
<h1>{waktu}</h1>','html','["SQL","Java","Astro"]'::jsonb,null,2,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('backend','guess','Teknologi backend apa ini?',null,'---
const skor = 24;
---
<h1>{skor}</h1>','html','["Phoenix","Ktor","Astro"]'::jsonb,null,2,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('backend','guess','Teknologi backend apa ini?',null,'---
const antrian = 56;
---
<h1>{antrian}</h1>','html','["SvelteKit","PowerShell","Astro"]'::jsonb,null,2,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('backend','guess','Teknologi backend apa ini?',null,'---
const skor = 41;
---
<h1>{skor}</h1>','html','["Astro","Flask","SQL"]'::jsonb,null,0,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('backend','guess','Teknologi backend apa ini?',null,'---
const laju = 93;
---
<h1>{laju}</h1>','html','["Hono","PHP","Astro"]'::jsonb,null,2,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('backend','guess','Teknologi backend apa ini?',null,'---
const indeks = 17;
---
<h1>{indeks}</h1>','html','["Flask","Astro","Hono"]'::jsonb,null,1,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/profil", (req, res) => res.send("profil"));','javascript','["PHP","Express","Rust"]'::jsonb,null,1,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/kelas", (req, res) => res.send("kelas"));','javascript','["Spring Boot","Express","Phoenix"]'::jsonb,null,1,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/kota", (req, res) => res.send("kota"));','javascript','["Express","Kotlin","Spring Boot"]'::jsonb,null,0,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/video", (req, res) => res.send("video"));','javascript','["PowerShell","Laravel","Express"]'::jsonb,null,2,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('backend','fill','Lengkapi kode Express ini agar valid',null,'____("/berita", (req, res) => res.send("berita"));','javascript','["#[Route","print","app.get"]'::jsonb,null,2,'app.get adalah bagian khas Express. Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('backend','valid','Apakah kode Express ini valid?',null,'app.get("/profil, (req, res) => res.send("profil"));','javascript','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('backend','guess','Teknologi backend apa ini?',null,'@Controller("tiket")
export class TiketController {
  @Get()
  findAll() { return "tiket"; }
}','typescript','["NestJS","Laravel","Flask"]'::jsonb,null,0,'NestJS: Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('backend','guess','Teknologi backend apa ini?',null,'@Controller("jadwal")
export class JadwalController {
  @Get()
  findAll() { return "jadwal"; }
}','typescript','["Astro","NestJS","Fastify"]'::jsonb,null,1,'NestJS: Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('backend','guess','Teknologi backend apa ini?',null,'@Controller("tentang")
export class TentangController {
  @Get()
  findAll() { return "tentang"; }
}','typescript','["PHP","Bash","NestJS"]'::jsonb,null,2,'NestJS: Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('backend','guess','Teknologi backend apa ini?',null,'@Controller("pesan")
export class PesanController {
  @Get()
  findAll() { return "pesan"; }
}','typescript','["Qwik","NestJS","Go"]'::jsonb,null,1,'NestJS: Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('backend','fill','Lengkapi kode NestJS ini agar valid',null,'____("tentang")
export class TentangController {
  @Get()
  findAll() { return "tentang"; }
}','typescript','["@Controller","app.get","@GetMapping"]'::jsonb,null,0,'@Controller adalah bagian khas NestJS. Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('backend','valid','Apakah kode NestJS ini valid?',null,'@Controller("kelas")
export class KelasController {
  @Get()
  findAll() { return "kelas"; }
}','typescript','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode NestJS ini lengkap dan valid. Framework Node.js terinspirasi Angular.',null,'Dirilis sekitar tahun 2017. Framework Node.js terinspirasi Angular.',null),
('backend','guess','Teknologi backend apa ini?',null,'Route::get(''/kontak'', [KontakController::class, ''index'']);','php','["ASP.NET Core","Nuxt","Laravel"]'::jsonb,null,2,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','guess','Teknologi backend apa ini?',null,'Route::get(''/berita'', [BeritaController::class, ''index'']);','php','["Ktor","Laravel","Phoenix"]'::jsonb,null,1,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','guess','Teknologi backend apa ini?',null,'Route::get(''/video'', [VideoController::class, ''index'']);','php','["Laravel","ASP.NET Core","Qwik"]'::jsonb,null,0,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','guess','Teknologi backend apa ini?',null,'Route::get(''/tiket'', [TiketController::class, ''index'']);','php','["ASP.NET Core","Laravel","Ktor"]'::jsonb,null,1,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','fill','Lengkapi kode Laravel ini agar valid',null,'____(''/admin'', [AdminController::class, ''index'']);','php','["c.String","#[Route","Route::get"]'::jsonb,null,2,'Route::get adalah bagian khas Laravel. Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','valid','Apakah kode Laravel ini valid?',null,'Route::get(''/pesan'', [PesanController::class, ''index''];','php','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','guess','Teknologi backend apa ini?',null,'#[Route(''/jadwal'', name: ''jadwal'')]
public function jadwal(): Response
{
  return new Response(''jadwal'');
}','php','["Kotlin","Symfony","Java"]'::jsonb,null,1,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','guess','Teknologi backend apa ini?',null,'#[Route(''/tiket'', name: ''tiket'')]
public function tiket(): Response
{
  return new Response(''tiket'');
}','php','["C++","Symfony","Kotlin"]'::jsonb,null,1,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','guess','Teknologi backend apa ini?',null,'#[Route(''/menu'', name: ''menu'')]
public function menu(): Response
{
  return new Response(''menu'');
}','php','["NestJS","Symfony","Ruby"]'::jsonb,null,1,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','guess','Teknologi backend apa ini?',null,'#[Route(''/kelas'', name: ''kelas'')]
public function kelas(): Response
{
  return new Response(''kelas'');
}','php','["Symfony","SQL","Fastify"]'::jsonb,null,0,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','fill','Lengkapi kode Symfony ini agar valid',null,'____(''/harga'', name: ''harga'')]
public function harga(): Response
{
  return new Response(''harga'');
}','php','["#[Route","Route::get","echo"]'::jsonb,null,0,'#[Route adalah bagian khas Symfony. Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','valid','Apakah kode Symfony ini valid?',null,'#[Route(''/tiket, name: ''tiket'')]
public function tiket(): Response
{
  return new Response(''tiket'');
}','php','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','guess','Teknologi backend apa ini?',null,'path("kota/", views.kota, name="kota"),','python','["Hono","Gin","Django"]'::jsonb,null,2,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('backend','guess','Teknologi backend apa ini?',null,'path("blog/", views.blog, name="blog"),','python','["Rust","Django","C#"]'::jsonb,null,1,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('backend','guess','Teknologi backend apa ini?',null,'path("admin/", views.admin, name="admin"),','python','["FastAPI","PHP","Django"]'::jsonb,null,2,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('backend','guess','Teknologi backend apa ini?',null,'path("kelas/", views.kelas, name="kelas"),','python','["Java","PowerShell","Django"]'::jsonb,null,2,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('backend','fill','Lengkapi kode Django ini agar valid',null,'____("toko/", views.toko, name="toko"),','python','["println","#[Route","path"]'::jsonb,null,2,'path adalah bagian khas Django. Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('backend','valid','Apakah kode Django ini valid?',null,'pathx("toko/", views.toko, name="toko"),','python','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,0,'"path" salah ketik menjadi "pathx" sehingga tidak dikenal oleh Django.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.route("/jadwal")
def jadwal():
    return "jadwal"','python','["PowerShell","C++","Flask"]'::jsonb,null,2,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.route("/users")
def users():
    return "users"','python','["Go","Flask","SQL"]'::jsonb,null,1,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.route("/harga")
def harga():
    return "harga"','python','["C++","Flask","Astro"]'::jsonb,null,1,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.route("/galeri")
def galeri():
    return "galeri"','python','["Remix","Flask","Rails"]'::jsonb,null,1,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','fill','Lengkapi kode Flask ini agar valid',null,'____("/blog")
def blog():
    return "blog"','python','["@app.route","load","component$"]'::jsonb,null,0,'@app.route adalah bagian khas Flask. Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','valid','Apakah kode Flask ini valid?',null,'@app.route("/tentang")
def tentang():
    return "tentang"','python','["Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Flask ini lengkap dan valid. Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.get("/tiket")
async def tiket():
    return {"pesan": "tiket"}','python','["Laravel","FastAPI","ASP.NET Core"]'::jsonb,null,1,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.get("/harga")
async def harga():
    return {"pesan": "harga"}','python','["FastAPI","C++","Astro"]'::jsonb,null,0,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.get("/pesan")
async def pesan():
    return {"pesan": "pesan"}','python','["NestJS","FastAPI","Gin"]'::jsonb,null,1,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.get("/profil")
async def profil():
    return {"pesan": "profil"}','python','["Spring Boot","FastAPI","SQL"]'::jsonb,null,1,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','fill','Lengkapi kode FastAPI ini agar valid',null,'____("/toko")
async def toko():
    return {"pesan": "toko"}','python','["fmt.Println","@app.get","SELECT"]'::jsonb,null,1,'@app.get adalah bagian khas FastAPI. API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','valid','Apakah kode FastAPI ini valid?',null,'@app.get("/pesan")
async def pesan(:
    return {"pesan": "pesan"}','python','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "kelas", to: "kelas#index"','ruby','["Rails","SQL","Remix"]'::jsonb,null,0,'Rails: Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "login", to: "login#index"','ruby','["NestJS","Phoenix","Rails"]'::jsonb,null,2,'Rails: Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "tiket", to: "tiket#index"','ruby','["FastAPI","Fastify","Rails"]'::jsonb,null,2,'Rails: Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "tentang", to: "tentang#index"','ruby','["Rails","C","C#"]'::jsonb,null,0,'Rails: Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','fill','Lengkapi kode Rails ini agar valid',null,'____ "profil", to: "profil#index"','ruby','["print","app.get","get"]'::jsonb,null,2,'get adalah bagian khas Rails. Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','valid','Apakah kode Rails ini valid?',null,'get "berita, to: "berita#index"','ruby','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','guess','Teknologi backend apa ini?',null,'@GetMapping("/kelas")
public String kelas() { return "kelas"; }','java','["Spring Boot","PowerShell","Gin"]'::jsonb,null,0,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','guess','Teknologi backend apa ini?',null,'@GetMapping("/galeri")
public String galeri() { return "galeri"; }','java','["SQL","Spring Boot","Fastify"]'::jsonb,null,1,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','guess','Teknologi backend apa ini?',null,'@GetMapping("/toko")
public String toko() { return "toko"; }','java','["Ktor","Laravel","Spring Boot"]'::jsonb,null,2,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','guess','Teknologi backend apa ini?',null,'@GetMapping("/menu")
public String menu() { return "menu"; }','java','["Spring Boot","Laravel","Qwik"]'::jsonb,null,0,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','fill','Lengkapi kode Spring Boot ini agar valid',null,'____("/produk")
public String produk() { return "produk"; }','java','["puts","fastify.get","@GetMapping"]'::jsonb,null,2,'@GetMapping adalah bagian khas Spring Boot. Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','valid','Apakah kode Spring Boot ini valid?',null,'@GetMapping("/profil")
public String profil() { return "profil"; }','java','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,1,'Kode Spring Boot ini lengkap dan valid. Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.MapGet("/pesan", () => "becak");','csharp','["PowerShell","ASP.NET Core","Python"]'::jsonb,null,1,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.MapGet("/tentang", () => "sambal");','csharp','["ASP.NET Core","Hono","Flask"]'::jsonb,null,0,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.MapGet("/pesan", () => "bakso");','csharp','["Rust","ASP.NET Core","Ktor"]'::jsonb,null,1,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.MapGet("/harga", () => "gado");','csharp','["Python","ASP.NET Core","PowerShell"]'::jsonb,null,1,'ASP.NET Core: Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('backend','fill','Lengkapi kode ASP.NET Core ini agar valid',null,'app.____("/users", () => "gado");','csharp','["export default","call.respondText","MapGet"]'::jsonb,null,2,'MapGet adalah bagian khas ASP.NET Core. Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('backend','valid','Apakah kode ASP.NET Core ini valid?',null,'app.MapGet("/jadwal", () => "becak");','csharp','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode ASP.NET Core ini lengkap dan valid. Web framework .NET lintas platform.',null,'Dirilis sekitar tahun 2016. Web framework .NET lintas platform.',null),
('backend','guess','Teknologi backend apa ini?',null,'r.GET("/kontak", func(c *gin.Context) {
  c.String(200, "bunga")
})','go','["Ktor","Remix","Gin"]'::jsonb,null,2,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'r.GET("/tiket", func(c *gin.Context) {
  c.String(200, "gunung")
})','go','["Remix","PowerShell","Gin"]'::jsonb,null,2,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'r.GET("/galeri", func(c *gin.Context) {
  c.String(200, "merdeka")
})','go','["Gin","SQL","PowerShell"]'::jsonb,null,0,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'r.GET("/jadwal", func(c *gin.Context) {
  c.String(200, "bunga")
})','go','["Python","Rails","Gin"]'::jsonb,null,2,'Gin: Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('backend','fill','Lengkapi kode Gin ini agar valid',null,'r.GET("/jadwal", func(c *gin.Context) {
  ____(200, "pantai")
})','go','["@Controller","print","c.String"]'::jsonb,null,2,'c.String adalah bagian khas Gin. Web framework Go yang cepat.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('backend','valid','Apakah kode Gin ini valid?',null,'r.GET("/blog", func(c *gin.Context) {
  c.String(200, "sate")
}','go','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: tanda kurung tidak seimbang"]'::jsonb,null,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2014. Web framework Go yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "/berita", BeritaController, :index','elixir','["Next.js","Flask","Phoenix"]'::jsonb,null,2,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "/profil", ProfilController, :index','elixir','["Express","Phoenix","ASP.NET Core"]'::jsonb,null,1,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "/video", VideoController, :index','elixir','["PowerShell","Phoenix","Bash"]'::jsonb,null,1,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "/tentang", TentangController, :index','elixir','["Ruby","Rails","Phoenix"]'::jsonb,null,2,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','fill','Lengkapi kode Phoenix ini agar valid',null,'____ "/tiket", TiketController, :index','elixir','["printf","get","load"]'::jsonb,null,1,'get adalah bagian khas Phoenix. Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','valid','Apakah kode Phoenix ini valid?',null,'get "/toko, TokoController, :index','elixir','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,null,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','guess','Teknologi backend apa ini?',null,'fn main() {
    let poin = "bunga";
    println!("{}", poin);
}','rust','["SQL","C#","Rust"]'::jsonb,null,2,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('backend','guess','Teknologi backend apa ini?',null,'fn main() {
    let porsi = "batik";
    println!("{}", porsi);
}','rust','["Rails","Flask","Rust"]'::jsonb,null,2,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('backend','guess','Teknologi backend apa ini?',null,'fn main() {
    let porsi = "tempe";
    println!("{}", porsi);
}','rust','["Rust","Express","Java"]'::jsonb,null,0,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('backend','guess','Teknologi backend apa ini?',null,'fn main() {
    let lebar = "pantai";
    println!("{}", lebar);
}','rust','["SQL","Rust","Gin"]'::jsonb,null,1,'Rust: Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('backend','fill','Lengkapi kode Rust ini agar valid',null,'fn main() {
    let tiket = "becak";
    ____("{}", tiket);
}','rust','["export default","println!","echo"]'::jsonb,null,1,'println! adalah bagian khas Rust. Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('backend','valid','Apakah kode Rust ini valid?',null,'fn main() {
    let antrian = "angkot";
    println!("{}", antrian);
}','rust','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,1,'Kode Rust ini lengkap dan valid. Aman memori tanpa GC lewat ownership.',null,'Dirilis sekitar tahun 2010. Aman memori tanpa GC lewat ownership.',null),
('backend','guess','Teknologi backend apa ini?',null,'fun main() {
    val level = "bakso"
    println(level)
}','kotlin','["Kotlin","Qwik","C#"]'::jsonb,null,0,'Kotlin: Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','guess','Teknologi backend apa ini?',null,'fun main() {
    val ukuran = "gunung"
    println(ukuran)
}','kotlin','["Kotlin","PowerShell","Go"]'::jsonb,null,0,'Kotlin: Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','guess','Teknologi backend apa ini?',null,'fun main() {
    val ukuran = "laut"
    println(ukuran)
}','kotlin','["Kotlin","Fastify","C"]'::jsonb,null,0,'Kotlin: Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','guess','Teknologi backend apa ini?',null,'fun main() {
    val tinggi = "laut"
    println(tinggi)
}','kotlin','["SQL","Rails","Kotlin"]'::jsonb,null,2,'Kotlin: Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','fill','Lengkapi kode Kotlin ini agar valid',null,'fun main() {
    val kuota = "candi"
    ____(kuota)
}','kotlin','["Console.WriteLine","export default","println"]'::jsonb,null,2,'println adalah bagian khas Kotlin. Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','valid','Apakah kode Kotlin ini valid?',null,'fun main() {
    val bobot = "bakso"
    println(bobot)
}','kotlin','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: string tidak ditutup"]'::jsonb,null,0,'Kode Kotlin ini lengkap dan valid. Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','guess','Teknologi backend apa ini?',null,'Write-Host "candi"','powershell','["Next.js","Astro","PowerShell"]'::jsonb,null,2,'PowerShell: Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('backend','guess','Teknologi backend apa ini?',null,'Write-Host "pantai"','powershell','["PowerShell","Flask","Astro"]'::jsonb,null,0,'PowerShell: Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('backend','guess','Teknologi backend apa ini?',null,'Write-Host "sambal"','powershell','["PowerShell","Ruby","FastAPI"]'::jsonb,null,0,'PowerShell: Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('backend','guess','Teknologi backend apa ini?',null,'Write-Host "halo"','powershell','["PowerShell","ASP.NET Core","Fastify"]'::jsonb,null,0,'PowerShell: Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('backend','fill','Lengkapi kode PowerShell ini agar valid',null,'____ "halo"','powershell','["Write-Host","@Controller","println!"]'::jsonb,null,0,'Write-Host adalah bagian khas PowerShell. Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('backend','valid','Apakah kode PowerShell ini valid?',null,'Write-Host "sambal','powershell','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('backend','guess','Teknologi backend apa ini?',null,'fastify.get("/profil", async () => "becak");','javascript','["Nuxt","Fastify","Django"]'::jsonb,null,1,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'fastify.get("/harga", async () => "sawah");','javascript','["Python","SvelteKit","Fastify"]'::jsonb,null,2,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'fastify.get("/toko", async () => "sate");','javascript','["Kotlin","Fastify","Bash"]'::jsonb,null,1,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'fastify.get("/users", async () => "garuda");','javascript','["Python","Fastify","SQL"]'::jsonb,null,1,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('backend','fill','Lengkapi kode Fastify ini agar valid',null,'____("/artikel", async () => "angin");','javascript','["puts","fastify.get","c.String"]'::jsonb,null,1,'fastify.get adalah bagian khas Fastify. Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('backend','valid','Apakah kode Fastify ini valid?',null,'fastify.get("/produk", async () => "bakso");','javascript','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Fastify ini lengkap dan valid. Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/profil", (c) => c.text("candi"));','javascript','["Qwik","Fastify","Hono"]'::jsonb,null,2,'Hono: Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/tiket", (c) => c.text("merdeka"));','javascript','["Fastify","Rails","Hono"]'::jsonb,null,2,'Hono: Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/users", (c) => c.text("wayang"));','javascript','["Hono","SQL","SvelteKit"]'::jsonb,null,0,'Hono: Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/harga", (c) => c.text("becak"));','javascript','["Ruby","Hono","PHP"]'::jsonb,null,1,'Hono: Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('backend','fill','Lengkapi kode Hono ini agar valid',null,'app.get("/toko", (c) => ____("bunga"));','javascript','["c.text","Console.WriteLine","app.get"]'::jsonb,null,0,'c.text adalah bagian khas Hono. Web framework ringan untuk edge.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('backend','valid','Apakah kode Hono ini valid?',null,'app.get("/jadwal", (c) => c.text("bunga");','javascript','["Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2021. Web framework ringan untuk edge.',null),
('backend','guess','Teknologi backend apa ini?',null,'get("/pesan") {
  call.respondText("becak")
}','kotlin','["Remix","Astro","Ktor"]'::jsonb,null,2,'Ktor: Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','guess','Teknologi backend apa ini?',null,'get("/tiket") {
  call.respondText("batik")
}','kotlin','["Ktor","Symfony","SQL"]'::jsonb,null,0,'Ktor: Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','guess','Teknologi backend apa ini?',null,'get("/tentang") {
  call.respondText("senja")
}','kotlin','["Django","Ktor","C++"]'::jsonb,null,1,'Ktor: Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','guess','Teknologi backend apa ini?',null,'get("/jadwal") {
  call.respondText("pantai")
}','kotlin','["SQL","Ktor","ASP.NET Core"]'::jsonb,null,1,'Ktor: Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','fill','Lengkapi kode Ktor ini agar valid',null,'get("/produk") {
  ____("dunia")
}','kotlin','["fmt.Println","c.String","call.respondText"]'::jsonb,null,2,'call.respondText adalah bagian khas Ktor. Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','valid','Apakah kode Ktor ini valid?',null,'get("/login") {
  call.respondTextx("dunia")
}','kotlin','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,0,'"call.respondText" salah ketik menjadi "call.respondTextx" sehingga tidak dikenal oleh Ktor.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ suhu: 79 });
}','tsx','["Hono","Kotlin","Remix"]'::jsonb,null,2,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ ukuran: 83 });
}','tsx','["C","Remix","Hono"]'::jsonb,null,1,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ stok: 13 });
}','tsx','["Flask","Django","Remix"]'::jsonb,null,2,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ suhu: 31 });
}','tsx','["Remix","C","Fastify"]'::jsonb,null,0,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','fill','Lengkapi kode Remix ini agar valid',null,'export async function ____() {
  return json({ stok: 41 });
}','tsx','["loader","@app.route","echo"]'::jsonb,null,0,'loader adalah bagian khas Remix. Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','valid','Apakah kode Remix ini valid?',null,'export async function loaderx() {
  return json({ poin: 62 });
}','tsx','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,null,1,'"loader" salah ketik menjadi "loaderx" sehingga tidak dikenal oleh Remix.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','guess','Teknologi backend apa ini?',null,'export default component$(() => {
  return <p>bunga</p>;
});','tsx','["Qwik","Java","Laravel"]'::jsonb,null,0,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('backend','guess','Teknologi backend apa ini?',null,'export default component$(() => {
  return <p>sate</p>;
});','tsx','["Qwik","SvelteKit","Spring Boot"]'::jsonb,null,0,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('backend','guess','Teknologi backend apa ini?',null,'export default component$(() => {
  return <p>kopi</p>;
});','tsx','["Rails","Qwik","SQL"]'::jsonb,null,1,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('backend','guess','Teknologi backend apa ini?',null,'export default component$(() => {
  return <p>bakso</p>;
});','tsx','["Laravel","Qwik","NestJS"]'::jsonb,null,1,'Qwik: Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('backend','fill','Lengkapi kode Qwik ini agar valid',null,'export default ____(() => {
  return <p>gunung</p>;
});','tsx','["MapGet","call.respondText","component$"]'::jsonb,null,2,'component$ adalah bagian khas Qwik. Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('backend','valid','Apakah kode Qwik ini valid?',null,'export default component$(() => {
  return <p>gunung</p>;
});','tsx','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,0,'Kode Qwik ini lengkap dan valid. Resumability tanpa hidrasi.',null,'Dirilis sekitar tahun 2022. Resumability tanpa hidrasi.',null),
('backend','guess','Teknologi backend apa ini?',null,'export const load = async () => ({ kuota: 5 });','javascript','["SvelteKit","NestJS","Flask"]'::jsonb,null,0,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','guess','Teknologi backend apa ini?',null,'export const load = async () => ({ tinggi: 21 });','javascript','["Java","SvelteKit","Rails"]'::jsonb,null,1,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','guess','Teknologi backend apa ini?',null,'export const load = async () => ({ urut: 91 });','javascript','["SvelteKit","Next.js","Remix"]'::jsonb,null,0,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','guess','Teknologi backend apa ini?',null,'export const load = async () => ({ level: 41 });','javascript','["SvelteKit","Go","Phoenix"]'::jsonb,null,0,'SvelteKit: Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','fill','Lengkapi kode SvelteKit ini agar valid',null,'export const ____ = async () => ({ urut: 27 });','javascript','["@GetMapping","println","load"]'::jsonb,null,2,'load adalah bagian khas SvelteKit. Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','valid','Apakah kode SvelteKit ini valid?',null,'export const loadx = async () => ({ porsi: 81 });','javascript','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'"load" salah ketik menjadi "loadx" sehingga tidak dikenal oleh SvelteKit.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','guess','Teknologi backend apa ini?',null,'@GetMapping("/artikel")
public String artikel() { return "artikel"; }','java','["Spring Boot","Kotlin","Phoenix"]'::jsonb,null,0,'Spring Boot: Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','guess','Teknologi backend apa ini?',null,'using System;
class App {
  static void Main() { Console.WriteLine("candi"); }
}','csharp','["Bash","Next.js","C#"]'::jsonb,null,2,'C#: Bahasa Microsoft untuk .NET dan Unity.',null,'Dirilis sekitar tahun 2000. Bahasa Microsoft untuk .NET dan Unity.',null),
('backend','valid','Apakah kode Go ini valid?',null,'package main
import "fmt
func main() {
  fmt.Println("sate")
}','go','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2009. Sederhana dan konkuren; dibuat di Google.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "/harga", HargaController, :index','elixir','["Phoenix","Bash","Java"]'::jsonb,null,0,'Phoenix: Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','guess','Teknologi backend apa ini?',null,'puts "nasi"','ruby','["Spring Boot","Python","Ruby"]'::jsonb,null,2,'Ruby: Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','fill','Lengkapi kode Bash ini agar valid',null,'#!/bin/bash
____ "batik"','bash','["fastify.get","echo","println"]'::jsonb,null,1,'echo adalah bagian khas Bash. Shell skrip Unix/Linux.',null,'Dirilis sekitar tahun 1989. Shell skrip Unix/Linux.',null),
('backend','guess','Teknologi backend apa ini?',null,'def main():
    print("padang")

main()','python','["Rust","PowerShell","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.',null,'Dirilis sekitar tahun 1991. Terbaca dan serbaguna: web, data, AI.',null),
('backend','valid','Apakah kode FastAPI ini valid?',null,'@app.getx("/kota")
async def kota():
    return {"pesan": "kota"}','python','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,2,'"@app.get" salah ketik menjadi "@app.getx" sehingga tidak dikenal oleh FastAPI.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','fill','Lengkapi kode Phoenix ini agar valid',null,'____ "/admin", AdminController, :index','elixir','["@app.get","call.respondText","get"]'::jsonb,null,2,'get adalah bagian khas Phoenix. Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','valid','Apakah kode Rails ini valid?',null,'get "kota", to: "kota#index"','ruby','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,1,'Kode Rails ini lengkap dan valid. Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','valid','Apakah kode Ktor ini valid?',null,'get("/jadwal") {
  call.respondTextx("bunga")
}','kotlin','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang"]'::jsonb,null,1,'"call.respondText" salah ketik menjadi "call.respondTextx" sehingga tidak dikenal oleh Ktor.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','fill','Lengkapi kode Ktor ini agar valid',null,'get("/menu") {
  ____("garuda")
}','kotlin','["call.respondText","fmt.Println","c.text"]'::jsonb,null,0,'call.respondText adalah bagian khas Ktor. Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ tiket: 96 });
}','tsx','["Next.js","Remix","Ruby"]'::jsonb,null,1,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','fill','Lengkapi kode Spring Boot ini agar valid',null,'____("/admin")
public String admin() { return "admin"; }','java','["@GetMapping","get","export default"]'::jsonb,null,0,'@GetMapping adalah bagian khas Spring Boot. Framework Java untuk layanan produksi.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','valid','Apakah kode SQL ini valid?',null,'SELECT ''sambal'' AS pesan;','sql','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,1,'Kode SQL ini lengkap dan valid. Bahasa query basis data relasional.',null,'Dirilis sekitar tahun 1974. Bahasa query basis data relasional.',null),
('backend','guess','Teknologi backend apa ini?',null,'app.get("/toko", (req, res) => res.send("toko"));','javascript','["Ktor","Rails","Express"]'::jsonb,null,2,'Express: Server minimalis untuk Node.js.',null,'Dirilis sekitar tahun 2010. Server minimalis untuk Node.js.',null),
('backend','guess','Teknologi backend apa ini?',null,'#[Route(''/tentang'', name: ''tentang'')]
public function tentang(): Response
{
  return new Response(''tentang'');
}','php','["Symfony","Rust","NestJS"]'::jsonb,null,0,'Symfony: Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','guess','Teknologi backend apa ini?',null,'#include <stdio.h>
int main(void) {
  printf("batik\n");
  return 0;
}','c','["Django","C","Spring Boot"]'::jsonb,null,1,'C: Dasar sistem operasi; memori dikelola manual.',null,'Dirilis sekitar tahun 1972. Dasar sistem operasi; memori dikelola manual.',null),
('backend','guess','Teknologi backend apa ini?',null,'path("video/", views.video, name="video"),','python','["PHP","Spring Boot","Django"]'::jsonb,null,2,'Django: Framework Python batteries-included.',null,'Dirilis sekitar tahun 2005. Framework Python batteries-included.',null),
('backend','valid','Apakah kode Flask ini valid?',null,'@app.route("/berita)
def berita():
    return "berita"','python','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: string tidak ditutup"]'::jsonb,null,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ suhu: 63 });
}','tsx','["Remix","Django","Gin"]'::jsonb,null,0,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','valid','Apakah kode Laravel ini valid?',null,'Route::get(''/galeri'', [GaleriController::class, ''index''];','php','["Error: tanda kurung tidak seimbang","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,null,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','valid','Apakah kode Kotlin ini valid?',null,'fun main() {
    val level = "candi"
    println(level
}','kotlin','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,null,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','fill','Lengkapi kode Symfony ini agar valid',null,'____(''/tiket'', name: ''tiket'')]
public function tiket(): Response
{
  return new Response(''tiket'');
}','php','["println!","#[Route","printf"]'::jsonb,null,1,'#[Route adalah bagian khas Symfony. Framework PHP berbasis komponen.',null,'Dirilis sekitar tahun 2005. Framework PHP berbasis komponen.',null),
('backend','guess','Teknologi backend apa ini?',null,'Write-Host "tempe"','powershell','["PowerShell","Astro","Qwik"]'::jsonb,null,0,'PowerShell: Shell dan otomasi Windows berbasis objek.',null,'Dirilis sekitar tahun 2006. Shell dan otomasi Windows berbasis objek.',null),
('backend','fill','Lengkapi kode SvelteKit ini agar valid',null,'export const ____ = async () => ({ stok: 54 });','javascript','["useFetch","load","puts"]'::jsonb,null,1,'load adalah bagian khas SvelteKit. Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','guess','Teknologi backend apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("gado");
  }
}','java','["Laravel","Java","FastAPI"]'::jsonb,null,1,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ tinggi: 7 });
}','tsx','["Hono","Gin","Remix"]'::jsonb,null,2,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','valid','Apakah kode Spring Boot ini valid?',null,'@GetMapping("/users)
public String users() { return "users"; }','java','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,null,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.',null,'Dirilis sekitar tahun 2014. Framework Java untuk layanan produksi.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.route("/tiket")
def tiket():
    return "tiket"','python','["C#","Flask","NestJS"]'::jsonb,null,1,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','guess','Teknologi backend apa ini?',null,'get "produk", to: "produk#index"','ruby','["Express","Rails","Nuxt"]'::jsonb,null,1,'Rails: Convention over configuration.',null,'Dirilis sekitar tahun 2004. Convention over configuration.',null),
('backend','valid','Apakah kode Phoenix ini valid?',null,'get "/produk", ProdukController, :index','elixir','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,null,2,'Kode Phoenix ini lengkap dan valid. Framework web Elixir.',null,'Dirilis sekitar tahun 2014. Framework web Elixir.',null),
('backend','guess','Teknologi backend apa ini?',null,'fastify.get("/kontak", async () => "garuda");','javascript','["Kotlin","Fastify","PowerShell"]'::jsonb,null,1,'Fastify: Server Node.js yang cepat.',null,'Dirilis sekitar tahun 2016. Server Node.js yang cepat.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ porsi: 79 });
}','tsx','["Remix","Ktor","Go"]'::jsonb,null,0,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','fill','Lengkapi kode SvelteKit ini agar valid',null,'export const ____ = async () => ({ antrian: 4 });','javascript','["MapGet","c.text","load"]'::jsonb,null,2,'load adalah bagian khas SvelteKit. Framework aplikasi untuk Svelte.',null,'Dirilis sekitar tahun 2020. Framework aplikasi untuk Svelte.',null),
('backend','guess','Teknologi backend apa ini?',null,'fun main() {
    val umur = "garuda"
    println(umur)
}','kotlin','["Laravel","Kotlin","Ruby"]'::jsonb,null,1,'Kotlin: Bahasa utama Android modern.',null,'Dirilis sekitar tahun 2011. Bahasa utama Android modern.',null),
('backend','fill','Lengkapi kode Next.js ini agar valid',null,'// app/blog/page.tsx
____ function BlogPage() {
  return <h1>blog</h1>;
}','tsx','["MapGet","export default","fmt.Println"]'::jsonb,null,1,'export default adalah bagian khas Next.js. Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.get("/jadwal")
async def jadwal():
    return {"pesan": "jadwal"}','python','["FastAPI","Rust","SQL"]'::jsonb,null,0,'FastAPI: API Python modern dan async.',null,'Dirilis sekitar tahun 2018. API Python modern dan async.',null),
('backend','guess','Teknologi backend apa ini?',null,'// app/harga/page.tsx
export default function HargaPage() {
  return <h1>harga</h1>;
}','tsx','["Next.js","Nuxt","Symfony"]'::jsonb,null,0,'Next.js: Framework React dari Vercel.',null,'Dirilis sekitar tahun 2016. Framework React dari Vercel.',null),
('backend','guess','Teknologi backend apa ini?',null,'export async function loader() {
  return json({ indeks: 38 });
}','tsx','["Ruby","PHP","Remix"]'::jsonb,null,2,'Remix: Framework web berbasis standar.',null,'Dirilis sekitar tahun 2021. Framework web berbasis standar.',null),
('backend','valid','Apakah kode Ktor ini valid?',null,'get("/produk") {
  call.respondText("sawah")
}','kotlin','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,null,1,'Kode Ktor ini lengkap dan valid. Framework web Kotlin dari JetBrains.',null,'Dirilis sekitar tahun 2018. Framework web Kotlin dari JetBrains.',null),
('backend','guess','Teknologi backend apa ini?',null,'Route::get(''/profil'', [ProfilController::class, ''index'']);','php','["PowerShell","Qwik","Laravel"]'::jsonb,null,2,'Laravel: Framework PHP elegan.',null,'Dirilis sekitar tahun 2011. Framework PHP elegan.',null),
('backend','fill','Lengkapi kode Ruby ini agar valid',null,'____ "bunga"','ruby','["Console.WriteLine","println!","puts"]'::jsonb,null,2,'puts adalah bagian khas Ruby. Ramah programmer; basis Rails.',null,'Dirilis sekitar tahun 1995. Ramah programmer; basis Rails.',null),
('backend','guess','Teknologi backend apa ini?',null,'public class Main {
  public static void main(String[] args) {
    System.out.println("pantai");
  }
}','java','["SvelteKit","Java","Flask"]'::jsonb,null,1,'Java: Write once, run anywhere lewat JVM.',null,'Dirilis sekitar tahun 1995. Write once, run anywhere lewat JVM.',null),
('backend','guess','Teknologi backend apa ini?',null,'@app.route("/blog")
def blog():
    return "blog"','python','["Remix","Nuxt","Flask"]'::jsonb,null,2,'Flask: Mikro-framework Python.',null,'Dirilis sekitar tahun 2010. Mikro-framework Python.',null),
('backend','guess','Teknologi backend apa ini?',null,'---
const tiket = 18;
---
<h1>{tiket}</h1>','html','["Remix","Nuxt","Astro"]'::jsonb,null,2,'Astro: Situs konten dengan sedikit JavaScript.',null,'Dirilis sekitar tahun 2021. Situs konten dengan sedikit JavaScript.',null);
