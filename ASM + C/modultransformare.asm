bits 32

; informam asamblorul ca dorim ca functia _sumaNumere sa fie disponibila altor unitati de compilare
global _transformare10

extern _unu;facem cunoscuta variabila din c in programul asm
extern _doi;facem cunoscuta variabila din c in programul asm
extern _putere
extern _rezultat

; linkeditorul poate folosi segmentul public de date si pentru date din afara
segment data public data use32
    
;nasm modultransformare.asm -fwin32 -g -o modultransformare.obj
;cl/Z7 mainnumere.c /link modultransformare.obj

;nasm modultransformare.asm -fwin32 -o modultransformare.obj
;cl mainnumere.c /link modultransformare.obj

;cd C:\Users\mbale\Dropbox\ASM_tools\asm_tools\npp\Lab10\Lab 10 - asm C
;cd C:\Users\aless\Dropbox\ASM_tools\asm_tools\npp\Lab10\Lab 10 - asm C

; codul scris in asamblare este dispus intr-un segment public, posibil a fi partajat cu alt cod extern
segment code public code use32

; int transformare10(int len, int s[]);
; conventie cdecl
_transformare10:
    ; creare cadru de stiva pentru programul apelat
    push ebp
    mov ebp, esp
    
    ; obtinem argumentele transmise pe stiva functiei transformare
    ; la locatia [ebp+4] se afla adresa de return (valoarea din EIP la momentul apelului)
    ; la locatia [ebp] se afla valoarea ebp pentru apelant
    mov ecx, 0
    mov cl, byte[ebp + 8]        ; ecx <- len adica lungimea sirului
    
        
    mov esi, [ebp + 12]        ; la [ebp + 12] se afla adresa sirului de cifre
                               ; la [ebp + 12] se afla adresa sirului de cifre
       
    mov edx, 0
    mov eax, 0
    mov ebx, 0
    mov dword[_rezultat], 0

    mov ebx, dword[_doi]
    
    repeta:
        lodsd
        mul dword[_putere]
         
        ;add edx, eax
        add dword[_rezultat], eax
        
        xchg eax, dword[_putere]
        mul ebx
        xchg dword[_putere], eax
            
        loop repeta    
    
    mov dword[_putere], 1
    
    mov eax, edx      ; valoarea de rezulat a functiei este in eax
   
    ; refacem cadrul de stiva pentru programul apelant
    mov esp, ebp
    pop ebp

    ret
    ; conventie cdecl - este responsabilitatea programului apelant sa elibereze parametrii transmisi
