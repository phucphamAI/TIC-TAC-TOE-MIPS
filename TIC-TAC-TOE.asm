.data
strName1:		.space 		20
strName2:		.space 		20
line4:			.asciiz 	"\n\n\t\t\t         Player 1's Nickname (X): "
line5:			.asciiz 	"\n\n\t\t\t         Player 2's Nickname (O): "
message_start:               .asciiz     "THE ONE WHO PLAYS FIRST WILL BE ALTERNATIVE EACH GAME.\nIN THE FIRST GAME, PLAYER 1 WILL GO FISRT. \n"
name2:			.asciiz		"\n\t\t\t          WELCOME TO TIC TAC TOE GAME"
line2:			.asciiz		"\n\t\t\t   **************************************"
line3:			.asciiz 		"\n"
message0: .asciiz"\n"
message1: .asciiz"  "
message2: .asciiz"Player 1 (X) - Player 2 (O)\n\n"
message3: .asciiz"Player "
message3_b: .asciiz " in turn: "
message4: .asciiz"Please enter a number : "
message5: .asciiz" WINS ==========================="
message6: .asciiz"\t\t\t===========GAME DRAW==========\n\n "
message8: .asciiz"\t\t\t=========================== PLAYER "
message9: .asciiz"\n\n"
message10: .asciiz ""
message11: .asciiz "The number of games: "
message12: .asciiz "Score: Player 1(X) - Player 2(O)\n"
message13: .asciiz "                 "
message14: .asciiz" - " 
message15: .asciiz "____________________________________________________"
gameMenu: .asciiz "\n\nChoose an option:\n[1] New Game\t[99] Quit\nOption: "
draw_all: .asciiz  "===================== FINAL RESULT IS DRAW ====================="
win_all_2: .asciiz "\t\t THE FINAL WINNER IS PLAYER 2: "
win_all_1: .asciiz "\t\t THE FINAL WINNER IS PLAYER 1: "
array: .word '1', '2', '3', '4', '5', '6', '7', '8', '9'
array2:.word '1', '2', '3', '4', '5', '6', '7', '8', '9'
array1:.word 'X', 'O'
score: .word 0,0
totalgame: .word -1
player: .word 1
turn: .word 0
L: .asciiz "         ||  "
M: .asciiz "  |  "
R: .asciiz "  |"
space: .asciiz"      "
Box1: .asciiz "          ._________________.\n         /|     |     |     |\n"
Box2: .asciiz        "\n         ||_____|_____|_____| \n         ||     |     |     |\n"
Box3: .asciiz        "\n         ||.____|_____|_____|.\n         |/_________________/\n\n"
X_top: .asciiz    "          ~~~~~~~~~~~~~~~~~~\n"
X_draw: .asciiz "         /|       X        |\n"
X_bot1:.asciiz    "           ~~~~~~~~~~~~~~~~~\n"
X_bot: .asciiz    "          /                /\n"
O_draw: .asciiz "         /|        O        |\n"
.text
jal   getName
main:
la $t0,score
addi $t1,$zero,0
addi $t2,$zero,0
sw $t1,0($t0)
sw $t2,4($t0)
reset:
la $t0,array2  #reset ban co 
la $t1,array
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
lw $t3,0($t0)
sw $t3,0($t1)

li 		$v0, 4
		la 		$a0, line2
		syscall
		
		li 		$v0, 4
		la		$a0, name2
		syscall
		
		li 		$v0, 4
		la 		$a0, line2
		syscall
		
		li 		$v0, 4
		la 		$a0, line3
		syscall
syscall
la $t0 , totalgame
lw $t1,0($t0)
addi $t1,$t1,1
sw $t1,0($t0)
li $v0,4
la $a0, message11
syscall
move $a0,$t1
li $v0,1
syscall
li $v0,4
la $a0,message0
syscall
li $v0,4
la $a0,message12
syscall
li $v0,4
la $a0,message13
syscall
la $t0, score
lw $t1,0($t0)
addi $a0,$t1,0
li $v0,1
syscall
li $v0,4
la $a0,message14
syscall
lw $t1,4($t0)
addi $a0,$t1,0
li $v0,1
syscall 

#Prepare
la $t0 , player
lw $t1,0($t0)
addi $t2,$t1,1
sw $t2,0($t0)
la $t0,array
li $t2,0 
li $t3,0 
li $t4,0
la $t5,array1
li $t6,0 
li $t7,0
li $t8,0
li $t9,0
Player:

li $v0 , 4
la $a0 , message9
syscall

jal board  

li $v0 , 4
la $a0 , message2
syscall

jal mode 

li $v0 , 4
la $a0 , message3
syscall
li $v0 , 1
move $a0 , $v1
syscall
li $v0,4
la $a0,message3_b
syscall
li $v0,1
beq $v1,$v0,nguoi_choi_1
li $v0,4
la $a0,strName2
syscall
j nguoi_choi_2
nguoi_choi_1:
li $v0,4
la $a0,strName1
syscall
nguoi_choi_2:
li $v0 , 4
la $a0 , message4
syscall

li $v0,5
syscall
move $t7,$v0
li $v0,4
la $a0, message15
syscall
jal change 

move $t6,$v1

bne $t7,1,assign2
lw $t4,0($t0)
bne $t4, '1',assign2
sw $t6,0($t0)
b again

assign2:
bne $t7,2,assign3
lw $t4,4($t0)
bne $t4, '2',assign3
sw $t6,4($t0)
b again

assign3:
bne $t7,3,assign4
lw $t4,8($t0)
bne $t4, '3',assign4
sw $t6,8($t0)
b again

assign4:
bne $t7,4,assign5
lw $t4,12($t0)
bne $t4, '4',assign5
sw $t6,12($t0)
b again

assign5:
bne $t7,5,assign6
lw $t4,16($t0)
bne $t4, '5',assign6
sw $t6,16($t0)
b again

assign6:
bne $t7,6,assign7
lw $t4,20($t0)
bne $t4, '6',assign7
sw $t6,20($t0)
b again

assign7:
bne $t7,7,assign8
lw $t4,24($t0)
bne $t4, '7',assign8
sw $t6,24($t0)
b again

assign8:
bne $t7,8,assign9
lw $t4,28($t0)
bne $t4, '8',assign9
sw $t6,28($t0)
b again

assign9:
bgt $t7,9,same
blt $t7,1,same
beq $t7,9,here
b same

here:
lw $t4,32($t0)
bne $t4, '9',same
sw $t6,32($t0)

b again

same: 
sub $t1 $t1,1

again:

jal check

move $t2,$v1

add $t1,$t1,1

beq $t2,2,Player

li $v0 , 4
la $a0 , message9
syscall

jal board	

jal player_win 

Exit: 
li $v0, 10
syscall

board: 
           li $v0,4
           la $a0,X_top
           syscall
              li $v0,4
           la $a0,X_draw
           syscall
           li $v0,4
           la $a0,X_bot1
           syscall
            li $v0,4
           la $a0,X_bot
           syscall
        
           
            la $t4,array
	
	li $v0, 4 
	la $a0, Box1
	syscall
	
	li $v0, 4
	la $a0, L
	syscall
	lb $a0, ($t4)            
	li $v0, 11                 
	syscall
	
	li $v0, 4
	la $a0, M
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)             
	li $v0, 11                 
	syscall
	
	li $v0, 4
	la $a0, M
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)              
	li $v0, 11                 
	syscall

	li $v0, 4
	la $a0, R
	syscall
	
	li $v0, 4
	la $a0, Box2
	syscall
	
	li $v0, 4
	la $a0, L
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)             
	li $v0, 11                
	syscall
	
	li $v0, 4
	la $a0, M
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)             
	li $v0, 11                  
	syscall
	
	li $v0, 4
	la $a0, M
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)              
	li $v0, 11                   
	syscall

	li $v0, 4
	la $a0, R
	syscall
	
	li $v0, 4 
	la $a0, Box2
	syscall
	
	li $v0, 4
	la $a0, L
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)             
	li $v0, 11                
	syscall
	
	li $v0, 4
	la $a0, M
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)              
	li $v0, 11                 
	syscall
	
	li $v0, 4
	la $a0, M
	syscall
	add $t4,$t4,4
	lb $a0, ($t4)             
	li $v0, 11              
	syscall

	li $v0, 4
	la $a0, R
	syscall
	#______
	li $v0, 4
	la $a0, Box3
	syscall
	 li $v0,4
           la $a0,X_top
           syscall
              li $v0,4
           la $a0,O_draw
           syscall
           li $v0,4
           la $a0,X_bot1
           syscall
            li $v0,4
           la $a0,X_bot
           syscall
	jr $ra
	
jr $ra 

mode:

	div $t1, $t1, 2
	mfhi $t1
	
	beq $t1,1,player1 
	li $t1,2
	move $v1,$t1
	
	jr $ra 
	
player1:

li $t1,1
move $v1,$t1

jr $ra 

change: 

beq $t1,1,Label
lw $t6,4($t5)
move $v1,$t6

jr $ra 

Label:
lw $t6,($t5)
move $v1,$t6

jr $ra 

check: 

winning_condition1:
lw $t7,0($t0)
lw $t8,4($t0)
bne $t7,$t8,winning_condition2
lw $t9,8($t0)
bne $t8,$t9,winning_condition2
li $t2,1
move $v1,$t2

jr $ra 

winning_condition2:
lw $t7,12($t0)
lw $t8,16($t0)
bne $t7,$t8,winning_condition3
lw $t9,20($t0)
bne $t8,$t9,winning_condition3
li $t2,1
move $v1,$t2

jr $ra

winning_condition3:
lw $t7,24($t0)
lw $t8,28($t0)
bne $t7,$t8,winning_condition4
lw $t9,32($t0)
bne $t8,$t9,winning_condition4
li $t2,1
move $v1,$t2

jr $ra 

winning_condition4:
lw $t7,0($t0)
lw $t8,12($t0)
bne $t7,$t8,winning_condition5
lw $t9,24($t0)
bne $t8,$t9,winning_condition5
li $t2,1
move $v1,$t2

jr $ra

winning_condition5:
lw $t7,4($t0)
lw $t8,16($t0)
bne $t7,$t8,winning_condition6
lw $t9,28($t0)
bne $t8,$t9,winning_condition6
li $t2,1
move $v1,$t2

jr $ra 

winning_condition6:
lw $t7,8($t0)
lw $t8,20($t0)
bne $t7,$t8,winning_condition7
lw $t9,32($t0)
bne $t8,$t9,winning_condition7
li $t2,1
move $v1,$t2

jr $ra 

winning_condition7:
lw $t7,0($t0)
lw $t8,16($t0)
bne $t7,$t8,winning_condition8
lw $t9,32($t0)
bne $t8,$t9,winning_condition8
li $t2,1
move $v1,$t2

jr $ra

winning_condition8:
lw $t7,8($t0)
lw $t8,16($t0)
bne $t7,$t8,winning_condition9
lw $t9,24($t0)
bne $t8,$t9,winning_condition9
li $t2,1
move $v1,$t2

jr $ra 


winning_condition9:

lw $t3,0($t0)
bne $t3,'1',next1
b end

next1:
lw $t3,4($t0)
bne $t3,'2',next2
b end

next2:
lw $t3,8($t0)
bne $t3,'3',next3
b end

next3:
lw $t3,12($t0)
bne $t3,'4',next4
b end

next4:
lw $t3,16($t0)
bne $t3,'5',next5
b end

next5:
lw $t3,20($t0)
bne $t3,'6',next6
b end

next6:
lw $t3,24($t0)
bne $t3,'7',next7
b end

next7:
lw $t3,28($t0)
bne $t3,'8',next8
b end

next8:
lw $t3,32($t0)
bne $t3,'9',next9
b end
next9:
li $v1,0

jr $ra


end:
li $v1,2

jr $ra 



player_win:

li $v0 , 4
la $a0 , message9
syscall

beq $t2,1,print



li $v0 , 4
la $a0 , message6
syscall
j MenuNewGame


jr $ra 

print:

li $v0 , 4
la $a0 , message8
syscall

sub $t1,$t1,1

li $v0,1
move $a0,$t1
syscall
#Score____________________
addi $s1,$zero,1
beq $t1,$s1,L1
la $t0,score
lw $t1,4($t0)
addi $t1,$t1,1
sw $t1,4($t0)
j Score_exit
L1:la $t0,score
lw $t1,0($t0)
addi $t1,$t1,1
sw $t1,0($t0)
Score_exit:

#________________________________

li $v0 , 4
la $a0 , message5
syscall

li $v0 , 4
la $a0 , message0
syscall
MenuNewGame:
                             li $v0,4
                             la $a0,gameMenu
                             syscall
                             li $v0,5
                             syscall
                             bne $v0,99,reset
                             la $t0,score
                             lw $t1,0($t0)
                             lw $t2,4($t0)
                             bne $t1,$t2,Not_Draw
                             li $v0,4
                             la $a0,draw_all
                             syscall
 		 j L_QUIT 
Not_Draw:          blt $t1,$t2,win_2
 		 li $v0,4
                             la $a0,win_all_1
                             syscall
                              li $v0,4
                             la $a0,strName1
                             syscall
                             j L_QUIT                       
 win_2:                li $v0,4
                             la $a0,win_all_2
                             syscall
                             li $v0,4
                             la $a0,strName2
                             syscall
 L_QUIT:              li $v0,10
                             syscall
jr $ra 
##################### Getting Name Started

.globl getName

	getName:
	li 		$v0, 4
	la 		$a0, message_start
	syscall
	li 		$v0, 4
	la 		$a0, line2
	syscall	
	li 		$v0, 4
	la 		$a0, line4
	syscall
#taking string as input
    	la 		$a0 , strName1
    	li 		$a1 , 1024
    	li 		$v0 , 8
    	syscall
	
    	li 		$v0, 4
	la 		$a0, line2
	syscall	

	li 		$v0, 4
	la 		$a0, line5
	syscall


		#taking string as input
    	la 		$a0 , strName2
    	li 		$a1 , 1024
    	li 		$v0 , 8
    	syscall    	

	li 		$v0, 4
	la 		$a0, line3
	syscall
		

	jr 		$ra

##################### End Of Getting Name
