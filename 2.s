.data
vetor: .word 200, 190, 340, 100 # exemplo

##### START MODIFIQUE AQUI START #####

##### END MODIFIQUE AQUI END #####

.text
jal ra, main
# utilizado para correção (considerando um limiar de 200 para o vetor de exemplo
após a aplicação do reajuste.
addi x14, x0, 3
beq x14, x5, FIM # Verifica a quantidade de salários acima do limiar.
main:

##### START MODIFIQUE AQUI START #####
jal ra, aplica_reajuste
##### END MODIFIQUE AQUI END #####

aplica_reajuste:
##### START MODIFIQUE AQUI START #####

##### END MODIFIQUE AQUI END #####

FIM: addi x0, x0, 1