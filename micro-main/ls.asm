dosseg
.model small
.stack 100h
.data
str1 db 'Enter size of Array :- $'
str2 db 'Start Entering Elements of Array  :- $'
str3 db 'Enter Element to Search :- $'
str4 db 'FOUND----------->$'
str5 db 'NOT FOUND------->$'
str6 db 'Entered Array is :- $'
len db 0
num db 0
array db 16 DUP(?)
.code
 
main proc
mov ax,@data
mov ds,ax

;Getting size of array
mov ah,9
mov dx, OFFSET str1
int 21h

mov ah,1
int 21h
sub al,48
mov len,al

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

;Entering in array
mov ah,9
mov dx, OFFSET str2
int 21h

mov cl,len
mov si,0
loop1:
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,1
int 21h
mov array[si],al
inc si
loop loop1

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h


;Getting Element to Search
mov ah,9
mov dx, OFFSET str3
int 21h

mov ah,1
int 21h
mov num,al

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h




;Linear Search Performing 
mov cl,len
mov si,0
mov bl,num

loop2:
cmp cl,1
JE lastEntry

cmp array[si],bl
JE Found

inc si
loop loop2

Found:
 mov ah,9
 mov dx,OFFSET str4
 int 21h
 jmp normalend
 
lastEntry:
 cmp array[si],bl
 JE Found
 mov ah,9
 mov dx,OFFSET str5
 int 21h


normalend:

mov ah,4ch
int 21h
main endp
end main
