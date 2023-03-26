Cerinta: Se citeste de la tastatura un sir de mai multe numere in baza 2.
Sa se afiseze aceste numere in baza 16
Pentru problema se cere cel putin un subprogram implementat in asm iar programul principal implementat in C.

Rulare din command prompt:
nasm modultransformare.asm -fwin32 -o modultransformare.obj
cl mainnumere.c /link modultransformare.obj
mainnumere.exe
