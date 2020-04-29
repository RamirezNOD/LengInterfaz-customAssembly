; 9- Determinar si el numero es par o impar

DISPLAY_MODE = LCD_CMD_DISPLAY | LCD_CMD_DISPLAY_ON | LCD_CMD_DISPLAY_CURSOR | LCD_CMD_DISPLAY_CURSOR_BLINK

lcc #LCD_INITIALIZE
lcc #DISPLAY_MODE

numero = 10

.begin:	
	clra
  	lcc #LCD_CMD_CLEAR
	mov Ra, numero
	jnz .ciclo
	hlt
	
.ciclo:
	mov Rb, 2
	sub Ra
	tst Ra
	jz .par
	jn .impar
	jnz .ciclo
	hlt

.par: 
  data Ra, .spar
  call .printStr
  hlt
  
.impar: 
  data Ra, .simpar
  call .printStr
  hlt

.spar:
#str "Es par\0"
	
.simpar:
#str "Es impar\0"
	
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
