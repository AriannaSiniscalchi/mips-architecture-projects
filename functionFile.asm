.text

.globl printAsciiz

    # $t5 = address of ASCIIz string,
printAsciiz:

    # output the message from t5
    li      $v0, 4
    move    $a0, $a1
    syscall

    # return from function
    jr      $ra
