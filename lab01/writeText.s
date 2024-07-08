SYSEXIT = 1
EXIT_SUCCESS = 0

SYSWRITE = 4
SYSREAD = 3

STDIN = 0
STDOUT = 1

.text
msg: .ascii "Write text (5): \n"
msg_len = . - msg

msg2: .ascii "Written text: "
msg2_len = . - msg2

newline: .ascii "\n"
newline_len = . - newline

.data
buf: .ascii "     "
buf_len = . - buf
    


.global _start

_start:

    mov $SYSWRITE, %eax
    MOV $STDOUT, %EBX
    MOV $msg, %ECX
    MOV $msg_len, %EDX    
    int $0x80


    mov $SYSREAD, %EAX
    MOV $STDIN, %EBX
    MOV $buf, %ECX
    MOV $buf_len, %EDX
    INT $0x80

    mov $SYSWRITE, %EAX
    MOV $STDOUT, %EBX
    MOV $msg2, %ECX
    MOV $msg2_len, %EDX
    INT $0X80
    
    MOV $SYSWRITE, %EAX
    MOV $STDOUT, %EBX
    MOV $buf, %ECX
    MOV $buf_len, %EDX
    INT $0X80 

    mov $SYSWRITE, %EAX
    MOV $STDOUT, %EBX
    MOV $newline, %ECX
    MOV $newline_len, %EDX
    int $0x80


    mov $SYSEXIT, %eax
    mov $EXIT_SUCCESS, %ebx
    int $0x80

