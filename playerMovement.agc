
if((GetRawKeyState(68) and player[3] < 10) and (GetRawKeyState(83) and player[4] < 10))
	// down + right
	player[3] = player[3] + player[5]
	player[4] = player[4] + player[5]
elseif((GetRawKeyState(68) and player[3] < 10) and (GetRawKeyState(87) and player[4] > -10))
	// up + right
	player[3] = player[3] + player[5]
	player[4] = player[4] - player[5]
elseif((GetRawKeyState(65) and player[3] > -10) and (GetRawKeyState(83) and player[4] < 10))
	// down + left
	player[3] = player[3] - player[5]
	player[4] = player[4] + player[5]
elseif((GetRawKeyState(65) and player[3] > -10) and (GetRawKeyState(87) and player[4] > -10))
	// up + left
	player[3] = player[3] - player[5]
	player[4] = player[4] - player[5]
elseif(GetRawKeyState(68) and player[3] < 15)
	// right
	player[3] = player[3] + player[5]
elseif(GetRawKeyState(65) and player[3] > -15)
	// left
	player[3] = player[3] - player[5]
elseif(GetRawKeyState(83) and player[4] < 15)
	// down
	player[4] = player[4] + player[5]
elseif(GetRawKeyState(87) and player[4] > -15)
	// up
	player[4] = player[4] - player[5]
endif


if(player[1] < 280)
	player[1] = 280
endif
if(player[2] < 230)
	player[2] = 230
endif
if(player[1] > GetSpriteWidth(1000) - 370)
	player[1] = GetSpriteWidth(1000) - 370
endif
if(player[2] > GetSpriteHeight(1000) - 320)
	player[2] = GetSpriteHeight(1000) - 320
endif



if(player[3] > 0)
	player[3] = player[3] - 1
elseif(player[3] < 0)
	player[3] = player[3] + 1
endif



if(player[4] > 0)
	player[4] = player[4] - 1
elseif(player[4] < 0)
	player[4] = player[4] + 1
endif



player[1] = player[1] + player[3]
player[2] = player[2] + player[4]



SetSpritePosition(1, player[1], player[2])

