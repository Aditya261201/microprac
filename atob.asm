;6. Write a program for ascii to binary conversion.
.model small
.data
    msg db 0dh,0ah,'Program for converting ASCII to Binary:$'      
    msg1 db 0dh,0ah,'Enter the element :$'  
 
.code
 .startup

  mov dx,offset msg
  mov ah,09h
  int 21h
  mov dx,offset msg1
  mov ah,09h
  int 21h 
  mov ah,01h
  int 21h 
  mov bl,al
  mov dl,0Ah
  mov ah,02h
  int 21h
  mov cx,8
  again:
    shl bl,1
    jc l2
    jnc l3
    loop again
  l2:
    mov dl,31h
    mov ah,02h
    int 21h
    jmp l4
  l3:
    mov dl,30h
    mov ah,02h
    int 21h
    jmp l4
  l4:
    loop again
  
end
    

    



