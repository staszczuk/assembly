.686
.model flat

public _sortuj

.code
_sortuj proc
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	mov ecx, [ebp + 12] ; liczba element�w
	dec ecx
ptl1:
	mov esi, [ebp + 8] ; adres pierwszego elementu tablicy
	push ecx ; zapisanie iteratora zewn�trznej p�tli
ptl2:
	mov eax, [esi] ; element i
	mov edx, [esi + 4] ; element i + 1
	cmp eax, edx
	ja zamien ; je�li elementy s� w z�ej kolejno�ci
	jmp pomin
zamien:
	mov [esi], edx
	mov [esi + 4], eax
pomin:
	add esi, 4 ; adres nast�pnego elementu tablicy
	loop ptl2
	pop ecx ; przywr�cenie iteratora
	loop ptl1

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_sortuj endp
end