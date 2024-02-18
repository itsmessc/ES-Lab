	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
    DCD 0x10001000 ; stack pointer value when stack is empty
    DCD Reset_Handler ; reset vector
    ALIGN
    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    LDR R0, =VALUE
	LDR R1, =NUM
	LDR R8,=RESULT
	ADD R0,R0,#12
	ADD R1,R1,#12
	ADD R8,R8,#12
    MOV R2, #4
    MOV R3, #0
	MOV R6, #0
loop
    LDR R4,[R0],#-4
	LDR R5,[R1],#-4
	ADDS R3,R6,#0
	MOV R6,#0
	ADDS R3,R3,R4
	ADDS R3,R3,R5
	ADC R6,R6,#0
	STR R3,[R8],#-4
	SUBS R2,R2,#1
    BNE loop
    STR R3, [R8],#-4
STOP
    B STOP
VALUE DCD 0xF0101010,0xF1010101,0x10010011,0x00011011
NUM DCD 0x10101010,0x12341234,0x10010011,0x00011011
    AREA DATA, DATA, READWRITE
RESULT DCD 0
    
