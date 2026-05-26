# ============================================================
# math_functions.asm
#
# Collection of mathematical functions
# ============================================================

.text

# ------------------------------------------------------------
# sum_function
#
# Arguments:
#   $a0 = first integer
#   $a1 = second integer
#
# Returns:
#   $v0 = sum
# ------------------------------------------------------------

sum_function:

    add $v0, $a0, $a1

    jr $ra