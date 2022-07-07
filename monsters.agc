
for i = 0 to 5
	if(olhos[i, 3] > -1)
		olhos[i,2] = ATan2(player[2]-olhos[i,1], player[1]-olhos[i,0])
		olhos[i,0] = olhos[i,0] + Random(2,2*game[0])*cos(olhos[i,2])
		olhos[i,1] = olhos[i,1] + Random(2,2*game[0])*sin(olhos[i,2])
		SetSpritePosition(i+3, olhos[i,0], olhos[i,1])
		
		if(GetSpriteCollision(1, i+3) and player[7] <= 0)
			player[6] = player[6] - 1
			player[7] = 15
			if(player[6] = 0)
				game[0] = 1
				player[6] = 10
				SetSpriteColorGreen(1, 255)
				
				olhos[0,0] = 280 // x
				olhos[0,1] = 230 // y
				olhos[0,3] = olhosHp // hp
				
				olhos[1,0] = 280 // x
				olhos[1,1] = GetSpriteHeight(1000) - 280 // y
				olhos[1,3] = olhosHp // hp
				
				olhos[2,0] = GetSpriteWidth(1000)/2 // x
				olhos[2,1] = 230 // y
				olhos[2,3] = olhosHp // hp
				
				olhos[3,0] = GetSpriteWidth(1000)/2 // x
				olhos[3,1] = GetSpriteHeight(1000) - 280 // y
				olhos[3,3] = olhosHp // hp
				
				olhos[4,0] = GetSpriteWidth(1000) - 350 // x
				olhos[4,1] = 230 // y
				olhos[4,3] = olhosHp // hp
				
				olhos[5,0] = GetSpriteWidth(1000) - 350 // x
				olhos[5,1] = GetSpriteHeight(1000) - 280 // y
				olhos[5,3] = olhosHp // hp

				SetSpriteColorRed(1000, game[0]*8)
				player[1] = GetVirtualWidth() - GetSpriteWidth(1)/2 // x
				player[2] = GetVirtualHeight() - GetSpriteHeight(1)/2 + 30 // y
				PlaySound(8)
				game[0] = 0
			endif
		endif
		
		if(GetSpriteCollision(2, i+3) and player[7] <= 0 and attack[1])
			PlaySound(5)
			olhos[i, 3] = olhos[i, 3] - 1
			attack[1] = 0
			olhos[i,0] = olhos[i,0] - Random(15,75)*cos(olhos[i,2])
			olhos[i,1] = olhos[i,1] - Random(15,75)*sin(olhos[i,2])
		endif
		if(olhos[i, 3] = 0)
			PlaySound(6, 70)
			SetSpriteColorAlpha(i+3, 127)
			olhos[i, 3] = -1
		else
			SetSpriteColorAlpha(i+3, 255)
		endif
	endif
next i

if(olhos[0,3] <= -1 and olhos[1,3] <= -1 and olhos[2,3] <= -1 and olhos[3,3] <= -1 and olhos[4,3] <= -1 and olhos[5,3] <= -1)
	olhos[0,0] = 280 // x
	olhos[0,1] = 230 // y
	olhos[0,3] = olhosHp // hp
	
	olhos[1,0] = 280 // x
	olhos[1,1] = GetSpriteHeight(1000) - 280 // y
	olhos[1,3] = olhosHp // hp
	
	olhos[2,0] = GetSpriteWidth(1000)/2 // x
	olhos[2,1] = 230 // y
	olhos[2,3] = olhosHp // hp
	
	olhos[3,0] = GetSpriteWidth(1000)/2 // x
	olhos[3,1] = GetSpriteHeight(1000) - 280 // y
	olhos[3,3] = olhosHp // hp
	
	olhos[4,0] = GetSpriteWidth(1000) - 350 // x
	olhos[4,1] = 230 // y
	olhos[4,3] = olhosHp // hp
	
	olhos[5,0] = GetSpriteWidth(1000) - 350 // x
	olhos[5,1] = GetSpriteHeight(1000) - 280 // y
	olhos[5,3] = olhosHp // hp
	
	if(game[0] > game[1])
		game[1] = game[0]
	endif
	game[0] = game[0] + 1
	SetSpriteColorRed(1000, game[0]*12)
	player[1] = GetVirtualWidth() - GetSpriteWidth(1)/2 // x
	player[2] = GetVirtualHeight() - GetSpriteHeight(1)/2 + 30 // y
	PlaySound(7)
endif
