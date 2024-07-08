.global _start



.section .data

zero: .float 0.0
minus_one: .float -1.0
two: .float 2.0

single_precision: .word 0x07F
double_precision: .word 0x17F

round_up: .word 0xB7F

.section .text

_start:

    finit

    exceptions:
        # +0
        fldz

        # -0 (0.0 / -1.0)
        fldz
        fmul minus_one


        # + inf (1.0 / 0.0)
        fld1
        fdiv zero

        # - inf (-1.0 / 0.0)
        fld minus_one
        fdiv zero
        
        # NaN (0.0 / 0.0)
        fldz
        fdiv zero

        ffree %st(0)
        fstp %st(0)
        
        ffree %st(0)
        fstp %st(0)
        
        ffree %st(0)
        fstp %st(0)

    precisions:
    	fldpi   #pi
        fld minus_one
        fadd %st(1), %st(0)
        
        fldcw single_precision
        fldpi   #pi
        fld minus_one
        fadd %st(1), %st(0)

        
   rounds:
   	fldcw round_up
	fldpi   #pi
	fadd minus_one
