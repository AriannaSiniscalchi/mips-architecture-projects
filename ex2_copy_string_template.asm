.data
source_buffer: .space 100
dest_buffer:   .space 100
prompt_msg:    .asciiz "Enter a string: "
result_msg:    .asciiz "Copied string: "

.text
.globl main
main:
    # Read a string into source_buffer
    li $v0, 4
    la $a0, prompt_msg
    syscall
    
    li $v0, 8
    la $a0, source_buffer
    li $a1, 100
    syscall

    # Copy it byte by byte into dest_buffer
    la $t0, source_buffer #Puntatore alla sorgente
    la $t1, dest_buffer #Puntatore alla destinazione

copy_loop:
    lb $t2, 0($t0) # Carico un byte da source
    sb $t2, 0($t1) # Memorizza il byte in desk     
    
    beq $t2, $zero, print_result

    # Stop at the null terminator
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j copy_loop

print_result:
    # 1. Stampa il messaggio "Copied string: "
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # 2. Stampa la stringa che hai appena copiato nel buffer di destinazione
    li $v0, 4              # Syscall 4 per stampare una stringa
    la $a0, dest_buffer    # Carica l'indirizzo dell'inizio della destinazione
    syscall
    
    # 3. Fine programma
    li $v0, 10
    syscall