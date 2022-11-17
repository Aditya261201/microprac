;ARRRAY addition & subtraction

.model small

.stack 1000h


.data
  arr1 db 09h, 09h, 09h, 09h, 09h
  arr2 db 01h, 03h, 05h, 06h, 09h

  diff db '$$'
  sum db '$$$'
  space db ' $'
  endl db 0ah,'$'

.code

  printSpace proc stdcall
    mov ah, 09h
    mov dx, offset space
    int 21h
    ret
  printSpace endp

  printSum proc stdcall
    mov ah, 09h
    mov dx, offset sum
    int 21h

    call printSpace
    ret
  printSum endp

  printSub proc stdcall
    mov ah, 09h
    mov dx, offset diff
    int 21h

    call printSpace
    ret
  printSub endp

  addition proc stdcall
    mov cx, 5
    mov si, 0
    a:
      xor bx, bx
      mov bl, byte ptr[arr1+si]
      add bl, byte ptr[arr2+si]

      cmp bl, 09h
      ja b
      c:
        or bx, 3030h

        mov byte ptr[sum], bh
        mov byte ptr[sum+1], bl

        call printSum
        inc si
        loop a
    ret

    b:
      xor ax, ax
      mov al, bl
      sub al, 0ah   ; sub bl, 09h    dec bl
      inc ah

      mov bx, ax
      jmp c
  addition endp

  subtraction proc stdcall
    mov cx, 5
    mov si, 0
    s:
      xor ax, ax
      xor bx, bx
      mov al, byte ptr[arr1+si]
      mov bl, byte ptr[arr2+si]
      sub al, bl
      or al, 30h
      mov byte ptr[diff], al

      call printSub
      inc si
      loop s
    ret
  subtraction endp


start:
  mov ax, @data
  mov ds, ax
  mov es, ax


  call addition

  mov ah, 09h
  mov dx, offset endl
  int 21h

  call subtraction

  jmp last


  last:
    .exit 0
end start