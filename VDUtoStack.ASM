;The following code collects all the vowels from a string and puts them onto the stack

org c0 ;put following code at c0(start of VDU memory)
db "HI THERE" ;Put string in hexidecimal form at memory locations
org 00 ;put following code at 00, start of memory
mov al,c0 ;put c0 in al, to keep track of vdu locations
mov dl,40 ;put hex 40(decimal 64) in dl, to keep track of vdu end location
jmp main

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
   push al ;pushes al onto stack, can be seen in memory from BF and working backwards
   inc al ;increments al to next position
   jmp main

progend:
   end
