; 1- Imprimir numeros enteros del 9 al 43

inicio = 9
fin = 43

	data Ra, inicio
	data Rb, fin
	
.begin:	
	mov Rd, Ra
	jnz .ciclo
	hlt
	
.ciclo:
	inc Ra
	mov Rd, Ra
	cmp Ra
	jnz .ciclo
	hlt
