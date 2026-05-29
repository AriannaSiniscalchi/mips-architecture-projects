.data
    # Allocazione array per memoization
    memo:      .word 0:4000 
    res_msg:   .asciiz "Risultato Fibonacci: "
    calls_msg: .asciiz "\nNumero di chiamate: "

.text
.globl main
main:
    # 1. Inizializza il contatore delle chiamate a 0
    li $t9, 0

    # Carica n in $a0
    li $a0, 20             
    jal fib_memo

    # Salva il risultato di Fibonacci in $s1 per preservarlo dalle syscall
    move $s1, $v0           

    # --- 2. Stampa del messaggio e del risultato di Fibonacci ---
    li $v0, 4
    la $a0, res_msg
    syscall

    move $a0, $s1
    li $v0, 1
    syscall

    # --- 3. Stampa del messaggio e del contatore di chiamate ---
    li $v0, 4
    la $a0, calls_msg
    syscall

    move $a0, $t9           # Sposta il contatore $t9 in $a0 per la stampa
    li $v0, 1
    syscall

    # Exit
    li $v0, 10             
    syscall

fib_memo:
    # --- INCREMENTO CONTATORE ---
    # Ogni volta che la funzione viene invocata, incrementiamo $t9 di 1
    addi $t9, $t9, 1

    # --- 1. Casi Base ---
    li $v0, 0
    beq $a0, $zero, end_f   # F(0) = 0
    li $v0, 1
    beq $a0, 1, end_f       # F(1) = 1

    # --- 2. Controllo Memoization ---
    sll $t0, $a0, 2         # t0 = n * 4
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