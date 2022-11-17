dosseg
.model small
.386
.data
	num1 DD 00000000H
	num2 DD 00000000H
	num3 DD 00000000H
	msg db 10,13,"Enter the first no.:: $"
	msg1 db 10,13,"Enter the second no.:: $"
	msg2 db 10,13,"The Resultant Difference is :: $"
	
.code

.startup

MOV AH,09
MOV DX,OFFSET msg
INT 21H

MOV EBX,0
MOV CX,8

AGAIN:  MOV AH,01 ;1ST NO. ENTERED
	INT 21H
	CMP AL,'A'
	JGE L2
	SUB AL,30H
	SHL EBX,4
	ADD BL,AL
	LOOP AGAIN
	
MOV num1,EBX

MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV EBX,0
MOV CX,8

AGAIN1: MOV AH,01 ;2nd NO. ENTERED
	INT 21H
	CMP AL,'A'
	JGE L2
	SUB AL,30H
	SHL EBX,4
	ADD BL,AL
	LOOP AGAIN1
	
MOV num2, EBX

mov ah, 09h
mov dx, offset msg2
int 21h

mov ax, word ptr num1+2
mov dx, word ptr num2+2

sub al,dl
das
mov dl,al

sbb ah,dh
das
mov dh,al

call disph

mov ax, word ptr num1
mov dx, word ptr num2

sbb al,dl
das
mov dl,al

sbb ah,dh
das
mov dh,al

disph proc near

	mov cl,4
	mov ch,4
	disph1:
		rol ax,cl
		push ax
		and al,0fh
		add al,30h
		cmp al,'9'
		jbe disph2
		add al,7
	
	disph2:
		mov ah,2
		mov dl,al
		int 21h
		pop ax
		dec ch
		jne disph1
	ret

disph endp

L2:
	mov ah,4ch
	int 21h
END
