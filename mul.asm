dosseg
.model small
.data
num1 db 10,13,"Enter first number : $"
num2 db 10,13,"Enter second number : $"
diff db 10,13,"The Difference is : $"

.code
.startup

mov dx , offset num1
mov ah, 9h
int 21h

mov ax,9934h
call disph

mov ax,5678h
call disph

mov dx,offset num2
mov ah,9h
int 21h

mov ax,1234h
call disph

mov ax,5678h
call disph

call sub_num

jmp exit

sub_num proc near
	mov dx,5678h
	mov bx,5678h
	mov cx,1234h
	mov ax,9934h
	
	sub al,cl
	das
	mov cl,al
	
	sbb ah,ch
	mov al,ah
	das
	mov ch,al
	
	mov si,cx
	mov al,bl
	
	sbb al,dl
	das
	mov bl,al
	
	mov al,bh
	
	sbb al,dh
	das
	mov bh,al
	
	mov dx,offset diff
	mov ah,9h
	int 21h
	
	mov ax,si
	call disph
	
	mov ax,bx
	call disph
	
	ret
sub_num endp

disph proc near
	mov cl,4
	mov ch,4
	disph1:
		rol ax,cl
		push ax
		and al,0fh
		add al,30h
		cmp al,'9'
		jbe disph2
		add al,7
	disph2:
		mov ah,2
		mov dl,al
		int 21h
		pop ax
		dec ch
		jne disph1
	ret
disph endp


exit:
	mov ah,4ch
	int 21h
end
