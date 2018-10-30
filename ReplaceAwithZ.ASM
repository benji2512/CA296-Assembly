;The following code checks all 64 memory location for the VDU for the letter "A" and replaces it with "Z".

org c0 ;put following code at C0(vdu memory location start)

db "AellA AlA" ;put string into memory locations (hexidecimal representations)

org 00 ;put following code at 00 (start of memory locations)
mov al,bf ;moves start point of vdu check into al
mov bl,5A ;moves hex for "Z" into bl for check
mov dl,40 ;counter for 64 memory locations for vdu
jmp main ;jump into main loop

main:
	mov cl,[al] ;moves contents of al into cl for comparison
	cmp cl,41 ;does cl = 41 ("A")
	jz replace ;jump if cl - 41 = 0 to replace loop
	inc al ;next memory location to check
	mov cl,[al] ;again move contents of al into cl after incrementing al
	cmp dl,0 ;does dl(counter) = 0 i.e. finshed
	jz progend ;if 0 jump to end
	dec dl ;decrement dl by 1, next register
	jmp main ;go back to top of loop
	

replace:
	mov [al],bl ;put bl(5A = "Z") into AL [dereferencing bl and putting into AL]
	mov bl,5A ;putting 5A back into bl for another comparison
	jmp main ;jump to main loop

progend:	
	end ;end program