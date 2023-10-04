.data
vetor: .word 2, 4, 7, 10, 13, 16, 21, 24

##### START MODIFIQUE AQUI START #####
tamanho_vetor: .word 8
##### END MODIFIQUE AQUI END #####

.text
jal x1, contador
addi x14, x0, 5 # utilizado para correção
beq x14, x10, FIM # Verifica # de pares
beq x14, x11, FIM # Verifica # de ímpares

##### START MODIFIQUE AQUI START #####
contador:
    la t2, vetor
    lw t3, tamanho_vetor

    addi x5, x0, 0 # Contador de pares = 0
    addi x6, x0, 0 # Contador de ímpares = 0

loop_contador:
    beq t3, x0, finaliza_loop # Quando tamanho = 0, terminamos o loop
    lw x4, 0(t2) # Carrega o valor que será analisado
    andi x8, x4, 1 # Verificação para número ímpar
    beqz x8, par # Se for par, vai para 'par'

    addi x6, x6, 1 # Contador de ímpares++
    j proximo_elemento
    
par:
    addi x5, x5, 1 # Contador de pares++

proximo_elemento:
    addi t2, t2, 4 # Incrementa o endereço do vetor
    addi t3, t3, -1 # Tamanho--
    j loop_contador

finaliza_loop:
    mv x10, x5 # Move o contador de pares para r0
    mv x11, x6 # Move o contador de ímpares para r1
    ret

##### END MODIFIQUE AQUI END #####

FIM: addi x0, x0, 1