# =================================================================
# DEFINIZIONE DELLE MACRO
# =================================================================

# Macro per stampare una stringa
.macro print_str (%label)
    li $v0, 4
    la $a0, %label
    syscall
.end_macro

# Macro per leggere un intero (il risultato va in $v0)
.macro read_int
    li $v0, 5
    syscall
.end_macro

# Macro per stampare un intero contenuto in un registro
.macro print_int (%reg)
    move $a0, %reg
    li $v0, 1
    syscall
.end_macro

# =================================================================
# STRUTTURA DATI
# =================================================================
.data
array_data:  .space 40
array_size:  .word 0
menu_msg:    .asciiz "\n1 Insert\n2 Print\n3 Sum\n4 Exit\nChoice: "
size_prompt: .asciiz "How many integers? "
item_prompt: .asciiz "Enter an integer: "
sum_msg:     .asciiz "Sum: "
space_msg:   .asciiz " "

# =================================================================
# CODICE PRINCIPALE
# =================================================================
.text
.globl main
main:

main_loop:
    # Mostra il menu e leggi la scelta usando le macro
    print_str(menu_msg)
    read_int
    move $t0, $v0           # $t0 = scelta dell'utente

    # Esecuzione dell'azione selezionata
    li $t1, 1
    beq $t0, $t1, do_insert
    li $t1, 2
    beq $t0, $t1, do_print
    li $t1, 3
    beq $t0, $t1, do_sum
    li $t1, 4
    beq $t0, $t1, do_exit
    j main_loop

# ----------------------------------------
# ROUTINE DI INSERIMENTO
# ----------------------------------------
do_insert:
    print_str(size_prompt)
    read_int
    move $t0, $v0           # $t0 = numero di elementi
    sw $t0, array_size      

    li $t1, 0               # i = 0
    la $t2, array_data      # Puntatore all'array

insert_loop:
    beq $t1, $t0, main_loop 

    print_str(item_prompt)
    read_int                # L'intero letto è in $v0
    sw $v0, 0($t2)          # array[i] = $v0
    
    addi $t2, $t2, 4        
    addi $t1, $t1, 1        
    j insert_loop

# ----------------------------------------
# ROUTINE DI STAMPA
# ----------------------------------------
do_print:
    lw $t0, array_size      
    li $t1, 0               
    la $t2, array_data      

print_loop:
    beq $t1, $t0, main_loop 

    lw $t3, 0($t2)          # Carica l'elemento in $t3
    print_int($t3)          # Stampa l'elemento usando la macro
    print_str(space_msg)    # Stampa lo spazio

    addi $t2, $t2, 4        
    addi $t1, $t1, 1        
    j print_loop

# ----------------------------------------
# ROUTINE DI SOMMA
# ----------------------------------------
do_sum:
    lw $t0, array_size      
    li $t1, 0               
    la $t2, array_data      
    li $t3, 0               # Somma = 0

sum_loop:
    beq $t1, $t0, print_sum 

    lw $t4, 0($t2)          
    add $t3, $t3, $t4       

    addi $t2, $t2, 4        
    addi $t1, $t1, 1        
    j sum_loop

print_sum:
    print_str(sum_msg)      
    print_int($t3)          # Stampa il totale accumulato
    j main_loop             

# ----------------------------------------
# USCITA
# ----------------------------------------
do_exit:
    li $v0, 10              # Exit syscall
    syscall