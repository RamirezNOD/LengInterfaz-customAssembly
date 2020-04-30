; 17- Suma de los numeros del 1 al 20

inicio = 0
fin = 20
	
.begin:	
	mov Ra, 0
	mov Rb, fin
	mov Rc, inicio
	jnz .ciclo
	hlt
	
.ciclo:	
	inc Rc
	mov Rb, Rc
	add Ra
	mov Rd, Ra
	mov Rb, fin	
	cmp Rc
	jnz .ciclo
	hlt
