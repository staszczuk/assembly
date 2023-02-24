.686
.model flat

public _weighted_average

.code 
_weighted_average proc
	push ebp
	mov ebp, esp

	finit

	mov eax, [ebp + 8] ; first value
	mov edx, [ebp + 12] ; first weight
	mov ecx, [ebp + 16] ; n
	fldz ; st0 = numerator placeholder
numerator:
	fld dword ptr [edx] ; st0 = weight, st1 = numerator
	fld dword ptr [eax] ; st0 = value, st1 = weight, st2 = numerator
	fmulp ; st0 = value * weight, st1 = numerator
	faddp ; st0 = numerator
	add eax, 4 ; next value
	add edx, 4 ; next weight
	loop numerator

	mov edx, [ebp + 12] ; first weight
	mov ecx, [ebp + 16] ; n
	fldz ; st0 = denominator placeholder, st1 = numerator
denominator:
	fld dword ptr [edx] ; st0 = weight, st1 = denominator, st2 = numerator
	faddp ; st0 = denominator, st1 = numerator
	add edx, 4 ; next weight
	loop denominator

	fdivp ; st0 = result

	pop ebp
	ret
_weighted_average endp
end