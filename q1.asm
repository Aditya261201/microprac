dosseg
.model small
.386  ;enables 32bit register  for the programm
.data

num1 DD 99345678H
num2 DD 11111111H
num3 DD 00000000H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"

.code

.startup

; ############## DISPLAYING THE MSG ###########
MOV AH,09
MOV DX,OFFSET msg
INT 21H

;###############################################

;#################### FIRST NUMBER ##################
MOV EBX,0
MOV CX,8

AGAIN: 	MOV AH,01 ;1ST NO. ENTERED
	INT 21H
	CMP AL,'A'
	JGE L2		; if (al >= 41{'A' ascii code}) if someone enters the letter
	SUB AL,30H	
	SHL EBX,4	; here 4 bits means 1 byte means 1 value
	ADD BL,AL
	LOOP AGAIN

MOV num1,EBX
;#####################################################

MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV EBX,0
MOV CX,8

AGAIN1:	MOV AH,01 ;2nd NO. ENTERED
	INT 21H
	CMP AL,'A'
	JGE L2
	SUB AL,30H
	SHL EBX,4
	ADD BL,AL
	LOOP AGAIN1

MOV num2, EBX


;############### Adding two 4 bytes number #########
mov ax, word ptr num1
mov dx, word ptr num2
add al,dl
daa

mov bl,al
mov al,ah
adc al,dh
daa


mov bh,al
mov word ptr num3, bx
;###################################################


mov ax, word ptr num1+2
mov dx, word ptr num2+2
adc al,dl
daa

mov bl,al
mov al,ah
adc al,dh
daa

mov bh,al
mov word ptr num3+2,bx
;###################################################

mov ebx,num3

mov ah, 09h
mov dx, offset msg2
int 21h

jnc L6  ; if no carry then skip below part

mov ah, 02h
mov dl, "1"
int 21h

; if any carry print 1 above line

L6: MOV CX,8
AGAIN2:	ROL EBX,4
	MOV DL,BL
	AND DL,0FH
	ADD DL,30H
	MOV AH,02
	INT 21H
	LOOP AGAIN2
	
; display number (one by one)

L2:	mov ah,4ch
	int 21h
	
	;exit

END
