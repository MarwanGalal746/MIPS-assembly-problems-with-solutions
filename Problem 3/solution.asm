.data 
	i: .word 0
	J: .word 0
	a: .word 5
	arr: .word 5, 5, 5, 5, 5
	n: .ascii "\n\0"
.text
.global main
main:
	lw $s0, a
	lw $s1, i
	lw $s2, J
	la $a1, arr
	addi $s3, $s3, 0
	
	
	outter:
	   bge $s1, $s0, exit
	   addi $s2, $s1, 0
	   j inner
	   
	   
	inner:
	   bltz $s2, inc	#beqz
	   lw $t0, 0($a1)
	   mul $t0, $t0, $s2
	   sw $t0, 0($a1)
	   subi $s2, $s2, 1
	   j inner
	   
	   
	inc:
	   lw $t0, 0($a1)
	   li $v0, 1
	   addi $a0, $t0, 0
	   syscall
	   li $v0,4                  
	   la $a0,n
	   syscall
	   addi $a1, $a1, 4
	   addi $s1, $s1, 1
	   j outter
	   
	   	
	
	exit:
	   li $v0, 10
	   syscall