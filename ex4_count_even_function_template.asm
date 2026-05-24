.data
array_data: .word 1, 2, 3, 4, 5, 6
size:       .word 6
result_msg: .asciiz "Even count: "

.text
.globl main
main:
    # 1. Load arguments for the function
    la $a0, array_data      # $a0 = base address of array
    lw $a1, size            # $a1 = size of array (6)

    # 2. Call the function
    jal count_even_function
    move $t0, $v0           # Save the result in $t0

    # 3. Print the result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # 4. Print the count returned in $v0
    li $v0, 1
    move $a0, $t0
    syscall

    # 5. Exit
    li $v0, 10
    syscall
    
count_even_function:
    li $v0, 0               # Initialize count = 0
    li $t0, 0               # Initialize index i = 0

loop:
    beq $t0, $a1, done      # If i == size, exit loop
    
    lw $t1, 0($a0)          # Load array[i] into $t1
    
    # Check if even: (value AND 1) == 0
    andi $t2, $t1, 1        # $t2 = $t1 & 1
    bne $t2, $zero, next    # If result is 1, it's odd; skip increment
    
    addi $v0, $v0, 1        # Increment count

next:
    addi $a0, $a0, 4        # Move to the next word (address + 4)
    addi $t0, $t0, 1        # i++
    j loop

done:
    jr $ra                  # Return to caller
