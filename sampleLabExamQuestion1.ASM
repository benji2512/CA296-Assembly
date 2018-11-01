;Sample lab exam question 1
;Swap Uppercase characters with Lowercase characters and vice versa. Program ends when a space (hex 20) is reached

org c0 ;starts following code at register c0, start of vdu
db 48
db 65
db 4c
db 6c
db 4f
db 77
db 4f
db 72
db 4c
db 64

;Above db's spell out HeLlOwOrLd

org 00 ;starts following code at register 00, start of memory
mov al,c0 ;reference c0 through al
jmp main ;jump into main loop

main:
   mov cl,[al] ;reference what whats in al through cl
   cmp cl,20 ;compare (subtract) 20 and cl
   jz progend ;if the compare is zero, jump to end
   cmp cl,5f ;compare 5f (hex for "_")[used the as it is roughly half between the hex for Uppercase and Lowercase letters so I can distingush them]
   js swapToLower ;if the sign flag is set (register SR) [means the compare returned a negative number] jump to swapToLower
   jns swapToHigher ;if the sign flag is not set (register SR) [means the compare returned a positive number] jump to swapToHigher

swapToLower:
   add cl,20 ;add 20 to cl [20 is the distance in decimal from one hex Uppercase letter to the Lowercase letter] i.e "H" is 48 and "h" is 68
   mov [al],cl ;put changed cl into al for vdu
   inc al ;incrementing (add 1) al to move to next vdu location
   jmp main ;jump back to main loop

swapToHigher:
   sub cl,20 ;substract 20 from cl [20 is the distance in decimal from one hex Uppercase letter to the Lowercase letter] i.e "H" is 48 and "h" is 68
   mov [al],cl ;put changed cl into al for vdu
   inc al ;incrementing (add 1) al to move to next vdu location
   jmp main ;jump back to main loop

progend:
   end ;end program
