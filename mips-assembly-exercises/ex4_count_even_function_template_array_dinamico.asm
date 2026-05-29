.data
prompt_size:  .asciiz "Inserisci la dimensione dell'array: "
prompt_val:   .asciiz "Inserisci un numero: "
result_msg:   .asciiz "Conteggio numeri pari: "
newline:      .asciiz "\n"

.text
.globl main
main:
    # 1. Chiedi la dimensione dell'array
    li $v0, 4
    la $a0, prompt_size
    syscall
    
    li $v0, 5           # Legge la dimensione n
    syscall
    move $s0, $v0       # Salva n in $s0

    # 2. Allocazione dinamica (sbrk)
    sll $a0, $s0, 2     # Calcola n * 4 byte
    li $v0, 9           # Syscall sbrk
    syscall
    move $s1, $v0       # $s1 = indirizzo base dell'array

    # 3. Chiamata alla funzione (che ora gestisce sia INPUT che CONTEGGIO)
    move $a0, $s1       # Passa l'indirizzo base
    move $a1, $s0       # Passa la dimensione
    jal input_and_count_even
    move $s2, $v0       # Salva il risultato del conteggio

    # 4. Stampa il risultato
    li $v0, 4
    la $a0, result_msg
    syscall
    
    li $v0, 1
    move $a0, $s2
    syscall

    # Fine programma
    li $v0, 10
    syscall

# ---------------------------------------------------------
# Funzione Unificata: Legge i valori e conta i pari in un solo ciclo
# ---------------------------------------------------------
input_and_count_even:
    li $v0, 0           # Inizializza il contatore dei pari ($v0 sarà il valore di ritorno)
    li $t0, 0           # Indice i = 0

single_loop:
    beq $t0, $a1, end_func  # Se i == dimensione, esci
    
    # Salva i registri temporanei necessari perché la syscall sovrascrive $v0 e $a0
    # In questo caso usiamo $t3 e $t4 per non perdere i riferimenti
    move $t3, $a0       # Salva l'indirizzo corrente in $t3
    
    # Chiedi l'inserimento del numero
    li $v0, 4
    la $a0, prompt_val
    syscall
    
    li $v0, 5           # Legge il numero intero
    syscall
    # Il numero letto è ora in $v0
    
    # Memorizza il valore nell'array (opzionale se serve solo il conteggio)
    sw $v0, 0($t3)
    
    # --- LOGICA CONTEGGIO PARI ---
    andi $t4, $v0, 1    # Isola l'ultimo bit (0 se pari, 1 se dispari)
    bne $t4, $zero, skip_increment
    
    # Se siamo qui, il numero è pari. Dobbiamo incrementare il nostro contatore.
    # Attenzione: $v0 viene usato per le syscall, quindi usiamo un registro 
    # temporaneo per il conteggio e lo sposteremo in $v0 alla fine, 
    # oppure gestiamo il contatore in $s o altro. 
    # Usiamo $t5 per il conteggio totale.
    addi $t5, $t5, 1    

skip_increment:
    addi $a0, $t3, 4    # Incrementa l'indirizzo per il prossimo elemento
    addi $t0, $t0, 1    # i++
    j single_loop

end_func:
    move $v0, $t5       # Sposta il conteggio finale nel registro di ritorno $v0
    jr $ra