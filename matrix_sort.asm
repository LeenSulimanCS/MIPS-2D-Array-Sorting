#The base address of array is 0x10000000
#$s0 = array base address, $s1 = i, $s2 = j
.data
str1 : .asciiz "Sorted Array"
str2 : .asciiz "Un sorted Array"
newline : .asciiz "\n"
space : .asciiz "  "
.text
main:
	li $s0, 0x10000000		

	addi $s1, $0, 0	#i = 0
	addi $t1, $0, 8	#$t1 = 8

for1:
slt $t0, $s1, $t1	#i < 8   
beq $t0, $0, done1	#if not then exit

	addi $s2, $0, 0	#j = 0
for2:
slt $t0, $s2, $t1	#j < 8   
beq $t0, $0, done2	#if not then exit

sll $t0, $s1, 3	#$t0 = i * 8
add $t0, $t0, $s2	#$t0 = i * 8 + j
sll $t0, $t0, 2	#$t0 = (i * 8 + j) * 4
sll $t2, $s2, 3	#$t2 = j * 8
add $t2, $t2, $s1	#$t2 = j * 8 + i
add $t0, $t0, $s0	#address of array[i][j]
sw  $t2, 0($t0)	#array[i][j] = $t2

addi $s2, $s2, 1	#j = j + 1
  	j for2			#repeat
done2:	
addi $s1, $s1, 1	#i = i + 1
  	j for1			#repeat
done1:	
	addi $s1, $0, 0	#i = 0
	addi $t3, $0, 63	#$t3 = 63

la  $a0, str2		#$a0 = str2
li $v0, 4
syscall			#Print "Un sorted array"
la  $a0, newline	#$a0 = new line
li $v0, 4
syscall			#Print new line

	jal printArray

for3:
slt $t0, $s1, $t3	#i < 63   
beq $t0, $0, done3	#if not then exit

	addi $s2, $0, 0	#j = 0
for4:
slt $t0, $s2, $t3	#j < 63   
beq $t0, $0, done4	#if not then exit

sll $t0, $s2, 2	#$t0 = j * 4 
add $t0, $t0, $s0	#address of array[j]
lw $t4, 0($t0)	#$t4 = array[j]
lw $t5, 4($t0)	#$t5 = array[j+1]

slt $t6, $t5, $t4	# array[j+1] < array[j]   
beq $t6, $0, if	#if not then exit

# swap array[j], array[j+1]
	sw $t5, 0($t0)	#array[j] = $t5
	sw $t4, 4($t0)	#array[j+1] = $t4
if:
addi $s2, $s2, 1	#j = j + 1
  	j for4			#repeat
done4:	
addi $s1, $s1, 1	#i = i + 1
  	j for3			#repeat
done3:	
la  $a0, str1		#$a0 = str1
li $v0, 4
syscall			#Print "Un sorted array"
la  $a0, newline	#$a0 = new line
li $v0, 4
syscall			#Print new line
	
	jal printArray
li $v0, 10			#exit
syscall	


printArray:
	
	addi $s1, $0, 0	#i = 0
	addi $t1, $0, 8	#$t1 = 8

for5:
slt $t0, $s1, $t1	#i < 8   
beq $t0, $0, done5	#if not then exit

	addi $s2, $0, 0	#j = 0
for6:
slt $t0, $s2, $t1	#j < 8   
beq $t0, $0, done6	#if not then exit

sll $t0, $s1, 3	#$t0 = i * 8
add $t0, $t0, $s2	#$t0 = i * 8 + j
sll $t0, $t0, 2	#$t0 = (i * 8 + j) * 4
sll $t2, $s2, 3	#$t2 = j * 8
add $t2, $t2, $s1	#$t2 = j * 8 + i
add $t0, $t0, $s0	#address of array[i][j]
lw  $a0, 0($t0)	#$a0 = array[i][j]

li $v0, 1
syscall			#Print the array[i][j]

la  $a0, space		#$a0 = space
li $v0, 4
syscall			#Print new line



addi $s2, $s2, 1	#j = j + 1
  	j for6			#repeat
done6:	

la  $a0, newline	#$a0 = new line
li $v0, 4
syscall			#Print new line


addi $s1, $s1, 1	#i = i + 1
  	j for5			#repeat
done5:
la  $a0, newline	#$a0 = new line
li $v0, 4
syscall			#Print new line

	
	jr $ra

