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

	mov ecx, [ebp + 12] ; liczba elementów
	dec ecx
ptl1:
	mov esi, [ebp + 8] ; adres pierwszego elementu tablicy
	push ecx ; zapisanie iteratora zewnêtrznej pêtli
ptl2:
	mov eax, [esi] ; element i
	mov edx, [esi + 4] ; element i + 1
	cmp eax, edx
	ja zamien ; jeœli elementy s¹ w z³ej kolejnoœci
	jmp pomin
zamien:
	mov [esi], edx
	mov [esi + 4], eax
pomin:
	add esi, 4 ; adres nastêpnego elementu tablicy
	loop ptl2
	pop ecx ; przywrócenie iteratora
	loop ptl1

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_sortuj endp
end