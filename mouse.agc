
// ATan((GetRawMouseY()-GetSpriteY(1))/(GetRawMouseX()-GetSpriteX(1)))

player[0] = ATan2(GetPointerY()-GetVirtualHeight()/2, GetPointerX()-GetVirtualWidth()/2)
SetSpriteAngle(1, player[0] + 45)

if(GetRawMouseLeftState() = 1 and attack[0] <= 0)
	attack[1] = 1
	attack[0] = 12
	PlaySound(1, 50)
	attack[2] = getSpriteX(1) - 12 + GetSpriteWidth(1)/2 + 52*cos(player[0])
	attack[3] = getSpriteY(1) - 12 + GetSpriteHeight(1)/2 + 52*sin(player[0])
	attack[4] = 35*cos(player[0])
	attack[5] = 35*sin(player[0])
endif

if(GetRawMouseRightState() = 1)
	if(player[8] <= 0)
		player[8] = 20 - game[0]/3
		PlaySound(2, 50)
		player[1] = player[1] + GetPointerX() - GetVirtualWidth()/2
		player[2] = player[2] + GetPointerY() - GetVirtualHeight()/2
	endif
endif
if(player[8] > 0)
	player[8] = player[8] - 1
	SetSpriteColorBlue(1, 255)
	if(player[8] = 1)
		PlaySound(3)
	endif
else
	SetSpriteColorBlue(1, 127)
endif

if(attack[1])
	SetSpriteVisible(2, 1)
	SetSpritePosition(2, attack[2], attack[3])
	attack[2] = attack[2] + attack[4]
	attack[3] = attack[3] + attack[5]
else
	SetSpriteVisible(2, 0)
	SetSpritePosition(2, 0, 0)
endif


if(attack[0] > 0)
	attack[0] = attack[0] - 1
else
	attack[1] = 0
endif
