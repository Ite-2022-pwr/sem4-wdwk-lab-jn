.global _start



.section .data
// liczba1:
//     	.long 0x10304008, 0x701100FF, 0x45100020, 0x08570030
// liczba2:
//     	.long 0xF040500C, 0x00220026, 0x321000CB, 0x04520031

//liczba1:
//    	.long 0x08570030, 0x08570030
//liczba2:
//    	.long 0xF040500C, 0x08570030
//len = . - liczba2

liczba1:
    	.long 0x08, 0x10, 0x06, 0x01
liczba2:
    	.long 0x0A, 0x0A, 0x05, 0x02
len = . - liczba2



.section .text


_start:


    mov $len, %ecx	# ładujemy dlugosc liczba2 (zakladamy że obie liczby są tej samej długości)
    mov %ecx, %eax	# kopiujemy do eax
    xor %edx, %edx	# magicznie uzywane w dzieleniu, wyzerowane	
    mov $4, %ecx	# ładujemy 4 do ecx którą uzyjemy do podzielenia w eax
    div %ecx		# dzielimy eax przez ecx
    mov %eax, %ecx	# wstawiamy wynik ile jest kawałków po 4 bajty do ecx
    dec %ecx		# zmniejszamy o jeden żeby mieć indeks najmłodszej częsci liczby
    subbLiczby:
    
        mov $liczba1, %ebx
        movl (%ebx, %ecx, 4), %eax  # ładujemy do rejestru eax 32-bitowe kawałki liczby1 zaczynając od najmłodszej

        mov $liczba2, %ebx
        movl (%ebx, %ecx, 4), %edx # to samo dla liczby2

        mov $0, %esi    # do przechowywania flagi przeniesienia
        
        addPart:
		sbb %edx, %eax	# odejmujemy z flagą przeniesienia
		jc overflow	# jeśli overflow to skok
		mov $0, %esi
		adc $0, %esi 	# "przechowujemy" overflow flag, bo compare go psuje
		push %eax
	    	dec %ecx
	    	cmp $-1, %ecx
	    	jne subbLiczby
	    	
		overflow:
			push $0xFFFFFFFF
			dec %ecx
		    	cmp $-1, %ecx
		    	jne subbLiczby
			
	
	cmp $1, %esi    
	jne exit
	push $0x1

	exit:
	    # Exit the program
	    mov $1, %eax  # syscall number for exit
	    xor %ebx, %ebx  # exit status 0
	    int $0x80  # invoke syscall
