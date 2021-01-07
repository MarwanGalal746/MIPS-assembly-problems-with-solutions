.data
arr: .space 1000
.globl main
.text
main:
	# taking the arr from the user
	li $v0, 8
	la $a0, arr
	li $a1, 1000
	syscall
	
	
	#load address of the array in $a0
	la $a0, arr
	#save value of #a0 in $v0 because we will use $a0 to get length of the string
	move $v0,$a0
	#get the length of the string
	jal length
	#storing in $a1 the length ofthe string
	move $a1,$v0
	#load address of the array in $a0
	la $a0, arr
	#reverse the string
    	jal     reverse
    	
    	
    	#print the the reversed version
 	li      $v0,4                  
	la      $a0,arr
	
	
	#terminating the program
	syscall
	li $v0, 10
    	syscall
    	
    	
    	#loop to get length of the array
	length:
	   #;oad a byte(cchar) in $t0
	   lb $t0, 0($a0)
	   #increase the pointer by 1
	   addi $a0, $a0, 1
	   #if the value of $t0 not equal to zero, then repeat
	   bnez $t0, length
	   # to get the difference between the pointer which refer to the first char and the last char
	   sub $v0, $a0, $v0
	   subiu $v0, $v0, 1
	   jr $ra
    	   
    	
    	#reverse the string
    	reverse:
    	   #move the content of the $ra to $s3 because $ra will be used in swapping
    	   move $s3,$ra
    	   #make $a0 refer to first char in string and $a1 refer to last char in the string
    	   add $a1,$a0,$a1
    	   addi $a1,$a1,-1
   	   j utilityReverse


	utilityReverse:
	   jal     swap
	   #increase the counter
	   addiu   $a0,$a0,1 
	   #decrease the counter              
	   addiu   $a1,$a1,-1
	   #if $a0 less or equa than $a1, the repeat
	   ble     $a0,$a1,utilityReverse    
	   jr      $s3
	   
	#swapping
    	swap:
    	   lb $s0, 0($a0)
    	   lb $s1, 0($a1)
    	   sb $s1, 0($a0)
    	   sb $s0, 0($a1)
    	   jr $ra
	
	    	
    	
