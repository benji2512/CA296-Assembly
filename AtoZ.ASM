mov al,41

loopy:
	cmp al,5B
	jz progend
	mov [c0],al
	inc al
	jmp loopy

progend:
	end