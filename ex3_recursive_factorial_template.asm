.data
result_msg: .asciiz "Fattoriale: "

.text
.globl main
main:
    # Load n into $a0 (e.g., let's find the factorial of 5)
    li $a0, 5

    # Call factorial_recursive
    jal factorial_recursive
    
    # Save the returned result ($v0) into a temporary register ($t0) 
    # so we can print the message first
    move $t0, $v0

    # Print the result message string
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print the returned factorial value
    li $v0, 1
    move $a0, $t0
    syscall

    # Exit
    li $v0, 10
    syscall


factorial_recursive:
    # 1. Base case check
    # If $a0 < 1, branch to base_case (0! and 1! are both 1)
    li $t0, 1
    ble $a0, $t0, base_case

    # 2. Save context on the stack (if we need to recurse)
    addi $sp, $sp, -8
    sw $ra, 4($sp)      # Save the return address
    sw $a0, 0($sp)      # Save current 'n'

    # 3. Recursive call
    addi $a0, $a0, -1   # Compute n - 1
    jal factorial_recursive  # Call factorial_recursive(n - 1)

    # 4. Combine the result
    # After returning from the call, $v0 contains factorial(n - 1)
    lw $a0, 0($sp)      # Restore original 'n' from stack
    lw $ra, 4($sp)      # Restore return address
    addi $sp, $sp, 8    # Pop 8 bytes off the stack

    mul $v0, $a0, $v0   # $v0 = n * factorial(n - 1)
    jr $ra              # Return to caller

base_case:
    # If n <= 1, return 1
    li $v0, 1
    jr $ra              # Return without touching the stack