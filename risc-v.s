.data
array:	.word 5,4,3,2,1,10,9,8,7,6	# Array
array_lenght:	.word 10		# Number of elements
.text
_start:
andi t0, t0, 0 	# Holds index i
andi t1, t1, 0 	# Holds sum
andi t6, t6, 0 	# Holds max value 

la a0, array
la a1, array_lenght
lw t5, 0(a1) 		# Load number of elements

loop:
beq t0, t5, end
slli t2, t0, 2    	# Multiply i by 4 (1 << 2 = 4)
add t3, a0, t2   	# Update memory address
lw s0, 0(t3) 		# Load s0 with next element
add t1, t1, s0		# sum

bge t6, s0, nextel
addi t6, s0, 0
addi t4, t3, 0		# Address of max element

nextel:
addi t0, t0, 1		# i=i+1
j loop
end:
sw t1, 0(t4)
ret
