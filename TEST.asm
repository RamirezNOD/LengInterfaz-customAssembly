; 15- TEST

DISPLAY_MODE = LCD_CMD_DISPLAY | LCD_CMD_DISPLAY_ON | LCD_CMD_DISPLAY_CURSOR | LCD_CMD_DISPLAY_CURSOR_BLINK

lcc #LCD_INITIALIZE
lcc #DISPLAY_MODE

ADDR   = 0
STR_TERM = 0
BCD_TERM = 255
ASCII_ZERO = 48 ; ascii 0

numero = 10

.begin:	
	clra
  	lcc #LCD_CMD_CLEAR
	mov Ra, numero
	jnz .ciclo
	
	
.ciclo:
	mov Rb, 5
  	call printNumber
	jmp .mas
	mov Ra, numero
	mov Rb, 4
  	call printNumber
	jmp .igual
	mov Ra, numero
	mov Ra, 5
	mov Rb, 4
	add Ra
	mov Rb, Ra
  	call printNumber
	jnz .ciclo
	hlt

.mas: 
  data Ra, .smas
  call .printStr
  
.igual: 
  data Ra, .sigual
  call .printStr

.smas:
#str " + \0"
	
.sigual:
#str " = \0"
	
.printStr:
  mov Rc, Ra
  .nextChar:
    lod Ra, Rc
    tst Ra
    jz .done
    lcd Ra
	inc Rc
    jmp .nextChar
  .done:
    ret
	
printNumber:
	data Ra, ADDR
	call toDec8
	data Ra, ADDR
	call printBCD
	ret

; print BCD value at address in Ra
printBCD:
	data Rb, BCD_TERM
	
	.findEnd:
		lod Rc, Ra
		cmp Rb, Rc
		jz .startPrint
		inc Ra
		jmp .findEnd

	.startPrint:
		clr Rc
		;inc Ra
	
	.nextDigit:
		dec Ra
		lod Rc, Ra
		data Rb, ASCII_ZERO
		add Rc
		lcd Rc
		mov Rb, Ra
		tst Rb
		jz ret
		jmp .nextDigit
		ret
		
toDec8:
	push Ra
	push Rb
	
	.nextDigit:
		pop Ra  ; get remaining number
		data Rb, 10
		call div8
		pop Rb  ; address to Rb
		sto Rb, Ra ; store remainder
		inc Rb
		push Rb  ; push next memory address
		tst Rc
		jz .return
		push Rc
		jmp .nextDigit

	.return:
		pop Rb
		data Ra, BCD_TERM  ; add terminator
		sto Rb, Ra
		ret

div8:
	data Rc, 0x00
	
	.step:
		cmp Rb, Ra
		jz .add
		jc ret
		
	.add:
		inc Rc
		sub Ra
		jnz .step
		ret
		
ret:
	ret
