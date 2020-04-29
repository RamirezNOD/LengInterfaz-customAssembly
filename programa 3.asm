; 3- Imprimir los numeros pares del 2 al 48

inicio = 2
fin = 48

	data Ra, inicio
	data Rb, fin
	
.begin:	
	mov Rd, Ra
	jnz .ciclo
	hlt
	
.ciclo:
	inc Ra
	inc Ra
	mov Rd, Ra
	cmp Ra
	jnz .ciclo
	hlt	
