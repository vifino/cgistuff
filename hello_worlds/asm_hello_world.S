; asm_hello_world.S
BITS 32

SECTION .data ; Data section

cgiheader: db "Content-Type: text/html",10,10,0 ; The CGI header thing for html.
content: db "<h1>Hello, world!</h1>",0 ; The content.

SECTION .text ; Actual code.

extern printf ; I'm a bad, bad boy.

global main
main:
	push ebp ; Set up stack
	mov ebp, esp

	push cgiheader ; Put header on stack and...
	call printf    ; call printf to write it to stdout.

	push content   ; Put the content on the stack...
	call printf    ; and do the same thing as above! Yay!

	mov esp, ebp ; Finalize.
	pop ebp
	mov eax, 0
	ret
