; Dada la duración (en minutos) en una llamada telefónica, 
; calcular su costo: hasta 3 minutos es de Q.0.50, 
; por arriba de esos 3 minutos, se suma Q0.10 por minuto adicional.

Minuto                   EQU 4; 		TIEMPO

	AREA |.text|, CODE, READONLY, ALIGN =2
	THUMB
	EXPORT Start
	
Start
	MOV R1, #0
	B Startx

Startx
	LDR R0, = Minuto
	B CONT

CONT
	SUB R0, #1
	CMP R0,#0
	BEQ Cuenta
	B CONT
	
Cuenta
	ADD R1, #1
	;HASTA LOS 3 MINUTOS COBRA 0.50
	CMP R1, #3
	BLE CENTAVOS50	
	;DESPUES DE LOS 3 MINUTOS COBRA 0.10
	CMP R1, #3
	BGE CENTAVOS10
	
	B Startx
	
CENTAVOS50
	VLDR.F s0, =0.50	;AGREGA VALOR AL REGISTRO
	VADD.F32 s1, s0		;HACE UNA SUMA AL REGISTRO
	VLDR.F s0, =0.00	;LIMPIA REGISTRO
	B Startx

CENTAVOS10
	VLDR.F s0, =0.10
	VADD.F32 s1, s0
	VLDR.F s0, =0.00
	B Startx


	ALIGN
    END