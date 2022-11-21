dosseg
.model small
.data
num1 db 32 DUP(?)
num2 db 32 DUP(?)
sum db 32 DUP(?)
diff db 4 DUP(?)
str1 db 'Enter 1st num in binary:- $'
str2 db 'Enter 2nd num in binary:- $'
str3 db 'Sum is :- $'
str4 db 'Difference is :- $'
disp1 db '1st Array is :- $'
disp2 db '2nd Array is :- $'
error1 db 'Only 0,1 is allowed$'
x db 0
.code

main proc
mov ax,@data
mov ds,ax

mov ah,9
mov dx,OFFSET str1
int 21h

;Entering 1st number in binary

mov cl,32
mov si,0
l1:
mov ah,1
int 21h

cmp al,'0'
JE normal1


cmp al,'1'
JE normal1
jmp out1

normal1:
mov num1[si],al
inc si
loop l1



mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h




;Entering 2nd number in binary
mov ah,9
mov dx,OFFSET str2
int 21h

mov cl,32
mov si,0
l2:
mov ah,1
int 21h

cmp al,'0'
JE normal2

cmp al,'1'
JE normal2
jmp out1

normal2:
mov num2[si],al
inc si
loop l2




jmp skiperror

;Throwing Error
out1:
mov ah,9
mov dx,OFFSET error1
int 21h
jmp normalexit

skiperror:

;Displaying 1st array
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,9
mov dx,OFFSET disp1
int 21h
mov ah,2
mov dl,' '
int 21h


mov cl,32
mov si,0
l3:
mov ah,2
mov dl,num1[si]
int 21h
inc si
loop l3


;Displaying 2nd Array
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,9
mov dx,OFFSET disp2
int 21h
mov ah,2
mov dl,' '
int 21h


mov cl,32
mov si,0
l4:
mov ah,2
mov dl,num2[si]
int 21h
inc si
loop l4

;Displaying sum 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,9
mov dx,OFFSET str3
int 21h
mov ah,2
mov dl,' '
int 21h

;Adding 
mov cl,32
mov si,31
addagain:
mov al,num1[si]
add al,num2[si]
sub al,48
add al,x


cmp al,'0'
JE normal

cmp al,'1'
JE normal

cmp al,'2'
JE onecarryzero

cmp al,'3'
JE onecarryone

onecarryzero:
mov x,1
mov sum[si],'0'
jmp carryexit

onecarryone:
mov x,1
mov sum[si],'1'
jmp carryexit



normal:
mov sum[si],al
mov x,0

carryexit:
dec si
loop addagain



cmp x,0
JE printnormal
mov ah,2
mov dl,'1'
int 21h
mov dl,' '
int 21h


printnormal:
mov cl,32
mov si,0
st1:
mov ah,2
mov dl,sum[si]
int 21h
inc si
loop st1


normalexit:
mov ah,4ch
int 21h
main endp
end main
