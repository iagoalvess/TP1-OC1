.data
vetor: .word 1500, 2200, 1800 # exemplo

##### START MODIFIQUE AQUI START #####
reajuste: .word 50 # 50 pois depois dividiremos por 100 e evitaremos uso de ponto flutuante
salario_limite: .word 1000 # Modificavel (Indica o salario considerado limite apos reajuste)
contador_sal_limite: .word 0 # Numero de salarios que superam o limite especificado
aux_reajuste: .word 100 # Auxiliar para reajuste, me permite não utilizar ponto flutuante (50%)
##### END MODIFIQUE AQUI END #####

.text
jal ra, main # utilizado para correção (considerando um limiar de 200 para o vetor de exemplo após a aplicação do reajuste.
addi x14, x0, 1
beq x14, x5, FIM # Verifica a quantidade de salários acima do limiar.

main:
##### START MODIFIQUE AQUI START #####
    # Carrega os valores/endereços
    la a0, vetor
    li a1, 3 # Tamanho do vetor

    lw t0, contador_sal_limite
    lw t1, reajuste
    lw t2, aux_reajuste
    lw t3, salario_limite

    jal ra, aplica_reajuste
    
    lw ra, 0(sp)  # Restaura o endereço de retorno da pilha
    addi sp, sp, 4 # Incrementa a pilha para liberar o espaço usado

    addi ra, ra, 4 # Configura ra para apontar para a próxima instrução

    jr ra # Retorno
##### END MODIFIQUE AQUI END #####

aplica_reajuste:
    # a0: Endereço base do vetor de salários
    # a1: Tamanho do vetor
    # t1: Valor de reajuste
    # t3: Salario limite
    # t4: Salario analisado 
    ##### START MODIFIQUE AQUI START #####
    # Verifica se ainda há salários para processar
    beq a1, x0, reajuste_aplicado

    lw t4, 0(a0) # Carrega o salario que será analisado

    # Aplica o reajuste
    mul t4, t4, t1 # Salario x Reajuste
    div t4, t4, t2 # Divide por 100 para obter o valor correto
    sw t4, 0(a0)   # Armazena o novo salário de volta no vetor

    # Atualiza o endereço do próximo salário no vetor
    addi a0, a0, 4

    # Decrementa o contador de salários restantes
    addi a1, a1, -1

    # Compara o salário reajustado com o limite
    bge t4, t3, salario_acima_limite

    j aplica_reajuste

salario_acima_limite:
    # Incrementa o contador de salários acima do limite
    addi t0, t0, 1

    j aplica_reajuste

reajuste_aplicado:
    jr ra # Retorno

##### END MODIFIQUE AQUI END #####

FIM: addi x0, x0, 1