; 8- Determinar si un numero es multiplo de 6

DISPLAY_MODE = LCD_CMD_DISPLAY | LCD_CMD_DISPLAY_ON | LCD_CMD_DISPLAY_CURSOR | LCD_CMD_DISPLAY_CURSOR_BLINK

lcc #LCD_INITIALIZE
lcc #DISPLAY_MODE

numero = 36

.begin:	
	clra
  	lcc #LCD_CMD_CLEAR
	mov Ra, numero
	jnz .ciclo
	hlt
	
.ciclo:
	mov Rb, 6
	sub Ra
	tst Ra
	jz .multiplo
	jn .nomultiplo
	jnz .ciclo
	hlt

.multiplo: 
  data Ra, .smultiplo
  call .printStr
  hlt
  
.nomultiplo: 
  data Ra, .snomultiplo
  call .printStr
  hlt

.smultiplo:
#str "Si es multiplo de 6\0"
	
.snomultiplo:
#str "No es multiplo de 6\0"
	
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
