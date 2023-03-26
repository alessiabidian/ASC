#include <stdio.h>
#include <stdlib.h>

int transformare10(int len, int s[]);
// functia declarata in fisierul modulSumaNumere.asm
//int sumaNumere(int a, int b);
int sir[33];
int baza16, baza10;

int unu=1, doi=2;
long rezultat=0, putere=1;

int main()
{
    ///Se citeste de la tastatura un sir de mai multe numere in baza 2.
    ///Sa se afiseze aceste numere in baza 16
    //Pentru urmatoarele probleme se cere cel putin un subprogram implementat in; asm iar programul principal implementat in C.
    // declaram variabilele
    int n = 0, m;
    int a = 0;
    int i, j, k, t;
    int len=0, dim=0;

    printf("n=");
    scanf("%d", &n);  //citim n = nr de numere care vor fi citite

    printf("Alegeti: byte(8), word(16), dword(32): ");
    scanf("%d", &dim);

    // citim de la tastatura sirul de numere, format din seturi de cate 4 cifre!!!
    for (i=1 ; i<=n ; i++)
    {   printf("\n");
        printf("a=");

        k=dim-4; //primu element din ultimul set

        len=dim;  //nr seturi * 4
        for(j=1; j<=dim/4; j++) //nr seturi de cate 4 (j<=8)
        {scanf("%d", &a);

         for(t=1; t<=4; t++)
            {sir[k] = a%10;
             a=a/10;
             k++;
            }
         k=k-8;
        }

        m = transformare10(len, sir);
        //printf("Baza 10: %d", rezultat);
        //printf("\n");
        printf("Baza 16: %X", rezultat);
        printf("\n");
        //printf("Putere: %d", putere);

        //for(k=0; k<=len-1; k++)
            //printf("%d", sir[k]);
        //printf("\n");

    }

    // apelam functia scrisa in limbaj de asamblare
    //m = transformare10(len, sir);
    // structura stivei dupa apel sumaNumare:
    //EBP + 0 - val anterioare din ebp
    //EBP + 4 - adresa de retur
    //EBP + 8 - lungimea sirului
    //EBP + 12 - adresa sirului

    return 0;
}
