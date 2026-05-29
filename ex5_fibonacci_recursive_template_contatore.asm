.data
    res_msg:   .asciiz "Risultato Fibonacci: "
    calls_msg: .asciiz "\nNumero di chiamate: "

.text
.globl main
main:
    # 1. Inizializza il contatore delle chiamate a 0
    li $t9, 0

    # Carica n in $a0 
    li $a0, 20

    # Chiama fibonacci_recursive
    jal fibonacci_recursive

    # Salva il risultato di Fibonacci in $s0 per non perderlo durante le syscall
    move $s0, $v0

    # --- 2. Stampa del messaggio e del risultato di Fibonacci ---
    li $v0, 4
    la $a0, res_msg
    syscall

    move $a0, $s0
    li $v0, 1
    syscall

    # --- 3. Stampa del messaggio e del contatore di chiamate ---
    li $v0, 4
    la $a0, calls_msg
    syscall

    move $a0, $t9       # Sposta il contatore $t9 in $a0 per la stampa
    li $v0, 1           # Syscall 1: stampa intero
    syscall

    # Exit
    li $v0, 10
    syscall


fibonacci_recursive:
    # --- INCREMENTO CONTATORE ---
    # Ogni volta che la funzione viene invocata, incrementiamo $t9 di 1
    addi $t9, $t9, 1

    # --- 1. Base Cases ---
    # If n == 0, return 0
    beq $a0, $zero, base_zero
    # If n == 1, return 1
    li $t0, 1
    beq $a0, $t0, base_one

    # --- 2. Allocate Stack Context ---
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $a0, 4($sp)

    # --- 3. First Recursive Call: Fib(n - 1) ---
    addi $a0, $a0, -1      
    jal  fibonacci_recursive
    sw   $v0, 0($sp)       

    # --- 4. Second Recursive Call: Fib(n - 2) ---
    lw   $a0, 4($sp)       
    addi $a0, $a0, -2      
    jal  fibonacci_recursive

    # --- 5. Combine Results and Clean Up ---
    lw   $t0, 0($sp)       
    add  $v0, $v0, $t0     

    lw   $ra, 8($sp)       
    addi $sp, $sp, 12      
    jr   $ra               

base_zero:
    li $v0, 0
    jr $ra

base_one:
    li $v0, 1
    jr $ra