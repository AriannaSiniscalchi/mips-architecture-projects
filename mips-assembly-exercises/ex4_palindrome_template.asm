.data
input_buffer: .space 100
prompt_msg:   .asciiz "Enter a string: "
yes_msg:      .asciiz "Palindrome"
no_msg:       .asciiz "Not a palindrome"

.text
.globl main
main:
    # --- Leggi la stringa ---
    li $v0, 4
    la $a0, prompt_msg
    syscall

    li $v0, 8
    la $a0, input_buffer
    li $a1, 100
    syscall

    # --- 1. Calcola la lunghezza della stringa ---
    la $t0, input_buffer    # Puntatore per scorrere la stringa
find_end:
    lb $t1, 0($t0)          # Carica il carattere
    beq $t1, $zero, end_found # Fine stringa (null terminator)
    beq $t1, 10, end_found   # Gestisce il newline '\n' (ASCII 10) aggiunto da syscall 8
    addi $t0, $t0, 1        # Avanza il puntatore
    j find_end

end_found:
    # Al termine, $t0 punta alla fine. 
    # Portiamo $t0 indietro di 1 per puntare all'ultimo carattere valido.
    addi $t0, $t0, -1       # Puntatore DESTRO (fine)
    la $t1, input_buffer    # Puntatore SINISTRO (inizio)

    # --- 2. Confronto Palindromo ---
check_loop:
    bge $t1, $t0, is_palindrome # Se i puntatori si incrociano, è un palindromo
    
    lb $t2, 0($t1)          # Carattere da sinistra
    lb $t3, 0($t0)          # Carattere da destra
    
    bne $t2, $t3, not_palindrome # Se sono diversi, non è palindromo
    
    addi $t1, $t1, 1        # Sposta puntatore sinistro a destra
    addi $t0, $t0, -1       # Sposta puntatore destro a sinistra
    j check_loop

# --- 3. Stampa il risultato ---
is_palindrome:
    li $v0, 4
    la $a0, yes_msg
    syscall
    j exit

not_palindrome:
    li $v0, 4
    la $a0, no_msg
    syscall

exit:
    li $v0, 10
    syscall