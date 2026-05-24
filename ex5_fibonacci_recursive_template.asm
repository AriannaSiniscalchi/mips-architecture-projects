.text
.globl main
main:
    # Load n into $a0 (e.g., find the 6th Fibonacci number)
    li $a0, 6

    # Call fibonacci_recursive
    jal fibonacci_recursive

    # Print the returned value ($v0 contains the result)
    move $a0, $v0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

fibonacci_recursive:
    # --- 1. Base Cases ---
    # If n == 0, return 0
    beq $a0, $zero, base_zero
    # If n == 1, return 1
    li $t0, 1
    beq $a0, $t0, base_one

    # --- 2. Allocate Stack Context ---
    # We need 12 bytes to store:
    # 8($sp) -> Return address ($ra)
    # 4($sp) -> Current value of n ($a0)
    # 0($sp) -> To temporarily store the result of Fib(n-1)
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $a0, 4($sp)

    # --- 3. First Recursive Call: Fib(n - 1) ---
    addi $a0, $a0, -1      # $a0 = n - 1
    jal  fibonacci_recursive
    sw   $v0, 0($sp)       # Save result of Fib(n-1) to the stack

    # --- 4. Second Recursive Call: Fib(n - 2) ---
    lw   $a0, 4($sp)       # Restore original n
    addi $a0, $a0, -2      # $a0 = n - 2
    jal  fibonacci_recursive
                           # $v0 now contains the result of Fib(n-2)

    # --- 5. Combine Results and Clean Up ---
    lw   $t0, 0($sp)       # Retrieve Fib(n-1) from the stack
    add  $v0, $v0, $t0     # $v0 = Fib(n-2) + Fib(n-1)

    lw   $ra, 8($sp)       # Restore the return address
    addi $sp, $sp, 12      # Deallocate stack space
    jr   $ra               # Return to caller

base_zero:
    li $v0, 0
    jr $ra

base_one:
    li $v0, 1
    jr $ra