.model small
.data
num1 db 10,"number1 : $"
num2 db 10,"number2 : $"
diff db 10,"Difference : $"
.code
.startup
mov dx , offset num1
mov ah, 9h
int 21h
mov ax,4215h
call disph
mov ax,6512h
call disph
mov dx,offset num2
mov ah,9h
int 21h
mov ax,1425h
call disph
mov ax,2145h
call disph
call sub_num


sub_num proc near
mov dx,4215h
mov bx,6512h
mov cx,1425h
mov ax,2145h
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


End
