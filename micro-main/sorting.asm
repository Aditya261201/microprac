dosseg
.model small
.stack 100h
.data
len db 0
x db 0
num1 db 0
str1 db 'Enter Size of Array :- $'
str2 db 'Enter Elements of Array $'
str3 db 'ENTERED ARRAY is :- $'
str4 db 'SORTED ARRAY is :- $'
array db 16 DUP(?)
.code
main proc
mov ax,@data
mov ds,ax

;taking array size
mov ah,9
mov dx,OFFSET str1
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



;taking array inputs
mov ah,9
mov dx,OFFSET str2
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov si,0
mov cl,len

loop1:
mov ah,1
int 21h
mov array[si],al
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
inc si
loop loop1


;Displaying Array
mov ah,9
mov dx,OFFSET str3
int 21h
mov si,0
mov cl,len

loop2:
mov ah,2
mov dl,array[si]
int 21h
mov dl,' '
int 21h
inc si
loop loop2

;performing Sorting
mov cl,len
mov si,0
outer:
cmp cl,1
je done
mov x,cl
sub cl,1
mov al,array[si]
inc si
mov di,si
dec si

inner:
cmp array[di],al
jg skipnow

  mov dl,array[di]
  mov array[di],al
  mov array[si],dl
  mov al,array[si]
  
skipnow:

inc di
loop inner

mov cl,x
inc si


loop outer
done:

;Displaying  Sorted Array
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,9
mov dx,OFFSET str4
int 21h
mov si,0
mov cl,len

loop5:
mov ah,2
mov dl,array[si]
int 21h
mov dl,' '
int 21h
inc si
loop loop5



mov ah,4ch
int 21h
main endp
end main
