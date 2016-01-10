; asm_hello_world.S
BITS 32

SECTION .data ; Data section

cgiheader: db "Content-Type: text/html",10,10,0 ; The CGI header thing for html.
cgiheader_len: equ $-cgiheader

content: db "<h1>Hello, world!</h1>",0 ; The content.
content_len: equ $-content

SECTION .text ; Actual code.

global _start
_start:
	mov edx,cgiheader_len ; content lengh
	mov ecx,cgiheader     ; actual content memory location
	mov ebx,1             ; file descriptor (stdout)
	mov eax,4             ; system call number (sys_write)
	int 0x80              ; call kernel

	mov edx,content_len   ; content length
	mov ecx,content       ; actual content memory location
	mov ebx,1             ; file descriptor (stdout)
	mov eax,4             ; system call number (sys_write)
	int 0x80              ; call kernel

	mov ebx, 0            ; Exit code
	mov eax, 1            ; no error
	int 0x80              ; call kernel
