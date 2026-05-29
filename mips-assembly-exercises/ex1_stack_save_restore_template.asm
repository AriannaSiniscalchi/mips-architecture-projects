.text
.globl main
main:
    # Call demo_function
    jal demo_function

    # Exit (Standard MARS/SPIM syscall for exit)
    li $v0, 10
    syscall

demo_function:
    # Allocate stack space (adjust size based on registers saved, e.g., 8 bytes)
    # 4 bytes for $ra, 4 bytes for $s0 (if used)
    addi $sp, $sp, -8

    # Save $ra and any saved registers ($s0-$s7)
    sw $ra, 4($sp)
    sw $s0, 0($sp)

    # --- Function body ---
    # (Your logic here)
    # ---------------------

    # Restore registers
    lw $s0, 0($sp)
    lw $ra, 4($sp)

    # Release stack space
    addi $sp, $sp, 8

    # Return
    jr $ra
