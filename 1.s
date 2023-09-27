.data
vetor: .word 2, 4, 7, 10, 13, 16, 21, 24

##### START MODIFIQUE AQUI START #####
tamanho: .word 8
##### END MODIFIQUE AQUI END #####

.text
jal x1, contador
addi x14, x0, 5 # utilizado para correção
beq x14, x5, FIM # Verifica # de pares
beq x14, x6, FIM # Verifica # de ímpares

##### START MODIFIQUE AQUI START #####
contador:
    la t2, vetor
    lw t3, tamanho

    addi x5, x0, 0 # Inicializa o contador de pares
    addi x6, x0, 0 # Inicializa o contador de ímpares

loop:
    beq t3, x0, end_loop # Se t3 (tamanho do vetor) for 0, termina o loop
    lw x4, 0(t2) # Carrega o valor do vetor na posição t2
    andi x8, x4, 1 # Verifica se o número é ímpar
    beqz x8, even # Se o número for par, vai para 'even'

    addi x6, x6, 1 # Incrementa o contador de ímpares
    j next # Vai para 'next'
    
even:
    addi x5, x5, 1 # Incrementa o contador de pares

next:
    addi t2, t2, 4 # Incrementa o endereço do vetor
    addi t3, t3, -1 # Decrementa o tamanho do vetor
    j loop # Volta para 'loop'

end_loop:
    mv a0, x5 # Move o contador de pares para r0 (valor de retorno)
    mv a1, x6 # Move o contador de ímpares para r1 (valor de retorno)
    ret

##### END MODIFIQUE AQUI END #####

FIM: addi x0, x0, 1