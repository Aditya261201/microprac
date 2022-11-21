dosseg
.model small
.stack 100h
.data
arr1 db 16 DUP(?)
arr2 db 16 DUP(?)
sum db 16 DUP(?)
Diff db 16 DUP(?)
len db 0
Str1 db 'Enter Size of Arrays :- $'
str2 db 'Enter 1st Array :-$'
str3 db 'Enter 2nd Array :-$'
str4 db 'Resultant Sum is :- $'
str5 db 'Resultant Difference is :- $'
str6 db 'ARRAY 1st :- $'
str7 db 'ARRAY 2nd :- $'
.code

main proc
mov ax,@data
mov ds,ax

mov ah,9
mov dx,OFFSET str1
int 21h

; taking size of array
mov ah,1
int 21h
mov cl,al
sub cl,48
mov len,cl

; Getting Elements of 1st array
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,9
mov dl,OFFSET str2
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov cl,len
mov si,0
loop1:
mov ah,1
int 21h
mov arr1[si],al
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
inc si

loop loop1

; Getting Elements of 2nd array and performing addition and substraction
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,9
mov dl,OFFSET str3
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov cl,len
mov si,0
loop2:
mov ah,1
int 21h
mov arr2[si],al
add al,arr1[si]
sub al,48
mov sum[si],al
mov al,arr1[si]
sub al,arr2[si]
add al,48
mov Diff[si],al
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
inc si

loop loop2

;Displaying all data

;Displaying 1st array
; next line 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,9
mov dx,OFFSET str6
int 21h
mov cl,len
mov si,0
loop3:
mov ah,2
mov dl,' '
int 21h
mov dl,arr1[si]
int 21h
inc si
loop loop3

;Displaying 2nd array
; next line 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,9
mov dx,OFFSET str7
int 21h
mov cl,len
mov si,0
loop4:
mov ah,2
mov dl,' '
int 21h
mov dl,arr2[si]
int 21h
inc si
loop loop4


;Displaying sum
; next line 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,9
mov dx,OFFSET str4
int 21h
mov cl,len
mov si,0
loop5:
mov ah,2
mov dl,' '
int 21h
mov dl,sum[si]
int 21h
inc si
loop loop5



;Displaying Difference array
; next line 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,9
mov dx,OFFSET str5
int 21h
mov cl,len
mov si,0
loop6:
mov ah,2
mov dl,' '
int 21h
mov dl,Diff[si]
int 21h
inc si
loop loop6


mov ah,4ch
int 21h
main endp
end main
