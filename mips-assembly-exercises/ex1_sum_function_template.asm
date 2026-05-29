.data
result_msg: .asciiz "Result: "

.text
.globl main
main:
    # 1. Load two arguments in $a0 and $a1
    li $a0, 15              
    li $a1, 30              

    # 2. Call sum_function
    jal sum_function        # Jump and link: saves return address in $ra

    # 3. Print the returned value
    move $t0, $v0           # Save the result in $t0 temporarily
    
    li $v0, 4               # Syscall for print_string
    la $a0, result_msg
    syscall

    move $a0, $t0           # Move result back to $a0 for printing
    li $v0, 1               # Syscall for print_int
    syscall

    # 4. Exit
    li $v0, 10              # Syscall for exit
    syscall

sum_function:
    # Return a + b in $v0
    add $v0, $a0, $a1       # $v0 = $a0 + $a1
    jr $ra                  # Return to caller
