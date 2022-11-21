dosseg
.model small
.stack 100h
.data
str1 db 'Enter ASCII Character :- $'
str2 db 'Binary Equivalent is Given by :- $'
.code

main proc
mov ax,@data
mov ds,ax

;Printing 1st Message
mov ah,9
mov dx,OFFSET str1
int 21h

; Taking One Charcter Input
mov ah,1
int 21h

;Temporary Storing data
mov cl,al

;For Next Line
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

;Printing 2nd Message
mov ah,9
mov dx,OFFSET str2
int 21h

mov bl,cl

;loop to be run 8times
mov cl,8

convertion:
shl bl,1
jc printone

printzero:
  mov dl,'0'
  jmp printnow

printone:
  mov dl,'1'

printnow:
  mov ah,2
  int 21h

loop convertion




mov ah,4ch
int 21h
main endp
end main
