.data

Stack_Top: 	   #Allocates memory
Stack_End:         .word 0:80 
Simon_Array:       .word 0:80
Error_Width:       .asciiz "Error: Horizontal line is too long\n"
Winner:            .asciiz "Congrats, you won!\n"
Loser:             .asciiz "Mismatch! You lost...\n"
SkillInit:         .asciiz "Welcome to Simon, please enter 1 for beginner, 2 for Intermediate, or 3 for expert level..."

Text1:  .asciiz "1"
Text2:  .asciiz "2"
Text3:  .asciiz "3"
Text4:  .asciiz "4"


ColorTable: 
	.word 0x000000     #black
	.word 0xffff00     #yellow
	.word 0x0000ff     #blue
	.word 0x00ff00     #green
	.word 0xff0000     #red
	.word 0xffffff	   #white
	.word 0x1e90ff	   #Dodger Blue
	.word 0xffa500	   #orange
	.word 0xdc143c	   #crimson
	.word 0x3cb371     #medium Sea Green
	
DigitTable:
        .byte   ' ', 0,0,0,0,0,0,0,0,0,0,0,0
        .byte   '0', 0x7e,0xff,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '1', 0x38,0x78,0xf8,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18
        .byte   '2', 0x7e,0xff,0x83,0x06,0x0c,0x18,0x30,0x60,0xc0,0xc1,0xff,0x7e
        .byte   '3', 0x7e,0xff,0x83,0x03,0x03,0x1e,0x1e,0x03,0x03,0x83,0xff,0x7e
        .byte   '4', 0xc3,0xc3,0xc3,0xc3,0xc3,0xff,0x7f,0x03,0x03,0x03,0x03,0x03
        .byte   '5', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0x7f,0x03,0x03,0x83,0xff,0x7f
        .byte   '6', 0xc0,0xc0,0xc0,0xc0,0xc0,0xfe,0xfe,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '7', 0x7e,0xff,0x03,0x06,0x06,0x0c,0x0c,0x18,0x18,0x30,0x30,0x60
        .byte   '8', 0x7e,0xff,0xc3,0xc3,0xc3,0x7e,0x7e,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '9', 0x7e,0xff,0xc3,0xc3,0xc3,0x7f,0x7f,0x03,0x03,0x03,0x03,0x03
        .byte   '+', 0x00,0x00,0x00,0x18,0x18,0x7e,0x7e,0x18,0x18,0x00,0x00,0x00
        .byte   '-', 0x00,0x00,0x00,0x00,0x00,0x7e,0x7e,0x00,0x00,0x00,0x00,0x00
        .byte   '*', 0x00,0x00,0x00,0x66,0x3c,0x18,0x18,0x3c,0x66,0x00,0x00,0x00
        .byte   '/', 0x00,0x00,0x18,0x18,0x00,0x7e,0x7e,0x00,0x18,0x18,0x00,0x00
        .byte   '=', 0x00,0x00,0x00,0x00,0x7e,0x00,0x7e,0x00,0x00,0x00,0x00,0x00
        .byte   'A', 0x18,0x3c,0x66,0xc3,0xc3,0xc3,0xff,0xff,0xc3,0xc3,0xc3,0xc3
        .byte   'B', 0xfc,0xfe,0xc3,0xc3,0xc3,0xfe,0xfe,0xc3,0xc3,0xc3,0xfe,0xfc
        .byte   'C', 0x7e,0xff,0xc1,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc1,0xff,0x7e
        .byte   'D', 0xfc,0xfe,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xfe,0xfc
        .byte   'E', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0xfe,0xc0,0xc0,0xc0,0xff,0xff
        .byte   'F', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0xfe,0xc0,0xc0,0xc0,0xc0,0xc0
        # add additional characters here....
	# first byte is the ascii character
	# next 12 bytes are the pixels that are "on" for each of the 12 lines
        .byte    0, 0,0,0,0,0,0,0,0,0,0,0,0

CircleTable:
	.word 128, 80, 7, 124, 76    #Circle 1, Upper, Orange, Number X, Number Y
	.word 80, 128, 6, 76, 124   #Circle 2, Left, Dodger Blue
	.word 176, 128, 8, 172, 124  #Circle 3, Right, Crimson
	.word 128, 176, 9, 124, 172  #Cicle 4, Bottom, Medium Sea Green
	
CircleRecipe:
	.word -3, -15, 7   #offset x, offset y, horiz line length
	.word -3, 13	   #offset x, horiz line length
	.word -2, 17	   #Last comment above continues through array
	.word -1, 19
	.word -1, 21
	.word -1, 23
	.word -1, 25
	.word -1, 27
	.word 0, 27
	.word -1, 29
	.word 0, 29
	.word 0, 29
	.word -1, 31
	.word 0, 31
	.word 0, 31
	.word 0, 31
	.word 0, 31
	.word 0, 31
	.word 0, 31
	.word 1, 29
	.word 0, 29
	.word 0, 29
	.word 1, 27
	.word 0, 27
	.word 1, 25
	.word 1, 23
	.word 1, 21
	.word 1, 19
	.word 2, 17
	.word 3, 13
	.word 3, 7
	
HorizDividerLines:
	.word 32, 32, 5, 192, 0	 #First horizontal line, right to left (x, y, ColorTable#, length, 0 = Pos Direction)
	.word 224, 32, 5, 192, 1 #First horizontal line, left to right (x, y, ColorTable#, -length, 1 = Neg Direction) 
 
BlinkTimes:
	.word 750	   #Millisecond Time for Simon box blinking
	.word 400
	.word 100
	
.text
la $sp, Stack_End	#point $sp to memory stack

######## Main Function #############
MAIN:

jal Init		   #Initialize program, seeds random value

jal DrawQuadrants           #Draws the quadrants on the bitmap

jal SetSkillLevel	    #Prompts user for their desired skill level
 
loopAgain:
add $s3, $s3, 1		   #Loop counter 
jal GetRandNum		   #Reqests next random number to

add $a0, $0, $v0	   #Pass return from GetRandNumb to AddNumbToSimonStack 
jal AddNumbToSimonStack    #Calls fucntion to add random number onto Simon stack

jal BlinkLights		   #Blinks the simon square(s)

jal ReadMemoryMatch	   #Read uses pattern, return outcome

beqz $v1, Lost		   #Return states user mismatched, inform and end came

#####Make incorrect sound
#####Display Correct circle with sound and blink rapidly

blt $s3, $s6, loopAgain

la $a0, Winner    	# load address of prompt string, user won
li $v0, 4	    	#cmd to specify Print String Service
syscall
j exit

Lost:la $a0, Loser    	# load address of prompt string, user lost
li $v0, 4	    	#cmd to specify Print String Service
syscall
j exit

add $s3, $0, $0		   #Clear long term storage

exit:li   $v0, 10          #system call for exit
syscall                    # Exit!

########### Function to Set Skill Level ##################
###########################################################
SetSkillLevel:
la $a0, SkillInit    	#Welcome the user and prompt for skill level
li $v0, 4	    	#cmd to specify Print String Service
syscall

li $a0, 10              #load char value into arg for new line
li $v0, 11	        #cmd to print char,
syscall

readAgain:
li $v0, 12              #specify read char
syscall
add $t0, $0, $v0	#Moves ReadMemoryMatch return to temp reg

li $a0, 10              #load char value into arg for new line
li $v0, 11	        #cmd to print char,
syscall

bgt $t0, 0x33, readAgain #Check bounds to make sure skill range is 1-3
blez $t0, readAgain

beq $t0, 0x31, fiveKeyStrokes	#Branch to switch case to set appropriate key strokes
beq $t0, 0x32, eightKeyStrokes
beq $t0, 0x33, elevenKeySrokes

fiveKeyStrokes:			#Set the keyStrokes for loop in main
add $s6, $0, 5
j skillSlected
eightKeyStrokes:
add $s6, $0, 8
j skillSlected
elevenKeySrokes:
add $s6, $0, 11

skillSlected:

jr $ra

######### Fuction that Reads User Memory Match ############
### $v0 last read number from Simon Array
### $v1 1 if matches sequence, 0 if failed
###########################################################
ReadMemoryMatch:
addiu $sp, $sp, -20      #Allocate space on stack to save ra
sw $ra, 16($sp)	        #Store ra

add $t0, $0, $s0	#Total number of numbers on Simon stack
la $t1, Simon_Array

matchLoop:
add $v1, $0, 1		#Set return for Succesful match
beqz $t0, doneMatching	#When no values on Simon stack left to check, return success
lw $t2, 0($t1) 		#Load current value on Simon stack
addiu $t1, $t1, -4	#Move to next value address on Simon stack


readCharAgain:
li $v0, 12              #specify read char
syscall
add $t3, $0, $v0	#Moves ReadMemoryMatch return to temp re

li $a0, 10              #load char value into arg for new line
li $v0, 11	        #cmd to print char,
syscall

sub $t3, $t3, 0x30      #Adjust hex ascii value to decimal
add $a0, $0, $t3	#Copy number pressed to sound arg

jal PlayCirSound	#Play a sound

sw $t0, 12($sp)		#Store numbers left to go on stack
sw $t1, 8($sp)		#Store address for next value
sw $t2, 4($sp)		#Current Simon stack value
sw $t3, 0($sp)		#Current End User value
	
add $a0, $0, $t3	#Load Arg for number
li $a1, 0		#No Pause
jal BlinkSimonCircle	#Blink Circle


lw $t0, 12($sp)		#Store numbers left to go on stack
lw $t1, 8($sp)		#Store address for next value
lw $t2, 4($sp)		#Current Simon stack value
lw $t3, 0($sp)		#Current End User value


add $t0, $t0, -4	#Decrement remaining simon stack words
beq $t3, $t2, matchLoop	#Continue if user matches number

li $a0, 5		#Load Wrong circle sound
jal PlayCirSound	#Play a sound

add $t0, $0, 3		#Counter for 3 blinks
blinkCorrect:
lw $a0, 4($sp)		#Load correct value to blink
li $a1, 0		#No pause

sw $t0, 12($sp)		#save loop counter

jal BlinkSimonCircle	#Blink

lw $t0, 12($sp)		      #save loop counter
add $t0, $t0, -1	      #Decremnt counter
bne $t0, $0, blinkCorrect

doneMatching:
lw $ra, 16($sp)
addiu $sp, $sp, 20

jr $ra

######## Function to initalize the program, seeds random value ##########
Init:
li $v0, 30               #Syscall for time system, returns current time
syscall

add $a1, $a0, $0	  #Copy return value for milliseconds into seed value
add $a0, $0, $0		  #Set ID of generator

li $v0, 40                #specify read char
syscall	

jr $ra

#####Add new number to sequence ######
### v0 return a random number #######
GetRandNum:
add $a0, $0, $0	         #Generator 0, we only are using one generator for this lab
sw $ra, 4($sp)           #Store stackpointer for $ra

add $a1, $0, 4	         #Specify the limit on the range
li $v0, 42               #specify read char
syscall
add $a0, $a0, 1		 #Add to return, range will be 1-4

add $v0, $0, $a0	#Return random number

jr $ra

####Add a new number to Simon Stack#######
### a0 number to store
#########################################
AddNumbToSimonStack:	
add $s0, $s0, 4		 #Increment total values on simon stack, 4=1

add $t0, $0, $sp         #Temp store for current address Stack_End

la $sp, Simon_Array     #Move pointer to simon stack
sub $sp, $sp, $s0	 #Allocate new memory on stack, moving to next memory address

sw $a0, 4($sp)	         #Add value to simon stack
la $s1, 0($sp)		 #Store current address for Simon Stack
la $sp, 0($t0)		 #Restore stack pointer to address on Stack_End

jr $ra

########## Blink Lights #############
#####################################
BlinkLights:
addiu $sp, $sp, -24     #Allocate space on stack to save ra
sw $ra, 20($sp)	        #Store ra
sw $t2, 16($sp)

add $s4, $0, $sp        #Temp store for current address Stack_End

la $sp, Simon_Array	#Load address of where the Simon values are stored
lw $a0, 0($sp)		#Load first box to blink from Simom Stack
la $sp, ($s4)		#Move Stack pointer back to nested functions

la $t4, BlinkTimes	#Load address to check blink speed
lw $a1, 0($t4)		#Blink Speed Beginner
beq $s6, 5, Blink	#Start Blinking when level 0
lw $a1, 4($t4)		#Blink Speed Intermediate
beq $s6, 8, Blink	#Start Blinking when level 1
lw $a1, 8($t4)		#Blink Speed Expert

Blink:
add $t1, $0, $0		#Initialize loop counter
add $t2, $0, $s0	#Use temp to hold total amount of bytes to traverse
la $t3, Simon_Array	#Use temp to hold Step address, used for decrementing down Simon Stack		
add $t3, $t3, 4		#Correct address offset

bLoop:
add $t1, $t1, 4		#Clear loop counter
addi $t3, $t3, -4	#Increment to next value on Simon stack
lw $a0, 0($t3)		#Load next box value for BlinkSimonCircle

sw $t2, 16($sp)		#Store temps, bound to change in nested functions
sw $t1, 8($sp)
sw $t2, 4($sp)
sw $t3, 0($sp)

jal PlayCirSound
lw $a0, 0($t3)		#Restore circle number argument
la $t4, BlinkTimes	#Load address to check blink speed
lw $a1, 0($t4)		#Blink Speed Beginner
beq $s6, 5, blinkNext	#Blink when level 0
lw $a1, 4($t4)		#Blink Speed Intermediate
beq $s6, 8, blinkNext	#Blink when level 1
lw $a1, 8($t4)		#Blink Speed Expert

blinkNext:
jal BlinkSimonCircle
lw $ra, 20($sp)	        #Restore ra and temp registers
lw $t2, 16($sp)		
lw $t1, 8($sp)
lw $t2, 4($sp)
lw $t3, 0($sp)

blt $t1, $t2, bLoop	#Check to see if total values have been traversed

exitBLoop:
jr $ra

############ Function to Blink Simon Circle ###################
### $a0 Simon Box Reqest
### $a1 $a2 Blink time "Milliseconds"
##########################################################
BlinkSimonCircle:
addiu $sp, $sp, -16     #Allocate space on stack to save ra
sw $ra, 12($sp)	        #Store ra
sw $a0, 8($sp)	        #Store Box Number requested
sw $a1, 4($sp)		#Store Blink time

lw $t1, 8($sp)		#Request Simon box number, original a0
sub $t1, $t1, 1		#Correct offset for index into CircleTable
mul $t1, $t1, 20	#Requested box number address offset
la $t0, CircleTable	#Load address of array of boxes
add $t0, $t0, $t1	#Address of Requested Box
sw $t0, 0($sp)		#Store Address of CircleTable + Offset

lw $a0, 0($t0)		#Load word for x variable of horiz divider
lw $a1, 4($t0)          #Load word for y variable of horiz divider
lw $a2, 8($t0)          #Load word for requested box color

jal DrawCircle
lw $ra, 12($sp)	       #Restore ra
lw $t0, 0($sp)	       #Restore circle table index address

lw $a0, 12($t0)		#horizontal pixel co-ordinate number in circle
lw $a1, 16($t0)		#vertical pixel co-ordinate
lw $a3, 8($t0)		#pixel color number for circle

lw $t2, 8($sp)		#Original Box Request Number

beq $t2, 1, num1	#Switch Case for number to enter into simon circle
beq $t2, 2, num2	
beq $t2, 3, num3
beq $t2, 4, num4

num1: la  $a2, Text1	#Load appropriate ascii key
j outTextCall
num2: la  $a2, Text2
j outTextCall
num3: la  $a2, Text3
j outTextCall
num4: la  $a2, Text4

sw $t0, 0($sp)			#Store circle table index address

outTextCall: jal OutText	#draw number in circle
lw $ra, 12($sp)	       #Restore ra
lw $t0, 0($sp)			#Restore circle table index address	

lw $a0, 4($sp)	       #Load arguement for pause time before "Blink time"
jal Pause				#Call Pause
lw $ra, 12($sp)	       #Restore ra

lw $t0, 0($sp)		#Rstore Address of BoxTable + Offset
lw $a0, 0($t0)		#Load word for x variable of horiz divider
lw $a1, 4($t0)          #Load word for y variable of horiz divider
lw $a2 ColorTable           #Load word for BLACK box color, erases the box

jal DrawCircle

lw $ra, 12($sp)	       #Restore ra
lw $a0, 8($sp)	       #Restore Box Number requested
lw $a1, 4($sp)	       #Restore Blink time

addiu $sp, $sp, 16       #Move back up stack to

jr $ra

###### Function to Draw a Circle #################
## $a0, for x0 0-256
## $a1, for y0 0-256
## $a2 for color number 0-9
## $v0 address for inital x + x0
## $v1 color of last drawn circle
##################################################
DrawCircle:
addi $sp, $sp, -28	#store all changable variables to stack
sw $ra, 24($sp)		#Store return address on stack
sw $a0, 20($sp)		#Store a registers that could change
sw $a1, 16($sp)
sw $a2, 12($sp)

la, $t0 CircleRecipe	#address for recipe
lw $t1, 0($t0)		#starting address offset, x 
lw $t2, 4($t0)		#starting address offset, y

add $a0, $a0, $t1	#first pixel on x axis
add $a1, $a1, $t2	#first pixel on y axis
lw $a3, 8($t0)		#load horizontal line length
add $t3, $0, 8		
add $t4, $t0, $t3	#next address to pull x offset from
sw $t4, 8($sp)		#Save current address location
sw $a0, 20($sp)		#save current x
sw $a1, 16($sp)		#save current y

sw $a0, 0($sp)		#save inital x + x0 for return, addressed need when drawing numbers in circle

jal DrawHorizLine	#draw first horiz line

add $t5, $0, $0		#loop counter
cirLoop: 
sw $t5, 4($sp)		#save current loop counter
lw $a0, 20($sp)		#load current x
lw $a1, 16($sp)		#load current y

lw $t4, 8($sp)		#load current index in CircleRecipe address location
lw $t5, 4($sp)		#save current loop counter
lw $a2, 12($sp)		#load color value

addi $t4, $t4, 4	#Move to next x value on CircleRecipe stack
lw $t1, 0($t4)		#load next x offset
add $a0, $a0, $t1	#Set next x value
add $a1, $a1, 1		#Move down y axis
addi $t4, $t4, 4	#Move to next line length address
lw $a3, 0($t4)		#Set next horiz line length value

sw $a0, 20($sp)		#save current x
sw $a1, 16($sp)		#save current y
sw $t4, 8($sp)		#load current index in CircleRecipe address location
sw $t5, 4($sp)		#save current loop counter
sw $a2, 12($sp)		#load color value

jal DrawHorizLine	#draw first horiz line
lw $t5, 4($sp)		#save current loop counter

add $t5, $t5, 1         #increment loop counter
blt $t5, 30, cirLoop	#Continue until circle is drawn

lw $ra, 24($sp)		#restore ra
lw $v1, 12($sp)		#return color value, addressed need when drawing numbers in circle
lw $v0, 0($sp)		#return inital x + x0, addressed need when drawing numbers in circle

addi $sp, $sp, 28	#move back up stack

jr $ra

######Function to Draw a Horizontal Line#########
## $a0 for x 0-31
## $a1 for y 0-31
## $a2 for color number 0-7
## $a3 length of the horizontal line
#####################################
DrawHorizLine:
addi $sp, $sp, -12	#store all changable variables to stack
sw $ra, 8($sp)		#Store return address on stack
sw $a1, 4($sp)		#Store a registers that could change
sw $a2, 0($sp)		

add $t0, $0, 32 	#Max Width of Bitmap
sub $t0, $t0, $a0	#Current distance to wall

HorizLoop:
jal DrawDot
add $a3, $a3, -1
add $a0, $a0, 1
bne $a3, $0, HorizLoop

add $ra, $ra, 4

lw $a1, 4($sp)		#restore register, DrawDot could change them
lw $a2, 0($sp)

lw $ra, 8($sp)		#restore return address
addi $sp, $sp, 12	#move stack pointer back up

jr $ra

############ Play Circle Sound ########################
# a0 Circle Number (1-4) sounds, wrong number sound otherwise
#####################################################
PlayCirSound:
li $v0, 31		#Syscall for MIDI out
add $a1, $0, 600	#Duration "miliseconds" (0-1000)
add $a2, $0, 5		#Insturment (Piano)
add $a3, $0, 30		#Volume (0-127)

beq $a0, 1, sound1	#Switch Case for number to enter into simon circle
beq $a0, 2, sound2	
beq $a0, 3, sound3
beq $a0, 4, sound4
j wrongCicleSound	#Go to wrong number sound if not 1-4

sound1:
add $a0, $0, 67		#Pitch (61-72) 67 is G
j playSound
sound2:
add $a0, $0, 62		#Pitch (61-72) 62 is D
j playSound
sound3:
add $a0, $0, 66		#Pitch (61-72) 66 is F# or Gb
j playSound
sound4:
add $a0, $0, 71		#Pitch (61-72) 66 is B or Cb
j playSound
wrongCicleSound:
add $a2, $0, 16		#Insturment (Organ)
add $a0, $0, 65		#Pitch (61-72) 65 E# or F

playSound:
syscall

jr $ra

######### Function to Lookup Color from ColorTable #############
#### a2 number for requested color
###############################################################
LookupColor:
la $t1, ColorTable				#Load address where color values start
beq $a2, 0, colorBlack				#Switch case color look up, $a2 is request color
beq $a2, 1, colorYellow
beq $a2, 2, colorBlue
beq $a2, 3, colorGreen
beq $a2, 4, colorRed
beq $a2, 5, colorWhite
beq $a2, 6, colorDodgerBlue
beq $a2, 7, colorOrange
beq $a2, 8, colorCrimson
beq $a2, 9, colorSeaGreen

colorBlack: lw $t0, 0($t1)			#Load the reqeusted color at specific memory address
j returnColor

colorYellow: lw $t0, 4($t1)
j returnColor

colorBlue: lw $t0, 8($t1)
j returnColor

colorGreen: lw $t0, 12($t1)
j returnColor

colorRed: lw $t0, 16($t1)
j returnColor

colorWhite: lw $t0, 20($t1)
j returnColor

colorDodgerBlue: lw $t0, 24($t1)
j returnColor

colorOrange: lw $t0, 28($t1)
j returnColor

colorCrimson: lw $t0, 32($t1)
j returnColor

colorSeaGreen: lw $t0, 36($t1)
j returnColor

returnColor:
add $v1, $0, $t0				#Return the color

jr $ra

########### Function to Draw the Quadrants ########
###################################################
DrawQuadrants:

addiu $sp, $sp, -4     		#Allocate space on stack to save ra
sw $ra, 0($sp)	       		#Store ra 

la $t0, HorizDividerLines	#Load address of array on stack	
lw $a0, 0($t0)			#Load word for x variable of horiz divider
lw $a1, 4($t0)          	#Load word for y variable of horiz divider
lw $a2, 8($t0)          	#Load word for white pixel color
lw $a3, 12($t0)			#Length of line
lw $t1, 16($t0)  		#Direction of the line

jal DrawDiagLine 		#Draw horizontal line left to right

lw $ra, 0($sp)	       		#Restore ra 

la $t0 HorizDividerLines	#Load address of array on stack	
lw $a0, 20($t0)			#Load word for x variable of horiz divider
lw $a1, 24($t0)         	#Load word for y variable of horiz divider
lw $a2, 28($t0)         	#Load word for white pixel color
lw $a3, 32($t0) 		#Length of line
lw $t1, 36($t0)  		#Direction of the line

jal DrawDiagLine		#Draw horizontal line right to left

lw $ra, 0($sp)	       		#Store ra 
addiu $sp, $sp, 4      		#Move back up stack

jr $ra

########### Function to Draw a Box ###########
## $a0 for x 0-31
## $a1 for y 0-31
## $a2 for color number 0-7
## $a3 = size of the box 
##############################################
DrawBox:
addiu $sp, $sp, -24     #Open up two words on stack
sw $ra, 20($sp)		#Store ra
sw $a0, 16($sp)		#Store a0
sw $a1, 12($sp)		#Store a1
sw $a2, 8($sp)		#Store a2
sw $a3, 4($sp)		#Store a3
sw $s2, 0($sp)		#Store a4

add $s2, $0, $a3	#Copy a3 to temp reg

BoxLoop:
lw $a0, 16($sp)		#Store a0
lw $a1, 12($sp)		#Store a1
lw $a2, 8($sp)		#Store a2
lw $a3, 4($sp)		#Store a3

jal DrawHorizLine	#Draw current row
add $a1, $a1, 1		#Increment Y coordinate
sw $a1, 12($sp)		#Reload a1
lw $a3, 4($sp)		#Reload a3

addiu $s2, $s2, -1	#Decrement remaining rows left
bne $s2, $0, BoxLoop	#Continue when more rows are left

lw $ra, 20($sp)		#Restore ra
lw $s2, 0($sp)		#Restore a4
addiu $sp, $sp, 24      #Restore position of stack pointer
jr $ra

######Function to Draw a Diagnal Line####################
## $a0 for x 0-31
## $a1 for y 0-31
## $a2 for color number 0-7
## $a3 length of the Diagnal line
## $t1 draw direction on x axis, 0 pos, 1 neg direction
#########################################################
DrawDiagLine:
addi $sp, $sp, -16		#store all changable variables to stack
sw $ra, 12($sp)			#Store return address on stack
sw $a1, 8($sp)			#Store a registers that could change
sw $a2, 4($sp)
sw $t1, 0($sp)			#Save the signal for which direction to move on x axis

add $t0, $0, 32 		#Max Width of Bitmap
sub $t0, $t0, $a0		#Current distance to wall
		
DiagnalLoop:
jal DrawDot			#Mark the dot on bitmap
lw $t1, 0($sp)			#Restore the signal for direction to move on x axis
add $a3, $a3, -1		#Decrement remaining line length
beqz $t1, movePosDir		#Traverse from left to right
beq $t1, 1, moveNegDir		#Traverse from right to left
movePosDir:add $a0, $a0, 1	#Incrments x in when moving in positive direction
j proceed 
moveNegDir: sub $a0, $a0, 1	#Incrments x in when moving in negative direction
proceed:add $a1, $a1, 1		#Increment y
bne $a3, $0, DiagnalLoop	#Continue while line lenth hasn't been achieved

add $ra, $ra, 4			#Move back up stack

lw $a1, 8($sp)			#restore register, DrawDot could change them
lw $a2, 4($sp)


lw $ra, 12($sp)			#restore return address
addi $sp, $sp, 16		#move stack pointer back up

jr $ra

######Function to Draw a Vertical Line #########
## $a0 for x 0-31
## $a1 for y 0-31
## $a2 for color number 0-7
## $a3 length of the horizontal line
#####################################
DrawVertLine:
addi $sp, $sp, -12	#store all changable variables to stack
sw $ra, 8($sp)		#Store return address on stack
sw $a1, 4($sp)		#Store a registers that could change
sw $a2, 0($sp)	

add $t0, $0, 32 	#Max Height of Bitmap
sub $t0, $t0, $a1	#Current distance to wall

ble $a3, $t0, VertLoop	#Checks requested bounds, informs user if requested width is too far for remain bitmap pixels
la $a0 Error_Width
li $v0, 4
syscall
j exit
		
VertLoop:		#Loop that draw the horizontal line
jal DrawDot		
add $a3, $a3, -1
add $a1, $a1, 1
bne $a3, $0, VertLoop

add $ra, $ra, 4		#Adjusts ra

lw $a1, 4($sp)		#restore register, DrawDot could change them
lw $a2, 0($sp)

lw $ra, 8($sp)		#restore return address
addi $sp, $sp, 12	#move stack pointer back up

jr $ra

######Function to Draw a Dot#########
## $a0 for x 0-31
## $a1 for y 0-31
## $a2 for color number 0-7 #########
DrawDot:
addiu $sp, $sp, -8      #Open up two words on stack
sw $ra, 4($sp)		#Store ra
sw $a2, 0($sp)		#Store original a2

jal CalcAddress  	#$v0 Las address for pixel
lw $a2, 0($sp)		#Restore a2
sw $v0, 0($sp)		#Store v0

jal LookupColor     	#$v1 has color 
lw $v0, 0($sp)    	#Restore v0

sw $v1, 0($v0)   	#make dot (color pixel)

lw $ra, 4($sp)		#Restore original ra
addiu $sp, $sp, 8	#Move sp back up stack

jr $ra

########### Function to clear display (256 x 256 Bitmap Display) ####
#####################################################################
ClearDisplay:
addiu $sp, $sp, -4     #Allocate space on stack to save ra
sw $ra, 0($sp)	       #Store ra 
add $a0, $0, $0	       #Hardcoded addres to start on (0,0) of 256 x 256 pixel Bitmap Display
add $a1, $0, $0
add $a2, $0, $0	       #Hardcoded color - black
add $a3, $0, 32

jal DrawBox

lw $ra, 0($sp)	      #Restore ra
addiu $sp, $sp, 4     #Clear ra data off the stack

jr $ra

######Function to Retrieve Bitmap Display Address (256 x 256) ###########
## $a0 for x 0-31
## $a1 for y 0-31
## $v0 address for color a pixel
#############################################################
CalcAddress:
add $t0, $0, 0x10040000	#Starting address on Bitmap Display 0,0 on the heap

mul $t1, $a1, 256		#Set offset for y
mul $t1, $t1, 4

mul $t2, $a0, 4			#Adjusts the position for x

add $t1, $t1, $t2		#Adds x and y together to caculate exact address
add $v0, $t0, $t1		#Returns address 

jr $ra

############## Function to Pause ##################
##### a0 Pause time "Milliseconds"
##############################################
Pause:
add $t4, $0, $a0      #Copy store time in temp register

add $t0, $0, $0       #Clear registers that will time comparison test
add $t1, $0, $0

li $v0, 30            #Get current timestap
syscall

add $t0, $a0, $0      #Store initial timestap

timeLoop:
syscall		       #Call for time to compare
add $t1, $a0, $0       #store compare time
subu $t3, $t1, $t0     #Subtract new first time stamp from second 
bltu $t3, $t4, timeLoop #Check to see if time has elapsed

syscall

jr $ra

################################################################
# OutText: display ascii characters on the bit mapped display
# $a0 = horizontal pixel co-ordinate (0-255)
# $a1 = vertical pixel co-ordinate (0-255)
# $a2 = pointer to asciiz text (to be displayed)
# $a3 = pixel color number
###############################################################
OutText:
        addiu   $sp, $sp, -24
        sw      $ra, 20($sp)
        
        mul	$a3, $a3, 4	

        li      $t8, 1          # line number in the digit array (1-12)
_text1:
        la      $t9, 0x10040000 	# get the memory start address
        sll     $t0, $a0, 2     # assumes mars was configured as 256 x 256
        addu    $t9, $t9, $t0   # and 1 pixel width, 1 pixel height
        sll     $t0, $a1, 10    # (a0 * 4) + (a1 * 4 * 256)
        addu    $t9, $t9, $t0   # t9 = memory address for this pixel

        move    $t2, $a2        # t2 = pointer to the text string
_text2:
        lb      $t0, 0($t2)     # character to be displayed
        addiu   $t2, $t2, 1     # last character is a null
        beq     $t0, $zero, _text9

        la      $t3, DigitTable # find the character in the table
_text3:
        lb      $t4, 0($t3)     # get an entry from the table
        beq     $t4, $t0, _text4
        beq     $t4, $zero, _text4
        addiu   $t3, $t3, 13    # go to the next entry in the table
        j       _text3
_text4:
        addu    $t3, $t3, $t8   # t8 is the line number
        lb      $t4, 0($t3)     # bit map to be displayed

        #sw      $zero, 0($t9)   # first pixel is black
        addiu   $t9, $t9, 4

        li      $t5, 8          # 8 bits to go out
_text5:
        la 	$t7, ColorTable
        add	$t7, $t7, $a3	#adjust to current color address
        lw      $t7, 0($t7)     # assume circle color
        andi    $t6, $t4, 0x80  # mask out the bit (0=color, 1=white)
        beq     $t6, $zero, _text6
        la      $t7, ColorTable     # else it is white
        lw      $t7, 20($t7)	 #Addres
_text6:
        sw      $t7, 0($t9)     # write the pixel color
        addiu   $t9, $t9, 4     # go to the next memory position
        sll     $t4, $t4, 1     # and line number
        addiu   $t5, $t5, -1    # and decrement down (8,7,...0)
        bne     $t5, $zero, _text5

        #sw      $zero, 0($t9)   # last pixel is black
        addiu   $t9, $t9, 4
        j       _text2          # go get another character

_text9:
        addiu   $a1, $a1, 1     # advance to the next line
        addiu   $t8, $t8, 1     # increment the digit array offset (1-12)
        bne     $t8, 13, _text1

        lw      $ra, 20($sp)
        addiu   $sp, $sp, 24
        jr      $ra
