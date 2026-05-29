.data
array_data: .word 7, 3, 12, 4, 9
array_size: .word 5
result_msg: .asciiz "Maximum: "

.text
.globl main
main:
    # 1. Caricamento indirizzo base e dimensione
    la $t0, array_data      # $t0 = indirizzo base dell'array
    lw $t1, array_size      # $t1 = numero di elementi (5)
    
    # 2. Inizializza il massimo con il primo elemento
    lw $t2, 0($t0)          # $t2 = valore massimo corrente (inizialmente array[0])
    
    # 3. Preparazione per il ciclo
    li $t3, 1               # $t3 = indice i = 1 (partiamo dal secondo elemento)
    addi $t0, $t0, 4        # Spostiamo il puntatore al secondo elemento (4 byte dopo)

loop:
    # Se i == array_size, esci dal ciclo
    beq $t3, $t1, print_result
    
    # Carica l'elemento corrente
    lw $t4, 0($t0)          # $t4 = array[i]
    
    # Confronta: se array[i] <= max, salta l'aggiornamento
    ble $t4, $t2, next_element
    
    # Se array[i] > max, aggiorna il massimo
    move $t2, $t4

next_element:
    addi $t3, $t3, 1        # Incrementa indice i++
    addi $t0, $t0, 4        # Sposta il puntatore all'elemento successivo (prossima word)
    j loop

print_result:
    # Stampa "Maximum: "
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # Stampa il valore contenuto in $t2
    move $a0, $t2
    li $v0, 1
    syscall
    
    # Fine programma
    li $v0, 10
    syscall