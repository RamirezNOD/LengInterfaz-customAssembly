; 15- Imprimir las sumas hasta 12+12

n = 1
fin = 12

.begin:	
	clra
	mov Rc, 0
	jnz .ciclo
	
	
.ciclo:
	inc Rc
	mov Ra, Rc
	mov Rb, Ra
	add Ra
	mov Rd,Ra
	mov Rb, fin
	cmp Rc
	jnz .ciclo
	hlt
