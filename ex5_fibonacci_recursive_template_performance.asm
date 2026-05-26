.data
# Creiamo un array di 100 parole (tutte a 0) per salvare i risultati
# Il valore 0 indica che il numero non è ancora stato calcolato.
memo: .word 0:100 

.text
.globl main
main:
    li $a0, 14              # Vogliamo F(14)
    jal fib_memo

    move $a0, $v0           # Stampa risultato
    li $v0, 1
    syscall
    li $v0, 10              # Exit
    syscall

fib_memo:
    # --- 1. Casi Base ---
    li $v0, 0
    beq $a0, $zero, end_f   # F(0) = 0
    li $v0, 1
    beq $a0, 1, end_f       # F(1) = 1

    # --- 2. Controllo Memoization ---
    # Controlliamo se memo[n] è già stato calcolato
    sll $t0, $a0, 2         # t0 = n * 4 (offset per array di word)
    la  $t1, memo           # Indirizzo base di memo
    add $t1, $t1, $t0       # t1 = indirizzo di memo[n]
    lw  $v0, 0($t1)         # Carica il valore di memo[n]
    
    bne $v0, $zero, end_f   # SE memo[n] != 0, abbiamo già il risultato! Ritorna.

    # --- 3. Calcolo Ricorsivo (se non presente in memo) ---
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $a0, 4($sp)
    sw   $t1, 0($sp)        # Salviamo l'indirizzo memo[n] per dopo

    # Calcola Fib(n-1)
    addi $a0, $a0, -1
    jal  fib_memo
    move $s0, $v0           # s0 = Fib(n-1)

    # Calcola Fib(n-2)
    lw   $a0, 4($sp)
    addi $a0, $a0, -2
    jal  fib_memo
    
    add  $v0, $v0, $s0      # $v0 = Fib(n-2) + Fib(n-1)

    # --- 4. Salva in Memo prima di uscire ---
    lw   $t1, 0($sp)        # Recupera l'indirizzo di memo[n]
    sw   $v0, 0($t1)        # Salva il risultato appena calcolato

    lw   $ra, 8($sp)
    addi $sp, $sp, 12

end_f:
    jr $ra