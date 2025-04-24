ORG 0000H
;P0.0 AND P0.1 IS RESERVED AS POLL PORTS
;LCD POINTS RESERVED FOR P1 RS-P2.0 rw-p2.1 en p2.2
;registers incremented for r0- for entry and r1 for exit
;|MAIN|
;---------------------------------
;display lcd
LJMP MAINROUTINE
LCD_ROUTINE:

MOV A, #38H      ; 8-bit, 2-line, 5x8 font
    ACALL LCD_CMD
    MOV A, #0EH      ; Display ON, cursor ON
    ACALL LCD_CMD
    MOV A, #01H      ; Clear display
    ACALL LCD_CMD
    MOV A, #06H      ; Auto-increment cursor
    ACALL LCD_CMD
    MOV A, #80H      ; Set cursor to 1st line, position 0
    ACALL LCD_CMD
    ; Print "count:"
    MOV A, #'c'
    ACALL LCD_DATA
    MOV A, #'o'
    ACALL LCD_DATA
    MOV A, #'u'
    ACALL LCD_DATA
    MOV A, #'n'
    ACALL LCD_DATA
    MOV A, #'t'
    ACALL LCD_DATA
    MOV A, #':'
    ACALL LCD_DATA
    SJMP $           
; Delay Subroutine
delay:
    MOV R2, #255
DL1: MOV R1, #255
DL2: DJNZ R1, DL2
    DJNZ R2, DL1
    RET
RET
LCD_CMD:            ; Send command
    CLR P2.0        ; RS = 0
    CLR P2.1        ; RW = 0
    SETB P2.2       ; EN = 1
    MOV P1, A       ; Send command to data bus
    ACALL delay
    CLR P2.2        ; EN = 0
    RET

LCD_DATA:           ; Send data
    SETB P2.0       ; RS = 1
    CLR P2.1        ; RW = 0
    SETB P2.2       ; EN = 1
    MOV P1, A       ; Send data to LCD
    ACALL delay
    CLR P2.2        ; EN = 0
    RET

MAINROUTINE:
;configure p3.0 and p3.1 as input ports
ACALL LCD_ROUTINE
SETB P3.0
SETB P3.1
MOV A, #86H     ; DDRAM address right after ':' (i.e. 7th position)
    ACALL LCD_CMD   ; Move cursor there
HERE:JNB P3.0,HERE
INC R0;INCREMENET REGISTER R0

    MOV A, R0       ; Get value from R0
    ADD A, #30H     ; Convert binary to ASCII
    ACALL LCD_DATA  ; Display the digit
HERE1:JNB P3.1,HERE1
DEC R0
; Clear previous digit
MOV A, #86H        ; DDRAM address after ':'
ACALL LCD_CMD
MOV A, #' '        ; Send a space to erase old digit
ACALL LCD_DATA

; Display new digit
MOV A, #86H        ; Move cursor back
ACALL LCD_CMD
MOV A, R0
ADD A, #30H        
ACALL LCD_DATA
SJMP HERE
END


