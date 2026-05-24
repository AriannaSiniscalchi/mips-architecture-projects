.text
.globl main
main:
    # Load n into $a0 (finding the 6th Fibonacci number)
    li $a0, 6

    # Call fibonacci_iterative
    jal fibonacci_iterative

    # Print the returned value
    move $a0, $v0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

fibonacci_iterative:
    # --- Base Cases ---
    beq $a0, $zero, return_zero
    li $t0, 1
    beq $a0, $t0, return_one

    # --- Initialization ---
    li $t0, 0      # Fib(i-2)
    li $t1, 1      # Fib(i-1)
    li $t3, 2      # Loop counter 'i'

fib_loop:
    bgt $t3, $a0, fib_done

    add $t2, $t1, $t0    # Fib(i) = Fib(i-1) + Fib(i-2)

    # Slide values forward
    move $t0, $t1        # New Fib(i-2) is old Fib(i-1)
    move $t1, $t2        # New Fib(i-1) is old Fib(i)

    addi $t3, $t3, 1     # i++
    j fib_loop

fib_done:
    move $v0, $t2        # Put final result in return register
    jr $ra

return_zero:
    li $v0, 0
    jr $ra

return_one:
    li $v0, 1
    jr $ra