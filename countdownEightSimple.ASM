mov cl,8 ;move hexidecimal 8 into cl register
main:
	dec cl ;Decrement(subtract 1) cl
	jnz main ;Jump to top of loop as long as cl is not 0
end
