.global _start



.section .data
// liczba1:
//     	.long 0x10304008, 0x701100FF, 0x45100020, 0x08570030
// liczba2:
//     	.long 0xF040500C, 0x00220026, 0x321000CB, 0x04520031

liczba1:
    	.long 0x08570030, 0x08570030
liczba2:
    	.long 0xF040500C, 0x08570030
len = . - liczba2


.section .text


_start:


    mov $len, %ecx
    mov %ecx, %eax
    xor %edx, %edx
    mov $4, %ecx
    div %ecx
    mov %eax, %ecx
    subbLiczby:
        mov $liczba1, %ebx
        movl (%ebx, %ecx, 4), %eax  # ładujemy do rejestru eax 32-bitowe kawałki liczby1 zaczynając od najmłodszej

        mov $liczba2, %ebx
        movl (%ebx, %ecx, 4), %edx # to samo dla liczby2

        mov $0, %ebx    # do liczenia ile bitów z tej 32-bitowego kawałku już obliczono
        mov $0, %esi    # do przechowywania flagi
        addBits:

            push %eax
            push %ecx
            mov %ebx, %ecx
            shr %cl, %eax
            pop %ecx
            and $1, %eax    # wartość bitu na pozycji n liczba1

            push %edx
            push %ecx
            mov %ebx, %ecx
            shr %cl, %edx
            pop %ecx
            and $1, %edx    # wartość bitu na pozycji n liczba2
            
            cmp $1, %esi
            jne calc    # jeżeli nie ma pożyczki, idziemy do normalnego rachunku

            adjust_overflow:
                cmp $1, %eax        # mamy pożyczkę i sprawdzamy czy pożyczyliśmy z tej 1
                je reset_overflow   # mamy pożyczkę i napotkaliśmy pierwszą 1
                mov $1, %eax        # mamy 0 na miejscu, więc dodajemy 1 i zostawiamy pożyczkę
                jmp calc            # po skorygowaniu wartości idziemy do obliczeń
            
            reset_overflow:
                mov $0, %eax        # ustawiamy 1 z której wzięto pożyczkę na 0
                mov $0, %esi        # reset przepełnienia
                

            calc:
                sub %edx, %eax      # odejmowanie bitu liczba1 od bitu liczba2
                jc push_overflow    # jeśli 0-1 to nie chcemy wstawiać -1 tylko 1
                mov %eax, %edi      # zapis wyniku odejmowania w rejestrze edi

                pop %edx        # przywrócenie oryginalnej wartości liczonej części liczba2
                pop %eax        # przywrócenie oryginalnej wartości liczonej części liczba1
                push %edi       # wrzucenie na stos wyniku pojedynczej operacji odejmowania
                
                inc %ebx
                cmp $32, %ebx
                jne addBits
                jmp finish_part_calc

            


            push_overflow:      # odejmujemy 0 - 1, tak jak na kartce wstawiamy 1
                mov $1, %esi    # ustawienie "przeniesienia na 1"
                pop %edx        # przywrócenie oryginalnej wartości liczonej części liczba2
                pop %eax        # przywrócenie oryginalnej wartości liczonej części liczba1
                push $1         # suma częściowa = 1
                inc %ebx
                cmp $32, %ebx
                jne addBits

        

        // wolne ebx i esi
        finish_part_calc:
            dec %ecx
            cmp $-1, %ecx
            jne subbLiczby # jeżeli zostały nam jeszcze jakieś części 

    #TODO: dokoptowanie jeszcze wstawienia na stos pozyczki jeśli jest ustawiona na 1

    # Exit the program
    mov $1, %eax  # syscall number for exit
    xor %ebx, %ebx  # exit status 0
    int $0x80  # invoke syscall