.data
    int1: .asciiz "What is your first number: "
    int2: .asciiz "What is your second number: "
    idkwhattonamethisint: .asciiz " & "
    line: .asciiz "\n"
    menu: .asciiz "Select an operation:\n1) Addition\n2) Subtraction\n3) Multiplication\n4) Division\n"
    sum_msg: .asciiz "sum: "
    sub_msg:      .asciiz "difference: "
    mul_msg:      .asciiz "product: "
    div_msg:      .asciiz "quotient: "
    same_msg: .asciiz " User inputs are the same"
    notsame_msg: .asciiz " User inputs are different"
    
.text
main:
    # print int 1
    li $v0, 4
    la $a0, int1
    syscall
    # gets first int & puts into $s0
    li $v0, 5
    syscall
    move $s0, $v0
    
    
    # print int 2
    li $v0, 4
    la $a0, int2
    syscall
    # get second int & puts into $s1 
    li $v0, 5
    syscall
    move $s1, $v0
    
    
    # print result from int 1
    li $v0, 1
    move $a0, $s0
    syscall 
    # outputs first int
    li $v0, 4
    la $a0, idkwhattonamethisint
    syscall
    
     # print result from int 2
    li $v0, 1
    move $a0, $s1
    syscall 
    # outputs second int
    li $v0, 4
    la $a0, line
    syscall
    
    
    # prints the menu
    li $v0, 4
    la $a0, menu
    syscall
    # operation user wants to use
    li $v0, 5
    syscall
    move $t4, $v0
    
    
    # user inputs 1 for addition
    li $t5, 1
    beq $t4, $t5, addition
        # user inputs 2 for subtraction
    li $t5, 2
    beq $t4, $t5, subtraction
        # user inputs 3 for multiplication
    li $t5, 3
    beq $t4, $t5, multiplication
        # user inputs 4 for division
    li $t5, 4
    beq $t4, $t5, division
    
    
    
addition:
    add $t0, $s0, $s1
    li $v0, 4
    la $a0, sum_msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    j equal_or_not
    
subtraction:
    sub $t1, $s0, $s1
    li $v0, 4
    la $a0, sub_msg
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    j equal_or_not
    
multiplication:
    mul $t2, $s0, $s1
    li $v0, 4
    la  $a0, mul_msg
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    j equal_or_not
    
division:
    div $s0, $s1
    mflo $t3
    li $v0, 4
    la $a0, div_msg
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    j equal_or_not
    
    
    # check if inputs are equal or not
equal_or_not:
    beq $s0, $s1, same
    li $v0, 4
    la $a0, notsame_msg
    syscall
    j end
    
same:
    li $v0, 4
    la $a0, same_msg
    syscall
    
end:
    li $v0, 10
    syscall


