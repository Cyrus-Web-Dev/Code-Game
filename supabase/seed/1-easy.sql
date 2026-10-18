-- DIHASILKAN oleh scripts/gen-bulk.mjs (easy)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("angin")

main()','python','["Go","JavaScript","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("angkot")

main()','python','["Python","Java","PowerShell"]'::jsonb,null,0,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("pantai")

main()','python','["Python","Perl","Go"]'::jsonb,null,0,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("garuda")

main()','python','["PHP","Python","Java"]'::jsonb,null,1,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','fill','Lengkapi kode Python ini agar valid','Complete this Python code so it is valid','def main():
    ____("gunung")

main()','python','["puts","print","System.out.println"]'::jsonb,null,1,'print adalah bagian khas Python. Terbaca dan serbaguna: web, data, AI.','print is characteristic of Python. Readable and versatile: web, data, AI.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword.'),
('easy','valid','Apakah kode Python ini valid?','Is this Python code valid?','def main():
    print("halo")

main(','python','["Error: tanda kurung tidak seimbang","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unbalanced parentheses","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword.'),
('easy','guess','Bahasa apa ini?','Which language is this?','console.log("angkot");','javascript','["JavaScript","C#","CSS"]'::jsonb,null,0,'JavaScript: Bahasa browser, kini juga di server.','JavaScript: The language of the browser, now on servers too.','Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma. (Muncul sekitar tahun 1995.)','Runs in the browser; prints through a ''console'' object and lines end with semicolons. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','console.log("batik");','javascript','["C++","JavaScript","Perl"]'::jsonb,null,1,'JavaScript: Bahasa browser, kini juga di server.','JavaScript: The language of the browser, now on servers too.','Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma. (Muncul sekitar tahun 1995.)','Runs in the browser; prints through a ''console'' object and lines end with semicolons. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','console.log("wayang");','javascript','["C","Python","JavaScript"]'::jsonb,null,2,'JavaScript: Bahasa browser, kini juga di server.','JavaScript: The language of the browser, now on servers too.','Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma. (Muncul sekitar tahun 1995.)','Runs in the browser; prints through a ''console'' object and lines end with semicolons. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','console.log("kopi");','javascript','["VBA","JavaScript","PHP"]'::jsonb,null,1,'JavaScript: Bahasa browser, kini juga di server.','JavaScript: The language of the browser, now on servers too.','Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma. (Muncul sekitar tahun 1995.)','Runs in the browser; prints through a ''console'' object and lines end with semicolons. (First appeared around 1995.)'),
('easy','fill','Lengkapi kode JavaScript ini agar valid','Complete this JavaScript code so it is valid','____("bakso");','javascript','["console.log","echo","Console.WriteLine"]'::jsonb,null,0,'console.log adalah bagian khas JavaScript. Bahasa browser, kini juga di server.','console.log is characteristic of JavaScript. The language of the browser, now on servers too.','Kata yang hilang terdiri dari 11 karakter, diawali "c" dan diakhiri "g". Ciri bahasa ini: Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma.','The missing word has 11 characters, starts with "c" and ends with "g". About this language: Runs in the browser; prints through a ''console'' object and lines end with semicolons.'),
('easy','valid','Apakah kode JavaScript ini valid?','Is this JavaScript code valid?','console.log("gado");','javascript','["Error: tanda kurung tidak seimbang","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unbalanced parentheses","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,2,'Kode JavaScript ini lengkap dan valid. Bahasa browser, kini juga di server.','This JavaScript code is complete and valid. The language of the browser, now on servers too.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Runs in the browser; prints through a ''console'' object and lines end with semicolons.'),
('easy','guess','Bahasa apa ini?','Which language is this?','const pesan: string = "durian";
console.log(pesan);','typescript','["Visual Basic","Perl","TypeScript"]'::jsonb,null,2,'TypeScript: JavaScript dengan tipe statis.','TypeScript: JavaScript with static types.','Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua. (Muncul sekitar tahun 2012.)','Looks like JavaScript, but variables carry a type annotation after a colon. (First appeared around 2012.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','const pesan: string = "batik";
console.log(pesan);','typescript','["TypeScript","C++","Java"]'::jsonb,null,0,'TypeScript: JavaScript dengan tipe statis.','TypeScript: JavaScript with static types.','Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua. (Muncul sekitar tahun 2012.)','Looks like JavaScript, but variables carry a type annotation after a colon. (First appeared around 2012.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','const pesan: string = "rendang";
console.log(pesan);','typescript','["TypeScript","Bash","HTML"]'::jsonb,null,0,'TypeScript: JavaScript dengan tipe statis.','TypeScript: JavaScript with static types.','Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua. (Muncul sekitar tahun 2012.)','Looks like JavaScript, but variables carry a type annotation after a colon. (First appeared around 2012.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','const pesan: string = "dunia";
console.log(pesan);','typescript','["VBA","SQL","TypeScript"]'::jsonb,null,2,'TypeScript: JavaScript dengan tipe statis.','TypeScript: JavaScript with static types.','Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua. (Muncul sekitar tahun 2012.)','Looks like JavaScript, but variables carry a type annotation after a colon. (First appeared around 2012.)'),
('easy','fill','Lengkapi kode TypeScript ini agar valid','Complete this TypeScript code so it is valid','const pesan: string = "angkot";
____(pesan);','typescript','["console.log","SELECT","echo"]'::jsonb,null,0,'console.log adalah bagian khas TypeScript. JavaScript dengan tipe statis.','console.log is characteristic of TypeScript. JavaScript with static types.','Kata yang hilang terdiri dari 11 karakter, diawali "c" dan diakhiri "g". Ciri bahasa ini: Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua.','The missing word has 11 characters, starts with "c" and ends with "g". About this language: Looks like JavaScript, but variables carry a type annotation after a colon.'),
('easy','valid','Apakah kode TypeScript ini valid?','Is this TypeScript code valid?','const pesan: string = "tempe;
console.log(pesan);','typescript','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode TypeScript ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua.','Trace every string in this TypeScript code: does each opening quote have a closing one? Remember: Looks like JavaScript, but variables carry a type annotation after a colon.'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("kopi");
  }
}','java','["PowerShell","Ruby","Java"]'::jsonb,null,2,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("rendang");
  }
}','java','["HTML","Visual Basic","Java"]'::jsonb,null,2,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("gunung");
  }
}','java','["PHP","Java","C++"]'::jsonb,null,1,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("bunga");
  }
}','java','["Go","Java","PowerShell"]'::jsonb,null,1,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','fill','Lengkapi kode Java ini agar valid','Complete this Java code so it is valid','public class Main {
  public static void main(String[] args) {
    ____("becak");
  }
}','java','["System.out.println","MsgBox","echo"]'::jsonb,null,0,'System.out.println adalah bagian khas Java. Write once, run anywhere lewat JVM.','System.out.println is characteristic of Java. Write once, run anywhere via the JVM.','Kata yang hilang terdiri dari 18 karakter, diawali "S" dan diakhiri "n". Ciri bahasa ini: Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void.','The missing word has 18 characters, starts with "S" and ends with "n". About this language: Everything lives inside a class; the entry point is a public static void ''main'' method.'),
('easy','valid','Apakah kode Java ini valid?','Is this Java code valid?','public class Main {
  public static void main(String[] args) {
    System.out.println("pantai);
  }
}','java','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Java ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void.','Trace every string in this Java code: does each opening quote have a closing one? Remember: Everything lives inside a class; the entry point is a public static void ''main'' method.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <stdio.h>
int main(void) {
  printf("gunung\n");
  return 0;
}','c','["VBA","Lua","C"]'::jsonb,null,2,'C: Dasar sistem operasi; memori dikelola manual.','C: Foundation of operating systems; manual memory management.','Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat. (Muncul sekitar tahun 1972.)','Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function. (First appeared around 1972.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <stdio.h>
int main(void) {
  printf("bakso\n");
  return 0;
}','c','["JavaScript","C","Visual Basic"]'::jsonb,null,1,'C: Dasar sistem operasi; memori dikelola manual.','C: Foundation of operating systems; manual memory management.','Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat. (Muncul sekitar tahun 1972.)','Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function. (First appeared around 1972.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <stdio.h>
int main(void) {
  printf("merdeka\n");
  return 0;
}','c','["Go","Visual Basic","C"]'::jsonb,null,2,'C: Dasar sistem operasi; memori dikelola manual.','C: Foundation of operating systems; manual memory management.','Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat. (Muncul sekitar tahun 1972.)','Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function. (First appeared around 1972.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <stdio.h>
int main(void) {
  printf("tempe\n");
  return 0;
}','c','["Perl","C++","C"]'::jsonb,null,2,'C: Dasar sistem operasi; memori dikelola manual.','C: Foundation of operating systems; manual memory management.','Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat. (Muncul sekitar tahun 1972.)','Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function. (First appeared around 1972.)'),
('easy','fill','Lengkapi kode C ini agar valid','Complete this C code so it is valid','#include <stdio.h>
int main(void) {
  ____("gunung\n");
  return 0;
}','c','["Write-Host","printf","fmt.Println"]'::jsonb,null,1,'printf adalah bagian khas C. Dasar sistem operasi; memori dikelola manual.','printf is characteristic of C. Foundation of operating systems; manual memory management.','Kata yang hilang terdiri dari 6 karakter, diawali "p" dan diakhiri "f". Ciri bahasa ini: Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat.','The missing word has 6 characters, starts with "p" and ends with "f". About this language: Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function.'),
('easy','valid','Apakah kode C ini valid?','Is this C code valid?','#include <stdio.h>
int main(void) {
  printf("candi\n");
  return 0;
}','c','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,2,'Kode C ini lengkap dan valid. Dasar sistem operasi; memori dikelola manual.','This C code is complete and valid. Foundation of operating systems; manual memory management.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "merdeka" << std::endl;
}','cpp','["C++","SQL","Visual Basic"]'::jsonb,null,0,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "kopi" << std::endl;
}','cpp','["C++","C#","Java"]'::jsonb,null,0,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "kerupuk" << std::endl;
}','cpp','["C++","Lua","Visual Basic"]'::jsonb,null,0,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "laut" << std::endl;
}','cpp','["C","CSS","C++"]'::jsonb,null,2,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','fill','Lengkapi kode C++ ini agar valid','Complete this C++ code so it is valid','#include <iostream>
int main() {
  ____ << "hujan" << std::endl;
}','cpp','["Write-Host","std::cout","echo"]'::jsonb,null,1,'std::cout adalah bagian khas C++. C dengan OOP dan kontrol performa.','std::cout is characteristic of C++. C with OOP and performance control.','Kata yang hilang terdiri dari 9 karakter, diawali "s" dan diakhiri "t". Ciri bahasa ini: Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar.','The missing word has 9 characters, starts with "s" and ends with "t". About this language: C-like, but prints with the ''<<'' stream operator on a standard output object.'),
('easy','valid','Apakah kode C++ ini valid?','Is this C++ code valid?','#include <iostream>
int main( {
  std::cout << "wayang" << std::endl;
}','cpp','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: program entry point not found"]'::jsonb,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: C-like, but prints with the ''<<'' stream operator on a standard output object.'),
('easy','guess','Bahasa apa ini?','Which language is this?','using System;
class App {
  static void Main() { Console.WriteLine("kerupuk"); }
}','csharp','["C#","Bash","PHP"]'::jsonb,null,0,'C#: Bahasa Microsoft untuk .NET dan Unity.','C#: Microsoft''s language for .NET and Unity.','Memakai ''using System;'' dan kelas dengan metode Main; mencetak lewat objek Console. (Muncul sekitar tahun 2000.)','Uses ''using System;'' and a class with a Main method; prints through the Console object. (First appeared around 2000.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','using System;
class App {
  static void Main() { Console.WriteLine("merdeka"); }
}','csharp','["Ruby","C#","JavaScript"]'::jsonb,null,1,'C#: Bahasa Microsoft untuk .NET dan Unity.','C#: Microsoft''s language for .NET and Unity.','Memakai ''using System;'' dan kelas dengan metode Main; mencetak lewat objek Console. (Muncul sekitar tahun 2000.)','Uses ''using System;'' and a class with a Main method; prints through the Console object. (First appeared around 2000.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','using System;
class App {
  static void Main() { Console.WriteLine("batik"); }
}','csharp','["C#","TypeScript","Java"]'::jsonb,null,0,'C#: Bahasa Microsoft untuk .NET dan Unity.','C#: Microsoft''s language for .NET and Unity.','Memakai ''using System;'' dan kelas dengan metode Main; mencetak lewat objek Console. (Muncul sekitar tahun 2000.)','Uses ''using System;'' and a class with a Main method; prints through the Console object. (First appeared around 2000.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','using System;
class App {
  static void Main() { Console.WriteLine("senja"); }
}','csharp','["C#","C++","HTML"]'::jsonb,null,0,'C#: Bahasa Microsoft untuk .NET dan Unity.','C#: Microsoft''s language for .NET and Unity.','Memakai ''using System;'' dan kelas dengan metode Main; mencetak lewat objek Console. (Muncul sekitar tahun 2000.)','Uses ''using System;'' and a class with a Main method; prints through the Console object. (First appeared around 2000.)'),
('easy','fill','Lengkapi kode C# ini agar valid','Complete this C# code so it is valid','using System;
class App {
  static void Main() { ____("batik"); }
}','csharp','["console.log","cat","Console.WriteLine"]'::jsonb,null,2,'Console.WriteLine adalah bagian khas C#. Bahasa Microsoft untuk .NET dan Unity.','Console.WriteLine is characteristic of C#. Microsoft''s language for .NET and Unity.','Kata yang hilang terdiri dari 17 karakter, diawali "C" dan diakhiri "e". Ciri bahasa ini: Memakai ''using System;'' dan kelas dengan metode Main; mencetak lewat objek Console.','The missing word has 17 characters, starts with "C" and ends with "e". About this language: Uses ''using System;'' and a class with a Main method; prints through the Console object.'),
('easy','valid','Apakah kode C# ini valid?','Is this C# code valid?','using System;
class App {
  static void Main() { Console.WriteLinex("hujan"); }
}','csharp','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Error: unterminated string","Valid, the code structure is complete","Error: unknown function or keyword name"]'::jsonb,2,'"Console.WriteLine" salah ketik menjadi "Console.WriteLinex" sehingga tidak dikenal oleh C#.','"Console.WriteLine" was misspelled as "Console.WriteLinex", so C# does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "Console.WriteLinex"). Apakah persis sama dengan yang dikenal C#? Ingat: Memakai ''using System;'' dan kelas dengan metode Main; mencetak lewat objek Console.','Check the spelling of the main function or keyword (here it reads "Console.WriteLinex"). Does it match exactly what C# recognizes? Remember: Uses ''using System;'' and a class with a Main method; prints through the Console object.'),
('easy','guess','Bahasa apa ini?','Which language is this?','<?php
echo "angkot";
?>','php','["PHP","Python","VBA"]'::jsonb,null,0,'PHP: Bahasa server web paling populer.','PHP: The most popular web server language.','Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''echo''. (Muncul sekitar tahun 1995.)','Code sits between tags that open with a question mark; printing uses the word ''echo''. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<?php
echo "laut";
?>','php','["Perl","PHP","JavaScript"]'::jsonb,null,1,'PHP: Bahasa server web paling populer.','PHP: The most popular web server language.','Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''echo''. (Muncul sekitar tahun 1995.)','Code sits between tags that open with a question mark; printing uses the word ''echo''. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<?php
echo "rendang";
?>','php','["PHP","PowerShell","Java"]'::jsonb,null,0,'PHP: Bahasa server web paling populer.','PHP: The most popular web server language.','Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''echo''. (Muncul sekitar tahun 1995.)','Code sits between tags that open with a question mark; printing uses the word ''echo''. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<?php
echo "garuda";
?>','php','["Visual Basic","PHP","PowerShell"]'::jsonb,null,1,'PHP: Bahasa server web paling populer.','PHP: The most popular web server language.','Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''echo''. (Muncul sekitar tahun 1995.)','Code sits between tags that open with a question mark; printing uses the word ''echo''. (First appeared around 1995.)'),
('easy','fill','Lengkapi kode PHP ini agar valid','Complete this PHP code so it is valid','<?php
____ "hujan";
?>','php','["SELECT","content","echo"]'::jsonb,null,2,'echo adalah bagian khas PHP. Bahasa server web paling populer.','echo is characteristic of PHP. The most popular web server language.','Kata yang hilang terdiri dari 4 karakter, diawali "e" dan diakhiri "o". Ciri bahasa ini: Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''…''.','The missing word has 4 characters, starts with "e" and ends with "o". About this language: Code sits between tags that open with a question mark; printing uses the word ''…''.'),
('easy','valid','Apakah kode PHP ini valid?','Is this PHP code valid?','<?php
echo "bunga;
?>','php','["Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unknown function or keyword name","Valid, the code structure is complete"]'::jsonb,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode PHP ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''echo''.','Trace every string in this PHP code: does each opening quote have a closing one? Remember: Code sits between tags that open with a question mark; printing uses the word ''echo''.'),
('easy','guess','Bahasa apa ini?','Which language is this?','puts "sate"','ruby','["Ruby","HTML","Go"]'::jsonb,null,0,'Ruby: Ramah programmer; basis Rails.','Ruby: Programmer-friendly; the basis of Rails.','Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''. (Muncul sekitar tahun 1995.)','Very terse: no curly braces or semicolons, and printing is the short word ''puts''. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','puts "bunga"','ruby','["HTML","Go","Ruby"]'::jsonb,null,2,'Ruby: Ramah programmer; basis Rails.','Ruby: Programmer-friendly; the basis of Rails.','Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''. (Muncul sekitar tahun 1995.)','Very terse: no curly braces or semicolons, and printing is the short word ''puts''. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','puts "dunia"','ruby','["Python","Ruby","PHP"]'::jsonb,null,1,'Ruby: Ramah programmer; basis Rails.','Ruby: Programmer-friendly; the basis of Rails.','Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''. (Muncul sekitar tahun 1995.)','Very terse: no curly braces or semicolons, and printing is the short word ''puts''. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','puts "hujan"','ruby','["JavaScript","Go","Ruby"]'::jsonb,null,2,'Ruby: Ramah programmer; basis Rails.','Ruby: Programmer-friendly; the basis of Rails.','Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''. (Muncul sekitar tahun 1995.)','Very terse: no curly braces or semicolons, and printing is the short word ''puts''. (First appeared around 1995.)'),
('easy','fill','Lengkapi kode Ruby ini agar valid','Complete this Ruby code so it is valid','____ "senja"','ruby','["Write-Host","MsgBox","puts"]'::jsonb,null,2,'puts adalah bagian khas Ruby. Ramah programmer; basis Rails.','puts is characteristic of Ruby. Programmer-friendly; the basis of Rails.','Kata yang hilang terdiri dari 4 karakter, diawali "p" dan diakhiri "s". Ciri bahasa ini: Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''…''.','The missing word has 4 characters, starts with "p" and ends with "s". About this language: Very terse: no curly braces or semicolons, and printing is the short word ''…''.'),
('easy','valid','Apakah kode Ruby ini valid?','Is this Ruby code valid?','puts "wayang','ruby','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Ruby ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''.','Trace every string in this Ruby code: does each opening quote have a closing one? Remember: Very terse: no curly braces or semicolons, and printing is the short word ''puts''.'),
('easy','guess','Bahasa apa ini?','Which language is this?','package main
import "fmt"
func main() {
  fmt.Println("halo")
}','go','["Go","Ruby","Visual Basic"]'::jsonb,null,0,'Go: Sederhana dan konkuren; dibuat di Google.','Go: Simple and concurrent; created at Google.','Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''. (Muncul sekitar tahun 2009.)','Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword. (First appeared around 2009.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','package main
import "fmt"
func main() {
  fmt.Println("angin")
}','go','["Go","Lua","JavaScript"]'::jsonb,null,0,'Go: Sederhana dan konkuren; dibuat di Google.','Go: Simple and concurrent; created at Google.','Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''. (Muncul sekitar tahun 2009.)','Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword. (First appeared around 2009.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','package main
import "fmt"
func main() {
  fmt.Println("batik")
}','go','["JavaScript","Python","Go"]'::jsonb,null,2,'Go: Sederhana dan konkuren; dibuat di Google.','Go: Simple and concurrent; created at Google.','Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''. (Muncul sekitar tahun 2009.)','Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword. (First appeared around 2009.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','package main
import "fmt"
func main() {
  fmt.Println("kopi")
}','go','["Lua","C","Go"]'::jsonb,null,2,'Go: Sederhana dan konkuren; dibuat di Google.','Go: Simple and concurrent; created at Google.','Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''. (Muncul sekitar tahun 2009.)','Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword. (First appeared around 2009.)'),
('easy','fill','Lengkapi kode Go ini agar valid','Complete this Go code so it is valid','package main
import "fmt"
func main() {
  ____("pantai")
}','go','["fmt.Println","System.out.println","SELECT"]'::jsonb,null,0,'fmt.Println adalah bagian khas Go. Sederhana dan konkuren; dibuat di Google.','fmt.Println is characteristic of Go. Simple and concurrent; created at Google.','Kata yang hilang terdiri dari 11 karakter, diawali "f" dan diakhiri "n". Ciri bahasa ini: Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''.','The missing word has 11 characters, starts with "f" and ends with "n". About this language: Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword.'),
('easy','valid','Apakah kode Go ini valid?','Is this Go code valid?','package main
import "fmt
func main() {
  fmt.Println("candi")
}','go','["Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: program entry point not found","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Go ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''.','Trace every string in this Go code: does each opening quote have a closing one? Remember: Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword.'),
('easy','guess','Bahasa apa ini?','Which language is this?','use strict;
print "laut\n";','perl','["Perl","C","PowerShell"]'::jsonb,null,0,'Perl: Pengolah teks dan skrip sistem klasik.','Perl: Classic text processing and system scripting.','Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n. (Muncul sekitar tahun 1987.)','Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n. (First appeared around 1987.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','use strict;
print "sambal\n";','perl','["SQL","Perl","C#"]'::jsonb,null,1,'Perl: Pengolah teks dan skrip sistem klasik.','Perl: Classic text processing and system scripting.','Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n. (Muncul sekitar tahun 1987.)','Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n. (First appeared around 1987.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','use strict;
print "tempe\n";','perl','["C#","Perl","Bash"]'::jsonb,null,1,'Perl: Pengolah teks dan skrip sistem klasik.','Perl: Classic text processing and system scripting.','Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n. (Muncul sekitar tahun 1987.)','Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n. (First appeared around 1987.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','use strict;
print "kerupuk\n";','perl','["CSS","Perl","HTML"]'::jsonb,null,1,'Perl: Pengolah teks dan skrip sistem klasik.','Perl: Classic text processing and system scripting.','Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n. (Muncul sekitar tahun 1987.)','Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n. (First appeared around 1987.)'),
('easy','fill','Lengkapi kode Perl ini agar valid','Complete this Perl code so it is valid','use strict;
____ "merdeka\n";','perl','["print","System.out.println","Console.WriteLine"]'::jsonb,null,0,'print adalah bagian khas Perl. Pengolah teks dan skrip sistem klasik.','print is characteristic of Perl. Classic text processing and system scripting.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Memakai ''use strict;'' dan mencetak dengan ''…'' yang diikuti string berakhiran \n.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: Uses ''use strict;'' and …s with ''…'' followed by a string ending in \n.'),
('easy','valid','Apakah kode Perl ini valid?','Is this Perl code valid?','use strict;
print "pantai\n;','perl','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Perl ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n.','Trace every string in this Perl code: does each opening quote have a closing one? Remember: Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n.'),
('easy','guess','Bahasa apa ini?','Which language is this?','local pesan = "kerupuk"
print(pesan)','lua','["Bash","Java","Lua"]'::jsonb,null,2,'Lua: Skrip ringan untuk game dan embedded.','Lua: Lightweight scripting for games and embedded use.','Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal. (Muncul sekitar tahun 1993.)','Local variables are marked with ''local''; no semicolons and no curly braces. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','local pesan = "durian"
print(pesan)','lua','["HTML","Lua","Perl"]'::jsonb,null,1,'Lua: Skrip ringan untuk game dan embedded.','Lua: Lightweight scripting for games and embedded use.','Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal. (Muncul sekitar tahun 1993.)','Local variables are marked with ''local''; no semicolons and no curly braces. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','local pesan = "sambal"
print(pesan)','lua','["HTML","Lua","JavaScript"]'::jsonb,null,1,'Lua: Skrip ringan untuk game dan embedded.','Lua: Lightweight scripting for games and embedded use.','Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal. (Muncul sekitar tahun 1993.)','Local variables are marked with ''local''; no semicolons and no curly braces. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','local pesan = "gunung"
print(pesan)','lua','["Go","Lua","C++"]'::jsonb,null,1,'Lua: Skrip ringan untuk game dan embedded.','Lua: Lightweight scripting for games and embedded use.','Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal. (Muncul sekitar tahun 1993.)','Local variables are marked with ''local''; no semicolons and no curly braces. (First appeared around 1993.)'),
('easy','fill','Lengkapi kode Lua ini agar valid','Complete this Lua code so it is valid','local pesan = "nasi"
____(pesan)','lua','["std::cout","printf","print"]'::jsonb,null,2,'print adalah bagian khas Lua. Skrip ringan untuk game dan embedded.','print is characteristic of Lua. Lightweight scripting for games and embedded use.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: Local variables are marked with ''local''; no semicolons and no curly braces.'),
('easy','valid','Apakah kode Lua ini valid?','Is this Lua code valid?','local pesan = "sambal
print(pesan)','lua','["Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: program entry point not found","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Lua ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal.','Trace every string in this Lua code: does each opening quote have a closing one? Remember: Local variables are marked with ''local''; no semicolons and no curly braces.'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "laut"
cat(pesan, "\n")','r','["PowerShell","R","Ruby"]'::jsonb,null,1,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "bunga"
cat(pesan, "\n")','r','["TypeScript","CSS","R"]'::jsonb,null,2,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "pantai"
cat(pesan, "\n")','r','["HTML","R","TypeScript"]'::jsonb,null,1,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "kerupuk"
cat(pesan, "\n")','r','["R","C++","C"]'::jsonb,null,0,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','fill','Lengkapi kode R ini agar valid','Complete this R code so it is valid','pesan <- "nasi"
____(pesan, "\n")','r','["System.out.println","print","cat"]'::jsonb,null,2,'cat adalah bagian khas R. Statistik dan analisis data.','cat is characteristic of R. Statistics and data analysis.','Kata yang hilang terdiri dari 3 karakter, diawali "c". Ciri bahasa ini: Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''…''; populer untuk statistik.','The missing word has 3 characters, starts with "c". About this language: Assignment uses the ''<-'' arrow and output goes through ''…''; popular for statistics.'),
('easy','valid','Apakah kode R ini valid?','Is this R code valid?','pesan <- "merdeka"
cat(pesan, "\n")','r','["Error: titik masuk program tidak ditemukan","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: program entry point not found","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,2,'Kode R ini lengkap dan valid. Statistik dan analisis data.','This R code is complete and valid. Statistics and data analysis.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#!/bin/bash
echo "kopi"','bash','["Java","R","Bash"]'::jsonb,null,2,'Bash: Shell skrip Unix/Linux.','Bash: Unix/Linux shell scripting.','Diawali baris ''#!'' (shebang) dan perintah shell ''echo''. (Muncul sekitar tahun 1989.)','Starts with a ''#!'' (shebang) line and the shell command ''echo''. (First appeared around 1989.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#!/bin/bash
echo "sawah"','bash','["Go","VBA","Bash"]'::jsonb,null,2,'Bash: Shell skrip Unix/Linux.','Bash: Unix/Linux shell scripting.','Diawali baris ''#!'' (shebang) dan perintah shell ''echo''. (Muncul sekitar tahun 1989.)','Starts with a ''#!'' (shebang) line and the shell command ''echo''. (First appeared around 1989.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#!/bin/bash
echo "candi"','bash','["TypeScript","VBA","Bash"]'::jsonb,null,2,'Bash: Shell skrip Unix/Linux.','Bash: Unix/Linux shell scripting.','Diawali baris ''#!'' (shebang) dan perintah shell ''echo''. (Muncul sekitar tahun 1989.)','Starts with a ''#!'' (shebang) line and the shell command ''echo''. (First appeared around 1989.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#!/bin/bash
echo "gado"','bash','["JavaScript","Go","Bash"]'::jsonb,null,2,'Bash: Shell skrip Unix/Linux.','Bash: Unix/Linux shell scripting.','Diawali baris ''#!'' (shebang) dan perintah shell ''echo''. (Muncul sekitar tahun 1989.)','Starts with a ''#!'' (shebang) line and the shell command ''echo''. (First appeared around 1989.)'),
('easy','fill','Lengkapi kode Bash ini agar valid','Complete this Bash code so it is valid','#!/bin/bash
____ "rendang"','bash','["fmt.Println","Write-Host","echo"]'::jsonb,null,2,'echo adalah bagian khas Bash. Shell skrip Unix/Linux.','echo is characteristic of Bash. Unix/Linux shell scripting.','Kata yang hilang terdiri dari 4 karakter, diawali "e" dan diakhiri "o". Ciri bahasa ini: Diawali baris ''#!'' (shebang) dan perintah shell ''…''.','The missing word has 4 characters, starts with "e" and ends with "o". About this language: Starts with a ''#!'' (shebang) line and the shell command ''…''.'),
('easy','valid','Apakah kode Bash ini valid?','Is this Bash code valid?','#!/bin/bash
echo "candi"','bash','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,1,'Kode Bash ini lengkap dan valid. Shell skrip Unix/Linux.','This Bash code is complete and valid. Unix/Linux shell scripting.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Diawali baris ''#!'' (shebang) dan perintah shell ''echo''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Starts with a ''#!'' (shebang) line and the shell command ''echo''.'),
('easy','guess','Bahasa apa ini?','Which language is this?','Module Program
  Sub Main()
    Console.WriteLine("sate")
  End Sub
End Module','vb','["Visual Basic","C","JavaScript"]'::jsonb,null,0,'Visual Basic: Bahasa berbasis BASIC dari Microsoft.','Visual Basic: Microsoft''s BASIC-based language.','Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma. (Muncul sekitar tahun 1991.)','Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Module Program
  Sub Main()
    Console.WriteLine("sambal")
  End Sub
End Module','vb','["Visual Basic","SQL","HTML"]'::jsonb,null,0,'Visual Basic: Bahasa berbasis BASIC dari Microsoft.','Visual Basic: Microsoft''s BASIC-based language.','Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma. (Muncul sekitar tahun 1991.)','Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Module Program
  Sub Main()
    Console.WriteLine("padang")
  End Sub
End Module','vb','["VBA","Visual Basic","Bash"]'::jsonb,null,1,'Visual Basic: Bahasa berbasis BASIC dari Microsoft.','Visual Basic: Microsoft''s BASIC-based language.','Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma. (Muncul sekitar tahun 1991.)','Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Module Program
  Sub Main()
    Console.WriteLine("wayang")
  End Sub
End Module','vb','["Go","Ruby","Visual Basic"]'::jsonb,null,2,'Visual Basic: Bahasa berbasis BASIC dari Microsoft.','Visual Basic: Microsoft''s BASIC-based language.','Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma. (Muncul sekitar tahun 1991.)','Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon. (First appeared around 1991.)'),
('easy','fill','Lengkapi kode Visual Basic ini agar valid','Complete this Visual Basic code so it is valid','Module Program
  Sub Main()
    ____("pantai")
  End Sub
End Module','vb','["SELECT","fmt.Println","Console.WriteLine"]'::jsonb,null,2,'Console.WriteLine adalah bagian khas Visual Basic. Bahasa berbasis BASIC dari Microsoft.','Console.WriteLine is characteristic of Visual Basic. Microsoft''s BASIC-based language.','Kata yang hilang terdiri dari 17 karakter, diawali "C" dan diakhiri "e". Ciri bahasa ini: Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat … tanpa titik koma.','The missing word has 17 characters, starts with "C" and ends with "e". About this language: Blocks close with ''End'' (End Sub, End Module); prints with … and no semicolon.'),
('easy','valid','Apakah kode Visual Basic ini valid?','Is this Visual Basic code valid?','Module Program
  Sub Main()
    Console.WriteLine("rendang")
  End Sub
End Module','vb','["Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: program entry point not found","Error: unbalanced parentheses"]'::jsonb,0,'Kode Visual Basic ini lengkap dan valid. Bahasa berbasis BASIC dari Microsoft.','This Visual Basic code is complete and valid. Microsoft''s BASIC-based language.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon.'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''garuda'' AS pesan;','sql','["Visual Basic","SQL","VBA"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''kopi'' AS pesan;','sql','["SQL","Go","Python"]'::jsonb,null,0,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''halo'' AS pesan;','sql','["C++","SQL","Python"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''dunia'' AS pesan;','sql','["SQL","JavaScript","HTML"]'::jsonb,null,0,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','fill','Lengkapi kode SQL ini agar valid','Complete this SQL code so it is valid','____ ''kopi'' AS pesan;','sql','["Console.WriteLine","std::cout","SELECT"]'::jsonb,null,2,'SELECT adalah bagian khas SQL. Bahasa query basis data relasional.','SELECT is characteristic of SQL. The query language for relational databases.','Kata yang hilang terdiri dari 6 karakter, diawali "S" dan diakhiri "T". Ciri bahasa ini: Kueri deklaratif: kata kunci huruf besar seperti … dan AS, diakhiri titik koma.','The missing word has 6 characters, starts with "S" and ends with "T". About this language: A declarative query: uppercase keywords like … and AS, ending with a semicolon.'),
('easy','valid','Apakah kode SQL ini valid?','Is this SQL code valid?','SELECT ''sawah'' AS pesan;','sql','["Error: tanda kurung tidak seimbang","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unbalanced parentheses","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,2,'Kode SQL ini lengkap dan valid. Bahasa query basis data relasional.','This SQL code is complete and valid. The query language for relational databases.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon.'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="total">
  <p>sawah</p>
</div>','html','["HTML","CSS","PowerShell"]'::jsonb,null,0,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="level">
  <p>nasi</p>
</div>','html','["TypeScript","C","HTML"]'::jsonb,null,2,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="poin">
  <p>garuda</p>
</div>','html','["Java","HTML","Perl"]'::jsonb,null,1,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="laju">
  <p>pantai</p>
</div>','html','["HTML","Ruby","Python"]'::jsonb,null,0,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="hasil">
  <p>batik</p>
</div>','html','["C++","HTML","C"]'::jsonb,null,1,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="waktu">
  <p>bunga</p>
</div>','html','["Ruby","HTML","Go"]'::jsonb,null,1,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "halo";
}','css','["Java","TypeScript","CSS"]'::jsonb,null,2,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "wayang";
}','css','["VBA","TypeScript","CSS"]'::jsonb,null,2,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "dunia";
}','css','["CSS","VBA","JavaScript"]'::jsonb,null,0,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "merdeka";
}','css','["Visual Basic","HTML","CSS"]'::jsonb,null,2,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','fill','Lengkapi kode CSS ini agar valid','Complete this CSS code so it is valid','.pesan::after {
  ____: "sate";
}','css','["puts","MsgBox","content"]'::jsonb,null,2,'content adalah bagian khas CSS. Mengatur tampilan halaman web.','content is characteristic of CSS. Styles web pages.','Kata yang hilang terdiri dari 7 karakter, diawali "c" dan diakhiri "t". Ciri bahasa ini: Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan.','The missing word has 7 characters, starts with "c" and ends with "t". About this language: Contains selectors and ''name: value;'' property blocks that control appearance.'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "bakso";
}','css','["Lua","CSS","VBA"]'::jsonb,null,1,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "padang"','powershell','["Bash","Java","PowerShell"]'::jsonb,null,2,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "merdeka"','powershell','["SQL","HTML","PowerShell"]'::jsonb,null,2,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "bakso"','powershell','["TypeScript","JavaScript","PowerShell"]'::jsonb,null,2,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "durian"','powershell','["C#","PowerShell","Ruby"]'::jsonb,null,1,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','fill','Lengkapi kode PowerShell ini agar valid','Complete this PowerShell code so it is valid','____ "hujan"','powershell','["System.out.println","Write-Host","MsgBox"]'::jsonb,null,1,'Write-Host adalah bagian khas PowerShell. Shell dan otomasi Windows berbasis objek.','Write-Host is characteristic of PowerShell. Object-based shell and automation for Windows.','Kata yang hilang terdiri dari 10 karakter, diawali "W" dan diakhiri "t". Ciri bahasa ini: Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (…).','The missing word has 10 characters, starts with "W" and ends with "t". About this language: Commands follow a Verb-Noun pattern with a hyphen (…).'),
('easy','valid','Apakah kode PowerShell ini valid?','Is this PowerShell code valid?','Write-Hostx "sambal"','powershell','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Valid, the code structure is complete","Error: unbalanced parentheses","Error: unknown function or keyword name"]'::jsonb,2,'"Write-Host" salah ketik menjadi "Write-Hostx" sehingga tidak dikenal oleh PowerShell.','"Write-Host" was misspelled as "Write-Hostx", so PowerShell does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "Write-Hostx"). Apakah persis sama dengan yang dikenal PowerShell? Ingat: Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host).','Check the spelling of the main function or keyword (here it reads "Write-Hostx"). Does it match exactly what PowerShell recognizes? Remember: Commands follow a Verb-Noun pattern with a hyphen (Write-Host).'),
('easy','guess','Bahasa apa ini?','Which language is this?','Sub Salam()
  MsgBox "kopi"
End Sub','vb','["VBA","Java","JavaScript"]'::jsonb,null,0,'VBA: Makro Excel dan Office.','VBA: Excel and Office macros.','Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat MsgBox. (Muncul sekitar tahun 1993.)','Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through MsgBox. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Sub Salam()
  MsgBox "hujan"
End Sub','vb','["Python","JavaScript","VBA"]'::jsonb,null,2,'VBA: Makro Excel dan Office.','VBA: Excel and Office macros.','Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat MsgBox. (Muncul sekitar tahun 1993.)','Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through MsgBox. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Sub Salam()
  MsgBox "senja"
End Sub','vb','["Perl","Visual Basic","VBA"]'::jsonb,null,2,'VBA: Makro Excel dan Office.','VBA: Excel and Office macros.','Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat MsgBox. (Muncul sekitar tahun 1993.)','Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through MsgBox. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Sub Salam()
  MsgBox "candi"
End Sub','vb','["TypeScript","Python","VBA"]'::jsonb,null,2,'VBA: Makro Excel dan Office.','VBA: Excel and Office macros.','Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat MsgBox. (Muncul sekitar tahun 1993.)','Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through MsgBox. (First appeared around 1993.)'),
('easy','fill','Lengkapi kode VBA ini agar valid','Complete this VBA code so it is valid','Sub Salam()
  ____ "nasi"
End Sub','vb','["MsgBox","content","echo"]'::jsonb,null,0,'MsgBox adalah bagian khas VBA. Makro Excel dan Office.','MsgBox is characteristic of VBA. Excel and Office macros.','Kata yang hilang terdiri dari 6 karakter, diawali "M" dan diakhiri "x". Ciri bahasa ini: Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat ….','The missing word has 6 characters, starts with "M" and ends with "x". About this language: Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through ….'),
('easy','valid','Apakah kode VBA ini valid?','Is this VBA code valid?','Sub Salam()
  MsgBox "rendang
End Sub','vb','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: unterminated string","Error: unbalanced parentheses"]'::jsonb,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode VBA ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat MsgBox.','Trace every string in this VBA code: does each opening quote have a closing one? Remember: Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through MsgBox.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("angkot".length)','javascript','["8","6","16"]'::jsonb,null,1,'Panjang "angkot" adalah 6.','The length of "angkot" is 6.','Hitung jumlah huruf di antara tanda kutip ("angkot"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("angkot"); the quotes themselves do not count.'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(12):
    total += i
print(total)','python','["132","66","56"]'::jsonb,null,1,'Jumlah 0 sampai 11 = 66.','The sum of 0 through 11 = 66.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 11 (range berhenti sebelum 12). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 11 (range stops before 12). Add up all the values of i.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "batik" << std::endl;
}','cpp','["R","C++","Perl"]'::jsonb,null,1,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(11):
    total += i
print(total)','python','["55","57","53"]'::jsonb,null,0,'Jumlah 0 sampai 10 = 55.','The sum of 0 through 10 = 55.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 10 (range berhenti sebelum 11). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 10 (range stops before 11). Add up all the values of i.'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''tempe'' AS pesan;','sql','["SQL","Perl","Bash"]'::jsonb,null,0,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 9
b = 10
print(a * b)','python','["80","88","90"]'::jsonb,null,2,'9 * 10 = 90 di Python.','9 * 10 = 90 in Python.','Ganti a dengan 9 dan b dengan 10. Operator * mengalikan.','Replace a with 9 and b with 10. The * operator multiplies.'),
('easy','guess','Bahasa apa ini?','Which language is this?','package main
import "fmt"
func main() {
  fmt.Println("gunung")
}','go','["C#","PHP","Go"]'::jsonb,null,2,'Go: Sederhana dan konkuren; dibuat di Google.','Go: Simple and concurrent; created at Google.','Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''. (Muncul sekitar tahun 2009.)','Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword. (First appeared around 2009.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 24
b = 5
print(a - b)','python','["19","20","18"]'::jsonb,null,0,'24 - 5 = 19 di Python.','24 - 5 = 19 in Python.','Ganti a dengan 24 dan b dengan 5. Operator - mengurangkan (a dikurangi b).','Replace a with 24 and b with 5. The - operator subtracts (a minus b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("senja");
  }
}','java','["Java","VBA","PHP"]'::jsonb,null,0,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("durian".length)','javascript','["4","16","6"]'::jsonb,null,2,'Panjang "durian" adalah 6.','The length of "durian" is 6.','Hitung jumlah huruf di antara tanda kutip ("durian"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("durian"); the quotes themselves do not count.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 3
b = 2
print(a - b)','python','["1","11","2"]'::jsonb,null,0,'3 - 2 = 1 di Python.','3 - 2 = 1 in Python.','Ganti a dengan 3 dan b dengan 2. Operator - mengurangkan (a dikurangi b).','Replace a with 3 and b with 2. The - operator subtracts (a minus b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','const pesan: string = "kopi";
console.log(pesan);','typescript','["Python","TypeScript","HTML"]'::jsonb,null,1,'TypeScript: JavaScript dengan tipe statis.','TypeScript: JavaScript with static types.','Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua. (Muncul sekitar tahun 2012.)','Looks like JavaScript, but variables carry a type annotation after a colon. (First appeared around 2012.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <stdio.h>
int main(void) {
  printf("laut\n");
  return 0;
}','c','["C","VBA","R"]'::jsonb,null,0,'C: Dasar sistem operasi; memori dikelola manual.','C: Foundation of operating systems; manual memory management.','Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat. (Muncul sekitar tahun 1972.)','Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function. (First appeared around 1972.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 26
b = 5
print(a - b)','python','["31","22","21"]'::jsonb,null,2,'26 - 5 = 21 di Python.','26 - 5 = 21 in Python.','Ganti a dengan 26 dan b dengan 5. Operator - mengurangkan (a dikurangi b).','Replace a with 26 and b with 5. The - operator subtracts (a minus b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','console.log("angin");','javascript','["JavaScript","Java","Lua"]'::jsonb,null,0,'JavaScript: Bahasa browser, kini juga di server.','JavaScript: The language of the browser, now on servers too.','Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma. (Muncul sekitar tahun 1995.)','Runs in the browser; prints through a ''console'' object and lines end with semicolons. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "senja"
cat(pesan, "\n")','r','["Perl","R","VBA"]'::jsonb,null,1,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 9
b = 3
print(a + b)','python','["22","12","14"]'::jsonb,null,1,'9 + 3 = 12 di Python.','9 + 3 = 12 in Python.','Ganti a dengan 9 dan b dengan 3. Operator + menjumlahkan.','Replace a with 9 and b with 3. The + operator adds.'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(14):
    total += i
print(total)','python','["89","101","91"]'::jsonb,null,2,'Jumlah 0 sampai 13 = 91.','The sum of 0 through 13 = 91.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 13 (range berhenti sebelum 14). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 13 (range stops before 14). Add up all the values of i.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("gado".length)','javascript','["2","8","4"]'::jsonb,null,2,'Panjang "gado" adalah 4.','The length of "gado" is 4.','Hitung jumlah huruf di antara tanda kutip ("gado"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("gado"); the quotes themselves do not count.'),
('easy','fill','Lengkapi kode JavaScript ini agar valid','Complete this JavaScript code so it is valid','____("gado");','javascript','["puts","echo","console.log"]'::jsonb,null,2,'console.log adalah bagian khas JavaScript. Bahasa browser, kini juga di server.','console.log is characteristic of JavaScript. The language of the browser, now on servers too.','Kata yang hilang terdiri dari 11 karakter, diawali "c" dan diakhiri "g". Ciri bahasa ini: Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma.','The missing word has 11 characters, starts with "c" and ends with "g". About this language: Runs in the browser; prints through a ''console'' object and lines end with semicolons.'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(4):
    total += i
print(total)','python','["6","4","12"]'::jsonb,null,0,'Jumlah 0 sampai 3 = 6.','The sum of 0 through 3 = 6.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 3 (range berhenti sebelum 4). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 3 (range stops before 4). Add up all the values of i.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 28
b = 2
print(a + b)','python','["30","28","29"]'::jsonb,null,0,'28 + 2 = 30 di Python.','28 + 2 = 30 in Python.','Ganti a dengan 28 dan b dengan 2. Operator + menjumlahkan.','Replace a with 28 and b with 2. The + operator adds.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 6
b = 8
print(a % b)','python','["4","16","6"]'::jsonb,null,2,'6 % 8 = 6 di Python.','6 % 8 = 6 in Python.','Ganti a dengan 6 dan b dengan 8. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 6 and b with 8. The % operator gives the remainder of the division (a divided by b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','local pesan = "dunia"
print(pesan)','lua','["Lua","Bash","Python"]'::jsonb,null,0,'Lua: Skrip ringan untuk game dan embedded.','Lua: Lightweight scripting for games and embedded use.','Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal. (Muncul sekitar tahun 1993.)','Local variables are marked with ''local''; no semicolons and no curly braces. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Module Program
  Sub Main()
    Console.WriteLine("candi")
  End Sub
End Module','vb','["Visual Basic","C","SQL"]'::jsonb,null,0,'Visual Basic: Bahasa berbasis BASIC dari Microsoft.','Visual Basic: Microsoft''s BASIC-based language.','Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma. (Muncul sekitar tahun 1991.)','Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','console.log("gunung");','javascript','["C","Python","JavaScript"]'::jsonb,null,2,'JavaScript: Bahasa browser, kini juga di server.','JavaScript: The language of the browser, now on servers too.','Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma. (Muncul sekitar tahun 1995.)','Runs in the browser; prints through a ''console'' object and lines end with semicolons. (First appeared around 1995.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("pantai".repeat(2))','javascript','["pantai","pantaipantaipantai","pantaipantai"]'::jsonb,null,2,'repeat(2) mengulang string 2 kali.','repeat(2) repeats the string 2 times.','repeat(2) menyambung string "pantai" sebanyak 2 kali, tanpa spasi di antaranya.','repeat(2) joins the string "pantai" 2 times, with no spaces between.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 6
b = 3
print(a + b)','python','["11","9","8"]'::jsonb,null,1,'6 + 3 = 9 di Python.','6 + 3 = 9 in Python.','Ganti a dengan 6 dan b dengan 3. Operator + menjumlahkan.','Replace a with 6 and b with 3. The + operator adds.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("kerupuk".length)','javascript','["8","7","9"]'::jsonb,null,1,'Panjang "kerupuk" adalah 7.','The length of "kerupuk" is 7.','Hitung jumlah huruf di antara tanda kutip ("kerupuk"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("kerupuk"); the quotes themselves do not count.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("bakso".repeat(2))','javascript','["bakso","baksobaksobakso","baksobakso"]'::jsonb,null,2,'repeat(2) mengulang string 2 kali.','repeat(2) repeats the string 2 times.','repeat(2) menyambung string "bakso" sebanyak 2 kali, tanpa spasi di antaranya.','repeat(2) joins the string "bakso" 2 times, with no spaces between.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 17
b = 4
print(a + b)','python','["42","21","23"]'::jsonb,null,1,'17 + 4 = 21 di Python.','17 + 4 = 21 in Python.','Ganti a dengan 17 dan b dengan 4. Operator + menjumlahkan.','Replace a with 17 and b with 4. The + operator adds.'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(13):
    total += i
print(total)','python','["78","77","68"]'::jsonb,null,0,'Jumlah 0 sampai 12 = 78.','The sum of 0 through 12 = 78.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 12 (range berhenti sebelum 13). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 12 (range stops before 13). Add up all the values of i.'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(7):
    total += i
print(total)','python','["21","20","31"]'::jsonb,null,0,'Jumlah 0 sampai 6 = 21.','The sum of 0 through 6 = 21.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 6 (range berhenti sebelum 7). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 6 (range stops before 7). Add up all the values of i.'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="indeks">
  <p>kopi</p>
</div>','html','["C++","TypeScript","HTML"]'::jsonb,null,2,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','valid','Apakah kode PHP ini valid?','Is this PHP code valid?','<?php
echo "laut;
?>','php','["Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unknown function or keyword name","Valid, the code structure is complete"]'::jsonb,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode PHP ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''echo''.','Trace every string in this PHP code: does each opening quote have a closing one? Remember: Code sits between tags that open with a question mark; printing uses the word ''echo''.'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("gado");
  }
}','java','["Bash","Visual Basic","Java"]'::jsonb,null,2,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(9):
    total += i
print(total)','python','["35","36","34"]'::jsonb,null,1,'Jumlah 0 sampai 8 = 36.','The sum of 0 through 8 = 36.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 8 (range berhenti sebelum 9). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 8 (range stops before 9). Add up all the values of i.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("sate".repeat(4))','javascript','["satesatesate","satesatesatesatesate","satesatesatesate"]'::jsonb,null,2,'repeat(4) mengulang string 4 kali.','repeat(4) repeats the string 4 times.','repeat(4) menyambung string "sate" sebanyak 4 kali, tanpa spasi di antaranya.','repeat(4) joins the string "sate" 4 times, with no spaces between.'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''gado'' AS pesan;','sql','["Ruby","Go","SQL"]'::jsonb,null,2,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("tempe");
  }
}','java','["Java","HTML","JavaScript"]'::jsonb,null,0,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 7
b = 11
print(a // b)','python','["2","0","1"]'::jsonb,null,1,'7 // 11 = 0 di Python.','7 // 11 = 0 in Python.','Ganti a dengan 7 dan b dengan 11. Operator // membagi lalu membulatkan ke bawah (pembagian bulat).','Replace a with 7 and b with 11. The // operator divides and rounds down (integer division).'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("nasi".repeat(3))','javascript','["nasinasinasinasi","nasinasinasi","nasinasi"]'::jsonb,null,1,'repeat(3) mengulang string 3 kali.','repeat(3) repeats the string 3 times.','repeat(3) menyambung string "nasi" sebanyak 3 kali, tanpa spasi di antaranya.','repeat(3) joins the string "nasi" 3 times, with no spaces between.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 3
b = 12
print(a % b)','python','["3","5","1"]'::jsonb,null,0,'3 % 12 = 3 di Python.','3 % 12 = 3 in Python.','Ganti a dengan 3 dan b dengan 12. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 3 and b with 12. The % operator gives the remainder of the division (a divided by b).'),
('easy','fill','Lengkapi kode Ruby ini agar valid','Complete this Ruby code so it is valid','____ "sawah"','ruby','["Write-Host","puts","console.log"]'::jsonb,null,1,'puts adalah bagian khas Ruby. Ramah programmer; basis Rails.','puts is characteristic of Ruby. Programmer-friendly; the basis of Rails.','Kata yang hilang terdiri dari 4 karakter, diawali "p" dan diakhiri "s". Ciri bahasa ini: Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''…''.','The missing word has 4 characters, starts with "p" and ends with "s". About this language: Very terse: no curly braces or semicolons, and printing is the short word ''…''.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("hujan".repeat(3))','javascript','["hujanhujanhujan","hujanhujanhujanhujan","hujanhujan"]'::jsonb,null,0,'repeat(3) mengulang string 3 kali.','repeat(3) repeats the string 3 times.','repeat(3) menyambung string "hujan" sebanyak 3 kali, tanpa spasi di antaranya.','repeat(3) joins the string "hujan" 3 times, with no spaces between.'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "rendang"
cat(pesan, "\n")','r','["VBA","R","Perl"]'::jsonb,null,1,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 17
b = 2
print(a * b)','python','["44","34","68"]'::jsonb,null,1,'17 * 2 = 34 di Python.','17 * 2 = 34 in Python.','Ganti a dengan 17 dan b dengan 2. Operator * mengalikan.','Replace a with 17 and b with 2. The * operator multiplies.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 16
b = 10
print(a * b)','python','["162","150","160"]'::jsonb,null,2,'16 * 10 = 160 di Python.','16 * 10 = 160 in Python.','Ganti a dengan 16 dan b dengan 10. Operator * mengalikan.','Replace a with 16 and b with 10. The * operator multiplies.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 15
b = 12
print(a % b)','python','["2","3","13"]'::jsonb,null,1,'15 % 12 = 3 di Python.','15 % 12 = 3 in Python.','Ganti a dengan 15 dan b dengan 12. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 15 and b with 12. The % operator gives the remainder of the division (a divided by b).'),
('easy','valid','Apakah kode C++ ini valid?','Is this C++ code valid?','#include <iostream>
int main() {
  std::cout << "kopi << std::endl;
}','cpp','["Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan","Error: string tidak ditutup"]'::jsonb,'["Valid, the code structure is complete","Error: program entry point not found","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode C++ ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar.','Trace every string in this C++ code: does each opening quote have a closing one? Remember: C-like, but prints with the ''<<'' stream operator on a standard output object.'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("padang")

main()','python','["R","VBA","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 26
b = 11
print(a * b)','python','["276","286","284"]'::jsonb,null,1,'26 * 11 = 286 di Python.','26 * 11 = 286 in Python.','Ganti a dengan 26 dan b dengan 11. Operator * mengalikan.','Replace a with 26 and b with 11. The * operator multiplies.'),
('easy','fill','Lengkapi kode C ini agar valid','Complete this C code so it is valid','#include <stdio.h>
int main(void) {
  ____("pantai\n");
  return 0;
}','c','["echo","printf","fmt.Println"]'::jsonb,null,1,'printf adalah bagian khas C. Dasar sistem operasi; memori dikelola manual.','printf is characteristic of C. Foundation of operating systems; manual memory management.','Kata yang hilang terdiri dari 6 karakter, diawali "p" dan diakhiri "f". Ciri bahasa ini: Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat.','The missing word has 6 characters, starts with "p" and ends with "f". About this language: Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 7
b = 9
print(a % b)','python','["7","5","9"]'::jsonb,null,0,'7 % 9 = 7 di Python.','7 % 9 = 7 in Python.','Ganti a dengan 7 dan b dengan 9. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 7 and b with 9. The % operator gives the remainder of the division (a divided by b).'),
('easy','valid','Apakah kode Go ini valid?','Is this Go code valid?','package main
import "fmt"
func main() {
  fmt.Println("tempe")
}','go','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Error: unterminated string","Valid, the code structure is complete","Error: program entry point not found"]'::jsonb,1,'Kode Go ini lengkap dan valid. Sederhana dan konkuren; dibuat di Google.','This Go code is complete and valid. Simple and concurrent; created at Google.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword.'),
('easy','fill','Lengkapi kode Python ini agar valid','Complete this Python code so it is valid','def main():
    ____("angkot")

main()','python','["print","Console.WriteLine","printf"]'::jsonb,null,0,'print adalah bagian khas Python. Terbaca dan serbaguna: web, data, AI.','print is characteristic of Python. Readable and versatile: web, data, AI.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("tempe".length)','javascript','["3","15","5"]'::jsonb,null,2,'Panjang "tempe" adalah 5.','The length of "tempe" is 5.','Hitung jumlah huruf di antara tanda kutip ("tempe"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("tempe"); the quotes themselves do not count.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 14
b = 11
print(a % b)','python','["4","1","3"]'::jsonb,null,2,'14 % 11 = 3 di Python.','14 % 11 = 3 in Python.','Ganti a dengan 14 dan b dengan 11. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 14 and b with 11. The % operator gives the remainder of the division (a divided by b).'),
('easy','fill','Lengkapi kode Go ini agar valid','Complete this Go code so it is valid','package main
import "fmt"
func main() {
  ____("bakso")
}','go','["std::cout","Write-Host","fmt.Println"]'::jsonb,null,2,'fmt.Println adalah bagian khas Go. Sederhana dan konkuren; dibuat di Google.','fmt.Println is characteristic of Go. Simple and concurrent; created at Google.','Kata yang hilang terdiri dari 11 karakter, diawali "f" dan diakhiri "n". Ciri bahasa ini: Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''.','The missing word has 11 characters, starts with "f" and ends with "n". About this language: Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword.'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("sambal")

main()','python','["Python","HTML","Go"]'::jsonb,null,0,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','fill','Lengkapi kode Java ini agar valid','Complete this Java code so it is valid','public class Main {
  public static void main(String[] args) {
    ____("dunia");
  }
}','java','["print","puts","System.out.println"]'::jsonb,null,2,'System.out.println adalah bagian khas Java. Write once, run anywhere lewat JVM.','System.out.println is characteristic of Java. Write once, run anywhere via the JVM.','Kata yang hilang terdiri dari 18 karakter, diawali "S" dan diakhiri "n". Ciri bahasa ini: Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void.','The missing word has 18 characters, starts with "S" and ends with "n". About this language: Everything lives inside a class; the entry point is a public static void ''main'' method.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#!/bin/bash
echo "pantai"','bash','["HTML","Bash","C"]'::jsonb,null,1,'Bash: Shell skrip Unix/Linux.','Bash: Unix/Linux shell scripting.','Diawali baris ''#!'' (shebang) dan perintah shell ''echo''. (Muncul sekitar tahun 1989.)','Starts with a ''#!'' (shebang) line and the shell command ''echo''. (First appeared around 1989.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 4
b = 7
print(a // b)','python','["0","2","1"]'::jsonb,null,0,'4 // 7 = 0 di Python.','4 // 7 = 0 in Python.','Ganti a dengan 4 dan b dengan 7. Operator // membagi lalu membulatkan ke bawah (pembagian bulat).','Replace a with 4 and b with 7. The // operator divides and rounds down (integer division).'),
('easy','guess','Bahasa apa ini?','Which language is this?','local pesan = "sawah"
print(pesan)','lua','["Ruby","TypeScript","Lua"]'::jsonb,null,2,'Lua: Skrip ringan untuk game dan embedded.','Lua: Lightweight scripting for games and embedded use.','Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal. (Muncul sekitar tahun 1993.)','Local variables are marked with ''local''; no semicolons and no curly braces. (First appeared around 1993.)'),
('easy','valid','Apakah kode C ini valid?','Is this C code valid?','#include <stdio.h>
int main(void) {
  printf("kopi\n";
  return 0;
}','c','["Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unbalanced parentheses","Error: unknown function or keyword name","Valid, the code structure is complete"]'::jsonb,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function.'),
('easy','valid','Apakah kode Lua ini valid?','Is this Lua code valid?','local pesan = "tempe"
print(pesan)','lua','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,2,'Kode Lua ini lengkap dan valid. Skrip ringan untuk game dan embedded.','This Lua code is complete and valid. Lightweight scripting for games and embedded use.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Local variables are marked with ''local''; no semicolons and no curly braces.'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(10):
    total += i
print(total)','python','["43","47","45"]'::jsonb,null,2,'Jumlah 0 sampai 9 = 45.','The sum of 0 through 9 = 45.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 9 (range berhenti sebelum 10). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 9 (range stops before 10). Add up all the values of i.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 17
b = 11
print(a * b)','python','["186","187","197"]'::jsonb,null,1,'17 * 11 = 187 di Python.','17 * 11 = 187 in Python.','Ganti a dengan 17 dan b dengan 11. Operator * mengalikan.','Replace a with 17 and b with 11. The * operator multiplies.'),
('easy','valid','Apakah kode Perl ini valid?','Is this Perl code valid?','use strict;
print "angkot\n";','perl','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: program entry point not found"]'::jsonb,1,'Kode Perl ini lengkap dan valid. Pengolah teks dan skrip sistem klasik.','This Perl code is complete and valid. Classic text processing and system scripting.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n.'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "merdeka"
cat(pesan, "\n")','r','["R","C#","Visual Basic"]'::jsonb,null,0,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "dunia" << std::endl;
}','cpp','["Go","C++","Python"]'::jsonb,null,1,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("rendang".repeat(4))','javascript','["rendangrendangrendangrendangrendang","rendangrendangrendangrendang","rendangrendangrendang"]'::jsonb,null,1,'repeat(4) mengulang string 4 kali.','repeat(4) repeats the string 4 times.','repeat(4) menyambung string "rendang" sebanyak 4 kali, tanpa spasi di antaranya.','repeat(4) joins the string "rendang" 4 times, with no spaces between.'),
('easy','guess','Bahasa apa ini?','Which language is this?','console.log("gado");','javascript','["JavaScript","Java","Python"]'::jsonb,null,0,'JavaScript: Bahasa browser, kini juga di server.','JavaScript: The language of the browser, now on servers too.','Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma. (Muncul sekitar tahun 1995.)','Runs in the browser; prints through a ''console'' object and lines end with semicolons. (First appeared around 1995.)'),
('easy','fill','Lengkapi kode SQL ini agar valid','Complete this SQL code so it is valid','____ ''durian'' AS pesan;','sql','["fmt.Println","cat","SELECT"]'::jsonb,null,2,'SELECT adalah bagian khas SQL. Bahasa query basis data relasional.','SELECT is characteristic of SQL. The query language for relational databases.','Kata yang hilang terdiri dari 6 karakter, diawali "S" dan diakhiri "T". Ciri bahasa ini: Kueri deklaratif: kata kunci huruf besar seperti … dan AS, diakhiri titik koma.','The missing word has 6 characters, starts with "S" and ends with "T". About this language: A declarative query: uppercase keywords like … and AS, ending with a semicolon.'),
('easy','guess','Bahasa apa ini?','Which language is this?','use strict;
print "rendang\n";','perl','["SQL","Perl","Ruby"]'::jsonb,null,1,'Perl: Pengolah teks dan skrip sistem klasik.','Perl: Classic text processing and system scripting.','Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n. (Muncul sekitar tahun 1987.)','Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n. (First appeared around 1987.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <stdio.h>
int main(void) {
  printf("halo\n");
  return 0;
}','c','["TypeScript","Visual Basic","C"]'::jsonb,null,2,'C: Dasar sistem operasi; memori dikelola manual.','C: Foundation of operating systems; manual memory management.','Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat. (Muncul sekitar tahun 1972.)','Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function. (First appeared around 1972.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 14
b = 9
print(a - b)','python','["3","5","4"]'::jsonb,null,1,'14 - 9 = 5 di Python.','14 - 9 = 5 in Python.','Ganti a dengan 14 dan b dengan 9. Operator - mengurangkan (a dikurangi b).','Replace a with 14 and b with 9. The - operator subtracts (a minus b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="level">
  <p>hujan</p>
</div>','html','["VBA","TypeScript","HTML"]'::jsonb,null,2,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','valid','Apakah kode JavaScript ini valid?','Is this JavaScript code valid?','console.log("merdeka);','javascript','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode JavaScript ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma.','Trace every string in this JavaScript code: does each opening quote have a closing one? Remember: Runs in the browser; prints through a ''console'' object and lines end with semicolons.'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "kopi"','powershell','["C","PowerShell","Perl"]'::jsonb,null,1,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(3):
    total += i
print(total)','python','["3","2","1"]'::jsonb,null,0,'Jumlah 0 sampai 2 = 3.','The sum of 0 through 2 = 3.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 2 (range berhenti sebelum 3). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 2 (range stops before 3). Add up all the values of i.'),
('easy','valid','Apakah kode Ruby ini valid?','Is this Ruby code valid?','putsx "kerupuk"','ruby','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Valid, the code structure is complete","Error: unknown function or keyword name","Error: program entry point not found"]'::jsonb,1,'"puts" salah ketik menjadi "putsx" sehingga tidak dikenal oleh Ruby.','"puts" was misspelled as "putsx", so Ruby does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "putsx"). Apakah persis sama dengan yang dikenal Ruby? Ingat: Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''.','Check the spelling of the main function or keyword (here it reads "putsx"). Does it match exactly what Ruby recognizes? Remember: Very terse: no curly braces or semicolons, and printing is the short word ''puts''.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 19
b = 7
print(a % b)','python','["5","4","7"]'::jsonb,null,0,'19 % 7 = 5 di Python.','19 % 7 = 5 in Python.','Ganti a dengan 19 dan b dengan 7. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 19 and b with 7. The % operator gives the remainder of the division (a divided by b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "angkot" << std::endl;
}','cpp','["C++","Go","Java"]'::jsonb,null,0,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','fill','Lengkapi kode VBA ini agar valid','Complete this VBA code so it is valid','Sub Salam()
  ____ "becak"
End Sub','vb','["puts","MsgBox","cat"]'::jsonb,null,1,'MsgBox adalah bagian khas VBA. Makro Excel dan Office.','MsgBox is characteristic of VBA. Excel and Office macros.','Kata yang hilang terdiri dari 6 karakter, diawali "M" dan diakhiri "x". Ciri bahasa ini: Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat ….','The missing word has 6 characters, starts with "M" and ends with "x". About this language: Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through ….'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 6
b = 3
print(a * b)','python','["28","18","19"]'::jsonb,null,1,'6 * 3 = 18 di Python.','6 * 3 = 18 in Python.','Ganti a dengan 6 dan b dengan 3. Operator * mengalikan.','Replace a with 6 and b with 3. The * operator multiplies.'),
('easy','guess','Bahasa apa ini?','Which language is this?','pesan <- "durian"
cat(pesan, "\n")','r','["C","VBA","R"]'::jsonb,null,2,'R: Statistik dan analisis data.','R: Statistics and data analysis.','Penugasan memakai panah ''<-'' dan keluaran lewat fungsi ''cat''; populer untuk statistik. (Muncul sekitar tahun 1993.)','Assignment uses the ''<-'' arrow and output goes through ''cat''; popular for statistics. (First appeared around 1993.)'),
('easy','fill','Lengkapi kode SQL ini agar valid','Complete this SQL code so it is valid','____ ''senja'' AS pesan;','sql','["SELECT","Console.WriteLine","cat"]'::jsonb,null,0,'SELECT adalah bagian khas SQL. Bahasa query basis data relasional.','SELECT is characteristic of SQL. The query language for relational databases.','Kata yang hilang terdiri dari 6 karakter, diawali "S" dan diakhiri "T". Ciri bahasa ini: Kueri deklaratif: kata kunci huruf besar seperti … dan AS, diakhiri titik koma.','The missing word has 6 characters, starts with "S" and ends with "T". About this language: A declarative query: uppercase keywords like … and AS, ending with a semicolon.'),
('easy','valid','Apakah kode Python ini valid?','Is this Python code valid?','def main():
    print("dunia")

main()','python','["Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,2,'Kode Python ini lengkap dan valid. Terbaca dan serbaguna: web, data, AI.','This Python code is complete and valid. Readable and versatile: web, data, AI.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 22
b = 10
print(a * b)','python','["220","222","218"]'::jsonb,null,0,'22 * 10 = 220 di Python.','22 * 10 = 220 in Python.','Ganti a dengan 22 dan b dengan 10. Operator * mengalikan.','Replace a with 22 and b with 10. The * operator multiplies.'),
('easy','valid','Apakah kode Python ini valid?','Is this Python code valid?','def main():
    printx("becak")

main()','python','["Error: nama fungsi atau kata kunci tidak dikenal","Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: program entry point not found","Valid, the code structure is complete"]'::jsonb,0,'"print" salah ketik menjadi "printx" sehingga tidak dikenal oleh Python.','"print" was misspelled as "printx", so Python does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "printx"). Apakah persis sama dengan yang dikenal Python? Ingat: Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf.','Check the spelling of the main function or keyword (here it reads "printx"). Does it match exactly what Python recognizes? Remember: Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword.'),
('easy','fill','Lengkapi kode CSS ini agar valid','Complete this CSS code so it is valid','.pesan::after {
  ____: "dunia";
}','css','["content","console.log","echo"]'::jsonb,null,0,'content adalah bagian khas CSS. Mengatur tampilan halaman web.','content is characteristic of CSS. Styles web pages.','Kata yang hilang terdiri dari 7 karakter, diawali "c" dan diakhiri "t". Ciri bahasa ini: Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan.','The missing word has 7 characters, starts with "c" and ends with "t". About this language: Contains selectors and ''name: value;'' property blocks that control appearance.'),
('easy','valid','Apakah kode Go ini valid?','Is this Go code valid?','package main
import "fmt"
func main() {
  fmt.Printlnx("gado")
}','go','["Error: nama fungsi atau kata kunci tidak dikenal","Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: program entry point not found","Valid, the code structure is complete"]'::jsonb,0,'"fmt.Println" salah ketik menjadi "fmt.Printlnx" sehingga tidak dikenal oleh Go.','"fmt.Println" was misspelled as "fmt.Printlnx", so Go does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "fmt.Printlnx"). Apakah persis sama dengan yang dikenal Go? Ingat: Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''.','Check the spelling of the main function or keyword (here it reads "fmt.Printlnx"). Does it match exactly what Go recognizes? Remember: Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "gado" << std::endl;
}','cpp','["Java","HTML","C++"]'::jsonb,null,2,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("wayang".length)','javascript','["8","16","6"]'::jsonb,null,2,'Panjang "wayang" adalah 6.','The length of "wayang" is 6.','Hitung jumlah huruf di antara tanda kutip ("wayang"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("wayang"); the quotes themselves do not count.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("halo".length)','javascript','["6","4","8"]'::jsonb,null,1,'Panjang "halo" adalah 4.','The length of "halo" is 4.','Hitung jumlah huruf di antara tanda kutip ("halo"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("halo"); the quotes themselves do not count.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#!/bin/bash
echo "durian"','bash','["Bash","VBA","C++"]'::jsonb,null,0,'Bash: Shell skrip Unix/Linux.','Bash: Unix/Linux shell scripting.','Diawali baris ''#!'' (shebang) dan perintah shell ''echo''. (Muncul sekitar tahun 1989.)','Starts with a ''#!'' (shebang) line and the shell command ''echo''. (First appeared around 1989.)'),
('easy','fill','Lengkapi kode Ruby ini agar valid','Complete this Ruby code so it is valid','____ "angkot"','ruby','["std::cout","print","puts"]'::jsonb,null,2,'puts adalah bagian khas Ruby. Ramah programmer; basis Rails.','puts is characteristic of Ruby. Programmer-friendly; the basis of Rails.','Kata yang hilang terdiri dari 4 karakter, diawali "p" dan diakhiri "s". Ciri bahasa ini: Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''…''.','The missing word has 4 characters, starts with "p" and ends with "s". About this language: Very terse: no curly braces or semicolons, and printing is the short word ''…''.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("garuda".length)','javascript','["6","12","5"]'::jsonb,null,0,'Panjang "garuda" adalah 6.','The length of "garuda" is 6.','Hitung jumlah huruf di antara tanda kutip ("garuda"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("garuda"); the quotes themselves do not count.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("sawah".repeat(4))','javascript','["sawahsawahsawahsawahsawah","sawahsawahsawah","sawahsawahsawahsawah"]'::jsonb,null,2,'repeat(4) mengulang string 4 kali.','repeat(4) repeats the string 4 times.','repeat(4) menyambung string "sawah" sebanyak 4 kali, tanpa spasi di antaranya.','repeat(4) joins the string "sawah" 4 times, with no spaces between.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 7
b = 11
print(a + b)','python','["16","17","18"]'::jsonb,null,2,'7 + 11 = 18 di Python.','7 + 11 = 18 in Python.','Ganti a dengan 7 dan b dengan 11. Operator + menjumlahkan.','Replace a with 7 and b with 11. The + operator adds.'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="nilai">
  <p>pantai</p>
</div>','html','["C","Go","HTML"]'::jsonb,null,2,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 3
b = 5
print(a // b)','python','["2","1","0"]'::jsonb,null,2,'3 // 5 = 0 di Python.','3 // 5 = 0 in Python.','Ganti a dengan 3 dan b dengan 5. Operator // membagi lalu membulatkan ke bawah (pembagian bulat).','Replace a with 3 and b with 5. The // operator divides and rounds down (integer division).'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 14
b = 7
print(a - b)','python','["8","14","7"]'::jsonb,null,2,'14 - 7 = 7 di Python.','14 - 7 = 7 in Python.','Ganti a dengan 14 dan b dengan 7. Operator - mengurangkan (a dikurangi b).','Replace a with 14 and b with 7. The - operator subtracts (a minus b).'),
('easy','fill','Lengkapi kode Lua ini agar valid','Complete this Lua code so it is valid','local pesan = "sate"
____(pesan)','lua','["fmt.Println","print","console.log"]'::jsonb,null,1,'print adalah bagian khas Lua. Skrip ringan untuk game dan embedded.','print is characteristic of Lua. Lightweight scripting for games and embedded use.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: Local variables are marked with ''local''; no semicolons and no curly braces.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("bunga".length)','javascript','["3","5","10"]'::jsonb,null,1,'Panjang "bunga" adalah 5.','The length of "bunga" is 5.','Hitung jumlah huruf di antara tanda kutip ("bunga"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("bunga"); the quotes themselves do not count.'),
('easy','valid','Apakah kode Ruby ini valid?','Is this Ruby code valid?','puts "angkot"','ruby','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: unknown function or keyword name","Error: unbalanced parentheses"]'::jsonb,0,'Kode Ruby ini lengkap dan valid. Ramah programmer; basis Rails.','This Ruby code is complete and valid. Programmer-friendly; the basis of Rails.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Very terse: no curly braces or semicolons, and printing is the short word ''puts''.'),
('easy','guess','Bahasa apa ini?','Which language is this?','Module Program
  Sub Main()
    Console.WriteLine("nasi")
  End Sub
End Module','vb','["HTML","Visual Basic","C"]'::jsonb,null,1,'Visual Basic: Bahasa berbasis BASIC dari Microsoft.','Visual Basic: Microsoft''s BASIC-based language.','Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma. (Muncul sekitar tahun 1991.)','Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon. (First appeared around 1991.)'),
('easy','valid','Apakah kode Java ini valid?','Is this Java code valid?','public class Main {
  public static void main(String[] args) {
    System.out.println("gado";
  }
}','java','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Everything lives inside a class; the entry point is a public static void ''main'' method.'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''sambal'' AS pesan;','sql','["Python","SQL","C#"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="total">
  <p>bakso</p>
</div>','html','["C++","HTML","Perl"]'::jsonb,null,1,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','fill','Lengkapi kode PowerShell ini agar valid','Complete this PowerShell code so it is valid','____ "laut"','powershell','["print","Write-Host","Console.WriteLine"]'::jsonb,null,1,'Write-Host adalah bagian khas PowerShell. Shell dan otomasi Windows berbasis objek.','Write-Host is characteristic of PowerShell. Object-based shell and automation for Windows.','Kata yang hilang terdiri dari 10 karakter, diawali "W" dan diakhiri "t". Ciri bahasa ini: Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (…).','The missing word has 10 characters, starts with "W" and ends with "t". About this language: Commands follow a Verb-Noun pattern with a hyphen (…).'),
('easy','guess','Bahasa apa ini?','Which language is this?','use strict;
print "durian\n";','perl','["CSS","Perl","PHP"]'::jsonb,null,1,'Perl: Pengolah teks dan skrip sistem klasik.','Perl: Classic text processing and system scripting.','Memakai ''use strict;'' dan mencetak dengan ''print'' yang diikuti string berakhiran \n. (Muncul sekitar tahun 1987.)','Uses ''use strict;'' and prints with ''print'' followed by a string ending in \n. (First appeared around 1987.)'),
('easy','fill','Lengkapi kode JavaScript ini agar valid','Complete this JavaScript code so it is valid','____("kerupuk");','javascript','["console.log","Console.WriteLine","content"]'::jsonb,null,0,'console.log adalah bagian khas JavaScript. Bahasa browser, kini juga di server.','console.log is characteristic of JavaScript. The language of the browser, now on servers too.','Kata yang hilang terdiri dari 11 karakter, diawali "c" dan diakhiri "g". Ciri bahasa ini: Berjalan di browser; mencetak lewat objek ''console'' dan baris diakhiri titik koma.','The missing word has 11 characters, starts with "c" and ends with "g". About this language: Runs in the browser; prints through a ''console'' object and lines end with semicolons.'),
('easy','valid','Apakah kode Java ini valid?','Is this Java code valid?','public class Main {
  public static void main(String[] args) {
    System.out.println("tempe");
  }
}','java','["Error: nama fungsi atau kata kunci tidak dikenal","Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: program entry point not found","Valid, the code structure is complete"]'::jsonb,2,'Kode Java ini lengkap dan valid. Write once, run anywhere lewat JVM.','This Java code is complete and valid. Write once, run anywhere via the JVM.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Everything lives inside a class; the entry point is a public static void ''main'' method.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 10
b = 6
print(a // b)','python','["1","11","2"]'::jsonb,null,0,'10 // 6 = 1 di Python.','10 // 6 = 1 in Python.','Ganti a dengan 10 dan b dengan 6. Operator // membagi lalu membulatkan ke bawah (pembagian bulat).','Replace a with 10 and b with 6. The // operator divides and rounds down (integer division).'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("candi".length)','javascript','["5","6","3"]'::jsonb,null,0,'Panjang "candi" adalah 5.','The length of "candi" is 5.','Hitung jumlah huruf di antara tanda kutip ("candi"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("candi"); the quotes themselves do not count.'),
('easy','valid','Apakah kode VBA ini valid?','Is this VBA code valid?','Sub Salam()
  MsgBox "angin"
End Sub','vb','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Valid, the code structure is complete","Error: unknown function or keyword name","Error: program entry point not found"]'::jsonb,0,'Kode VBA ini lengkap dan valid. Makro Excel dan Office.','This VBA code is complete and valid. Excel and Office macros.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat MsgBox.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through MsgBox.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 30
b = 3
print(a * b)','python','["91","92","90"]'::jsonb,null,2,'30 * 3 = 90 di Python.','30 * 3 = 90 in Python.','Ganti a dengan 30 dan b dengan 3. Operator * mengalikan.','Replace a with 30 and b with 3. The * operator multiplies.'),
('easy','guess','Bahasa apa ini?','Which language is this?','puts "halo"','ruby','["PowerShell","CSS","Ruby"]'::jsonb,null,2,'Ruby: Ramah programmer; basis Rails.','Ruby: Programmer-friendly; the basis of Rails.','Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''. (Muncul sekitar tahun 1995.)','Very terse: no curly braces or semicolons, and printing is the short word ''puts''. (First appeared around 1995.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 5
b = 3
print(a * b)','python','["13","15","16"]'::jsonb,null,1,'5 * 3 = 15 di Python.','5 * 3 = 15 in Python.','Ganti a dengan 5 dan b dengan 3. Operator * mengalikan.','Replace a with 5 and b with 3. The * operator multiplies.'),
('easy','output','Berapa nilai total di akhir?','What is the final value of total?','total = 0
for i in range(15):
    total += i
print(total)','python','["106","105","104"]'::jsonb,null,1,'Jumlah 0 sampai 14 = 105.','The sum of 0 through 14 = 105.','total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai 14 (range berhenti sebelum 15). Jumlahkan semua nilai i.','total starts at 0 and gets i added on every pass. i runs from 0 to 14 (range stops before 15). Add up all the values of i.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("angkot".repeat(3))','javascript','["angkotangkotangkot","angkotangkotangkotangkot","angkotangkot"]'::jsonb,null,0,'repeat(3) mengulang string 3 kali.','repeat(3) repeats the string 3 times.','repeat(3) menyambung string "angkot" sebanyak 3 kali, tanpa spasi di antaranya.','repeat(3) joins the string "angkot" 3 times, with no spaces between.'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "gado";
}','css','["TypeScript","PHP","CSS"]'::jsonb,null,2,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','puts "nasi"','ruby','["Ruby","JavaScript","Bash"]'::jsonb,null,0,'Ruby: Ramah programmer; basis Rails.','Ruby: Programmer-friendly; the basis of Rails.','Sangat ringkas: tanpa kurung kurawal maupun titik koma, perintah cetaknya kata pendek ''puts''. (Muncul sekitar tahun 1995.)','Very terse: no curly braces or semicolons, and printing is the short word ''puts''. (First appeared around 1995.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("gado")

main()','python','["VBA","PHP","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "sate";
}','css','["C#","CSS","SQL"]'::jsonb,null,1,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 19
b = 2
print(a + b)','python','["20","22","21"]'::jsonb,null,2,'19 + 2 = 21 di Python.','19 + 2 = 21 in Python.','Ganti a dengan 19 dan b dengan 2. Operator + menjumlahkan.','Replace a with 19 and b with 2. The + operator adds.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 20
b = 5
print(a + b)','python','["25","23","26"]'::jsonb,null,0,'20 + 5 = 25 di Python.','20 + 5 = 25 in Python.','Ganti a dengan 20 dan b dengan 5. Operator + menjumlahkan.','Replace a with 20 and b with 5. The + operator adds.'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "angkot"','powershell','["SQL","Lua","PowerShell"]'::jsonb,null,2,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 5
b = 4
print(a // b)','python','["1","11","2"]'::jsonb,null,0,'5 // 4 = 1 di Python.','5 // 4 = 1 in Python.','Ganti a dengan 5 dan b dengan 4. Operator // membagi lalu membulatkan ke bawah (pembagian bulat).','Replace a with 5 and b with 4. The // operator divides and rounds down (integer division).'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("tempe".repeat(4))','javascript','["tempetempetempetempetempe","tempetempetempe","tempetempetempetempe"]'::jsonb,null,2,'repeat(4) mengulang string 4 kali.','repeat(4) repeats the string 4 times.','repeat(4) menyambung string "tempe" sebanyak 4 kali, tanpa spasi di antaranya.','repeat(4) joins the string "tempe" 4 times, with no spaces between.'),
('easy','valid','Apakah kode Java ini valid?','Is this Java code valid?','public class Main {
  public static void main(String[] args) {
    System.out.println("durian");
  }
}','java','["Error: titik masuk program tidak ditemukan","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: program entry point not found","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,2,'Kode Java ini lengkap dan valid. Write once, run anywhere lewat JVM.','This Java code is complete and valid. Write once, run anywhere via the JVM.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Everything lives inside a class; the entry point is a public static void ''main'' method.'),
('easy','fill','Lengkapi kode SQL ini agar valid','Complete this SQL code so it is valid','____ ''padang'' AS pesan;','sql','["SELECT","print","cat"]'::jsonb,null,0,'SELECT adalah bagian khas SQL. Bahasa query basis data relasional.','SELECT is characteristic of SQL. The query language for relational databases.','Kata yang hilang terdiri dari 6 karakter, diawali "S" dan diakhiri "T". Ciri bahasa ini: Kueri deklaratif: kata kunci huruf besar seperti … dan AS, diakhiri titik koma.','The missing word has 6 characters, starts with "S" and ends with "T". About this language: A declarative query: uppercase keywords like … and AS, ending with a semicolon.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 12
b = 9
print(a % b)','python','["3","5","4"]'::jsonb,null,0,'12 % 9 = 3 di Python.','12 % 9 = 3 in Python.','Ganti a dengan 12 dan b dengan 9. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 12 and b with 9. The % operator gives the remainder of the division (a divided by b).'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("sawah".repeat(2))','javascript','["sawahsawah","sawah","sawahsawahsawah"]'::jsonb,null,0,'repeat(2) mengulang string 2 kali.','repeat(2) repeats the string 2 times.','repeat(2) menyambung string "sawah" sebanyak 2 kali, tanpa spasi di antaranya.','repeat(2) joins the string "sawah" 2 times, with no spaces between.'),
('easy','guess','Bahasa apa ini?','Which language is this?','public class Main {
  public static void main(String[] args) {
    System.out.println("nasi");
  }
}','java','["Java","VBA","Bash"]'::jsonb,null,0,'Java: Write once, run anywhere lewat JVM.','Java: Write once, run anywhere via the JVM.','Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void. (Muncul sekitar tahun 1995.)','Everything lives inside a class; the entry point is a public static void ''main'' method. (First appeared around 1995.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 25
b = 5
print(a + b)','python','["30","28","40"]'::jsonb,null,0,'25 + 5 = 30 di Python.','25 + 5 = 30 in Python.','Ganti a dengan 25 dan b dengan 5. Operator + menjumlahkan.','Replace a with 25 and b with 5. The + operator adds.'),
('easy','guess','Bahasa apa ini?','Which language is this?','.pesan::after {
  content: "senja";
}','css','["CSS","R","HTML"]'::jsonb,null,0,'CSS: Mengatur tampilan halaman web.','CSS: Styles web pages.','Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan. (Muncul sekitar tahun 1996.)','Contains selectors and ''name: value;'' property blocks that control appearance. (First appeared around 1996.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("rendang".length)','javascript','["7","8","9"]'::jsonb,null,0,'Panjang "rendang" adalah 7.','The length of "rendang" is 7.','Hitung jumlah huruf di antara tanda kutip ("rendang"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("rendang"); the quotes themselves do not count.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("hujan".repeat(2))','javascript','["hujan","hujanhujan","hujanhujanhujan"]'::jsonb,null,1,'repeat(2) mengulang string 2 kali.','repeat(2) repeats the string 2 times.','repeat(2) menyambung string "hujan" sebanyak 2 kali, tanpa spasi di antaranya.','repeat(2) joins the string "hujan" 2 times, with no spaces between.'),
('easy','guess','Bahasa apa ini?','Which language is this?','const pesan: string = "merdeka";
console.log(pesan);','typescript','["VBA","TypeScript","Java"]'::jsonb,null,1,'TypeScript: JavaScript dengan tipe statis.','TypeScript: JavaScript with static types.','Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua. (Muncul sekitar tahun 2012.)','Looks like JavaScript, but variables carry a type annotation after a colon. (First appeared around 2012.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','package main
import "fmt"
func main() {
  fmt.Println("pantai")
}','go','["VBA","Go","Bash"]'::jsonb,null,1,'Go: Sederhana dan konkuren; dibuat di Google.','Go: Simple and concurrent; created at Google.','Diawali ''package main'', mengimpor paket ''fmt'', dan fungsi dibuka kata kunci ''func''. (Muncul sekitar tahun 2009.)','Starts with ''package main'', imports the ''fmt'' package, and functions open with the ''func'' keyword. (First appeared around 2009.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 30
b = 12
print(a + b)','python','["40","42","84"]'::jsonb,null,1,'30 + 12 = 42 di Python.','30 + 12 = 42 in Python.','Ganti a dengan 30 dan b dengan 12. Operator + menjumlahkan.','Replace a with 30 and b with 12. The + operator adds.'),
('easy','valid','Apakah kode Python ini valid?','Is this Python code valid?','def main():
    print("halo")

main()','python','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: program entry point not found"]'::jsonb,1,'Kode Python ini lengkap dan valid. Terbaca dan serbaguna: web, data, AI.','This Python code is complete and valid. Readable and versatile: web, data, AI.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword.'),
('easy','fill','Lengkapi kode Visual Basic ini agar valid','Complete this Visual Basic code so it is valid','Module Program
  Sub Main()
    ____("batik")
  End Sub
End Module','vb','["SELECT","content","Console.WriteLine"]'::jsonb,null,2,'Console.WriteLine adalah bagian khas Visual Basic. Bahasa berbasis BASIC dari Microsoft.','Console.WriteLine is characteristic of Visual Basic. Microsoft''s BASIC-based language.','Kata yang hilang terdiri dari 17 karakter, diawali "C" dan diakhiri "e". Ciri bahasa ini: Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat … tanpa titik koma.','The missing word has 17 characters, starts with "C" and ends with "e". About this language: Blocks close with ''End'' (End Sub, End Module); prints with … and no semicolon.'),
('easy','valid','Apakah kode C ini valid?','Is this C code valid?','#include <stdio.h>
int main(void) {
  printf("tempe\n");
  return 0;
}','c','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: unknown function or keyword name","Error: unbalanced parentheses"]'::jsonb,0,'Kode C ini lengkap dan valid. Dasar sistem operasi; memori dikelola manual.','This C code is complete and valid. Foundation of operating systems; manual memory management.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function.'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "hujan"','powershell','["C++","CSS","PowerShell"]'::jsonb,null,2,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Sub Salam()
  MsgBox "sawah"
End Sub','vb','["Perl","VBA","SQL"]'::jsonb,null,1,'VBA: Makro Excel dan Office.','VBA: Excel and Office macros.','Makro Office: prosedur dibuka ''Sub'' dan ditutup ''End Sub'', pesan lewat MsgBox. (Muncul sekitar tahun 1993.)','Office macro: procedures open with ''Sub'' and close with ''End Sub'', messages go through MsgBox. (First appeared around 1993.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 14
b = 3
print(a % b)','python','["4","0","2"]'::jsonb,null,2,'14 % 3 = 2 di Python.','14 % 3 = 2 in Python.','Ganti a dengan 14 dan b dengan 3. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 14 and b with 3. The % operator gives the remainder of the division (a divided by b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','Write-Host "halo"','powershell','["VBA","SQL","PowerShell"]'::jsonb,null,2,'PowerShell: Shell dan otomasi Windows berbasis objek.','PowerShell: Object-based shell and automation for Windows.','Perintahnya berpola Kata-Kerja dan Kata-Benda dengan tanda hubung (Write-Host). (Muncul sekitar tahun 2006.)','Commands follow a Verb-Noun pattern with a hyphen (Write-Host). (First appeared around 2006.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("halo")

main()','python','["PowerShell","Python","C++"]'::jsonb,null,1,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','valid','Apakah kode Python ini valid?','Is this Python code valid?','def main():
    print("tempe")

main(','python','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword.'),
('easy','fill','Lengkapi kode Visual Basic ini agar valid','Complete this Visual Basic code so it is valid','Module Program
  Sub Main()
    ____("padang")
  End Sub
End Module','vb','["printf","Console.WriteLine","MsgBox"]'::jsonb,null,1,'Console.WriteLine adalah bagian khas Visual Basic. Bahasa berbasis BASIC dari Microsoft.','Console.WriteLine is characteristic of Visual Basic. Microsoft''s BASIC-based language.','Kata yang hilang terdiri dari 17 karakter, diawali "C" dan diakhiri "e". Ciri bahasa ini: Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat … tanpa titik koma.','The missing word has 17 characters, starts with "C" and ends with "e". About this language: Blocks close with ''End'' (End Sub, End Module); prints with … and no semicolon.'),
('easy','fill','Lengkapi kode CSS ini agar valid','Complete this CSS code so it is valid','.pesan::after {
  ____: "batik";
}','css','["Write-Host","content","MsgBox"]'::jsonb,null,1,'content adalah bagian khas CSS. Mengatur tampilan halaman web.','content is characteristic of CSS. Styles web pages.','Kata yang hilang terdiri dari 7 karakter, diawali "c" dan diakhiri "t". Ciri bahasa ini: Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan.','The missing word has 7 characters, starts with "c" and ends with "t". About this language: Contains selectors and ''name: value;'' property blocks that control appearance.'),
('easy','fill','Lengkapi kode C ini agar valid','Complete this C code so it is valid','#include <stdio.h>
int main(void) {
  ____("angkot\n");
  return 0;
}','c','["echo","Write-Host","printf"]'::jsonb,null,2,'printf adalah bagian khas C. Dasar sistem operasi; memori dikelola manual.','printf is characteristic of C. Foundation of operating systems; manual memory management.','Kata yang hilang terdiri dari 6 karakter, diawali "p" dan diakhiri "f". Ciri bahasa ini: Diawali #include untuk header standar; main mengembalikan int dan teks dicetak dengan fungsi berformat.','The missing word has 6 characters, starts with "p" and ends with "f". About this language: Starts with #include for a standard header; main returns an int and text is printed with a formatted-print function.'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("tempe")

main()','python','["Go","Python","Java"]'::jsonb,null,1,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','fill','Lengkapi kode CSS ini agar valid','Complete this CSS code so it is valid','.pesan::after {
  ____: "angkot";
}','css','["Console.WriteLine","print","content"]'::jsonb,null,2,'content adalah bagian khas CSS. Mengatur tampilan halaman web.','content is characteristic of CSS. Styles web pages.','Kata yang hilang terdiri dari 7 karakter, diawali "c" dan diakhiri "t". Ciri bahasa ini: Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan.','The missing word has 7 characters, starts with "c" and ends with "t". About this language: Contains selectors and ''name: value;'' property blocks that control appearance.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("senja".repeat(4))','javascript','["senjasenjasenjasenjasenja","senjasenjasenjasenja","senjasenjasenja"]'::jsonb,null,1,'repeat(4) mengulang string 4 kali.','repeat(4) repeats the string 4 times.','repeat(4) menyambung string "senja" sebanyak 4 kali, tanpa spasi di antaranya.','repeat(4) joins the string "senja" 4 times, with no spaces between.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 27
b = 11
print(a // b)','python','["4","1","2"]'::jsonb,null,2,'27 // 11 = 2 di Python.','27 // 11 = 2 in Python.','Ganti a dengan 27 dan b dengan 11. Operator // membagi lalu membulatkan ke bawah (pembagian bulat).','Replace a with 27 and b with 11. The // operator divides and rounds down (integer division).'),
('easy','guess','Bahasa apa ini?','Which language is this?','const pesan: string = "wayang";
console.log(pesan);','typescript','["Visual Basic","TypeScript","Java"]'::jsonb,null,1,'TypeScript: JavaScript dengan tipe statis.','TypeScript: JavaScript with static types.','Mirip JavaScript, tetapi variabel diberi anotasi tipe setelah titik dua. (Muncul sekitar tahun 2012.)','Looks like JavaScript, but variables carry a type annotation after a colon. (First appeared around 2012.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 11
b = 8
print(a + b)','python','["19","9","29"]'::jsonb,null,0,'11 + 8 = 19 di Python.','11 + 8 = 19 in Python.','Ganti a dengan 11 dan b dengan 8. Operator + menjumlahkan.','Replace a with 11 and b with 8. The + operator adds.'),
('easy','fill','Lengkapi kode CSS ini agar valid','Complete this CSS code so it is valid','.pesan::after {
  ____: "bunga";
}','css','["content","SELECT","MsgBox"]'::jsonb,null,0,'content adalah bagian khas CSS. Mengatur tampilan halaman web.','content is characteristic of CSS. Styles web pages.','Kata yang hilang terdiri dari 7 karakter, diawali "c" dan diakhiri "t". Ciri bahasa ini: Berisi pemilih (selector) dan blok properti ''nama: nilai;'' untuk mengatur tampilan.','The missing word has 7 characters, starts with "c" and ends with "t". About this language: Contains selectors and ''name: value;'' property blocks that control appearance.'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 25
b = 6
print(a - b)','python','["19","38","29"]'::jsonb,null,0,'25 - 6 = 19 di Python.','25 - 6 = 19 in Python.','Ganti a dengan 25 dan b dengan 6. Operator - mengurangkan (a dikurangi b).','Replace a with 25 and b with 6. The - operator subtracts (a minus b).'),
('easy','guess','Bahasa apa ini?','Which language is this?','local pesan = "garuda"
print(pesan)','lua','["Visual Basic","Lua","CSS"]'::jsonb,null,1,'Lua: Skrip ringan untuk game dan embedded.','Lua: Lightweight scripting for games and embedded use.','Variabel lokal ditandai kata ''local''; tanpa titik koma dan tanpa kurung kurawal. (Muncul sekitar tahun 1993.)','Local variables are marked with ''local''; no semicolons and no curly braces. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','<?php
echo "hujan";
?>','php','["Python","PHP","CSS"]'::jsonb,null,1,'PHP: Bahasa server web paling populer.','PHP: The most popular web server language.','Kode berada di antara tag pembuka berawalan tanda tanya; perintah cetaknya kata ''echo''. (Muncul sekitar tahun 1995.)','Code sits between tags that open with a question mark; printing uses the word ''echo''. (First appeared around 1995.)'),
('easy','fill','Lengkapi kode Java ini agar valid','Complete this Java code so it is valid','public class Main {
  public static void main(String[] args) {
    ____("halo");
  }
}','java','["std::cout","System.out.println","echo"]'::jsonb,null,1,'System.out.println adalah bagian khas Java. Write once, run anywhere lewat JVM.','System.out.println is characteristic of Java. Write once, run anywhere via the JVM.','Kata yang hilang terdiri dari 18 karakter, diawali "S" dan diakhiri "n". Ciri bahasa ini: Semua kode dibungkus kelas; titik masuknya metode ''main'' bertipe public static void.','The missing word has 18 characters, starts with "S" and ends with "n". About this language: Everything lives inside a class; the entry point is a public static void ''main'' method.'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="tiket">
  <p>gado</p>
</div>','html','["C#","HTML","R"]'::jsonb,null,1,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("pantai".length)','javascript','["6","7","4"]'::jsonb,null,0,'Panjang "pantai" adalah 6.','The length of "pantai" is 6.','Hitung jumlah huruf di antara tanda kutip ("pantai"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("pantai"); the quotes themselves do not count.'),
('easy','guess','Bahasa apa ini?','Which language is this?','<div class="bobot">
  <p>angin</p>
</div>','html','["CSS","HTML","TypeScript"]'::jsonb,null,1,'HTML: Markup kerangka halaman web.','HTML: Markup that structures web pages.','Bukan bahasa pemrograman biasa: penanda berupa tag buka-tutup seperti <div> dan <p>. (Muncul sekitar tahun 1993.)','Not an ordinary programming language: markup made of open/close tags like <div> and <p>. (First appeared around 1993.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','def main():
    print("laut")

main()','python','["Perl","Visual Basic","Python"]'::jsonb,null,2,'Python: Terbaca dan serbaguna: web, data, AI.','Python: Readable and versatile: web, data, AI.','Blok dibentuk dengan titik dua dan indentasi, tanpa kurung kurawal; fungsi dibuka dengan kata kunci tiga huruf. (Muncul sekitar tahun 1991.)','Blocks use a colon plus indentation, no curly braces; functions start with a three-letter keyword. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','Module Program
  Sub Main()
    Console.WriteLine("kerupuk")
  End Sub
End Module','vb','["Lua","Visual Basic","PowerShell"]'::jsonb,null,1,'Visual Basic: Bahasa berbasis BASIC dari Microsoft.','Visual Basic: Microsoft''s BASIC-based language.','Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma. (Muncul sekitar tahun 1991.)','Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon. (First appeared around 1991.)'),
('easy','guess','Bahasa apa ini?','Which language is this?','SELECT ''laut'' AS pesan;','sql','["PHP","SQL","C#"]'::jsonb,null,1,'SQL: Bahasa query basis data relasional.','SQL: The query language for relational databases.','Kueri deklaratif: kata kunci huruf besar seperti SELECT dan AS, diakhiri titik koma. (Muncul sekitar tahun 1974.)','A declarative query: uppercase keywords like SELECT and AS, ending with a semicolon. (First appeared around 1974.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("sambal".repeat(4))','javascript','["sambalsambalsambal","sambalsambalsambalsambalsambal","sambalsambalsambalsambal"]'::jsonb,null,2,'repeat(4) mengulang string 4 kali.','repeat(4) repeats the string 4 times.','repeat(4) menyambung string "sambal" sebanyak 4 kali, tanpa spasi di antaranya.','repeat(4) joins the string "sambal" 4 times, with no spaces between.'),
('easy','output','Apa output kode ini?','What is the output of this code?','console.log("padang".length)','javascript','["6","8","4"]'::jsonb,null,0,'Panjang "padang" adalah 6.','The length of "padang" is 6.','Hitung jumlah huruf di antara tanda kutip ("padang"); tanda kutipnya sendiri tidak dihitung.','Count the letters between the quotes ("padang"); the quotes themselves do not count.'),
('easy','guess','Bahasa apa ini?','Which language is this?','#include <iostream>
int main() {
  std::cout << "sambal" << std::endl;
}','cpp','["Visual Basic","C++","Go"]'::jsonb,null,1,'C++: C dengan OOP dan kontrol performa.','C++: C with OOP and performance control.','Mirip C, tetapi mencetak dengan operator aliran ''<<'' pada objek keluaran standar. (Muncul sekitar tahun 1985.)','C-like, but prints with the ''<<'' stream operator on a standard output object. (First appeared around 1985.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 2
b = 9
print(a // b)','python','["1","2","0"]'::jsonb,null,2,'2 // 9 = 0 di Python.','2 // 9 = 0 in Python.','Ganti a dengan 2 dan b dengan 9. Operator // membagi lalu membulatkan ke bawah (pembagian bulat).','Replace a with 2 and b with 9. The // operator divides and rounds down (integer division).'),
('easy','guess','Bahasa apa ini?','Which language is this?','using System;
class App {
  static void Main() { Console.WriteLine("wayang"); }
}','csharp','["Ruby","C#","Python"]'::jsonb,null,1,'C#: Bahasa Microsoft untuk .NET dan Unity.','C#: Microsoft''s language for .NET and Unity.','Memakai ''using System;'' dan kelas dengan metode Main; mencetak lewat objek Console. (Muncul sekitar tahun 2000.)','Uses ''using System;'' and a class with a Main method; prints through the Console object. (First appeared around 2000.)'),
('easy','output','Apa output kode ini?','What is the output of this code?','a = 18
b = 12
print(a % b)','python','["5","4","6"]'::jsonb,null,2,'18 % 12 = 6 di Python.','18 % 12 = 6 in Python.','Ganti a dengan 18 dan b dengan 12. Operator % memberi sisa pembagian (a dibagi b).','Replace a with 18 and b with 12. The % operator gives the remainder of the division (a divided by b).'),
('easy','valid','Apakah kode Visual Basic ini valid?','Is this Visual Basic code valid?','Module Program
  Sub Main()
    Console.WriteLinex("padang")
  End Sub
End Module','vb','["Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Error: program entry point not found","Valid, the code structure is complete","Error: unknown function or keyword name"]'::jsonb,2,'"Console.WriteLine" salah ketik menjadi "Console.WriteLinex" sehingga tidak dikenal oleh Visual Basic.','"Console.WriteLine" was misspelled as "Console.WriteLinex", so Visual Basic does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "Console.WriteLinex"). Apakah persis sama dengan yang dikenal Visual Basic? Ingat: Blok ditutup kata ''End'' (End Sub, End Module); mencetak lewat Console.WriteLine tanpa titik koma.','Check the spelling of the main function or keyword (here it reads "Console.WriteLinex"). Does it match exactly what Visual Basic recognizes? Remember: Blocks close with ''End'' (End Sub, End Module); prints with Console.WriteLine and no semicolon.');
