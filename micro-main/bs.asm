dosseg
.model small
.stack 100h
.data
str1 db 'Enter size of Array :- $'
str2 db 'Start Entering Elements of Array (Increasing order) :- $'
str3 db 'Enter Element to Search :- $'
str4 db 'FOUND----------->$'
str5 db 'NOT FOUND------->$'
str6 db 'Entered Array is :- $'
len db 0
num db 0
start db 0
en db 0
mid db 0
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
mov ah,9
mov dx,OFFSET str6
int 21h
mov cl,len
mov bh,0
mov bl,0
loop3:
mov ah,2
mov dl,' '
int 21h
mov dl,array[bx]
int 21h
add bl,1
loop loop3
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

;Binary Search Performing 
mov cl,len
mov en,cl
mov start,0
mov dl,num
ca:
mov bl,en
sub bl,start
mov al,bl
mov ah,0
mov bl,2
div bl

add al,start
mov mid,al
mov bh,0
mov bl,mid
cmp array[bx],dl
JE Found


cmp dl,array[bx]
JG startmid
mov al,mid
mov en,al
jmp plzcontinue

startmid:
 mov al,mid
 mov start,al

plzcontinue:

loop ca
mov ah,9 
mov dx,OFFSET str5
int 21h 
jmp normalend

Found:
mov ah,9
mov dx,OFFSET str4
int 21h

normalend:


mov ah,4ch
int 21h
main endp
end main
