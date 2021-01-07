.data 
	x: .word 3
	y: .word 8
.text
.global main
main:
	addi $t5, $zero, 1
	lw $t1, x
	addi $s0, $t1, 0
	jal fact
	addi $t1, $s2, 0
	lw $t2, y
	add $s0, $t2, $zero
	jal fact
	addi $t2, $s2, 0
	add $t3, $t1, $t2
	li $v0, 1
	addi $a0, $t3, 0
	syscall
	
	li $v0, 10
    	syscall
	
	fact:
	   add $s1, $s0, $zero
	   addi $s2, $s0, 0
	   subi $s1, $s1, 1
	   bgt $s1, $t5, fact2
	   jr $ra
	
	fact2:
	   mul $s2, $s2, $s1
	   subi $s1, $s1, 1
	   bgt $s1, $t5, fact2
	   jr $ra
	   
.end main


	
	