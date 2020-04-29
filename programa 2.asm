; 2- Imprimir los numeros impares del 7 al 51

inicio = 7
fin = 51

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
