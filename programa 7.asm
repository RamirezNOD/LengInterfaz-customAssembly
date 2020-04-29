; 7- Determinar si un numero es divisible entre 14

DISPLAY_MODE = LCD_CMD_DISPLAY | LCD_CMD_DISPLAY_ON | LCD_CMD_DISPLAY_CURSOR | LCD_CMD_DISPLAY_CURSOR_BLINK

lcc #LCD_INITIALIZE
lcc #DISPLAY_MODE

numero = 42

.begin:	
	clra
  	lcc #LCD_CMD_CLEAR
	mov Ra, numero
	jnz .ciclo
	hlt
	
.ciclo:
	mov Rb, 14
	sub Ra
	tst Ra
	jz .div
	jn .nodiv
	jnz .ciclo
	hlt

.div: 
  data Ra, .sdiv
  call .printStr
  hlt
  
.nodiv: 
  data Ra, .snodiv
  call .printStr
  hlt

.sdiv:
#str "Si es divisible\0"
	
.snodiv:
#str "No es divisible\0"
	
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
