dosseg
.model small
.stack 100h
.data
str1 db 'Enter Binary number :- $'
str2 db 'ASCII Equivalent :- $' 
errorprint db 'Error :- Only 0,1 is allowed $'
.code

main proc

mov ax,@data
mov ds,ax

mov bl,00h
mov ah,9
mov dx,OFFSET str1
int 21h

mov cl,8

startinput:

mov ah,1
int 21h
sub al,48
cmp al,0
JE normal

cmp al,1
JE normal

jmp exitnow

normal:
shl bl,1
add bl,al

loop startinput

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,9
mov dx,OFFSET str2
int 21h
mov ah,2
mov dl,bl
int 21h
jmp normalexit


normalexit:
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
jmp finalend

exitnow:
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,9
mov dx,OFFSET errorprint
int 21h

finalend:



mov ah,4ch
int 21h
main endp
end main
