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
    	.long 0x10, 0x02, 0x10
liczba2:
    	.long 0x06, 0x01, 0x03
len = . - liczba2



.section .text


_start:


    mov $len, %ecx
    mov %ecx, %eax
    xor %edx, %edx
    mov $4, %ecx
    div %ecx
    mov %eax, %ecx
    dec %ecx
    subbLiczby:
        mov $liczba1, %ebx
        movl (%ebx, %ecx, 4), %eax  # ładujemy do rejestru eax 32-bitowe kawałki liczby1 zaczynając od najmłodszej

        mov $liczba2, %ebx
        movl (%ebx, %ecx, 4), %edx # to samo dla liczby2

        mov $0, %esi    # do przechowywania flagi
        
        addPart:
		cmp $1, %esi
		je carry
		xor %ebx, %ebx
		adc %edx, %eax
		push %eax	# odkładamy sumę częściową na stack
		mov $0, %esi
		adc $0, %esi # "przechowujemy" overflow flag, bo compare go pushe
		jmp help
		carry:
			adc %edx, %eax
			
        help:
	    dec %ecx
	    cmp $-1, %ecx
	    jne subbLiczby
	
	cmp $1, %esi    
	jne exit
	push $1

    	#TODO: dokoptowanie jeszcze wstawienia na stos pozyczki jeśli jest ustawiona na 1
	exit:
	    # Exit the program
	    mov $1, %eax  # syscall number for exit
	    xor %ebx, %ebx  # exit status 0
	    int $0x80  # invoke syscall
