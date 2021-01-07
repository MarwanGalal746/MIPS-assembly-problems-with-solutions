.data
no: .ascii "no\0"
arr: .space 1000
yes: .ascii "yes\0"
.globl main
.text
main:
	# taking the arr from the user
	li $v0, 8
	la $a0, arr
	li $a1, 1000
	syscall
	la $a0, arr
	add $a1,$a0,$zero
    	j length

   	#loop to get length of the array
	length:
	   #load a byte(cchar) in $t0
	   lb $t0, ($a1)
	   #increase the pointer by 1
	   addi $a1, $a1, 1
	   #if the value of $t0 not equal to zero, then repeat
	   bnez $t0, length
	   # to get the difference between the pointer which refer to the first char and the last char
	   subiu $a1, $a1, 3
	   j palindrome
	   
	   
    	palindrome:
    	   bge $a0, $a1, y
    	   lb $t0, ($a0)
    	   lb $t1, ($a1)
    	   bne $t0, $t1, n
    	   sub $a1, $a1, 1
    	   addi $a0, $a0, 1
    	   b palindrome
    	   li $v0, 10
	   syscall
    	   
    	   
    	n:
    	   li $v0,4                  
	   la $a0,no
	   syscall
	   li $v0, 10
	   syscall
	   
	   	   	   
    	y:
    	   li $v0,4                  
	   la $a0,yes
	   syscall
	   li $v0, 10
	   syscall
	 
	   
    	

	   
	 
    		

	   
  
