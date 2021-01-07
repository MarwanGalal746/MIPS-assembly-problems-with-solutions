.data 
	g: .word 5
	f: .word 6
.text
.global main
main:
	lw $s1, g
	lw $s2, f
	bge $s1, $s2, l
	subi $s1, $s1, 1
	j finish
	l: addi $s1,$s1,1 
	finish:
	sw $s1, g
.end main


	
	