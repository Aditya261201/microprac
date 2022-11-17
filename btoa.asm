;5. Write a program for binary to ascii conversion
.model small
.data
      array db 8 dup(?)
      msg db 0dh,0ah,'Program for conversion of binary to ascii:$'      
      msg1 db 0dh,0ah,'Enter the element to array:$'
     
.code
.startup

mov dx,offset msg
mov ah,09h
int 21h
mov dx,offset msg1
mov si,0
mov cx,8
again:
    mov ah,01h
    int 21h
    sub al,30h
    mov array[si],al
    inc si
loop again    



mov cx,8
mov al,01h
mov sp,0h     
mov si,07h
mov bl,02h
again1:   
    
    mov dl,array[si] 
    cmp dl,01h
    jz  l2
here:
dec si
mul bl
loop again1 

jmp ext

l2:
   add sp, ax
   jmp here
   
ext:
mov dx,sp
mov ah,02h
int 21h 

end    
    
    