; 5- Imprimir las potencias del 2 sin exceder 1000 
;						(No soporta mas de 255; nuevo limite: 128)

inicio = 2
fin = 128

	data Ra, inicio
	data Rb, fin
	
.begin:	
	mov Rd, Ra
	jnz .ciclo
	hlt
	
.ciclo:
	mov Rb, Ra
	add Ra
	mov Rd, Ra
	mov Rb, fin
	cmp Ra
	jnz .ciclo
	hlt	
