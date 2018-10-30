;This program searches the VDU for vowels and replaces them with "Z"

org c0 ;put following code at c0(start of VDU memory)

db "I LOVE FOOTBALL AT UNI" ;put hexidecimal representations of string in memory

org 00 ;put following code at 00 (start of memory)
mov al,c0 ;start at first VDU memory location
mov bl,5a ;put "Z" in bl register for vowel change
mov dl,40 ;put decimal 64 into dl as counter to check every VDU register
jmp main ;jump into main loop

main:
	mov cl,[al] ;put hex number in al into cl
	cmp cl,41 ;check if cl == "A" (hex 41)
	jz foundvowel ;jump to foundvowel loop if comparision is 0
	cmp cl,45 ;check if cl == "E" (hex 45)
	jz foundvowel
	cmp cl,49 ;check if cl == "I" (hex 49)
	jz foundvowel
	cmp cl,4f ;check if cl == "O" (hex 4f)
	jz foundvowel
	cmp cl,55 ;check if cl == "U" (hex 55)
	jz foundvowel
	cmp dl,0 ;check if dl(register counter) is 0
	jz progend ; jump to end is dl is 0
	dec dl ;decrement (substract 1) from dl
	inc al ;increment (add 1) to al to go to next register in VDU [c0 to c1 to c2 etc)
	jmp main ;jump back to topof loop

foundvowel:
	mov [al],bl ;replace whats in al wirh bl("Z")
	mov bl,5a ;put "Z" back in bl
	dec dl ;decrement (substract 1) from dl
	inc al ;jump back to topof loop
	jmp main

progend:
	end
