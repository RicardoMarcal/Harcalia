
if(player[7] > 0)
	if(player[7] = 15)
		PlaySound(4)
		SetSpriteColorAlpha(1, 127)
		SetSpriteColorGreen(1, 20*player[6])
	endif
	if(player[7] = 1)
		SetSpriteColorAlpha(1, 255)
	endif
	player[7] = player[7] - 1
endif
