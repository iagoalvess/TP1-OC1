.data
vetor: .word 1500, 2200, 1800 # exemplo

##### START MODIFIQUE AQUI START #####
reajuste: .word 50 # Use .float para representar números decimais
salario_limite: .word 1000
contador_salarios_acima_limite: .word 0
aux_reajuste: .word 100
##### END MODIFIQUE AQUI END #####

.text
jal ra, main
# utilizado para correção (considerando um limiar de 200 para o vetor de exemplo após a aplicação do reajuste.
addi x14, x0, 1
beq x14, x5, FIM # Verifica a quantidade de salários acima do limiar.

main:
##### START MODIFIQUE AQUI START #####
    la a0, vetor
    li a1, 3
    li t0, 0
    lw t1, reajuste # Carrega o valor de reajuste
    lw t2, aux_reajuste
    lw t3, salario_limite

    mv t6, ra
    jal ra, aplica_reajuste
    mv ra, t6
    jr ra
##### END MODIFIQUE AQUI END #####

aplica_reajuste:
    # Argumentos:
    # a0: Endereço base do vetor de salários
    # a1: Número de salários no vetor
    # t3: Limite de salário
    # t1: Contador de salários acima do limite
    ##### START MODIFIQUE AQUI START #####

    # Verifica se ainda há salários para processar
    beq a1, x0, reajuste_aplicado

    lw t4, 0(a0)

    # Aplica o reajuste
    mul t4, t4, t1  # t4 = t4 * t1 (reajuste em percentagem)
    div t4, t4, t2 # Divide por 100 para obter o valor correto
    sw t4, 0(a0)    # Armazena o novo salário de volta no vetor
    # Compara o salário com o limite após o reajuste

    # Atualiza o endereço do próximo salário no vetor
    addi a0, a0, 4

    # Decrementa o contador de salários restantes
    addi a1, a1, -1

    bge t4, t3, salario_acima_limite

    j aplica_reajuste

salario_acima_limite:
    # Incrementa o contador de salários acima do limite
    addi t0, t0, 1
    j aplica_reajuste

reajuste_aplicado:
    jr ra

##### END MODIFIQUE AQUI END #####

FIM: addi x0, x0, 1