;Realice un programa que calcule la determinante de una matriz de 3X3

A 				EQU 0x40066666
B1				EQU 0x4019999a	
C				EQU 0x40000000
D				EQU 0x40000000
E				EQU 0x40533333	
F				EQU 0x40800000	
G				EQU 0x3f800000	
H				EQU 0x40000000	
I				EQU 0xc0000000	
	
	AREA |.text|, CODE, READONLY, ALIGN =2
	THUMB
		
	
	EXPORT Start
		
Start
	;AEI
	LDR R0, =A 		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S0, R0 ;SE CONVIERTE A FLOAT
	LDR R1, =E		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S1, R1 ;SE CONVIERTE A FLOAT
	MUL R0, R1, R0	;SE MULTIPLICA LOS VALORES R1=A*B
	VMUL.F32 S0, S1, S0
	LDR R1, =I		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S1, R1 ;SE CONVIERTE A FLOAT
	MUL R0, R0, R1	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S0, S1, S0
	;BFG
	LDR R1, = B1	;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S1, R1 ;SE CONVIERTE A FLOAT
	LDR R2, = F		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S2, R2 ;SE CONVIERTE A FLOAT
	MUL R1, R1, R2	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S1, S1, S2
	LDR R2, = G		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S2, R2 ;SE CONVIERTE A FLOAT
	MUL R1, R1, R2	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S1, S1, S2
	;DHC
	LDR R2, = D		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S2, R2 ;SE CONVIERTE A FLOAT
	LDR R3, = H		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S3, R3 ;SE CONVIERTE A FLOAT
	MUL R2, R2, R3	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S2, S2, S3
	LDR R3, = C		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S3, R3 ;SE CONVIERTE A FLOAT
	MUL R2, R2, R3	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S2, S2, S3
	;AEI+BFG+DHC
	VADD.F32 S0, S0, S1
	VADD.F32 S0, S0, S2
	
	;--------------------------------------------------------------------------
	;CEG
	LDR R1, = C		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S1, R1 ;SE CONVIERTE A FLOAT
	LDR R2, = E		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S2, R2 ;SE CONVIERTE A FLOAT
	MUL R1, R1, R2	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S1, S1, S2
	LDR R2, = G		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S2, R2 ;SE CONVIERTE A FLOAT
	MUL R1, R1, R2	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S1, S1, S2
	;BDI
	LDR R2, = B1	;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S2, R2 ;SE CONVIERTE A FLOAT
	LDR R3, = D		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S3, R3 ;SE CONVIERTE A FLOAT
	MUL R2, R2, R3	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S2, S2, S3
	LDR R3, = I		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S3, R3 ;SE CONVIERTE A FLOAT
	MUL R2, R2, R3	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S2, S2, S3
	;FHA
	LDR R3, = F		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S3, R3 ;SE CONVIERTE A FLOAT
	LDR R4, = H		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S4, R4 ;SE CONVIERTE A FLOAT
	MUL R3, R3, R4	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S3, S3, S4
	LDR R4, = A		;SE LE ASIGNA VALOR A REGISTRO ANTERIOMENTE DEFINIDO
	VMOV.F32 S4, R4 ;SE CONVIERTE A FLOAT
	MUL R3, R3, R4	;SE MULTIPLICA LOS VALORES R1=R1*C
	VMUL.F32 S3, S3, S4
	;CEG+BDI+FHA
	ADD R1, R1, R2
	VADD.F32 S1, S1, S2
	ADD R1, R1, R3
	VADD.F32 S1, S1, S3
	
	;----------------------------------------------------------
	
	VSUB.F32 S0, S0, S1
	;LIMPIA REGISTROS
	MOV R1, #0
	MOV R2, #0
	MOV R3, #0
	MOV R4, #0
	;SI ES CERO
	VCMP.F32 S0, #0
	BEQ Error
	B Stop
	
	
Error
	VMOV.F32 S0, #0xc0000000
	VMOV.F32 S1, #0xc0000000
	B Stop

		
Stop
	NOP
	NOP


		
	ALIGN
	END