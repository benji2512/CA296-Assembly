mov al,41 ;move hexidecimal 41 ("A") into al

main:
	cmp al,5B ;compare 5B ("Z") to al. Compare subtracts the two
	jz progend ;jump to progend if the compare is 0
	mov [c0],al ;move al into c0 (first location in the VDU)
	inc al ;increment al (add 1)
	jmp main

progend:
	end
