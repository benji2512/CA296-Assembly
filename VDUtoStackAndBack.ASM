;The following code collects all the vowels from a string and puts them onto the stack
;unfinshed as of this update. working locally to get it working. 

org c0
db "HI THERE"
org 00
mov al,c0
mov bl,20
mov dl,40
jmp compare

compare:
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
   jz compareTwo ; jump to end is dl is 0
   dec dl ;decrement (substract 1) from dl
   inc al ;increment (add 1) to al to go to next register in VDU [c0 to c1 to c2 etc)
   jmp compare ;jump back to topof loop

foundvowel:
   push al ;pushes al onto stack, can be seen in memory from BF and working backwards
   inc al ;increments al to next position
   jmp compare

compareTwo:
   mov cl,[al]
   cmp cl,20
   jnz clearvdu
   dec al
   inc dl
   cmp dl,40
   jz progend 
   jmp clearvdu

clearvdu:
   mov cl,20
   dec al
   inc dl
   jmp compareTwo

progend:
   end
