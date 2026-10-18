-- DIHASILKAN oleh scripts/gen-bulk.mjs (extreme)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('extreme','guess','Bahasa apa ini?','Which language is this?','section .data
  msg db "gunung", 10
section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 7
  int 0x80','asm','["Assembly x86","B","SNOBOL"]'::jsonb,null,0,'Assembly x86: Instruksi mesin x86, langsung bicara ke CPU.','Assembly x86: x86 machine instructions, talking directly to the CPU.','Instruksi mov dengan register eax/ebx/ecx dan pemanggilan sistem lewat ''int 0x80''. (Muncul sekitar tahun 1978.)','mov instructions with eax/ebx/ecx registers and a system call through ''int 0x80''. (First appeared around 1978.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','section .data
  msg db "batik", 10
section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 6
  int 0x80','asm','["Smalltalk","Assembly x86","Ada"]'::jsonb,null,1,'Assembly x86: Instruksi mesin x86, langsung bicara ke CPU.','Assembly x86: x86 machine instructions, talking directly to the CPU.','Instruksi mov dengan register eax/ebx/ecx dan pemanggilan sistem lewat ''int 0x80''. (Muncul sekitar tahun 1978.)','mov instructions with eax/ebx/ecx registers and a system call through ''int 0x80''. (First appeared around 1978.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','section .data
  msg db "kerupuk", 10
section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 8
  int 0x80','asm','["Prolog","Assembly x86","Rexx"]'::jsonb,null,1,'Assembly x86: Instruksi mesin x86, langsung bicara ke CPU.','Assembly x86: x86 machine instructions, talking directly to the CPU.','Instruksi mov dengan register eax/ebx/ecx dan pemanggilan sistem lewat ''int 0x80''. (Muncul sekitar tahun 1978.)','mov instructions with eax/ebx/ecx registers and a system call through ''int 0x80''. (First appeared around 1978.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','section .data
  msg db "sambal", 10
section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 7
  int 0x80','asm','["Awk","Assembly x86","Logo"]'::jsonb,null,1,'Assembly x86: Instruksi mesin x86, langsung bicara ke CPU.','Assembly x86: x86 machine instructions, talking directly to the CPU.','Instruksi mov dengan register eax/ebx/ecx dan pemanggilan sistem lewat ''int 0x80''. (Muncul sekitar tahun 1978.)','mov instructions with eax/ebx/ecx registers and a system call through ''int 0x80''. (First appeared around 1978.)'),
('extreme','fill','Lengkapi kode Assembly x86 ini agar valid','Complete this Assembly x86 code so it is valid','section .data
  msg db "gado", 10
section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 5
  ____','asm','["int 0x80","writeln","ecall"]'::jsonb,null,0,'int 0x80 adalah bagian khas Assembly x86. Instruksi mesin x86, langsung bicara ke CPU.','int 0x80 is characteristic of Assembly x86. x86 machine instructions, talking directly to the CPU.','Kata yang hilang terdiri dari 8 karakter, diawali "i" dan diakhiri "0". Ciri bahasa ini: Instruksi mov dengan register eax/ebx/ecx dan pemanggilan sistem lewat ''…''.','The missing word has 8 characters, starts with "i" and ends with "0". About this language: mov instructions with eax/ebx/ecx registers and a system call through ''…''.'),
('extreme','valid','Apakah kode Assembly x86 ini valid?','Is this Assembly x86 code valid?','section .data
  msg db "hujan", 10
section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 6
  int 0x80x','asm','["Error: nama fungsi atau kata kunci tidak dikenal","Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: program entry point not found","Valid, the code structure is complete"]'::jsonb,0,'"int 0x80" salah ketik menjadi "int 0x80x" sehingga tidak dikenal oleh Assembly x86.','"int 0x80" was misspelled as "int 0x80x", so Assembly x86 does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "int 0x80x"). Apakah persis sama dengan yang dikenal Assembly x86? Ingat: Instruksi mov dengan register eax/ebx/ecx dan pemanggilan sistem lewat ''int 0x80''.','Check the spelling of the main function or keyword (here it reads "int 0x80x"). Does it match exactly what Assembly x86 recognizes? Remember: mov instructions with eax/ebx/ecx registers and a system call through ''int 0x80''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.global _start
_start:
  mov r0, #1
  ldr r1, =msg
  mov r2, #5
  mov r7, #4
  svc #0
msg: .ascii "dunia"','asm','["ABAP","Prolog","ARM Assembly"]'::jsonb,null,2,'ARM Assembly: Assembly prosesor ponsel dan embedded.','ARM Assembly: Assembly for phone and embedded processors.','Register r0-r7, instruksi ldr/mov, dan panggilan sistem ''svc #0''. (Muncul sekitar tahun 1985.)','Registers r0-r7, ldr/mov instructions, and a ''svc #0'' system call. (First appeared around 1985.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.global _start
_start:
  mov r0, #1
  ldr r1, =msg
  mov r2, #5
  mov r7, #4
  svc #0
msg: .ascii "batik"','asm','["Prolog","Pascal","ARM Assembly"]'::jsonb,null,2,'ARM Assembly: Assembly prosesor ponsel dan embedded.','ARM Assembly: Assembly for phone and embedded processors.','Register r0-r7, instruksi ldr/mov, dan panggilan sistem ''svc #0''. (Muncul sekitar tahun 1985.)','Registers r0-r7, ldr/mov instructions, and a ''svc #0'' system call. (First appeared around 1985.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.global _start
_start:
  mov r0, #1
  ldr r1, =msg
  mov r2, #6
  mov r7, #4
  svc #0
msg: .ascii "sambal"','asm','["ARM Assembly","Logo","PL/I"]'::jsonb,null,0,'ARM Assembly: Assembly prosesor ponsel dan embedded.','ARM Assembly: Assembly for phone and embedded processors.','Register r0-r7, instruksi ldr/mov, dan panggilan sistem ''svc #0''. (Muncul sekitar tahun 1985.)','Registers r0-r7, ldr/mov instructions, and a ''svc #0'' system call. (First appeared around 1985.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.global _start
_start:
  mov r0, #1
  ldr r1, =msg
  mov r2, #5
  mov r7, #4
  svc #0
msg: .ascii "candi"','asm','["Simula","Wolfram Language","ARM Assembly"]'::jsonb,null,2,'ARM Assembly: Assembly prosesor ponsel dan embedded.','ARM Assembly: Assembly for phone and embedded processors.','Register r0-r7, instruksi ldr/mov, dan panggilan sistem ''svc #0''. (Muncul sekitar tahun 1985.)','Registers r0-r7, ldr/mov instructions, and a ''svc #0'' system call. (First appeared around 1985.)'),
('extreme','fill','Lengkapi kode ARM Assembly ini agar valid','Complete this ARM Assembly code so it is valid','.global _start
_start:
  mov r0, #1
  ldr r1, =msg
  mov r2, #6
  mov r7, #4
  ____ #0
msg: .ascii "wayang"','asm','["svc","syscall","showln:"]'::jsonb,null,0,'svc adalah bagian khas ARM Assembly. Assembly prosesor ponsel dan embedded.','svc is characteristic of ARM Assembly. Assembly for phone and embedded processors.','Kata yang hilang terdiri dari 3 karakter, diawali "s". Ciri bahasa ini: Register r0-r7, instruksi ldr/mov, dan panggilan sistem ''… #0''.','The missing word has 3 characters, starts with "s". About this language: Registers r0-r7, ldr/mov instructions, and a ''… #0'' system call.'),
('extreme','valid','Apakah kode ARM Assembly ini valid?','Is this ARM Assembly code valid?','.global _start
_start:
  mov r0, #1
  ldr r1, =msg
  mov r2, #5
  mov r7, #4
  svcx #0
msg: .ascii "batik"','asm','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Error: unterminated string","Valid, the code structure is complete","Error: unknown function or keyword name"]'::jsonb,2,'"svc" salah ketik menjadi "svcx" sehingga tidak dikenal oleh ARM Assembly.','"svc" was misspelled as "svcx", so ARM Assembly does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "svcx"). Apakah persis sama dengan yang dikenal ARM Assembly? Ingat: Register r0-r7, instruksi ldr/mov, dan panggilan sistem ''svc #0''.','Check the spelling of the main function or keyword (here it reads "svcx"). Does it match exactly what ARM Assembly recognizes? Remember: Registers r0-r7, ldr/mov instructions, and a ''svc #0'' system call.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','LDA #$6B
JSR $FFD2
LDA #$0D
JSR $FFD2
RTS','asm','["Ada","6502 Assembly","Delphi"]'::jsonb,null,1,'6502 Assembly: Mesin Apple II, Commodore 64, dan NES.','6502 Assembly: The chip in the Apple II, Commodore 64, and NES.','Instruksi tiga huruf (LDA, JSR, RTS) dengan nilai heksadesimal berawalan #$. (Muncul sekitar tahun 1975.)','Three-letter instructions (LDA, JSR, RTS) with hex values prefixed by #$. (First appeared around 1975.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','LDA #$70
JSR $FFD2
LDA #$0D
JSR $FFD2
RTS','asm','["COBOL","RISC-V Assembly","6502 Assembly"]'::jsonb,null,2,'6502 Assembly: Mesin Apple II, Commodore 64, dan NES.','6502 Assembly: The chip in the Apple II, Commodore 64, and NES.','Instruksi tiga huruf (LDA, JSR, RTS) dengan nilai heksadesimal berawalan #$. (Muncul sekitar tahun 1975.)','Three-letter instructions (LDA, JSR, RTS) with hex values prefixed by #$. (First appeared around 1975.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','LDA #$6C
JSR $FFD2
LDA #$0D
JSR $FFD2
RTS','asm','["6502 Assembly","Icon","MIPS Assembly"]'::jsonb,null,0,'6502 Assembly: Mesin Apple II, Commodore 64, dan NES.','6502 Assembly: The chip in the Apple II, Commodore 64, and NES.','Instruksi tiga huruf (LDA, JSR, RTS) dengan nilai heksadesimal berawalan #$. (Muncul sekitar tahun 1975.)','Three-letter instructions (LDA, JSR, RTS) with hex values prefixed by #$. (First appeared around 1975.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','LDA #$64
JSR $FFD2
LDA #$0D
JSR $FFD2
RTS','asm','["Fortran","6502 Assembly","B"]'::jsonb,null,1,'6502 Assembly: Mesin Apple II, Commodore 64, dan NES.','6502 Assembly: The chip in the Apple II, Commodore 64, and NES.','Instruksi tiga huruf (LDA, JSR, RTS) dengan nilai heksadesimal berawalan #$. (Muncul sekitar tahun 1975.)','Three-letter instructions (LDA, JSR, RTS) with hex values prefixed by #$. (First appeared around 1975.)'),
('extreme','fill','Lengkapi kode 6502 Assembly ini agar valid','Complete this 6502 Assembly code so it is valid','LDA #$73
____ $FFD2
LDA #$0D
JSR $FFD2
RTS','asm','["JSR","say","DISPLAY"]'::jsonb,null,0,'JSR adalah bagian khas 6502 Assembly. Mesin Apple II, Commodore 64, dan NES.','JSR is characteristic of 6502 Assembly. The chip in the Apple II, Commodore 64, and NES.','Kata yang hilang terdiri dari 3 karakter, diawali "J". Ciri bahasa ini: Instruksi tiga huruf (LDA, …, RTS) dengan nilai heksadesimal berawalan #$.','The missing word has 3 characters, starts with "J". About this language: Three-letter instructions (LDA, …, RTS) with hex values prefixed by #$.'),
('extreme','valid','Apakah kode 6502 Assembly ini valid?','Is this 6502 Assembly code valid?','LDA #$6C
JSRx $FFD2
LDA #$0D
JSR $FFD2
RTS','asm','["Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unknown function or keyword name","Valid, the code structure is complete"]'::jsonb,1,'"JSR" salah ketik menjadi "JSRx" sehingga tidak dikenal oleh 6502 Assembly.','"JSR" was misspelled as "JSRx", so 6502 Assembly does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "JSRx"). Apakah persis sama dengan yang dikenal 6502 Assembly? Ingat: Instruksi tiga huruf (LDA, JSR, RTS) dengan nilai heksadesimal berawalan #$.','Check the spelling of the main function or keyword (here it reads "JSRx"). Does it match exactly what 6502 Assembly recognizes? Remember: Three-letter instructions (LDA, JSR, RTS) with hex values prefixed by #$.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','IDENTIFICATION DIVISION.
PROGRAM-ID. HASIL.
PROCEDURE DIVISION.
    DISPLAY "PADANG".
    STOP RUN.','cobol','["COBOL","ABAP","Ada"]'::jsonb,null,0,'COBOL: Bahasa bisnis dan perbankan; ribuan sistem masih berjalan.','COBOL: Business and banking language; thousands of systems still run on it.','Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah DISPLAY. (Muncul sekitar tahun 1959.)','Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a DISPLAY command. (First appeared around 1959.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','IDENTIFICATION DIVISION.
PROGRAM-ID. SALDO.
PROCEDURE DIVISION.
    DISPLAY "GARUDA".
    STOP RUN.','cobol','["Fortran","Logo","COBOL"]'::jsonb,null,2,'COBOL: Bahasa bisnis dan perbankan; ribuan sistem masih berjalan.','COBOL: Business and banking language; thousands of systems still run on it.','Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah DISPLAY. (Muncul sekitar tahun 1959.)','Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a DISPLAY command. (First appeared around 1959.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','IDENTIFICATION DIVISION.
PROGRAM-ID. SUHU.
PROCEDURE DIVISION.
    DISPLAY "WAYANG".
    STOP RUN.','cobol','["ALGOL 68","COBOL","Ada"]'::jsonb,null,1,'COBOL: Bahasa bisnis dan perbankan; ribuan sistem masih berjalan.','COBOL: Business and banking language; thousands of systems still run on it.','Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah DISPLAY. (Muncul sekitar tahun 1959.)','Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a DISPLAY command. (First appeared around 1959.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','IDENTIFICATION DIVISION.
PROGRAM-ID. TIKET.
PROCEDURE DIVISION.
    DISPLAY "KOPI".
    STOP RUN.','cobol','["Oberon","6502 Assembly","COBOL"]'::jsonb,null,2,'COBOL: Bahasa bisnis dan perbankan; ribuan sistem masih berjalan.','COBOL: Business and banking language; thousands of systems still run on it.','Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah DISPLAY. (Muncul sekitar tahun 1959.)','Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a DISPLAY command. (First appeared around 1959.)'),
('extreme','fill','Lengkapi kode COBOL ini agar valid','Complete this COBOL code so it is valid','IDENTIFICATION DIVISION.
PROGRAM-ID. LAJU.
PROCEDURE DIVISION.
    ____ "HALO".
    STOP RUN.','cobol','["DISPLAY","svc","syscall"]'::jsonb,null,0,'DISPLAY adalah bagian khas COBOL. Bahasa bisnis dan perbankan; ribuan sistem masih berjalan.','DISPLAY is characteristic of COBOL. Business and banking language; thousands of systems still run on it.','Kata yang hilang terdiri dari 7 karakter, diawali "D" dan diakhiri "Y". Ciri bahasa ini: Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah ….','The missing word has 7 characters, starts with "D" and ends with "Y". About this language: Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a … command.'),
('extreme','valid','Apakah kode COBOL ini valid?','Is this COBOL code valid?','IDENTIFICATION DIVISION.
PROGRAM-ID. TINGGI.
PROCEDURE DIVISION.
    DISPLAY "RENDANG.
    STOP RUN.','cobol','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode COBOL ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah DISPLAY.','Trace every string in this COBOL code: does each opening quote have a closing one? Remember: Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a DISPLAY command.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program poin
  print *, "nasi"
end program poin','fortran-free-form','["APL","Fortran","Wolfram Language"]'::jsonb,null,1,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program urut
  print *, "candi"
end program urut','fortran-free-form','["Lisp","Fortran","B"]'::jsonb,null,1,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program lebar
  print *, "merdeka"
end program lebar','fortran-free-form','["Lisp","Fortran","Scheme"]'::jsonb,null,1,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program poin
  print *, "bakso"
end program poin','fortran-free-form','["BASIC","Fortran","Forth"]'::jsonb,null,1,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','fill','Lengkapi kode Fortran ini agar valid','Complete this Fortran code so it is valid','program ukuran
  ____ *, "nasi"
end program ukuran','fortran-free-form','["print","say","dsply"]'::jsonb,null,0,'print adalah bagian khas Fortran. Komputasi ilmiah; masih dipakai di simulasi cuaca.','print is characteristic of Fortran. Scientific computing; still used in weather simulation.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: ''program ... end program'' dengan ''… *,'' untuk keluaran.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: ''program ... end program'' with ''… *,'' for output.'),
('extreme','valid','Apakah kode Fortran ini valid?','Is this Fortran code valid?','program poin
  printx *, "angkot"
end program poin','fortran-free-form','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Error: unterminated string","Valid, the code structure is complete","Error: unknown function or keyword name"]'::jsonb,2,'"print" salah ketik menjadi "printx" sehingga tidak dikenal oleh Fortran.','"print" was misspelled as "printx", so Fortran does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "printx"). Apakah persis sama dengan yang dikenal Fortran? Ingat: ''program ... end program'' dengan ''print *,'' untuk keluaran.','Check the spelling of the main function or keyword (here it reads "printx"). Does it match exactly what Fortran recognizes? Remember: ''program ... end program'' with ''print *,'' for output.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program Batas;
begin
  writeln(''sate'');
end.','pascal','["Lisp","Awk","Pascal"]'::jsonb,null,2,'Pascal: Bahasa pengajaran terstruktur.','Pascal: A structured teaching language.','Blok ''begin ... end.'' dengan penugasan '':='' dan writeln berkutip tunggal. (Muncul sekitar tahun 1970.)','A ''begin ... end.'' block with '':='' assignment and a single-quoted writeln. (First appeared around 1970.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program Waktu;
begin
  writeln(''halo'');
end.','pascal','["BASIC","Delphi","Pascal"]'::jsonb,null,2,'Pascal: Bahasa pengajaran terstruktur.','Pascal: A structured teaching language.','Blok ''begin ... end.'' dengan penugasan '':='' dan writeln berkutip tunggal. (Muncul sekitar tahun 1970.)','A ''begin ... end.'' block with '':='' assignment and a single-quoted writeln. (First appeared around 1970.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program Nilai;
begin
  writeln(''durian'');
end.','pascal','["Smalltalk","Awk","Pascal"]'::jsonb,null,2,'Pascal: Bahasa pengajaran terstruktur.','Pascal: A structured teaching language.','Blok ''begin ... end.'' dengan penugasan '':='' dan writeln berkutip tunggal. (Muncul sekitar tahun 1970.)','A ''begin ... end.'' block with '':='' assignment and a single-quoted writeln. (First appeared around 1970.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program Batas;
begin
  writeln(''garuda'');
end.','pascal','["Logo","Smalltalk","Pascal"]'::jsonb,null,2,'Pascal: Bahasa pengajaran terstruktur.','Pascal: A structured teaching language.','Blok ''begin ... end.'' dengan penugasan '':='' dan writeln berkutip tunggal. (Muncul sekitar tahun 1970.)','A ''begin ... end.'' block with '':='' assignment and a single-quoted writeln. (First appeared around 1970.)'),
('extreme','fill','Lengkapi kode Pascal ini agar valid','Complete this Pascal code so it is valid','program Poin;
begin
  ____(''gunung'');
end.','pascal','["writeln","JSR","int 0x80"]'::jsonb,null,0,'writeln adalah bagian khas Pascal. Bahasa pengajaran terstruktur.','writeln is characteristic of Pascal. A structured teaching language.','Kata yang hilang terdiri dari 7 karakter, diawali "w" dan diakhiri "n". Ciri bahasa ini: Blok ''begin ... end.'' dengan penugasan '':='' dan … berkutip tunggal.','The missing word has 7 characters, starts with "w" and ends with "n". About this language: A ''begin ... end.'' block with '':='' assignment and a single-quoted ….'),
('extreme','valid','Apakah kode Pascal ini valid?','Is this Pascal code valid?','program Stok;
begin
  writeln(''sambal'';
end.','pascal','["Error: tanda kurung tidak seimbang","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unbalanced parentheses","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Blok ''begin ... end.'' dengan penugasan '':='' dan writeln berkutip tunggal.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: A ''begin ... end.'' block with '':='' assignment and a single-quoted writeln.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','uses Dialogs;
begin
  ShowMessage(''sate'');
end.','pascal','["Delphi","Modula-2","ARM Assembly"]'::jsonb,null,0,'Delphi: Pascal berorientasi objek untuk aplikasi Windows.','Delphi: Object-oriented Pascal for Windows apps.','Mirip Pascal, tetapi memakai unit ''uses Dialogs'' dan ShowMessage. (Muncul sekitar tahun 1995.)','Pascal-like, but with a ''uses Dialogs'' unit and ShowMessage. (First appeared around 1995.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','uses Dialogs;
begin
  ShowMessage(''padang'');
end.','pascal','["Oberon","Ada","Delphi"]'::jsonb,null,2,'Delphi: Pascal berorientasi objek untuk aplikasi Windows.','Delphi: Object-oriented Pascal for Windows apps.','Mirip Pascal, tetapi memakai unit ''uses Dialogs'' dan ShowMessage. (Muncul sekitar tahun 1995.)','Pascal-like, but with a ''uses Dialogs'' unit and ShowMessage. (First appeared around 1995.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','uses Dialogs;
begin
  ShowMessage(''sambal'');
end.','pascal','["Logo","Delphi","Modula-2"]'::jsonb,null,1,'Delphi: Pascal berorientasi objek untuk aplikasi Windows.','Delphi: Object-oriented Pascal for Windows apps.','Mirip Pascal, tetapi memakai unit ''uses Dialogs'' dan ShowMessage. (Muncul sekitar tahun 1995.)','Pascal-like, but with a ''uses Dialogs'' unit and ShowMessage. (First appeared around 1995.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','uses Dialogs;
begin
  ShowMessage(''becak'');
end.','pascal','["Smalltalk","Delphi","SNOBOL"]'::jsonb,null,1,'Delphi: Pascal berorientasi objek untuk aplikasi Windows.','Delphi: Object-oriented Pascal for Windows apps.','Mirip Pascal, tetapi memakai unit ''uses Dialogs'' dan ShowMessage. (Muncul sekitar tahun 1995.)','Pascal-like, but with a ''uses Dialogs'' unit and ShowMessage. (First appeared around 1995.)'),
('extreme','fill','Lengkapi kode Delphi ini agar valid','Complete this Delphi code so it is valid','uses Dialogs;
begin
  ____(''nasi'');
end.','pascal','["JSR","ShowMessage","OutText"]'::jsonb,null,1,'ShowMessage adalah bagian khas Delphi. Pascal berorientasi objek untuk aplikasi Windows.','ShowMessage is characteristic of Delphi. Object-oriented Pascal for Windows apps.','Kata yang hilang terdiri dari 11 karakter, diawali "S" dan diakhiri "e". Ciri bahasa ini: Mirip Pascal, tetapi memakai unit ''uses Dialogs'' dan ….','The missing word has 11 characters, starts with "S" and ends with "e". About this language: Pascal-like, but with a ''uses Dialogs'' unit and ….'),
('extreme','valid','Apakah kode Delphi ini valid?','Is this Delphi code valid?','uses Dialogs;
begin
  ShowMessage(''halo'');
end.','pascal','["Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: unterminated string","Valid, the code structure is complete"]'::jsonb,2,'Kode Delphi ini lengkap dan valid. Pascal berorientasi objek untuk aplikasi Windows.','This Delphi code is complete and valid. Object-oriented Pascal for Windows apps.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Mirip Pascal, tetapi memakai unit ''uses Dialogs'' dan ShowMessage.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Pascal-like, but with a ''uses Dialogs'' unit and ShowMessage.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(format t "halo~%")','lisp','["PL/I","Oberon","Lisp"]'::jsonb,null,2,'Lisp: Kode adalah data; leluhur banyak bahasa modern.','Lisp: Code is data; ancestor of many modern languages.','Seluruh kode berupa daftar berkurung; format teks lewat (format t "...~%"). (Muncul sekitar tahun 1958.)','All code is parenthesized lists; text is formatted via (format t "...~%"). (First appeared around 1958.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(format t "candi~%")','lisp','["Delphi","Lisp","Simula"]'::jsonb,null,1,'Lisp: Kode adalah data; leluhur banyak bahasa modern.','Lisp: Code is data; ancestor of many modern languages.','Seluruh kode berupa daftar berkurung; format teks lewat (format t "...~%"). (Muncul sekitar tahun 1958.)','All code is parenthesized lists; text is formatted via (format t "...~%"). (First appeared around 1958.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(format t "kerupuk~%")','lisp','["Lisp","Wolfram Language","MIPS Assembly"]'::jsonb,null,0,'Lisp: Kode adalah data; leluhur banyak bahasa modern.','Lisp: Code is data; ancestor of many modern languages.','Seluruh kode berupa daftar berkurung; format teks lewat (format t "...~%"). (Muncul sekitar tahun 1958.)','All code is parenthesized lists; text is formatted via (format t "...~%"). (First appeared around 1958.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(format t "tempe~%")','lisp','["ALGOL 68","SNOBOL","Lisp"]'::jsonb,null,2,'Lisp: Kode adalah data; leluhur banyak bahasa modern.','Lisp: Code is data; ancestor of many modern languages.','Seluruh kode berupa daftar berkurung; format teks lewat (format t "...~%"). (Muncul sekitar tahun 1958.)','All code is parenthesized lists; text is formatted via (format t "...~%"). (First appeared around 1958.)'),
('extreme','fill','Lengkapi kode Lisp ini agar valid','Complete this Lisp code so it is valid','(____ t "sawah~%")','lisp','["format","Print","syscall"]'::jsonb,null,0,'format adalah bagian khas Lisp. Kode adalah data; leluhur banyak bahasa modern.','format is characteristic of Lisp. Code is data; ancestor of many modern languages.','Kata yang hilang terdiri dari 6 karakter, diawali "f" dan diakhiri "t". Ciri bahasa ini: Seluruh kode berupa daftar berkurung; … teks lewat (… t "...~%").','The missing word has 6 characters, starts with "f" and ends with "t". About this language: All code is parenthesized lists; text is …ted via (… t "...~%").'),
('extreme','valid','Apakah kode Lisp ini valid?','Is this Lisp code valid?','(format t "padang~%)','lisp','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Error: unterminated string","Valid, the code structure is complete","Error: unknown function or keyword name"]'::jsonb,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Lisp ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Seluruh kode berupa daftar berkurung; format teks lewat (format t "...~%").','Trace every string in this Lisp code: does each opening quote have a closing one? Remember: All code is parenthesized lists; text is formatted via (format t "...~%").'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(display "halo")
(newline)','scheme','["Eiffel","Scheme","Icon"]'::jsonb,null,1,'Scheme: Lisp minimalis untuk pengajaran.','Scheme: A minimalist Lisp for teaching.','Lisp minimalis: (display "...") disusul (newline). (Muncul sekitar tahun 1975.)','Minimalist Lisp: (display "...") followed by (newline). (First appeared around 1975.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(display "rendang")
(newline)','scheme','["Oberon","Scheme","ALGOL 68"]'::jsonb,null,1,'Scheme: Lisp minimalis untuk pengajaran.','Scheme: A minimalist Lisp for teaching.','Lisp minimalis: (display "...") disusul (newline). (Muncul sekitar tahun 1975.)','Minimalist Lisp: (display "...") followed by (newline). (First appeared around 1975.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(display "nasi")
(newline)','scheme','["Logo","Scheme","COBOL"]'::jsonb,null,1,'Scheme: Lisp minimalis untuk pengajaran.','Scheme: A minimalist Lisp for teaching.','Lisp minimalis: (display "...") disusul (newline). (Muncul sekitar tahun 1975.)','Minimalist Lisp: (display "...") followed by (newline). (First appeared around 1975.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(display "angin")
(newline)','scheme','["Scheme","ALGOL 68","Standard ML"]'::jsonb,null,0,'Scheme: Lisp minimalis untuk pengajaran.','Scheme: A minimalist Lisp for teaching.','Lisp minimalis: (display "...") disusul (newline). (Muncul sekitar tahun 1975.)','Minimalist Lisp: (display "...") followed by (newline). (First appeared around 1975.)'),
('extreme','fill','Lengkapi kode Scheme ini agar valid','Complete this Scheme code so it is valid','(____ "tempe")
(newline)','scheme','["OutText","Out.String","display"]'::jsonb,null,2,'display adalah bagian khas Scheme. Lisp minimalis untuk pengajaran.','display is characteristic of Scheme. A minimalist Lisp for teaching.','Kata yang hilang terdiri dari 7 karakter, diawali "d" dan diakhiri "y". Ciri bahasa ini: Lisp minimalis: (… "...") disusul (newline).','The missing word has 7 characters, starts with "d" and ends with "y". About this language: Minimalist Lisp: (… "...") followed by (newline).'),
('extreme','valid','Apakah kode Scheme ini valid?','Is this Scheme code valid?','(display "gado")
(newline','scheme','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Lisp minimalis: (display "...") disusul (newline).','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Minimalist Lisp: (display "...") followed by (newline).'),
('extreme','guess','Bahasa apa ini?','Which language is this?',':- initialization(main).
main :- write(''padang''), nl.','prolog','["Prolog","Oberon","Lisp"]'::jsonb,null,0,'Prolog: Pemrograman logika.','Prolog: Logic programming.','Berbasis fakta dan aturan; direktif '':- initialization(main).'' dan aturan dengan '':-''. (Muncul sekitar tahun 1972.)','Based on facts and rules; the directive '':- initialization(main).'' and rules using '':-''. (First appeared around 1972.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?',':- initialization(main).
main :- write(''senja''), nl.','prolog','["Smalltalk","Prolog","Lisp"]'::jsonb,null,1,'Prolog: Pemrograman logika.','Prolog: Logic programming.','Berbasis fakta dan aturan; direktif '':- initialization(main).'' dan aturan dengan '':-''. (Muncul sekitar tahun 1972.)','Based on facts and rules; the directive '':- initialization(main).'' and rules using '':-''. (First appeared around 1972.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?',':- initialization(main).
main :- write(''angin''), nl.','prolog','["Prolog","Delphi","Scheme"]'::jsonb,null,0,'Prolog: Pemrograman logika.','Prolog: Logic programming.','Berbasis fakta dan aturan; direktif '':- initialization(main).'' dan aturan dengan '':-''. (Muncul sekitar tahun 1972.)','Based on facts and rules; the directive '':- initialization(main).'' and rules using '':-''. (First appeared around 1972.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?',':- initialization(main).
main :- write(''candi''), nl.','prolog','["Fortran","Prolog","Oberon"]'::jsonb,null,1,'Prolog: Pemrograman logika.','Prolog: Logic programming.','Berbasis fakta dan aturan; direktif '':- initialization(main).'' dan aturan dengan '':-''. (Muncul sekitar tahun 1972.)','Based on facts and rules; the directive '':- initialization(main).'' and rules using '':-''. (First appeared around 1972.)'),
('extreme','fill','Lengkapi kode Prolog ini agar valid','Complete this Prolog code so it is valid',':- initialization(main).
main :- ____(''wayang''), nl.','prolog','["Put_Line","ecall","write"]'::jsonb,null,2,'write adalah bagian khas Prolog. Pemrograman logika.','write is characteristic of Prolog. Logic programming.','Kata yang hilang terdiri dari 5 karakter, diawali "w" dan diakhiri "e". Ciri bahasa ini: Berbasis fakta dan aturan; direktif '':- initialization(main).'' dan aturan dengan '':-''.','The missing word has 5 characters, starts with "w" and ends with "e". About this language: Based on facts and rules; the directive '':- initialization(main).'' and rules using '':-''.'),
('extreme','valid','Apakah kode Prolog ini valid?','Is this Prolog code valid?',':- initialization(main).
main :- write(''rendang'', nl.','prolog','["Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: program entry point not found","Error: unbalanced parentheses"]'::jsonb,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Berbasis fakta dan aturan; direktif '':- initialization(main).'' dan aturan dengan '':-''.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Based on facts and rules; the directive '':- initialization(main).'' and rules using '':-''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','with Ada.Text_IO; use Ada.Text_IO;
procedure Tiket is
begin
  Put_Line("becak");
end Tiket;','ada','["Standard ML","Ada","Wolfram Language"]'::jsonb,null,1,'Ada: Bahasa aman untuk penerbangan dan militer.','Ada: A safe language for aviation and defense.','Klausa ''with'' dan ''use'' untuk paket Text_IO, lalu ''procedure ... is begin ... end''. (Muncul sekitar tahun 1980.)','''with'' and ''use'' clauses for a Text_IO package, then ''procedure ... is begin ... end''. (First appeared around 1980.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','with Ada.Text_IO; use Ada.Text_IO;
procedure Antrian is
begin
  Put_Line("garuda");
end Antrian;','ada','["Ada","ARM Assembly","Icon"]'::jsonb,null,0,'Ada: Bahasa aman untuk penerbangan dan militer.','Ada: A safe language for aviation and defense.','Klausa ''with'' dan ''use'' untuk paket Text_IO, lalu ''procedure ... is begin ... end''. (Muncul sekitar tahun 1980.)','''with'' and ''use'' clauses for a Text_IO package, then ''procedure ... is begin ... end''. (First appeared around 1980.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','with Ada.Text_IO; use Ada.Text_IO;
procedure Umur is
begin
  Put_Line("durian");
end Umur;','ada','["Fortran","RISC-V Assembly","Ada"]'::jsonb,null,2,'Ada: Bahasa aman untuk penerbangan dan militer.','Ada: A safe language for aviation and defense.','Klausa ''with'' dan ''use'' untuk paket Text_IO, lalu ''procedure ... is begin ... end''. (Muncul sekitar tahun 1980.)','''with'' and ''use'' clauses for a Text_IO package, then ''procedure ... is begin ... end''. (First appeared around 1980.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','with Ada.Text_IO; use Ada.Text_IO;
procedure Nilai is
begin
  Put_Line("rendang");
end Nilai;','ada','["Ada","Modula-2","SNOBOL"]'::jsonb,null,0,'Ada: Bahasa aman untuk penerbangan dan militer.','Ada: A safe language for aviation and defense.','Klausa ''with'' dan ''use'' untuk paket Text_IO, lalu ''procedure ... is begin ... end''. (Muncul sekitar tahun 1980.)','''with'' and ''use'' clauses for a Text_IO package, then ''procedure ... is begin ... end''. (First appeared around 1980.)'),
('extreme','fill','Lengkapi kode Ada ini agar valid','Complete this Ada code so it is valid','with Ada.Text_IO; use Ada.Text_IO;
procedure Skor is
begin
  ____("merdeka");
end Skor;','ada','["Put_Line","display","dsply"]'::jsonb,null,0,'Put_Line adalah bagian khas Ada. Bahasa aman untuk penerbangan dan militer.','Put_Line is characteristic of Ada. A safe language for aviation and defense.','Kata yang hilang terdiri dari 8 karakter, diawali "P" dan diakhiri "e". Ciri bahasa ini: Klausa ''with'' dan ''use'' untuk paket Text_IO, lalu ''procedure ... is begin ... end''.','The missing word has 8 characters, starts with "P" and ends with "e". About this language: ''with'' and ''use'' clauses for a Text_IO package, then ''procedure ... is begin ... end''.'),
('extreme','valid','Apakah kode Ada ini valid?','Is this Ada code valid?','with Ada.Text_IO; use Ada.Text_IO;
procedure Kuota is
begin
  Put_Line("rendang);
end Kuota;','ada','["Error: string tidak ditutup","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,0,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Ada ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Klausa ''with'' dan ''use'' untuk paket Text_IO, lalu ''procedure ... is begin ... end''.','Trace every string in this Ada code: does each opening quote have a closing one? Remember: ''with'' and ''use'' clauses for a Text_IO package, then ''procedure ... is begin ... end''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Transcript showln: ''rendang''.','smalltalk','["B","Smalltalk","Scheme"]'::jsonb,null,1,'Smalltalk: OOP murni; menginspirasi Java dan Ruby.','Smalltalk: Pure OOP; inspired Java and Ruby.','Semuanya kirim pesan: ''Transcript showln: ...'' dengan kata kunci bertanda titik dua. (Muncul sekitar tahun 1972.)','Everything is message passing: ''Transcript showln: ...'' with colon-marked keywords. (First appeared around 1972.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Transcript showln: ''sambal''.','smalltalk','["6502 Assembly","Logo","Smalltalk"]'::jsonb,null,2,'Smalltalk: OOP murni; menginspirasi Java dan Ruby.','Smalltalk: Pure OOP; inspired Java and Ruby.','Semuanya kirim pesan: ''Transcript showln: ...'' dengan kata kunci bertanda titik dua. (Muncul sekitar tahun 1972.)','Everything is message passing: ''Transcript showln: ...'' with colon-marked keywords. (First appeared around 1972.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Transcript showln: ''padang''.','smalltalk','["Ada","Smalltalk","Logo"]'::jsonb,null,1,'Smalltalk: OOP murni; menginspirasi Java dan Ruby.','Smalltalk: Pure OOP; inspired Java and Ruby.','Semuanya kirim pesan: ''Transcript showln: ...'' dengan kata kunci bertanda titik dua. (Muncul sekitar tahun 1972.)','Everything is message passing: ''Transcript showln: ...'' with colon-marked keywords. (First appeared around 1972.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Transcript showln: ''becak''.','smalltalk','["RISC-V Assembly","Assembly x86","Smalltalk"]'::jsonb,null,2,'Smalltalk: OOP murni; menginspirasi Java dan Ruby.','Smalltalk: Pure OOP; inspired Java and Ruby.','Semuanya kirim pesan: ''Transcript showln: ...'' dengan kata kunci bertanda titik dua. (Muncul sekitar tahun 1972.)','Everything is message passing: ''Transcript showln: ...'' with colon-marked keywords. (First appeared around 1972.)'),
('extreme','fill','Lengkapi kode Smalltalk ini agar valid','Complete this Smalltalk code so it is valid','Transcript ____ ''merdeka''.','smalltalk','["REPORT","showln:","OUTPUT"]'::jsonb,null,1,'showln: adalah bagian khas Smalltalk. OOP murni; menginspirasi Java dan Ruby.','showln: is characteristic of Smalltalk. Pure OOP; inspired Java and Ruby.','Kata yang hilang terdiri dari 7 karakter, diawali "s" dan diakhiri ":". Ciri bahasa ini: Semuanya kirim pesan: ''Transcript … ...'' dengan kata kunci bertanda titik dua.','The missing word has 7 characters, starts with "s" and ends with ":". About this language: Everything is message passing: ''Transcript … ...'' with colon-marked keywords.'),
('extreme','valid','Apakah kode Smalltalk ini valid?','Is this Smalltalk code valid?','Transcript showln: ''kerupuk.','smalltalk','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Valid, the code structure is complete","Error: unterminated string","Error: program entry point not found"]'::jsonb,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Smalltalk ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Semuanya kirim pesan: ''Transcript showln: ...'' dengan kata kunci bertanda titik dua.','Trace every string in this Smalltalk code: does each opening quote have a closing one? Remember: Everything is message passing: ''Transcript showln: ...'' with colon-marked keywords.'),
('extreme','guess','Bahasa apa ini?','Which language is this?',': salam ." angin" cr ;
salam','forth','["Wolfram Language","Modula-2","Forth"]'::jsonb,null,2,'Forth: Bahasa berbasis stack dengan notasi postfix.','Forth: A stack-based language with postfix notation.','Notasi postfix dengan stack; definisi dimulai '':'' dan diakhiri '';'', teks lewat .". (Muncul sekitar tahun 1970.)','Postfix notation with a stack; definitions start with '':'' and end with '';'', text via .". (First appeared around 1970.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?',': salam ." angkot" cr ;
salam','forth','["Forth","ALGOL 68","Pascal"]'::jsonb,null,0,'Forth: Bahasa berbasis stack dengan notasi postfix.','Forth: A stack-based language with postfix notation.','Notasi postfix dengan stack; definisi dimulai '':'' dan diakhiri '';'', teks lewat .". (Muncul sekitar tahun 1970.)','Postfix notation with a stack; definitions start with '':'' and end with '';'', text via .". (First appeared around 1970.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?',': salam ." nasi" cr ;
salam','forth','["Oberon","SNOBOL","Forth"]'::jsonb,null,2,'Forth: Bahasa berbasis stack dengan notasi postfix.','Forth: A stack-based language with postfix notation.','Notasi postfix dengan stack; definisi dimulai '':'' dan diakhiri '';'', teks lewat .". (Muncul sekitar tahun 1970.)','Postfix notation with a stack; definitions start with '':'' and end with '';'', text via .". (First appeared around 1970.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?',': salam ." gunung" cr ;
salam','forth','["Forth","Modula-2","MIPS Assembly"]'::jsonb,null,0,'Forth: Bahasa berbasis stack dengan notasi postfix.','Forth: A stack-based language with postfix notation.','Notasi postfix dengan stack; definisi dimulai '':'' dan diakhiri '';'', teks lewat .". (Muncul sekitar tahun 1970.)','Postfix notation with a stack; definitions start with '':'' and end with '';'', text via .". (First appeared around 1970.)'),
('extreme','fill','Lengkapi kode Forth ini agar valid','Complete this Forth code so it is valid',': salam ." sate" ____ ;
salam','forth','["DISPLAY","cr","Print"]'::jsonb,null,1,'cr adalah bagian khas Forth. Bahasa berbasis stack dengan notasi postfix.','cr is characteristic of Forth. A stack-based language with postfix notation.','Kata yang hilang terdiri dari 2 karakter, diawali "c". Ciri bahasa ini: Notasi postfix dengan stack; definisi dimulai '':'' dan diakhiri '';'', teks lewat .".','The missing word has 2 characters, starts with "c". About this language: Postfix notation with a stack; definitions start with '':'' and end with '';'', text via .".'),
('extreme','valid','Apakah kode Forth ini valid?','Is this Forth code valid?',': salam ." padang" crx ;
salam','forth','["Error: tanda kurung tidak seimbang","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unbalanced parentheses","Error: unknown function or keyword name","Valid, the code structure is complete"]'::jsonb,1,'"cr" salah ketik menjadi "crx" sehingga tidak dikenal oleh Forth.','"cr" was misspelled as "crx", so Forth does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "crx"). Apakah persis sama dengan yang dikenal Forth? Ingat: Notasi postfix dengan stack; definisi dimulai '':'' dan diakhiri '';'', teks lewat .".','Check the spelling of the main function or keyword (here it reads "crx"). Does it match exactly what Forth recognizes? Remember: Postfix notation with a stack; definitions start with '':'' and end with '';'', text via .".'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  print(("sambal", newline))
END','text','["ALGOL 68","Delphi","ARM Assembly"]'::jsonb,null,0,'ALGOL 68: Leluhur Pascal dan C.','ALGOL 68: Ancestor of Pascal and C.','Blok BEGIN ... END dan print dengan daftar argumen ganda ((...)). (Muncul sekitar tahun 1968.)','BEGIN ... END blocks and print with a doubled argument list ((...)). (First appeared around 1968.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  print(("padang", newline))
END','text','["ALGOL 68","Assembly x86","Oberon"]'::jsonb,null,0,'ALGOL 68: Leluhur Pascal dan C.','ALGOL 68: Ancestor of Pascal and C.','Blok BEGIN ... END dan print dengan daftar argumen ganda ((...)). (Muncul sekitar tahun 1968.)','BEGIN ... END blocks and print with a doubled argument list ((...)). (First appeared around 1968.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  print(("sate", newline))
END','text','["MUMPS","6502 Assembly","ALGOL 68"]'::jsonb,null,2,'ALGOL 68: Leluhur Pascal dan C.','ALGOL 68: Ancestor of Pascal and C.','Blok BEGIN ... END dan print dengan daftar argumen ganda ((...)). (Muncul sekitar tahun 1968.)','BEGIN ... END blocks and print with a doubled argument list ((...)). (First appeared around 1968.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  print(("laut", newline))
END','text','["Ada","ALGOL 68","APL"]'::jsonb,null,1,'ALGOL 68: Leluhur Pascal dan C.','ALGOL 68: Ancestor of Pascal and C.','Blok BEGIN ... END dan print dengan daftar argumen ganda ((...)). (Muncul sekitar tahun 1968.)','BEGIN ... END blocks and print with a doubled argument list ((...)). (First appeared around 1968.)'),
('extreme','fill','Lengkapi kode ALGOL 68 ini agar valid','Complete this ALGOL 68 code so it is valid','BEGIN
  ____(("bunga", newline))
END','text','["Print","print","Out.String"]'::jsonb,null,1,'print adalah bagian khas ALGOL 68. Leluhur Pascal dan C.','print is characteristic of ALGOL 68. Ancestor of Pascal and C.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Blok BEGIN ... END dan … dengan daftar argumen ganda ((...)).','The missing word has 5 characters, starts with "p" and ends with "t". About this language: BEGIN ... END blocks and … with a doubled argument list ((...)).'),
('extreme','valid','Apakah kode ALGOL 68 ini valid?','Is this ALGOL 68 code valid?','BEGIN
  printx(("sate", newline))
END','text','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: program entry point not found"]'::jsonb,0,'"print" salah ketik menjadi "printx" sehingga tidak dikenal oleh ALGOL 68.','"print" was misspelled as "printx", so ALGOL 68 does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "printx"). Apakah persis sama dengan yang dikenal ALGOL 68? Ingat: Blok BEGIN ... END dan print dengan daftar argumen ganda ((...)).','Check the spelling of the main function or keyword (here it reads "printx"). Does it match exactly what ALGOL 68 recognizes? Remember: BEGIN ... END blocks and print with a doubled argument list ((...)).'),
('extreme','guess','Bahasa apa ini?','Which language is this?','10 PRINT "MERDEKA"
20 END','text','["BASIC","Scheme","ARM Assembly"]'::jsonb,null,0,'BASIC: Dibuat agar pemula bisa memprogram.','BASIC: Created so beginners could program.','Baris bernomor (10, 20) dengan perintah PRINT dan END. (Muncul sekitar tahun 1964.)','Numbered lines (10, 20) with PRINT and END commands. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','10 PRINT "BECAK"
20 END','text','["RPG","BASIC","RISC-V Assembly"]'::jsonb,null,1,'BASIC: Dibuat agar pemula bisa memprogram.','BASIC: Created so beginners could program.','Baris bernomor (10, 20) dengan perintah PRINT dan END. (Muncul sekitar tahun 1964.)','Numbered lines (10, 20) with PRINT and END commands. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','10 PRINT "HUJAN"
20 END','text','["BASIC","Ada","Simula"]'::jsonb,null,0,'BASIC: Dibuat agar pemula bisa memprogram.','BASIC: Created so beginners could program.','Baris bernomor (10, 20) dengan perintah PRINT dan END. (Muncul sekitar tahun 1964.)','Numbered lines (10, 20) with PRINT and END commands. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','10 PRINT "DURIAN"
20 END','text','["BASIC","Scheme","Oberon"]'::jsonb,null,0,'BASIC: Dibuat agar pemula bisa memprogram.','BASIC: Created so beginners could program.','Baris bernomor (10, 20) dengan perintah PRINT dan END. (Muncul sekitar tahun 1964.)','Numbered lines (10, 20) with PRINT and END commands. (First appeared around 1964.)'),
('extreme','fill','Lengkapi kode BASIC ini agar valid','Complete this BASIC code so it is valid','10 ____ "PANTAI"
20 END','text','["create","syscall","PRINT"]'::jsonb,null,2,'PRINT adalah bagian khas BASIC. Dibuat agar pemula bisa memprogram.','PRINT is characteristic of BASIC. Created so beginners could program.','Kata yang hilang terdiri dari 5 karakter, diawali "P" dan diakhiri "T". Ciri bahasa ini: Baris bernomor (10, 20) dengan perintah … dan END.','The missing word has 5 characters, starts with "P" and ends with "T". About this language: Numbered lines (10, 20) with … and END commands.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','10 PRINT "GARUDA"
20 END','text','["BASIC","Scheme","Fortran"]'::jsonb,null,0,'BASIC: Dibuat agar pemula bisa memprogram.','BASIC: Created so beginners could program.','Baris bernomor (10, 20) dengan perintah PRINT dan END. (Muncul sekitar tahun 1964.)','Numbered lines (10, 20) with PRINT and END commands. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','TOTAL: PROCEDURE OPTIONS(MAIN);
  PUT SKIP LIST(''padang'');
END TOTAL;','text','["PL/I","Oberon","Wolfram Language"]'::jsonb,null,0,'PL/I: Gabungan Fortran, COBOL, dan ALGOL dari IBM.','PL/I: IBM''s blend of Fortran, COBOL, and ALGOL.','''PROCEDURE OPTIONS(MAIN);'' dan ''PUT SKIP LIST(...)''. (Muncul sekitar tahun 1964.)','''PROCEDURE OPTIONS(MAIN);'' and ''PUT SKIP LIST(...)''. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','HASIL: PROCEDURE OPTIONS(MAIN);
  PUT SKIP LIST(''garuda'');
END HASIL;','text','["Fortran","PL/I","Ada"]'::jsonb,null,1,'PL/I: Gabungan Fortran, COBOL, dan ALGOL dari IBM.','PL/I: IBM''s blend of Fortran, COBOL, and ALGOL.','''PROCEDURE OPTIONS(MAIN);'' dan ''PUT SKIP LIST(...)''. (Muncul sekitar tahun 1964.)','''PROCEDURE OPTIONS(MAIN);'' and ''PUT SKIP LIST(...)''. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','SUHU: PROCEDURE OPTIONS(MAIN);
  PUT SKIP LIST(''sambal'');
END SUHU;','text','["ARM Assembly","PL/I","Smalltalk"]'::jsonb,null,1,'PL/I: Gabungan Fortran, COBOL, dan ALGOL dari IBM.','PL/I: IBM''s blend of Fortran, COBOL, and ALGOL.','''PROCEDURE OPTIONS(MAIN);'' dan ''PUT SKIP LIST(...)''. (Muncul sekitar tahun 1964.)','''PROCEDURE OPTIONS(MAIN);'' and ''PUT SKIP LIST(...)''. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','ANTRIAN: PROCEDURE OPTIONS(MAIN);
  PUT SKIP LIST(''candi'');
END ANTRIAN;','text','["ABAP","Icon","PL/I"]'::jsonb,null,2,'PL/I: Gabungan Fortran, COBOL, dan ALGOL dari IBM.','PL/I: IBM''s blend of Fortran, COBOL, and ALGOL.','''PROCEDURE OPTIONS(MAIN);'' dan ''PUT SKIP LIST(...)''. (Muncul sekitar tahun 1964.)','''PROCEDURE OPTIONS(MAIN);'' and ''PUT SKIP LIST(...)''. (First appeared around 1964.)'),
('extreme','fill','Lengkapi kode PL/I ini agar valid','Complete this PL/I code so it is valid','SKOR: PROCEDURE OPTIONS(MAIN);
  ____ SKIP LIST(''batik'');
END SKOR;','text','["PUT","display","writeln"]'::jsonb,null,0,'PUT adalah bagian khas PL/I. Gabungan Fortran, COBOL, dan ALGOL dari IBM.','PUT is characteristic of PL/I. IBM''s blend of Fortran, COBOL, and ALGOL.','Kata yang hilang terdiri dari 3 karakter, diawali "P". Ciri bahasa ini: ''PROCEDURE OPTIONS(MAIN);'' dan ''… SKIP LIST(...)''.','The missing word has 3 characters, starts with "P". About this language: ''PROCEDURE OPTIONS(MAIN);'' and ''… SKIP LIST(...)''.'),
('extreme','valid','Apakah kode PL/I ini valid?','Is this PL/I code valid?','UMUR: PROCEDURE OPTIONS(MAIN);
  PUTx SKIP LIST(''wayang'');
END UMUR;','text','["Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Error: program entry point not found","Valid, the code structure is complete","Error: unknown function or keyword name"]'::jsonb,2,'"PUT" salah ketik menjadi "PUTx" sehingga tidak dikenal oleh PL/I.','"PUT" was misspelled as "PUTx", so PL/I does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "PUTx"). Apakah persis sama dengan yang dikenal PL/I? Ingat: ''PROCEDURE OPTIONS(MAIN);'' dan ''PUT SKIP LIST(...)''.','Check the spelling of the main function or keyword (here it reads "PUTx"). Does it match exactly what PL/I recognizes? Remember: ''PROCEDURE OPTIONS(MAIN);'' and ''PUT SKIP LIST(...)''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''kopi''','apl','["Simula","Logo","APL"]'::jsonb,null,2,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''gado''','apl','["Ada","Forth","APL"]'::jsonb,null,2,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''sate''','apl','["Assembly x86","Logo","APL"]'::jsonb,null,2,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''garuda''','apl','["Lisp","APL","Icon"]'::jsonb,null,1,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''nasi''','apl','["Standard ML","COBOL","APL"]'::jsonb,null,2,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','valid','Apakah kode APL ini valid?','Is this APL code valid?','⎕←''garuda','apl','["Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal","Error: string tidak ditutup"]'::jsonb,'["Valid, the code structure is complete","Error: unknown function or keyword name","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode APL ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Memakai simbol khusus seperti panah keluaran ''⎕←''.','Trace every string in this APL code: does each opening quote have a closing one? Remember: Uses special symbols such as the output arrow ''⎕←''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  OutText("sawah");
  OutImage;
END;','text','["Simula","APL","Logo"]'::jsonb,null,0,'Simula: Bahasa OOP pertama.','Simula: The first OOP language.','Blok BEGIN/END dengan OutText dan OutImage; pelopor pemrograman berorientasi objek. (Muncul sekitar tahun 1962.)','BEGIN/END blocks with OutText and OutImage; a pioneer of object-oriented programming. (First appeared around 1962.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  OutText("becak");
  OutImage;
END;','text','["RPG","Fortran","Simula"]'::jsonb,null,2,'Simula: Bahasa OOP pertama.','Simula: The first OOP language.','Blok BEGIN/END dengan OutText dan OutImage; pelopor pemrograman berorientasi objek. (Muncul sekitar tahun 1962.)','BEGIN/END blocks with OutText and OutImage; a pioneer of object-oriented programming. (First appeared around 1962.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  OutText("gunung");
  OutImage;
END;','text','["RISC-V Assembly","Simula","COBOL"]'::jsonb,null,1,'Simula: Bahasa OOP pertama.','Simula: The first OOP language.','Blok BEGIN/END dengan OutText dan OutImage; pelopor pemrograman berorientasi objek. (Muncul sekitar tahun 1962.)','BEGIN/END blocks with OutText and OutImage; a pioneer of object-oriented programming. (First appeared around 1962.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  OutText("nasi");
  OutImage;
END;','text','["6502 Assembly","Simula","BASIC"]'::jsonb,null,1,'Simula: Bahasa OOP pertama.','Simula: The first OOP language.','Blok BEGIN/END dengan OutText dan OutImage; pelopor pemrograman berorientasi objek. (Muncul sekitar tahun 1962.)','BEGIN/END blocks with OutText and OutImage; a pioneer of object-oriented programming. (First appeared around 1962.)'),
('extreme','fill','Lengkapi kode Simula ini agar valid','Complete this Simula code so it is valid','BEGIN
  ____("angin");
  OutImage;
END;','text','["say","format","OutText"]'::jsonb,null,2,'OutText adalah bagian khas Simula. Bahasa OOP pertama.','OutText is characteristic of Simula. The first OOP language.','Kata yang hilang terdiri dari 7 karakter, diawali "O" dan diakhiri "t". Ciri bahasa ini: Blok BEGIN/END dengan … dan OutImage; pelopor pemrograman berorientasi objek.','The missing word has 7 characters, starts with "O" and ends with "t". About this language: BEGIN/END blocks with … and OutImage; a pioneer of object-oriented programming.'),
('extreme','valid','Apakah kode Simula ini valid?','Is this Simula code valid?','BEGIN
  OutText("sambal";
  OutImage;
END;','text','["Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: program entry point not found","Error: unbalanced parentheses"]'::jsonb,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Blok BEGIN/END dengan OutText dan OutImage; pelopor pemrograman berorientasi objek.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: BEGIN/END blocks with OutText and OutImage; a pioneer of object-oriented programming.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Tiket;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("dunia"); WriteLn;
END Tiket.','text','["Assembly x86","MUMPS","Modula-2"]'::jsonb,null,2,'Modula-2: Penerus Pascal dengan modul.','Modula-2: A Pascal successor with modules.','Mirip Pascal, tetapi berstruktur ''MODULE ... FROM ... IMPORT ...''. (Muncul sekitar tahun 1978.)','Pascal-like, but structured as ''MODULE ... FROM ... IMPORT ...''. (First appeared around 1978.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Skor;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("becak"); WriteLn;
END Skor.','text','["Forth","ALGOL 68","Modula-2"]'::jsonb,null,2,'Modula-2: Penerus Pascal dengan modul.','Modula-2: A Pascal successor with modules.','Mirip Pascal, tetapi berstruktur ''MODULE ... FROM ... IMPORT ...''. (Muncul sekitar tahun 1978.)','Pascal-like, but structured as ''MODULE ... FROM ... IMPORT ...''. (First appeared around 1978.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Waktu;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("candi"); WriteLn;
END Waktu.','text','["Standard ML","RISC-V Assembly","Modula-2"]'::jsonb,null,2,'Modula-2: Penerus Pascal dengan modul.','Modula-2: A Pascal successor with modules.','Mirip Pascal, tetapi berstruktur ''MODULE ... FROM ... IMPORT ...''. (Muncul sekitar tahun 1978.)','Pascal-like, but structured as ''MODULE ... FROM ... IMPORT ...''. (First appeared around 1978.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Nilai;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("dunia"); WriteLn;
END Nilai.','text','["SNOBOL","Modula-2","BASIC"]'::jsonb,null,1,'Modula-2: Penerus Pascal dengan modul.','Modula-2: A Pascal successor with modules.','Mirip Pascal, tetapi berstruktur ''MODULE ... FROM ... IMPORT ...''. (Muncul sekitar tahun 1978.)','Pascal-like, but structured as ''MODULE ... FROM ... IMPORT ...''. (First appeared around 1978.)'),
('extreme','fill','Lengkapi kode Modula-2 ini agar valid','Complete this Modula-2 code so it is valid','____ Urut;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("sate"); WriteLn;
END Urut.','text','["MODULE","putstr","JSR"]'::jsonb,null,0,'MODULE adalah bagian khas Modula-2. Penerus Pascal dengan modul.','MODULE is characteristic of Modula-2. A Pascal successor with modules.','Kata yang hilang terdiri dari 6 karakter, diawali "M" dan diakhiri "E". Ciri bahasa ini: Mirip Pascal, tetapi berstruktur ''… ... FROM ... IMPORT ...''.','The missing word has 6 characters, starts with "M" and ends with "E". About this language: Pascal-like, but structured as ''… ... FROM ... IMPORT ...''.'),
('extreme','valid','Apakah kode Modula-2 ini valid?','Is this Modula-2 code valid?','MODULE Suhu;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("becak"); WriteLn;
END Suhu.','text','["Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: program entry point not found","Error: unbalanced parentheses"]'::jsonb,0,'Kode Modula-2 ini lengkap dan valid. Penerus Pascal dengan modul.','This Modula-2 code is complete and valid. A Pascal successor with modules.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Mirip Pascal, tetapi berstruktur ''MODULE ... FROM ... IMPORT ...''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Pascal-like, but structured as ''MODULE ... FROM ... IMPORT ...''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','**free
dsply ''angin'';
return;','text','["Simula","RPG","SNOBOL"]'::jsonb,null,1,'RPG: Pelaporan di mainframe IBM.','RPG: Report generation on IBM mainframes.','Bentuk bebas diawali ''**free'' dan perintah ''dsply''. (Muncul sekitar tahun 1959.)','Free-form starting with ''**free'' and a ''dsply'' command. (First appeared around 1959.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','**free
dsply ''sate'';
return;','text','["Forth","Modula-2","RPG"]'::jsonb,null,2,'RPG: Pelaporan di mainframe IBM.','RPG: Report generation on IBM mainframes.','Bentuk bebas diawali ''**free'' dan perintah ''dsply''. (Muncul sekitar tahun 1959.)','Free-form starting with ''**free'' and a ''dsply'' command. (First appeared around 1959.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','**free
dsply ''rendang'';
return;','text','["RPG","Pascal","Fortran"]'::jsonb,null,0,'RPG: Pelaporan di mainframe IBM.','RPG: Report generation on IBM mainframes.','Bentuk bebas diawali ''**free'' dan perintah ''dsply''. (Muncul sekitar tahun 1959.)','Free-form starting with ''**free'' and a ''dsply'' command. (First appeared around 1959.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','**free
dsply ''batik'';
return;','text','["BASIC","Icon","RPG"]'::jsonb,null,2,'RPG: Pelaporan di mainframe IBM.','RPG: Report generation on IBM mainframes.','Bentuk bebas diawali ''**free'' dan perintah ''dsply''. (Muncul sekitar tahun 1959.)','Free-form starting with ''**free'' and a ''dsply'' command. (First appeared around 1959.)'),
('extreme','fill','Lengkapi kode RPG ini agar valid','Complete this RPG code so it is valid','**free
____ ''batik'';
return;','text','["format","dsply","write"]'::jsonb,null,1,'dsply adalah bagian khas RPG. Pelaporan di mainframe IBM.','dsply is characteristic of RPG. Report generation on IBM mainframes.','Kata yang hilang terdiri dari 5 karakter, diawali "d" dan diakhiri "y". Ciri bahasa ini: Bentuk bebas diawali ''**free'' dan perintah ''…''.','The missing word has 5 characters, starts with "d" and ends with "y". About this language: Free-form starting with ''**free'' and a ''…'' command.'),
('extreme','valid','Apakah kode RPG ini valid?','Is this RPG code valid?','**free
dsplyx ''senja'';
return;','text','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,0,'"dsply" salah ketik menjadi "dsplyx" sehingga tidak dikenal oleh RPG.','"dsply" was misspelled as "dsplyx", so RPG does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "dsplyx"). Apakah persis sama dengan yang dikenal RPG? Ingat: Bentuk bebas diawali ''**free'' dan perintah ''dsply''.','Check the spelling of the main function or keyword (here it reads "dsplyx"). Does it match exactly what RPG recognizes? Remember: Free-form starting with ''**free'' and a ''dsply'' command.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','class LAJU
create make
feature
  make do
    print ("durian")
  end
end','text','["Eiffel","SNOBOL","Delphi"]'::jsonb,null,0,'Eiffel: Design by Contract.','Eiffel: Design by Contract.','Kelas dengan klausa ''create'', ''feature'', dan blok ''do ... end''. (Muncul sekitar tahun 1986.)','A class with ''create'', ''feature'' clauses and a ''do ... end'' block. (First appeared around 1986.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','class UKURAN
create make
feature
  make do
    print ("senja")
  end
end','text','["Oberon","Eiffel","Ada"]'::jsonb,null,1,'Eiffel: Design by Contract.','Eiffel: Design by Contract.','Kelas dengan klausa ''create'', ''feature'', dan blok ''do ... end''. (Muncul sekitar tahun 1986.)','A class with ''create'', ''feature'' clauses and a ''do ... end'' block. (First appeared around 1986.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','class PORSI
create make
feature
  make do
    print ("becak")
  end
end','text','["Oberon","Forth","Eiffel"]'::jsonb,null,2,'Eiffel: Design by Contract.','Eiffel: Design by Contract.','Kelas dengan klausa ''create'', ''feature'', dan blok ''do ... end''. (Muncul sekitar tahun 1986.)','A class with ''create'', ''feature'' clauses and a ''do ... end'' block. (First appeared around 1986.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','class LAJU
create make
feature
  make do
    print ("sawah")
  end
end','text','["Eiffel","ARM Assembly","MUMPS"]'::jsonb,null,0,'Eiffel: Design by Contract.','Eiffel: Design by Contract.','Kelas dengan klausa ''create'', ''feature'', dan blok ''do ... end''. (Muncul sekitar tahun 1986.)','A class with ''create'', ''feature'' clauses and a ''do ... end'' block. (First appeared around 1986.)'),
('extreme','fill','Lengkapi kode Eiffel ini agar valid','Complete this Eiffel code so it is valid','class UMUR
____ make
feature
  make do
    print ("angin")
  end
end','text','["cr","MODULE","create"]'::jsonb,null,2,'create adalah bagian khas Eiffel. Design by Contract.','create is characteristic of Eiffel. Design by Contract.','Kata yang hilang terdiri dari 6 karakter, diawali "c" dan diakhiri "e". Ciri bahasa ini: Kelas dengan klausa ''…'', ''feature'', dan blok ''do ... end''.','The missing word has 6 characters, starts with "c" and ends with "e". About this language: A class with ''…'', ''feature'' clauses and a ''do ... end'' block.'),
('extreme','valid','Apakah kode Eiffel ini valid?','Is this Eiffel code valid?','class UMUR
create make
feature
  make do
    print ("laut")
  end
end','text','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Valid, the code structure is complete","Error: unterminated string","Error: program entry point not found"]'::jsonb,0,'Kode Eiffel ini lengkap dan valid. Design by Contract.','This Eiffel code is complete and valid. Design by Contract.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Kelas dengan klausa ''create'', ''feature'', dan blok ''do ... end''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: A class with ''create'', ''feature'' clauses and a ''do ... end'' block.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','print [candi]','text','["RPG","ALGOL 68","Logo"]'::jsonb,null,2,'Logo: Kura-kura grafis untuk anak.','Logo: The turtle graphics language for kids.','Perintah sederhana tanpa tanda baca selain kurung siku: print [kata]. (Muncul sekitar tahun 1967.)','Simple commands with no punctuation except square brackets: print [word]. (First appeared around 1967.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','print [gunung]','text','["Oberon","Logo","Lisp"]'::jsonb,null,1,'Logo: Kura-kura grafis untuk anak.','Logo: The turtle graphics language for kids.','Perintah sederhana tanpa tanda baca selain kurung siku: print [kata]. (Muncul sekitar tahun 1967.)','Simple commands with no punctuation except square brackets: print [word]. (First appeared around 1967.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','print [nasi]','text','["Smalltalk","Logo","B"]'::jsonb,null,1,'Logo: Kura-kura grafis untuk anak.','Logo: The turtle graphics language for kids.','Perintah sederhana tanpa tanda baca selain kurung siku: print [kata]. (Muncul sekitar tahun 1967.)','Simple commands with no punctuation except square brackets: print [word]. (First appeared around 1967.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','print [becak]','text','["COBOL","Logo","Simula"]'::jsonb,null,1,'Logo: Kura-kura grafis untuk anak.','Logo: The turtle graphics language for kids.','Perintah sederhana tanpa tanda baca selain kurung siku: print [kata]. (Muncul sekitar tahun 1967.)','Simple commands with no punctuation except square brackets: print [word]. (First appeared around 1967.)'),
('extreme','fill','Lengkapi kode Logo ini agar valid','Complete this Logo code so it is valid','____ [durian]','text','["Out.String","OutText","print"]'::jsonb,null,2,'print adalah bagian khas Logo. Kura-kura grafis untuk anak.','print is characteristic of Logo. The turtle graphics language for kids.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Perintah sederhana tanpa tanda baca selain kurung siku: … [kata].','The missing word has 5 characters, starts with "p" and ends with "t". About this language: Simple commands with no punctuation except square brackets: … [word].'),
('extreme','valid','Apakah kode Logo ini valid?','Is this Logo code valid?','print [wayang]','text','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Valid, the code structure is complete","Error: unterminated string","Error: program entry point not found"]'::jsonb,0,'Kode Logo ini lengkap dan valid. Kura-kura grafis untuk anak.','This Logo code is complete and valid. The turtle graphics language for kids.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Perintah sederhana tanpa tanda baca selain kurung siku: print [kata].','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Simple commands with no punctuation except square brackets: print [word].'),
('extreme','guess','Bahasa apa ini?','Which language is this?','    OUTPUT = ''halo''
END','text','["Awk","Delphi","SNOBOL"]'::jsonb,null,2,'SNOBOL: Pengolahan string dan pola.','SNOBOL: String and pattern processing.','Penugasan ke variabel khusus untuk menampilkan teks dan program ditutup ''END''. (Muncul sekitar tahun 1962.)','An assignment to a special text-emitting variable, and the program closes with ''END''. (First appeared around 1962.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','    OUTPUT = ''dunia''
END','text','["Standard ML","6502 Assembly","SNOBOL"]'::jsonb,null,2,'SNOBOL: Pengolahan string dan pola.','SNOBOL: String and pattern processing.','Penugasan ke variabel khusus untuk menampilkan teks dan program ditutup ''END''. (Muncul sekitar tahun 1962.)','An assignment to a special text-emitting variable, and the program closes with ''END''. (First appeared around 1962.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','    OUTPUT = ''bunga''
END','text','["Eiffel","SNOBOL","Oberon"]'::jsonb,null,1,'SNOBOL: Pengolahan string dan pola.','SNOBOL: String and pattern processing.','Penugasan ke variabel khusus untuk menampilkan teks dan program ditutup ''END''. (Muncul sekitar tahun 1962.)','An assignment to a special text-emitting variable, and the program closes with ''END''. (First appeared around 1962.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','    OUTPUT = ''gunung''
END','text','["BASIC","Delphi","SNOBOL"]'::jsonb,null,2,'SNOBOL: Pengolahan string dan pola.','SNOBOL: String and pattern processing.','Penugasan ke variabel khusus untuk menampilkan teks dan program ditutup ''END''. (Muncul sekitar tahun 1962.)','An assignment to a special text-emitting variable, and the program closes with ''END''. (First appeared around 1962.)'),
('extreme','fill','Lengkapi kode SNOBOL ini agar valid','Complete this SNOBOL code so it is valid','    ____ = ''nasi''
END','text','["say","OUTPUT","writeln"]'::jsonb,null,1,'OUTPUT adalah bagian khas SNOBOL. Pengolahan string dan pola.','OUTPUT is characteristic of SNOBOL. String and pattern processing.','Kata yang hilang terdiri dari 6 karakter, diawali "O" dan diakhiri "T". Ciri bahasa ini: Penugasan ke variabel khusus untuk menampilkan teks dan program ditutup ''END''.','The missing word has 6 characters, starts with "O" and ends with "T". About this language: An assignment to a special text-emitting variable, and the program closes with ''END''.'),
('extreme','valid','Apakah kode SNOBOL ini valid?','Is this SNOBOL code valid?','    OUTPUT = ''halo''
END','text','["Error: tanda kurung tidak seimbang","Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unbalanced parentheses","Error: program entry point not found","Valid, the code structure is complete"]'::jsonb,2,'Kode SNOBOL ini lengkap dan valid. Pengolahan string dan pola.','This SNOBOL code is complete and valid. String and pattern processing.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Penugasan ke variabel khusus untuk menampilkan teks dan program ditutup ''END''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: An assignment to a special text-emitting variable, and the program closes with ''END''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','WRITE "sambal",!','text','["MUMPS","Smalltalk","PL/I"]'::jsonb,null,0,'MUMPS: Basis data rumah sakit.','MUMPS: The hospital database language.','Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru. (Muncul sekitar tahun 1966.)','A ''WRITE'' command with a string and an exclamation mark for a new line. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','WRITE "senja",!','text','["Awk","RISC-V Assembly","MUMPS"]'::jsonb,null,2,'MUMPS: Basis data rumah sakit.','MUMPS: The hospital database language.','Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru. (Muncul sekitar tahun 1966.)','A ''WRITE'' command with a string and an exclamation mark for a new line. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','WRITE "kopi",!','text','["B","MUMPS","Wolfram Language"]'::jsonb,null,1,'MUMPS: Basis data rumah sakit.','MUMPS: The hospital database language.','Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru. (Muncul sekitar tahun 1966.)','A ''WRITE'' command with a string and an exclamation mark for a new line. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','WRITE "merdeka",!','text','["BASIC","APL","MUMPS"]'::jsonb,null,2,'MUMPS: Basis data rumah sakit.','MUMPS: The hospital database language.','Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru. (Muncul sekitar tahun 1966.)','A ''WRITE'' command with a string and an exclamation mark for a new line. (First appeared around 1966.)'),
('extreme','fill','Lengkapi kode MUMPS ini agar valid','Complete this MUMPS code so it is valid','____ "kopi",!','text','["dsply","WRITE","OutText"]'::jsonb,null,1,'WRITE adalah bagian khas MUMPS. Basis data rumah sakit.','WRITE is characteristic of MUMPS. The hospital database language.','Kata yang hilang terdiri dari 5 karakter, diawali "W" dan diakhiri "E". Ciri bahasa ini: Perintah ''…'' dengan string dan tanda seru untuk baris baru.','The missing word has 5 characters, starts with "W" and ends with "E". About this language: A ''…'' command with a string and an exclamation mark for a new line.'),
('extreme','valid','Apakah kode MUMPS ini valid?','Is this MUMPS code valid?','WRITE "bunga,!','text','["Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan","Error: string tidak ditutup"]'::jsonb,'["Valid, the code structure is complete","Error: program entry point not found","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode MUMPS ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru.','Trace every string in this MUMPS code: does each opening quote have a closing one? Remember: A ''WRITE'' command with a string and an exclamation mark for a new line.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','say "sate"','text','["6502 Assembly","Logo","Rexx"]'::jsonb,null,2,'Rexx: Skrip mainframe IBM.','Rexx: Scripting on IBM mainframes.','Perintah ''say'' dengan string berkutip untuk skrip mainframe. (Muncul sekitar tahun 1979.)','A ''say'' command with a quoted string, used for mainframe scripts. (First appeared around 1979.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','say "garuda"','text','["Rexx","Logo","ALGOL 68"]'::jsonb,null,0,'Rexx: Skrip mainframe IBM.','Rexx: Scripting on IBM mainframes.','Perintah ''say'' dengan string berkutip untuk skrip mainframe. (Muncul sekitar tahun 1979.)','A ''say'' command with a quoted string, used for mainframe scripts. (First appeared around 1979.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','say "angin"','text','["Rexx","Pascal","ABAP"]'::jsonb,null,0,'Rexx: Skrip mainframe IBM.','Rexx: Scripting on IBM mainframes.','Perintah ''say'' dengan string berkutip untuk skrip mainframe. (Muncul sekitar tahun 1979.)','A ''say'' command with a quoted string, used for mainframe scripts. (First appeared around 1979.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','say "candi"','text','["Oberon","Rexx","RPG"]'::jsonb,null,1,'Rexx: Skrip mainframe IBM.','Rexx: Scripting on IBM mainframes.','Perintah ''say'' dengan string berkutip untuk skrip mainframe. (Muncul sekitar tahun 1979.)','A ''say'' command with a quoted string, used for mainframe scripts. (First appeared around 1979.)'),
('extreme','fill','Lengkapi kode Rexx ini agar valid','Complete this Rexx code so it is valid','____ "sawah"','text','["dsply","WRITE","say"]'::jsonb,null,2,'say adalah bagian khas Rexx. Skrip mainframe IBM.','say is characteristic of Rexx. Scripting on IBM mainframes.','Kata yang hilang terdiri dari 3 karakter, diawali "s". Ciri bahasa ini: Perintah ''…'' dengan string berkutip untuk skrip mainframe.','The missing word has 3 characters, starts with "s". About this language: A ''…'' command with a quoted string, used for mainframe scripts.'),
('extreme','valid','Apakah kode Rexx ini valid?','Is this Rexx code valid?','say "rendang"','text','["Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,'["Error: program entry point not found","Valid, the code structure is complete","Error: unbalanced parentheses"]'::jsonb,1,'Kode Rexx ini lengkap dan valid. Skrip mainframe IBM.','This Rexx code is complete and valid. Scripting on IBM mainframes.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Perintah ''say'' dengan string berkutip untuk skrip mainframe.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: A ''say'' command with a quoted string, used for mainframe scripts.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','REPORT zsalam.
WRITE ''nasi''.','text','["MIPS Assembly","ABAP","BASIC"]'::jsonb,null,1,'ABAP: Bahasa sistem SAP.','ABAP: SAP''s system language.','Diawali ''REPORT'' dan ''WRITE'' dengan string berkutip tunggal; tiap perintah diakhiri titik. (Muncul sekitar tahun 1983.)','Starts with ''REPORT'' and ''WRITE'' with a single-quoted string; every statement ends with a period. (First appeared around 1983.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','REPORT zsalam.
WRITE ''garuda''.','text','["RPG","ABAP","Rexx"]'::jsonb,null,1,'ABAP: Bahasa sistem SAP.','ABAP: SAP''s system language.','Diawali ''REPORT'' dan ''WRITE'' dengan string berkutip tunggal; tiap perintah diakhiri titik. (Muncul sekitar tahun 1983.)','Starts with ''REPORT'' and ''WRITE'' with a single-quoted string; every statement ends with a period. (First appeared around 1983.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','REPORT zsalam.
WRITE ''sawah''.','text','["MIPS Assembly","Eiffel","ABAP"]'::jsonb,null,2,'ABAP: Bahasa sistem SAP.','ABAP: SAP''s system language.','Diawali ''REPORT'' dan ''WRITE'' dengan string berkutip tunggal; tiap perintah diakhiri titik. (Muncul sekitar tahun 1983.)','Starts with ''REPORT'' and ''WRITE'' with a single-quoted string; every statement ends with a period. (First appeared around 1983.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','REPORT zsalam.
WRITE ''sate''.','text','["B","Ada","ABAP"]'::jsonb,null,2,'ABAP: Bahasa sistem SAP.','ABAP: SAP''s system language.','Diawali ''REPORT'' dan ''WRITE'' dengan string berkutip tunggal; tiap perintah diakhiri titik. (Muncul sekitar tahun 1983.)','Starts with ''REPORT'' and ''WRITE'' with a single-quoted string; every statement ends with a period. (First appeared around 1983.)'),
('extreme','fill','Lengkapi kode ABAP ini agar valid','Complete this ABAP code so it is valid','____ zsalam.
WRITE ''merdeka''.','text','["REPORT","MODULE","WRITE"]'::jsonb,null,0,'REPORT adalah bagian khas ABAP. Bahasa sistem SAP.','REPORT is characteristic of ABAP. SAP''s system language.','Kata yang hilang terdiri dari 6 karakter, diawali "R" dan diakhiri "T". Ciri bahasa ini: Diawali ''…'' dan ''WRITE'' dengan string berkutip tunggal; tiap perintah diakhiri titik.','The missing word has 6 characters, starts with "R" and ends with "T". About this language: Starts with ''…'' and ''WRITE'' with a single-quoted string; every statement ends with a period.'),
('extreme','valid','Apakah kode ABAP ini valid?','Is this ABAP code valid?','REPORT zsalam.
WRITE ''durian.','text','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode ABAP ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Diawali ''REPORT'' dan ''WRITE'' dengan string berkutip tunggal; tiap perintah diakhiri titik.','Trace every string in this ABAP code: does each opening quote have a closing one? Remember: Starts with ''REPORT'' and ''WRITE'' with a single-quoted string; every statement ends with a period.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Total;
IMPORT Out;
BEGIN
  Out.String("laut"); Out.Ln
END Total.','text','["Oberon","Pascal","BASIC"]'::jsonb,null,0,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Urut;
IMPORT Out;
BEGIN
  Out.String("bakso"); Out.Ln
END Urut.','text','["Oberon","Standard ML","Pascal"]'::jsonb,null,0,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Umur;
IMPORT Out;
BEGIN
  Out.String("gado"); Out.Ln
END Umur.','text','["Oberon","Smalltalk","Forth"]'::jsonb,null,0,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Nilai;
IMPORT Out;
BEGIN
  Out.String("hujan"); Out.Ln
END Nilai.','text','["MIPS Assembly","Rexx","Oberon"]'::jsonb,null,2,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','fill','Lengkapi kode Oberon ini agar valid','Complete this Oberon code so it is valid','MODULE Hasil;
IMPORT Out;
BEGIN
  ____("bakso"); Out.Ln
END Hasil.','text','["DISPLAY","Out.String","syscall"]'::jsonb,null,1,'Out.String adalah bagian khas Oberon. Penerus Modula-2 oleh Niklaus Wirth.','Out.String is characteristic of Oberon. Niklaus Wirth''s successor to Modula-2.','Kata yang hilang terdiri dari 10 karakter, diawali "O" dan diakhiri "g". Ciri bahasa ini: Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan ….','The missing word has 10 characters, starts with "O" and ends with "g". About this language: Modula-2-like: ''MODULE ... IMPORT Out;'' and ….'),
('extreme','valid','Apakah kode Oberon ini valid?','Is this Oberon code valid?','MODULE Poin;
IMPORT Out;
BEGIN
  Out.String("laut"; Out.Ln
END Poin.','text','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: unbalanced parentheses"]'::jsonb,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','val _ = print "merdeka\n";','sml','["Oberon","B","Standard ML"]'::jsonb,null,2,'Standard ML: Fungsional bertipe dengan semantik formal.','Standard ML: Statically typed functional language with formal semantics.','Fungsional bertipe: ''val _ = print "...\n";''. (Muncul sekitar tahun 1983.)','Typed functional: ''val _ = print "...\n";''. (First appeared around 1983.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','val _ = print "angkot\n";','sml','["Simula","Awk","Standard ML"]'::jsonb,null,2,'Standard ML: Fungsional bertipe dengan semantik formal.','Standard ML: Statically typed functional language with formal semantics.','Fungsional bertipe: ''val _ = print "...\n";''. (Muncul sekitar tahun 1983.)','Typed functional: ''val _ = print "...\n";''. (First appeared around 1983.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','val _ = print "sambal\n";','sml','["Assembly x86","Standard ML","Modula-2"]'::jsonb,null,1,'Standard ML: Fungsional bertipe dengan semantik formal.','Standard ML: Statically typed functional language with formal semantics.','Fungsional bertipe: ''val _ = print "...\n";''. (Muncul sekitar tahun 1983.)','Typed functional: ''val _ = print "...\n";''. (First appeared around 1983.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','val _ = print "durian\n";','sml','["Lisp","Prolog","Standard ML"]'::jsonb,null,2,'Standard ML: Fungsional bertipe dengan semantik formal.','Standard ML: Statically typed functional language with formal semantics.','Fungsional bertipe: ''val _ = print "...\n";''. (Muncul sekitar tahun 1983.)','Typed functional: ''val _ = print "...\n";''. (First appeared around 1983.)'),
('extreme','fill','Lengkapi kode Standard ML ini agar valid','Complete this Standard ML code so it is valid','val _ = ____ "nasi\n";','sml','["int 0x80","print","dsply"]'::jsonb,null,1,'print adalah bagian khas Standard ML. Fungsional bertipe dengan semantik formal.','print is characteristic of Standard ML. Statically typed functional language with formal semantics.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Fungsional bertipe: ''val _ = … "...\n";''.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: Typed functional: ''val _ = … "...\n";''.'),
('extreme','valid','Apakah kode Standard ML ini valid?','Is this Standard ML code valid?','val _ = print "durian\n";','sml','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,1,'Kode Standard ML ini lengkap dan valid. Fungsional bertipe dengan semantik formal.','This Standard ML code is complete and valid. Statically typed functional language with formal semantics.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Fungsional bertipe: ''val _ = print "...\n";''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Typed functional: ''val _ = print "...\n";''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["merdeka"]','wolfram','["Wolfram Language","Eiffel","6502 Assembly"]'::jsonb,null,0,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["kerupuk"]','wolfram','["Wolfram Language","SNOBOL","RISC-V Assembly"]'::jsonb,null,0,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["wayang"]','wolfram','["Wolfram Language","ARM Assembly","Fortran"]'::jsonb,null,0,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["gunung"]','wolfram','["Rexx","Wolfram Language","BASIC"]'::jsonb,null,1,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','fill','Lengkapi kode Wolfram Language ini agar valid','Complete this Wolfram Language code so it is valid','____["becak"]','wolfram','["WRITE","Print","ShowMessage"]'::jsonb,null,1,'Print adalah bagian khas Wolfram Language. Komputasi simbolik Mathematica.','Print is characteristic of Wolfram Language. Symbolic computation in Mathematica.','Kata yang hilang terdiri dari 5 karakter, diawali "P" dan diakhiri "t". Ciri bahasa ini: Pemanggilan fungsi memakai kurung siku: …["..."].','The missing word has 5 characters, starts with "P" and ends with "t". About this language: Function calls use square brackets: …["..."].'),
('extreme','valid','Apakah kode Wolfram Language ini valid?','Is this Wolfram Language code valid?','Print["candi"]','wolfram','["Error: string tidak ditutup","Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan"]'::jsonb,'["Error: unterminated string","Valid, the code structure is complete","Error: program entry point not found"]'::jsonb,1,'Kode Wolfram Language ini lengkap dan valid. Komputasi simbolik Mathematica.','This Wolfram Language code is complete and valid. Symbolic computation in Mathematica.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Pemanggilan fungsi memakai kurung siku: Print["..."].','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Function calls use square brackets: Print["..."].'),
('extreme','guess','Bahasa apa ini?','Which language is this?','procedure main()
  write("kerupuk")
end','text','["Lisp","Scheme","Icon"]'::jsonb,null,2,'Icon: Pencarian pola dan string.','Icon: Pattern and string searching.','''procedure main()'' dengan write(...) dan blok ditutup ''end''. (Muncul sekitar tahun 1977.)','''procedure main()'' with write(...) and a block closed by ''end''. (First appeared around 1977.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','procedure main()
  write("wayang")
end','text','["Scheme","Icon","Ada"]'::jsonb,null,1,'Icon: Pencarian pola dan string.','Icon: Pattern and string searching.','''procedure main()'' dengan write(...) dan blok ditutup ''end''. (Muncul sekitar tahun 1977.)','''procedure main()'' with write(...) and a block closed by ''end''. (First appeared around 1977.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','procedure main()
  write("bunga")
end','text','["Wolfram Language","Icon","Eiffel"]'::jsonb,null,1,'Icon: Pencarian pola dan string.','Icon: Pattern and string searching.','''procedure main()'' dengan write(...) dan blok ditutup ''end''. (Muncul sekitar tahun 1977.)','''procedure main()'' with write(...) and a block closed by ''end''. (First appeared around 1977.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','procedure main()
  write("candi")
end','text','["Simula","Standard ML","Icon"]'::jsonb,null,2,'Icon: Pencarian pola dan string.','Icon: Pattern and string searching.','''procedure main()'' dengan write(...) dan blok ditutup ''end''. (Muncul sekitar tahun 1977.)','''procedure main()'' with write(...) and a block closed by ''end''. (First appeared around 1977.)'),
('extreme','fill','Lengkapi kode Icon ini agar valid','Complete this Icon code so it is valid','procedure main()
  ____("durian")
end','text','["ecall","write","putstr"]'::jsonb,null,1,'write adalah bagian khas Icon. Pencarian pola dan string.','write is characteristic of Icon. Pattern and string searching.','Kata yang hilang terdiri dari 5 karakter, diawali "w" dan diakhiri "e". Ciri bahasa ini: ''procedure main()'' dengan …(...) dan blok ditutup ''end''.','The missing word has 5 characters, starts with "w" and ends with "e". About this language: ''procedure main()'' with …(...) and a block closed by ''end''.'),
('extreme','valid','Apakah kode Icon ini valid?','Is this Icon code valid?','procedure main()
  write("tempe"
end','text','["Error: nama fungsi atau kata kunci tidak dikenal","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unknown function or keyword name","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: ''procedure main()'' dengan write(...) dan blok ditutup ''end''.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: ''procedure main()'' with write(...) and a block closed by ''end''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .asciiz "angkot"
.text
  li $v0, 4
  la $a0, msg
  syscall','asm','["MIPS Assembly","Lisp","Eiffel"]'::jsonb,null,0,'MIPS Assembly: Assembly RISC klasik untuk pengajaran.','MIPS Assembly: Classic RISC assembly for teaching.','Direktif .data/.text, instruksi li/la, dan ''syscall''. (Muncul sekitar tahun 1985.)','.data/.text directives, li/la instructions, and ''syscall''. (First appeared around 1985.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .asciiz "bakso"
.text
  li $v0, 4
  la $a0, msg
  syscall','asm','["MIPS Assembly","Eiffel","Icon"]'::jsonb,null,0,'MIPS Assembly: Assembly RISC klasik untuk pengajaran.','MIPS Assembly: Classic RISC assembly for teaching.','Direktif .data/.text, instruksi li/la, dan ''syscall''. (Muncul sekitar tahun 1985.)','.data/.text directives, li/la instructions, and ''syscall''. (First appeared around 1985.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .asciiz "padang"
.text
  li $v0, 4
  la $a0, msg
  syscall','asm','["ALGOL 68","MIPS Assembly","Scheme"]'::jsonb,null,1,'MIPS Assembly: Assembly RISC klasik untuk pengajaran.','MIPS Assembly: Classic RISC assembly for teaching.','Direktif .data/.text, instruksi li/la, dan ''syscall''. (Muncul sekitar tahun 1985.)','.data/.text directives, li/la instructions, and ''syscall''. (First appeared around 1985.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .asciiz "tempe"
.text
  li $v0, 4
  la $a0, msg
  syscall','asm','["SNOBOL","MIPS Assembly","Modula-2"]'::jsonb,null,1,'MIPS Assembly: Assembly RISC klasik untuk pengajaran.','MIPS Assembly: Classic RISC assembly for teaching.','Direktif .data/.text, instruksi li/la, dan ''syscall''. (Muncul sekitar tahun 1985.)','.data/.text directives, li/la instructions, and ''syscall''. (First appeared around 1985.)'),
('extreme','fill','Lengkapi kode MIPS Assembly ini agar valid','Complete this MIPS Assembly code so it is valid','.data
msg: .asciiz "nasi"
.text
  li $v0, 4
  la $a0, msg
  ____','asm','["MODULE","syscall","create"]'::jsonb,null,1,'syscall adalah bagian khas MIPS Assembly. Assembly RISC klasik untuk pengajaran.','syscall is characteristic of MIPS Assembly. Classic RISC assembly for teaching.','Kata yang hilang terdiri dari 7 karakter, diawali "s" dan diakhiri "l". Ciri bahasa ini: Direktif .data/.text, instruksi li/la, dan ''…''.','The missing word has 7 characters, starts with "s" and ends with "l". About this language: .data/.text directives, li/la instructions, and ''…''.'),
('extreme','valid','Apakah kode MIPS Assembly ini valid?','Is this MIPS Assembly code valid?','.data
msg: .asciiz "gado
.text
  li $v0, 4
  la $a0, msg
  syscall','asm','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Valid, the code structure is complete","Error: unterminated string","Error: unknown function or keyword name"]'::jsonb,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode MIPS Assembly ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Direktif .data/.text, instruksi li/la, dan ''syscall''.','Trace every string in this MIPS Assembly code: does each opening quote have a closing one? Remember: .data/.text directives, li/la instructions, and ''syscall''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .string "kerupuk"
.text
  li a7, 64
  la a1, msg
  ecall','asm','["Forth","RISC-V Assembly","MUMPS"]'::jsonb,null,1,'RISC-V Assembly: Arsitektur set instruksi terbuka.','RISC-V Assembly: An open instruction set architecture.','Register a0-a7, instruksi li/la, dan ''ecall''. (Muncul sekitar tahun 2010.)','Registers a0-a7, li/la instructions, and ''ecall''. (First appeared around 2010.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .string "halo"
.text
  li a7, 64
  la a1, msg
  ecall','asm','["RISC-V Assembly","Ada","Wolfram Language"]'::jsonb,null,0,'RISC-V Assembly: Arsitektur set instruksi terbuka.','RISC-V Assembly: An open instruction set architecture.','Register a0-a7, instruksi li/la, dan ''ecall''. (Muncul sekitar tahun 2010.)','Registers a0-a7, li/la instructions, and ''ecall''. (First appeared around 2010.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .string "batik"
.text
  li a7, 64
  la a1, msg
  ecall','asm','["Ada","RISC-V Assembly","Forth"]'::jsonb,null,1,'RISC-V Assembly: Arsitektur set instruksi terbuka.','RISC-V Assembly: An open instruction set architecture.','Register a0-a7, instruksi li/la, dan ''ecall''. (Muncul sekitar tahun 2010.)','Registers a0-a7, li/la instructions, and ''ecall''. (First appeared around 2010.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .string "rendang"
.text
  li a7, 64
  la a1, msg
  ecall','asm','["ALGOL 68","RISC-V Assembly","Forth"]'::jsonb,null,1,'RISC-V Assembly: Arsitektur set instruksi terbuka.','RISC-V Assembly: An open instruction set architecture.','Register a0-a7, instruksi li/la, dan ''ecall''. (Muncul sekitar tahun 2010.)','Registers a0-a7, li/la instructions, and ''ecall''. (First appeared around 2010.)'),
('extreme','fill','Lengkapi kode RISC-V Assembly ini agar valid','Complete this RISC-V Assembly code so it is valid','.data
msg: .string "garuda"
.text
  li a7, 64
  la a1, msg
  ____','asm','["ecall","PRINT","write"]'::jsonb,null,0,'ecall adalah bagian khas RISC-V Assembly. Arsitektur set instruksi terbuka.','ecall is characteristic of RISC-V Assembly. An open instruction set architecture.','Kata yang hilang terdiri dari 5 karakter, diawali "e" dan diakhiri "l". Ciri bahasa ini: Register a0-a7, instruksi li/la, dan ''…''.','The missing word has 5 characters, starts with "e" and ends with "l". About this language: Registers a0-a7, li/la instructions, and ''…''.'),
('extreme','valid','Apakah kode RISC-V Assembly ini valid?','Is this RISC-V Assembly code valid?','.data
msg: .string "halo
.text
  li a7, 64
  la a1, msg
  ecall','asm','["Valid, struktur kodenya lengkap","Error: tanda kurung tidak seimbang","Error: string tidak ditutup"]'::jsonb,'["Valid, the code structure is complete","Error: unbalanced parentheses","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode RISC-V Assembly ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Register a0-a7, instruksi li/la, dan ''ecall''.','Trace every string in this RISC-V Assembly code: does each opening quote have a closing one? Remember: Registers a0-a7, li/la instructions, and ''ecall''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','main() {
  putstr("angin*n");
}','text','["B","RPG","APL"]'::jsonb,null,0,'B: Pendahulu langsung C.','B: The direct predecessor of C.','Tanpa tipe: ''main() { ... }'' dengan putstr dan akhir baris ''*n''. (Muncul sekitar tahun 1969.)','Typeless: ''main() { ... }'' with putstr and a ''*n'' line ending. (First appeared around 1969.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','main() {
  putstr("laut*n");
}','text','["ABAP","Fortran","B"]'::jsonb,null,2,'B: Pendahulu langsung C.','B: The direct predecessor of C.','Tanpa tipe: ''main() { ... }'' dengan putstr dan akhir baris ''*n''. (Muncul sekitar tahun 1969.)','Typeless: ''main() { ... }'' with putstr and a ''*n'' line ending. (First appeared around 1969.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','main() {
  putstr("kerupuk*n");
}','text','["B","Pascal","Lisp"]'::jsonb,null,0,'B: Pendahulu langsung C.','B: The direct predecessor of C.','Tanpa tipe: ''main() { ... }'' dengan putstr dan akhir baris ''*n''. (Muncul sekitar tahun 1969.)','Typeless: ''main() { ... }'' with putstr and a ''*n'' line ending. (First appeared around 1969.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','main() {
  putstr("bunga*n");
}','text','["B","SNOBOL","BASIC"]'::jsonb,null,0,'B: Pendahulu langsung C.','B: The direct predecessor of C.','Tanpa tipe: ''main() { ... }'' dengan putstr dan akhir baris ''*n''. (Muncul sekitar tahun 1969.)','Typeless: ''main() { ... }'' with putstr and a ''*n'' line ending. (First appeared around 1969.)'),
('extreme','fill','Lengkapi kode B ini agar valid','Complete this B code so it is valid','main() {
  ____("merdeka*n");
}','text','["display","writeln","putstr"]'::jsonb,null,2,'putstr adalah bagian khas B. Pendahulu langsung C.','putstr is characteristic of B. The direct predecessor of C.','Kata yang hilang terdiri dari 6 karakter, diawali "p" dan diakhiri "r". Ciri bahasa ini: Tanpa tipe: ''main() { ... }'' dengan … dan akhir baris ''*n''.','The missing word has 6 characters, starts with "p" and ends with "r". About this language: Typeless: ''main() { ... }'' with … and a ''*n'' line ending.'),
('extreme','valid','Apakah kode B ini valid?','Is this B code valid?','main() {
  putstr("gado*n";
}','text','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: tanda kurung tidak seimbang"]'::jsonb,'["Valid, the code structure is complete","Error: unterminated string","Error: unbalanced parentheses"]'::jsonb,2,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Tanpa tipe: ''main() { ... }'' dengan putstr dan akhir baris ''*n''.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Typeless: ''main() { ... }'' with putstr and a ''*n'' line ending.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN { print "candi" }','awk','["Awk","Oberon","Eiffel"]'::jsonb,null,0,'Awk: Pemrosesan teks berbasis pola.','Awk: Pattern-based text processing.','Blok ''BEGIN { print ... }'' tanpa titik koma. (Muncul sekitar tahun 1977.)','A ''BEGIN { print ... }'' block without semicolons. (First appeared around 1977.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN { print "laut" }','awk','["Pascal","Awk","SNOBOL"]'::jsonb,null,1,'Awk: Pemrosesan teks berbasis pola.','Awk: Pattern-based text processing.','Blok ''BEGIN { print ... }'' tanpa titik koma. (Muncul sekitar tahun 1977.)','A ''BEGIN { print ... }'' block without semicolons. (First appeared around 1977.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN { print "hujan" }','awk','["Eiffel","Awk","Rexx"]'::jsonb,null,1,'Awk: Pemrosesan teks berbasis pola.','Awk: Pattern-based text processing.','Blok ''BEGIN { print ... }'' tanpa titik koma. (Muncul sekitar tahun 1977.)','A ''BEGIN { print ... }'' block without semicolons. (First appeared around 1977.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN { print "kerupuk" }','awk','["MUMPS","Rexx","Awk"]'::jsonb,null,2,'Awk: Pemrosesan teks berbasis pola.','Awk: Pattern-based text processing.','Blok ''BEGIN { print ... }'' tanpa titik koma. (Muncul sekitar tahun 1977.)','A ''BEGIN { print ... }'' block without semicolons. (First appeared around 1977.)'),
('extreme','fill','Lengkapi kode Awk ini agar valid','Complete this Awk code so it is valid','BEGIN { ____ "padang" }','awk','["display","print","dsply"]'::jsonb,null,1,'print adalah bagian khas Awk. Pemrosesan teks berbasis pola.','print is characteristic of Awk. Pattern-based text processing.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Blok ''BEGIN { … ... }'' tanpa titik koma.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: A ''BEGIN { … ... }'' block without semicolons.'),
('extreme','valid','Apakah kode Awk ini valid?','Is this Awk code valid?','BEGIN { print "kopi }','awk','["Valid, struktur kodenya lengkap","Error: string tidak ditutup","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Valid, the code structure is complete","Error: unterminated string","Error: unknown function or keyword name"]'::jsonb,1,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode Awk ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: Blok ''BEGIN { print ... }'' tanpa titik koma.','Trace every string in this Awk code: does each opening quote have a closing one? Remember: A ''BEGIN { print ... }'' block without semicolons.'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','2 6 + 2 - .','forth','["6","12","7"]'::jsonb,null,0,'Notasi postfix: (2 + 6) - 2 = 6.','Postfix notation: (2 + 6) - 2 = 6.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 2 + 6 = 8; hasilnya dipakai bersama 2 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 2 + 6 = 8; that result is used with 2 by the last operator.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program nilai
  print *, "angin"
end program nilai','fortran-free-form','["Fortran","Icon","Rexx"]'::jsonb,null,0,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','class HARGA
create make
feature
  make do
    print ("padang")
  end
end','text','["Eiffel","Lisp","Scheme"]'::jsonb,null,0,'Eiffel: Design by Contract.','Eiffel: Design by Contract.','Kelas dengan klausa ''create'', ''feature'', dan blok ''do ... end''. (Muncul sekitar tahun 1986.)','A class with ''create'', ''feature'' clauses and a ''do ... end'' block. (First appeared around 1986.)'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(* 6 (+ 7 8))','lisp','["100","92","90"]'::jsonb,null,2,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (+ 7 8) = 15, lalu pakai hasilnya pada operasi luar bersama 6. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (+ 7 8) = 15, then use that result in the outer operation together with 6. Prefix notation: the operator comes first.'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 34
sub eax, 7','asm','["17","29","27"]'::jsonb,null,2,'34 sub 7 = 27.','34 sub 7 = 27.','mov mengisi eax dengan 34. Lalu sub (pengurangan) memakai 7: 34 - 7.','mov loads eax with 34. Then sub (subtraction) uses 7: 34 - 7.'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 16
imul eax, 3','asm','["96","48","46"]'::jsonb,null,1,'16 imul 3 = 48.','16 imul 3 = 48.','mov mengisi eax dengan 16. Lalu imul (perkalian) memakai 3: 16 × 3.','mov loads eax with 16. Then imul (multiplication) uses 3: 16 × 3.'),
('extreme','valid','Apakah kode Icon ini valid?','Is this Icon code valid?','procedure main()
  writex("garuda")
end','text','["Valid, struktur kodenya lengkap","Error: titik masuk program tidak ditemukan","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Valid, the code structure is complete","Error: program entry point not found","Error: unknown function or keyword name"]'::jsonb,2,'"write" salah ketik menjadi "writex" sehingga tidak dikenal oleh Icon.','"write" was misspelled as "writex", so Icon does not recognize it.','Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "writex"). Apakah persis sama dengan yang dikenal Icon? Ingat: ''procedure main()'' dengan write(...) dan blok ditutup ''end''.','Check the spelling of the main function or keyword (here it reads "writex"). Does it match exactly what Icon recognizes? Remember: ''procedure main()'' with write(...) and a block closed by ''end''.'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #19
add r0, r0, #2','asm','["21","42","31"]'::jsonb,null,0,'add r0, r0, #2 mengubah r0 menjadi 21.','add r0, r0, #2 changes r0 to 21.','mov memuat 19 ke r0, lalu add mengubah r0 dengan 2: 19 + 2. Format ARM: tujuan, sumber, nilai.','mov loads 19 into r0, then add changes r0 by 2: 19 + 2. ARM format: destination, source, value.'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 25
imul eax, 5','asm','["125","250","127"]'::jsonb,null,0,'25 imul 5 = 125.','25 imul 5 = 125.','mov mengisi eax dengan 25. Lalu imul (perkalian) memakai 5: 25 × 5.','mov loads eax with 25. Then imul (multiplication) uses 5: 25 × 5.'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','2 3 * 3 - .','forth','["13","3","1"]'::jsonb,null,1,'Notasi postfix: (2 * 3) - 3 = 3.','Postfix notation: (2 * 3) - 3 = 3.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 2 * 3 = 6; hasilnya dipakai bersama 3 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 2 * 3 = 6; that result is used with 3 by the last operator.'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(+ 7 (* 3 9))','lisp','["44","34","36"]'::jsonb,null,1,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 3 9) = 27, lalu pakai hasilnya pada operasi luar bersama 7. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 3 9) = 27, then use that result in the outer operation together with 7. Prefix notation: the operator comes first.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','main() {
  putstr("tempe*n");
}','text','["Fortran","B","Delphi"]'::jsonb,null,1,'B: Pendahulu langsung C.','B: The direct predecessor of C.','Tanpa tipe: ''main() { ... }'' dengan putstr dan akhir baris ''*n''. (Muncul sekitar tahun 1969.)','Typeless: ''main() { ... }'' with putstr and a ''*n'' line ending. (First appeared around 1969.)'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','6 8 * 4 * .','forth','["202","194","192"]'::jsonb,null,2,'Notasi postfix: (6 * 8) * 4 = 192.','Postfix notation: (6 * 8) * 4 = 192.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 6 * 8 = 48; hasilnya dipakai bersama 4 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 6 * 8 = 48; that result is used with 4 by the last operator.'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 20
sub eax, 2','asm','["8","18","16"]'::jsonb,null,1,'20 sub 2 = 18.','20 sub 2 = 18.','mov mengisi eax dengan 20. Lalu sub (pengurangan) memakai 2: 20 - 2.','mov loads eax with 20. Then sub (subtraction) uses 2: 20 - 2.'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','7 9 + 2 + .','forth','["8","18","36"]'::jsonb,null,1,'Notasi postfix: (7 + 9) + 2 = 18.','Postfix notation: (7 + 9) + 2 = 18.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 7 + 9 = 16; hasilnya dipakai bersama 2 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 7 + 9 = 16; that result is used with 2 by the last operator.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','10 PRINT "SAMBAL"
20 END','text','["BASIC","RPG","ALGOL 68"]'::jsonb,null,0,'BASIC: Dibuat agar pemula bisa memprogram.','BASIC: Created so beginners could program.','Baris bernomor (10, 20) dengan perintah PRINT dan END. (Muncul sekitar tahun 1964.)','Numbered lines (10, 20) with PRINT and END commands. (First appeared around 1964.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program skor
  print *, "senja"
end program skor','fortran-free-form','["Fortran","Eiffel","Oberon"]'::jsonb,null,0,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.global _start
_start:
  mov r0, #1
  ldr r1, =msg
  mov r2, #4
  mov r7, #4
  svc #0
msg: .ascii "halo"','asm','["ARM Assembly","Icon","COBOL"]'::jsonb,null,0,'ARM Assembly: Assembly prosesor ponsel dan embedded.','ARM Assembly: Assembly for phone and embedded processors.','Register r0-r7, instruksi ldr/mov, dan panggilan sistem ''svc #0''. (Muncul sekitar tahun 1985.)','Registers r0-r7, ldr/mov instructions, and a ''svc #0'' system call. (First appeared around 1985.)'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(* 2 (+ 9 9))','lisp','["26","36","46"]'::jsonb,null,1,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (+ 9 9) = 18, lalu pakai hasilnya pada operasi luar bersama 2. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (+ 9 9) = 18, then use that result in the outer operation together with 2. Prefix notation: the operator comes first.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["candi"]','wolfram','["Wolfram Language","MIPS Assembly","APL"]'::jsonb,null,0,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','3 4 * 5 + .','forth','["19","17","7"]'::jsonb,null,1,'Notasi postfix: (3 * 4) + 5 = 17.','Postfix notation: (3 * 4) + 5 = 17.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 3 * 4 = 12; hasilnya dipakai bersama 5 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 3 * 4 = 12; that result is used with 5 by the last operator.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(display "laut")
(newline)','scheme','["Icon","B","Scheme"]'::jsonb,null,2,'Scheme: Lisp minimalis untuk pengajaran.','Scheme: A minimalist Lisp for teaching.','Lisp minimalis: (display "...") disusul (newline). (Muncul sekitar tahun 1975.)','Minimalist Lisp: (display "...") followed by (newline). (First appeared around 1975.)'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #42
sub r0, r0, #2','asm','["50","39","40"]'::jsonb,null,2,'sub r0, r0, #2 mengubah r0 menjadi 40.','sub r0, r0, #2 changes r0 to 40.','mov memuat 42 ke r0, lalu sub mengubah r0 dengan 2: 42 - 2. Format ARM: tujuan, sumber, nilai.','mov loads 42 into r0, then sub changes r0 by 2: 42 - 2. ARM format: destination, source, value.'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(+ 7 (* 8 3))','lisp','["29","30","31"]'::jsonb,null,2,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 8 3) = 24, lalu pakai hasilnya pada operasi luar bersama 7. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 8 3) = 24, then use that result in the outer operation together with 7. Prefix notation: the operator comes first.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','IDENTIFICATION DIVISION.
PROGRAM-ID. KUOTA.
PROCEDURE DIVISION.
    DISPLAY "HUJAN".
    STOP RUN.','cobol','["Eiffel","Prolog","COBOL"]'::jsonb,null,2,'COBOL: Bahasa bisnis dan perbankan; ribuan sistem masih berjalan.','COBOL: Business and banking language; thousands of systems still run on it.','Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah DISPLAY. (Muncul sekitar tahun 1959.)','Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a DISPLAY command. (First appeared around 1959.)'),
('extreme','fill','Lengkapi kode Awk ini agar valid','Complete this Awk code so it is valid','BEGIN { ____ "nasi" }','awk','["print","MODULE","REPORT"]'::jsonb,null,0,'print adalah bagian khas Awk. Pemrosesan teks berbasis pola.','print is characteristic of Awk. Pattern-based text processing.','Kata yang hilang terdiri dari 5 karakter, diawali "p" dan diakhiri "t". Ciri bahasa ini: Blok ''BEGIN { … ... }'' tanpa titik koma.','The missing word has 5 characters, starts with "p" and ends with "t". About this language: A ''BEGIN { … ... }'' block without semicolons.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','val _ = print "wayang\n";','sml','["Scheme","ABAP","Standard ML"]'::jsonb,null,2,'Standard ML: Fungsional bertipe dengan semantik formal.','Standard ML: Statically typed functional language with formal semantics.','Fungsional bertipe: ''val _ = print "...\n";''. (Muncul sekitar tahun 1983.)','Typed functional: ''val _ = print "...\n";''. (First appeared around 1983.)'),
('extreme','fill','Lengkapi kode Pascal ini agar valid','Complete this Pascal code so it is valid','program Kuota;
begin
  ____(''garuda'');
end.','pascal','["writeln","OUTPUT","svc"]'::jsonb,null,0,'writeln adalah bagian khas Pascal. Bahasa pengajaran terstruktur.','writeln is characteristic of Pascal. A structured teaching language.','Kata yang hilang terdiri dari 7 karakter, diawali "w" dan diakhiri "n". Ciri bahasa ini: Blok ''begin ... end.'' dengan penugasan '':='' dan … berkutip tunggal.','The missing word has 7 characters, starts with "w" and ends with "n". About this language: A ''begin ... end.'' block with '':='' assignment and a single-quoted ….'),
('extreme','valid','Apakah kode PL/I ini valid?','Is this PL/I code valid?','POIN: PROCEDURE OPTIONS(MAIN);
  PUT SKIP LIST(''merdeka);
END POIN;','text','["Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap","Error: string tidak ditutup"]'::jsonb,'["Error: unknown function or keyword name","Valid, the code structure is complete","Error: unterminated string"]'::jsonb,2,'Tanda kutip penutup hilang sehingga literal string tidak lengkap.','The closing quote is missing, so the string literal is incomplete.','Telusuri setiap string di kode PL/I ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: ''PROCEDURE OPTIONS(MAIN);'' dan ''PUT SKIP LIST(...)''.','Trace every string in this PL/I code: does each opening quote have a closing one? Remember: ''PROCEDURE OPTIONS(MAIN);'' and ''PUT SKIP LIST(...)''.'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #36
add r0, r0, #4','asm','["42","38","40"]'::jsonb,null,2,'add r0, r0, #4 mengubah r0 menjadi 40.','add r0, r0, #4 changes r0 to 40.','mov memuat 36 ke r0, lalu add mengubah r0 dengan 4: 36 + 4. Format ARM: tujuan, sumber, nilai.','mov loads 36 into r0, then add changes r0 by 4: 36 + 4. ARM format: destination, source, value.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Umur;
IMPORT Out;
BEGIN
  Out.String("durian"); Out.Ln
END Umur.','text','["Oberon","Wolfram Language","Icon"]'::jsonb,null,0,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','print [halo]','text','["MIPS Assembly","Logo","Scheme"]'::jsonb,null,1,'Logo: Kura-kura grafis untuk anak.','Logo: The turtle graphics language for kids.','Perintah sederhana tanpa tanda baca selain kurung siku: print [kata]. (Muncul sekitar tahun 1967.)','Simple commands with no punctuation except square brackets: print [word]. (First appeared around 1967.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Saldo;
IMPORT Out;
BEGIN
  Out.String("bunga"); Out.Ln
END Saldo.','text','["Delphi","RPG","Oberon"]'::jsonb,null,2,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(+ 2 (* 4 7))','lisp','["29","31","30"]'::jsonb,null,2,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 4 7) = 28, lalu pakai hasilnya pada operasi luar bersama 2. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 4 7) = 28, then use that result in the outer operation together with 2. Prefix notation: the operator comes first.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''sambal''','apl','["Prolog","APL","BASIC"]'::jsonb,null,1,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','fill','Lengkapi kode Smalltalk ini agar valid','Complete this Smalltalk code so it is valid','Transcript ____ ''gado''.','smalltalk','["showln:","REPORT","MODULE"]'::jsonb,null,0,'showln: adalah bagian khas Smalltalk. OOP murni; menginspirasi Java dan Ruby.','showln: is characteristic of Smalltalk. Pure OOP; inspired Java and Ruby.','Kata yang hilang terdiri dari 7 karakter, diawali "s" dan diakhiri ":". Ciri bahasa ini: Semuanya kirim pesan: ''Transcript … ...'' dengan kata kunci bertanda titik dua.','The missing word has 7 characters, starts with "s" and ends with ":". About this language: Everything is message passing: ''Transcript … ...'' with colon-marked keywords.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .string "pantai"
.text
  li a7, 64
  la a1, msg
  ecall','asm','["ARM Assembly","RPG","RISC-V Assembly"]'::jsonb,null,2,'RISC-V Assembly: Arsitektur set instruksi terbuka.','RISC-V Assembly: An open instruction set architecture.','Register a0-a7, instruksi li/la, dan ''ecall''. (Muncul sekitar tahun 2010.)','Registers a0-a7, li/la instructions, and ''ecall''. (First appeared around 2010.)'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #77
add r0, r0, #3','asm','["90","82","80"]'::jsonb,null,2,'add r0, r0, #3 mengubah r0 menjadi 80.','add r0, r0, #3 changes r0 to 80.','mov memuat 77 ke r0, lalu add mengubah r0 dengan 3: 77 + 3. Format ARM: tujuan, sumber, nilai.','mov loads 77 into r0, then add changes r0 by 3: 77 + 3. ARM format: destination, source, value.'),
('extreme','valid','Apakah kode 6502 Assembly ini valid?','Is this 6502 Assembly code valid?','LDA #$62
JSR $FFD2
LDA #$0D
JSR $FFD2
RTS','asm','["Error: string tidak ditutup","Error: titik masuk program tidak ditemukan","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: unterminated string","Error: program entry point not found","Valid, the code structure is complete"]'::jsonb,2,'Kode 6502 Assembly ini lengkap dan valid. Mesin Apple II, Commodore 64, dan NES.','This 6502 Assembly code is complete and valid. The chip in the Apple II, Commodore 64, and NES.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Instruksi tiga huruf (LDA, JSR, RTS) dengan nilai heksadesimal berawalan #$.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Three-letter instructions (LDA, JSR, RTS) with hex values prefixed by #$.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["angkot"]','wolfram','["Prolog","Wolfram Language","Standard ML"]'::jsonb,null,1,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Saldo;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("durian"); WriteLn;
END Saldo.','text','["Rexx","Modula-2","APL"]'::jsonb,null,1,'Modula-2: Penerus Pascal dengan modul.','Modula-2: A Pascal successor with modules.','Mirip Pascal, tetapi berstruktur ''MODULE ... FROM ... IMPORT ...''. (Muncul sekitar tahun 1978.)','Pascal-like, but structured as ''MODULE ... FROM ... IMPORT ...''. (First appeared around 1978.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["hujan"]','wolfram','["Wolfram Language","Ada","Delphi"]'::jsonb,null,0,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','WRITE "wayang",!','text','["MUMPS","Icon","Fortran"]'::jsonb,null,0,'MUMPS: Basis data rumah sakit.','MUMPS: The hospital database language.','Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru. (Muncul sekitar tahun 1966.)','A ''WRITE'' command with a string and an exclamation mark for a new line. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program antrian
  print *, "sambal"
end program antrian','fortran-free-form','["Fortran","MUMPS","Prolog"]'::jsonb,null,0,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','5 5 + 3 * .','forth','["30","31","60"]'::jsonb,null,0,'Notasi postfix: (5 + 5) * 3 = 30.','Postfix notation: (5 + 5) * 3 = 30.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 5 + 5 = 10; hasilnya dipakai bersama 3 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 5 + 5 = 10; that result is used with 3 by the last operator.'),
('extreme','fill','Lengkapi kode MUMPS ini agar valid','Complete this MUMPS code so it is valid','____ "sawah",!','text','["say","dsply","WRITE"]'::jsonb,null,2,'WRITE adalah bagian khas MUMPS. Basis data rumah sakit.','WRITE is characteristic of MUMPS. The hospital database language.','Kata yang hilang terdiri dari 5 karakter, diawali "W" dan diakhiri "E". Ciri bahasa ini: Perintah ''…'' dengan string dan tanda seru untuk baris baru.','The missing word has 5 characters, starts with "W" and ends with "E". About this language: A ''…'' command with a string and an exclamation mark for a new line.'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(- 9 (* 2 3))','lisp','["5","6","3"]'::jsonb,null,2,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 2 3) = 6, lalu pakai hasilnya pada operasi luar bersama 9. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 2 3) = 6, then use that result in the outer operation together with 9. Prefix notation: the operator comes first.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program harga
  print *, "bakso"
end program harga','fortran-free-form','["Modula-2","Fortran","Lisp"]'::jsonb,null,1,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #26
add r0, r0, #6','asm','["32","64","33"]'::jsonb,null,0,'add r0, r0, #6 mengubah r0 menjadi 32.','add r0, r0, #6 changes r0 to 32.','mov memuat 26 ke r0, lalu add mengubah r0 dengan 6: 26 + 6. Format ARM: tujuan, sumber, nilai.','mov loads 26 into r0, then add changes r0 by 6: 26 + 6. ARM format: destination, source, value.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','WRITE "garuda",!','text','["Icon","Modula-2","MUMPS"]'::jsonb,null,2,'MUMPS: Basis data rumah sakit.','MUMPS: The hospital database language.','Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru. (Muncul sekitar tahun 1966.)','A ''WRITE'' command with a string and an exclamation mark for a new line. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .string "hujan"
.text
  li a7, 64
  la a1, msg
  ecall','asm','["Awk","RISC-V Assembly","Forth"]'::jsonb,null,1,'RISC-V Assembly: Arsitektur set instruksi terbuka.','RISC-V Assembly: An open instruction set architecture.','Register a0-a7, instruksi li/la, dan ''ecall''. (Muncul sekitar tahun 2010.)','Registers a0-a7, li/la instructions, and ''ecall''. (First appeared around 2010.)'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #63
add r0, r0, #1','asm','["64","62","128"]'::jsonb,null,0,'add r0, r0, #1 mengubah r0 menjadi 64.','add r0, r0, #1 changes r0 to 64.','mov memuat 63 ke r0, lalu add mengubah r0 dengan 1: 63 + 1. Format ARM: tujuan, sumber, nilai.','mov loads 63 into r0, then add changes r0 by 1: 63 + 1. ARM format: destination, source, value.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','.data
msg: .asciiz "senja"
.text
  li $v0, 4
  la $a0, msg
  syscall','asm','["Assembly x86","MIPS Assembly","APL"]'::jsonb,null,1,'MIPS Assembly: Assembly RISC klasik untuk pengajaran.','MIPS Assembly: Classic RISC assembly for teaching.','Direktif .data/.text, instruksi li/la, dan ''syscall''. (Muncul sekitar tahun 1985.)','.data/.text directives, li/la instructions, and ''syscall''. (First appeared around 1985.)'),
('extreme','fill','Lengkapi kode Lisp ini agar valid','Complete this Lisp code so it is valid','(____ t "candi~%")','lisp','["create","write","format"]'::jsonb,null,2,'format adalah bagian khas Lisp. Kode adalah data; leluhur banyak bahasa modern.','format is characteristic of Lisp. Code is data; ancestor of many modern languages.','Kata yang hilang terdiri dari 6 karakter, diawali "f" dan diakhiri "t". Ciri bahasa ini: Seluruh kode berupa daftar berkurung; … teks lewat (… t "...~%").','The missing word has 6 characters, starts with "f" and ends with "t". About this language: All code is parenthesized lists; text is …ted via (… t "...~%").'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','4 6 * 3 * .','forth','["72","70","144"]'::jsonb,null,0,'Notasi postfix: (4 * 6) * 3 = 72.','Postfix notation: (4 * 6) * 3 = 72.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 4 * 6 = 24; hasilnya dipakai bersama 3 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 4 * 6 = 24; that result is used with 3 by the last operator.'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #37
sub r0, r0, #7','asm','["32","30","20"]'::jsonb,null,1,'sub r0, r0, #7 mengubah r0 menjadi 30.','sub r0, r0, #7 changes r0 to 30.','mov memuat 37 ke r0, lalu sub mengubah r0 dengan 7: 37 - 7. Format ARM: tujuan, sumber, nilai.','mov loads 37 into r0, then sub changes r0 by 7: 37 - 7. ARM format: destination, source, value.'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 20
sub eax, 6','asm','["15","14","12"]'::jsonb,null,1,'20 sub 6 = 14.','20 sub 6 = 14.','mov mengisi eax dengan 20. Lalu sub (pengurangan) memakai 6: 20 - 6.','mov loads eax with 20. Then sub (subtraction) uses 6: 20 - 6.'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #49
sub r0, r0, #6','asm','["43","86","53"]'::jsonb,null,0,'sub r0, r0, #6 mengubah r0 menjadi 43.','sub r0, r0, #6 changes r0 to 43.','mov memuat 49 ke r0, lalu sub mengubah r0 dengan 6: 49 - 6. Format ARM: tujuan, sumber, nilai.','mov loads 49 into r0, then sub changes r0 by 6: 49 - 6. ARM format: destination, source, value.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','STOK: PROCEDURE OPTIONS(MAIN);
  PUT SKIP LIST(''merdeka'');
END STOK;','text','["Icon","PL/I","B"]'::jsonb,null,1,'PL/I: Gabungan Fortran, COBOL, dan ALGOL dari IBM.','PL/I: IBM''s blend of Fortran, COBOL, and ALGOL.','''PROCEDURE OPTIONS(MAIN);'' dan ''PUT SKIP LIST(...)''. (Muncul sekitar tahun 1964.)','''PROCEDURE OPTIONS(MAIN);'' and ''PUT SKIP LIST(...)''. (First appeared around 1964.)'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #72
add r0, r0, #8','asm','["80","70","78"]'::jsonb,null,0,'add r0, r0, #8 mengubah r0 menjadi 80.','add r0, r0, #8 changes r0 to 80.','mov memuat 72 ke r0, lalu add mengubah r0 dengan 8: 72 + 8. Format ARM: tujuan, sumber, nilai.','mov loads 72 into r0, then add changes r0 by 8: 72 + 8. ARM format: destination, source, value.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''laut''','apl','["ARM Assembly","APL","Awk"]'::jsonb,null,1,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(- 8 (* 2 5))','lisp','["-4","-2","-1"]'::jsonb,null,1,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 2 5) = 10, lalu pakai hasilnya pada operasi luar bersama 8. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 2 5) = 10, then use that result in the outer operation together with 8. Prefix notation: the operator comes first.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Waktu;
IMPORT Out;
BEGIN
  Out.String("sate"); Out.Ln
END Waktu.','text','["6502 Assembly","Awk","Oberon"]'::jsonb,null,2,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','fill','Lengkapi kode MIPS Assembly ini agar valid','Complete this MIPS Assembly code so it is valid','.data
msg: .asciiz "padang"
.text
  li $v0, 4
  la $a0, msg
  ____','asm','["syscall","MODULE","OUTPUT"]'::jsonb,null,0,'syscall adalah bagian khas MIPS Assembly. Assembly RISC klasik untuk pengajaran.','syscall is characteristic of MIPS Assembly. Classic RISC assembly for teaching.','Kata yang hilang terdiri dari 7 karakter, diawali "s" dan diakhiri "l". Ciri bahasa ini: Direktif .data/.text, instruksi li/la, dan ''…''.','The missing word has 7 characters, starts with "s" and ends with "l". About this language: .data/.text directives, li/la instructions, and ''…''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','BEGIN
  print(("halo", newline))
END','text','["COBOL","ALGOL 68","Modula-2"]'::jsonb,null,1,'ALGOL 68: Leluhur Pascal dan C.','ALGOL 68: Ancestor of Pascal and C.','Blok BEGIN ... END dan print dengan daftar argumen ganda ((...)). (Muncul sekitar tahun 1968.)','BEGIN ... END blocks and print with a doubled argument list ((...)). (First appeared around 1968.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','(format t "becak~%")','lisp','["MUMPS","Lisp","RPG"]'::jsonb,null,1,'Lisp: Kode adalah data; leluhur banyak bahasa modern.','Lisp: Code is data; ancestor of many modern languages.','Seluruh kode berupa daftar berkurung; format teks lewat (format t "...~%"). (Muncul sekitar tahun 1958.)','All code is parenthesized lists; text is formatted via (format t "...~%"). (First appeared around 1958.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','IDENTIFICATION DIVISION.
PROGRAM-ID. PORSI.
PROCEDURE DIVISION.
    DISPLAY "PADANG".
    STOP RUN.','cobol','["Pascal","COBOL","PL/I"]'::jsonb,null,1,'COBOL: Bahasa bisnis dan perbankan; ribuan sistem masih berjalan.','COBOL: Business and banking language; thousands of systems still run on it.','Divisi huruf besar (IDENTIFICATION DIVISION, PROCEDURE DIVISION) dan perintah DISPLAY. (Muncul sekitar tahun 1959.)','Uppercase divisions (IDENTIFICATION DIVISION, PROCEDURE DIVISION) and a DISPLAY command. (First appeared around 1959.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','**free
dsply ''padang'';
return;','text','["Modula-2","RPG","RISC-V Assembly"]'::jsonb,null,1,'RPG: Pelaporan di mainframe IBM.','RPG: Report generation on IBM mainframes.','Bentuk bebas diawali ''**free'' dan perintah ''dsply''. (Muncul sekitar tahun 1959.)','Free-form starting with ''**free'' and a ''dsply'' command. (First appeared around 1959.)'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(+ 4 (* 6 4))','lisp','["30","28","29"]'::jsonb,null,1,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 6 4) = 24, lalu pakai hasilnya pada operasi luar bersama 4. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 6 4) = 24, then use that result in the outer operation together with 4. Prefix notation: the operator comes first.'),
('extreme','fill','Lengkapi kode Wolfram Language ini agar valid','Complete this Wolfram Language code so it is valid','____["halo"]','wolfram','["writeln","Print","svc"]'::jsonb,null,1,'Print adalah bagian khas Wolfram Language. Komputasi simbolik Mathematica.','Print is characteristic of Wolfram Language. Symbolic computation in Mathematica.','Kata yang hilang terdiri dari 5 karakter, diawali "P" dan diakhiri "t". Ciri bahasa ini: Pemanggilan fungsi memakai kurung siku: …["..."].','The missing word has 5 characters, starts with "P" and ends with "t". About this language: Function calls use square brackets: …["..."].'),
('extreme','guess','Bahasa apa ini?','Which language is this?','Print["angin"]','wolfram','["Modula-2","Lisp","Wolfram Language"]'::jsonb,null,2,'Wolfram Language: Komputasi simbolik Mathematica.','Wolfram Language: Symbolic computation in Mathematica.','Pemanggilan fungsi memakai kurung siku: Print["..."]. (Muncul sekitar tahun 1988.)','Function calls use square brackets: Print["..."]. (First appeared around 1988.)'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #28
sub r0, r0, #8','asm','["20","40","30"]'::jsonb,null,0,'sub r0, r0, #8 mengubah r0 menjadi 20.','sub r0, r0, #8 changes r0 to 20.','mov memuat 28 ke r0, lalu sub mengubah r0 dengan 8: 28 - 8. Format ARM: tujuan, sumber, nilai.','mov loads 28 into r0, then sub changes r0 by 8: 28 - 8. ARM format: destination, source, value.'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','7 6 + 4 + .','forth','["34","17","18"]'::jsonb,null,1,'Notasi postfix: (7 + 6) + 4 = 17.','Postfix notation: (7 + 6) + 4 = 17.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 7 + 6 = 13; hasilnya dipakai bersama 4 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 7 + 6 = 13; that result is used with 4 by the last operator.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program hasil
  print *, "senja"
end program hasil','fortran-free-form','["6502 Assembly","Fortran","Wolfram Language"]'::jsonb,null,1,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','valid','Apakah kode Modula-2 ini valid?','Is this Modula-2 code valid?','MODULE Kuota;
FROM InOut IMPORT WriteString, WriteLn;
BEGIN
  WriteString("wayang"; WriteLn;
END Kuota.','text','["Error: titik masuk program tidak ditemukan","Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: program entry point not found","Error: unbalanced parentheses","Valid, the code structure is complete"]'::jsonb,1,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Mirip Pascal, tetapi berstruktur ''MODULE ... FROM ... IMPORT ...''.','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: Pascal-like, but structured as ''MODULE ... FROM ... IMPORT ...''.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','program indeks
  print *, "gado"
end program indeks','fortran-free-form','["Icon","Fortran","ALGOL 68"]'::jsonb,null,1,'Fortran: Komputasi ilmiah; masih dipakai di simulasi cuaca.','Fortran: Scientific computing; still used in weather simulation.','''program ... end program'' dengan ''print *,'' untuk keluaran. (Muncul sekitar tahun 1957.)','''program ... end program'' with ''print *,'' for output. (First appeared around 1957.)'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(* 8 (+ 5 3))','lisp','["64","62","65"]'::jsonb,null,0,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (+ 5 3) = 8, lalu pakai hasilnya pada operasi luar bersama 8. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (+ 5 3) = 8, then use that result in the outer operation together with 8. Prefix notation: the operator comes first.'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #28
sub r0, r0, #1','asm','["25","27","26"]'::jsonb,null,1,'sub r0, r0, #1 mengubah r0 menjadi 27.','sub r0, r0, #1 changes r0 to 27.','mov memuat 28 ke r0, lalu sub mengubah r0 dengan 1: 28 - 1. Format ARM: tujuan, sumber, nilai.','mov loads 28 into r0, then sub changes r0 by 1: 28 - 1. ARM format: destination, source, value.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','val _ = print "gado\n";','sml','["ALGOL 68","Standard ML","Eiffel"]'::jsonb,null,1,'Standard ML: Fungsional bertipe dengan semantik formal.','Standard ML: Statically typed functional language with formal semantics.','Fungsional bertipe: ''val _ = print "...\n";''. (Muncul sekitar tahun 1983.)','Typed functional: ''val _ = print "...\n";''. (First appeared around 1983.)'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 34
imul eax, 4','asm','["126","134","136"]'::jsonb,null,2,'34 imul 4 = 136.','34 imul 4 = 136.','mov mengisi eax dengan 34. Lalu imul (perkalian) memakai 4: 34 × 4.','mov loads eax with 34. Then imul (multiplication) uses 4: 34 × 4.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','⎕←''merdeka''','apl','["6502 Assembly","Logo","APL"]'::jsonb,null,2,'APL: Simbol khusus untuk komputasi array.','APL: Special symbols for array computation.','Memakai simbol khusus seperti panah keluaran ''⎕←''. (Muncul sekitar tahun 1966.)','Uses special symbols such as the output arrow ''⎕←''. (First appeared around 1966.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','val _ = print "gunung\n";','sml','["PL/I","SNOBOL","Standard ML"]'::jsonb,null,2,'Standard ML: Fungsional bertipe dengan semantik formal.','Standard ML: Statically typed functional language with formal semantics.','Fungsional bertipe: ''val _ = print "...\n";''. (Muncul sekitar tahun 1983.)','Typed functional: ''val _ = print "...\n";''. (First appeared around 1983.)'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(- 8 (* 4 6))','lisp','["-6","-16","-18"]'::jsonb,null,1,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 4 6) = 24, lalu pakai hasilnya pada operasi luar bersama 8. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 4 6) = 24, then use that result in the outer operation together with 8. Prefix notation: the operator comes first.'),
('extreme','valid','Apakah kode ALGOL 68 ini valid?','Is this ALGOL 68 code valid?','BEGIN
  print(("angin", newline)
END','text','["Error: tanda kurung tidak seimbang","Valid, struktur kodenya lengkap","Error: nama fungsi atau kata kunci tidak dikenal"]'::jsonb,'["Error: unbalanced parentheses","Valid, the code structure is complete","Error: unknown function or keyword name"]'::jsonb,0,'Ada kurung tutup yang hilang sehingga kurung tidak seimbang.','A closing parenthesis is missing, so the parentheses are unbalanced.','Hitung pasangan kurung: setiap ''('' harus punya '')''. Periksa terutama baris yang memanggil fungsi. Ingat: Blok BEGIN ... END dan print dengan daftar argumen ganda ((...)).','Count the parentheses: every ''('' needs a '')''. Look especially at the line that calls a function. Remember: BEGIN ... END blocks and print with a doubled argument list ((...)).'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 27
add eax, 9','asm','["38","34","36"]'::jsonb,null,2,'27 add 9 = 36.','27 add 9 = 36.','mov mengisi eax dengan 27. Lalu add (penjumlahan) memakai 9: 27 + 9.','mov loads eax with 27. Then add (addition) uses 9: 27 + 9.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','MODULE Ukuran;
IMPORT Out;
BEGIN
  Out.String("rendang"); Out.Ln
END Ukuran.','text','["Oberon","ARM Assembly","Forth"]'::jsonb,null,0,'Oberon: Penerus Modula-2 oleh Niklaus Wirth.','Oberon: Niklaus Wirth''s successor to Modula-2.','Mirip Modula-2: ''MODULE ... IMPORT Out;'' dan Out.String. (Muncul sekitar tahun 1987.)','Modula-2-like: ''MODULE ... IMPORT Out;'' and Out.String. (First appeared around 1987.)'),
('extreme','guess','Bahasa apa ini?','Which language is this?','uses Dialogs;
begin
  ShowMessage(''batik'');
end.','pascal','["Awk","Delphi","Eiffel"]'::jsonb,null,1,'Delphi: Pascal berorientasi objek untuk aplikasi Windows.','Delphi: Object-oriented Pascal for Windows apps.','Mirip Pascal, tetapi memakai unit ''uses Dialogs'' dan ShowMessage. (Muncul sekitar tahun 1995.)','Pascal-like, but with a ''uses Dialogs'' unit and ShowMessage. (First appeared around 1995.)'),
('extreme','output','Isi r0 setelah dijalankan?','What is in r0 after running?','mov r0, #78
sub r0, r0, #8','asm','["68","70","140"]'::jsonb,null,1,'sub r0, r0, #8 mengubah r0 menjadi 70.','sub r0, r0, #8 changes r0 to 70.','mov memuat 78 ke r0, lalu sub mengubah r0 dengan 8: 78 - 8. Format ARM: tujuan, sumber, nilai.','mov loads 78 into r0, then sub changes r0 by 8: 78 - 8. ARM format: destination, source, value.'),
('extreme','output','Berapa hasil evaluasi Lisp ini?','What does this Lisp expression evaluate to?','(+ 4 (* 6 5))','lisp','["32","34","44"]'::jsonb,null,1,'Evaluasi dari kurung terdalam ke luar.','Evaluate from the innermost parentheses outward.','Hitung dari kurung terdalam: (* 6 5) = 30, lalu pakai hasilnya pada operasi luar bersama 4. Notasi prefix: operator ditulis lebih dulu.','Work from the innermost parentheses: (* 6 5) = 30, then use that result in the outer operation together with 4. Prefix notation: the operator comes first.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','section .data
  msg db "nasi", 10
section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 5
  int 0x80','asm','["Eiffel","Assembly x86","Scheme"]'::jsonb,null,1,'Assembly x86: Instruksi mesin x86, langsung bicara ke CPU.','Assembly x86: x86 machine instructions, talking directly to the CPU.','Instruksi mov dengan register eax/ebx/ecx dan pemanggilan sistem lewat ''int 0x80''. (Muncul sekitar tahun 1978.)','mov instructions with eax/ebx/ecx registers and a system call through ''int 0x80''. (First appeared around 1978.)'),
('extreme','valid','Apakah kode APL ini valid?','Is this APL code valid?','⎕←''tempe''','apl','["Error: titik masuk program tidak ditemukan","Error: nama fungsi atau kata kunci tidak dikenal","Valid, struktur kodenya lengkap"]'::jsonb,'["Error: program entry point not found","Error: unknown function or keyword name","Valid, the code structure is complete"]'::jsonb,2,'Kode APL ini lengkap dan valid. Simbol khusus untuk komputasi array.','This APL code is complete and valid. Special symbols for array computation.','Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: Memakai simbol khusus seperti panah keluaran ''⎕←''.','Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: Uses special symbols such as the output arrow ''⎕←''.'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','8 6 * 4 * .','forth','["192","182","193"]'::jsonb,null,0,'Notasi postfix: (8 * 6) * 4 = 192.','Postfix notation: (8 * 6) * 4 = 192.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 8 * 6 = 48; hasilnya dipakai bersama 4 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 8 * 6 = 48; that result is used with 4 by the last operator.'),
('extreme','guess','Bahasa apa ini?','Which language is this?','WRITE "laut",!','text','["MUMPS","6502 Assembly","Delphi"]'::jsonb,null,0,'MUMPS: Basis data rumah sakit.','MUMPS: The hospital database language.','Perintah ''WRITE'' dengan string dan tanda seru untuk baris baru. (Muncul sekitar tahun 1966.)','A ''WRITE'' command with a string and an exclamation mark for a new line. (First appeared around 1966.)'),
('extreme','output','Berapa isi stack di akhir?','What is on the stack at the end?','4 4 + 3 - .','forth','["4","15","5"]'::jsonb,null,2,'Notasi postfix: (4 + 4) - 3 = 5.','Postfix notation: (4 + 4) - 3 = 5.','Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: 4 + 4 = 8; hasilnya dipakai bersama 3 pada operator terakhir.','Postfix notation: an operator works on the last two numbers on the stack. First step: 4 + 4 = 8; that result is used with 3 by the last operator.'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 38
imul eax, 2','asm','["75","76","86"]'::jsonb,null,1,'38 imul 2 = 76.','38 imul 2 = 76.','mov mengisi eax dengan 38. Lalu imul (perkalian) memakai 2: 38 × 2.','mov loads eax with 38. Then imul (multiplication) uses 2: 38 × 2.'),
('extreme','output','Isi register eax setelah dijalankan?','What is in register eax after running?','mov eax, 18
add eax, 3','asm','["19","21","23"]'::jsonb,null,1,'18 add 3 = 21.','18 add 3 = 21.','mov mengisi eax dengan 18. Lalu add (penjumlahan) memakai 3: 18 + 3.','mov loads eax with 18. Then add (addition) uses 3: 18 + 3.');
