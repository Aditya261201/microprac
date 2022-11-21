.model small
.data
num1 db 10,"number1 : $"
num2 db 10,"number2 : $"
sum db 10,"Sum : $"
diff db 10,"Difference : $"
.code
.startup
mov dx , offset num1
mov ah, 9h
int 21h
mov ax,3204h
call disph
mov ax,6002h
call disph
mov dx,offset num2
mov ah,9h
int 21h
mov ax,1234h
call disph
mov ax,5678h
call disph
call add_num
call sub_num

MOV AH,4CH
INT 21H
add_num proc near
;32-bit bcd addition
mov ax,5678h
mov cx,6002h
mov bx,1234h
mov dx,3204h
add al,cl
daa
mov cl,al
adc ah,ch
mov al,ah
daa
mov ch,al
mov si,cx
mov al,bl
adc al,dl
daa
mov bl,al
mov al,bh
adc al,dh
daa
mov bh,al
mov dx,offset sum
mov ah,9h
int 21h
mov ax,bx
call disph
mov ax,si
call disph
ret
add_num endp
sub_num proc near
mov ax,5678h
mov cx,6002h
mov bx,1234h
mov dx,3204h
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
mov ax,bx
call disph
mov ax,si
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
disph2:mov ah,2
mov dl,al
int 21h
pop ax
dec ch
jne disph1
ret
disph endp
end
