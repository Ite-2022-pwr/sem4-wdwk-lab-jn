SYSEXIT = 1
EXIT_SUCCESS = 0

SYSWRITE = 4
SYSREAD = 3

STDIN = 0
STDOUT = 1

.text
msg: .ascii "Write text (5): \n"
msg_len = . - msg

msg2: .ascii "Written text is not equal halal"
msg2_len = . - msg2

msg3: .ascii "Written text is equal halal"
msg3_len = . - msg2

msg_compare: .ascii "halal"


newline: .ascii "\n"
newline_len = . - newline

.data
buf: .ascii "     "
buf_len = . - buf
    


.global _start

_start:

// wypisanie tekstu początkowego
    mov $SYSWRITE, %eax
    MOV $STDOUT, %EBX
    MOV $msg, %ECX
    MOV $msg_len, %EDX    
    int $0x80

//załadowanie napisu
    mov $SYSREAD, %EAX
    MOV $STDIN, %EBX
    MOV $buf, %ECX
    MOV $buf_len, %EDX
    INT $0x80
    
    
mov $0, %ecx
mov $buf, %ebx
mov $msg_compare, %edx
  loop:
  	mov (%ebx,%ecx,1), %al
  	mov (%edx,%ecx,1), %ah
  	cmp %al, %ah
  	jne not_equal
  	inc %ecx
  	mov $buf_len, %eax
  	cmp %ecx, %eax
  	jne loop
  	
  equal:
 	mov $SYSWRITE, %EAX
    	MOV $STDOUT, %EBX
    	MOV $msg3, %ECX
    	MOV $msg3_len, %EDX
    	INT $0X80	
    	jmp koniec
  	
  	
  not_equal:
   mov $SYSWRITE, %EAX
    MOV $STDOUT, %EBX
    MOV $msg2, %ECX
    MOV $msg2_len, %EDX
    INT $0X80
    
   koniec:
	mov $SYSWRITE, %EAX
	    MOV $STDOUT, %EBX
	    MOV $newline, %ECX
	    MOV $newline_len, %EDX
	    INT $0X80
	    mov $SYSEXIT, %eax
	    mov $EXIT_SUCCESS, %ebx
	    int $0x80


