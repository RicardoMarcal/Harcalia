
// Olhos
dim olhos[6,4]
olhosHp = 3
CreateSprite(3, 3)
olhos[0,0] = 280 // x
olhos[0,1] = 230 // y
olhos[0,3] = olhosHp // hp
CreateSprite(4, 3)
olhos[1,0] = 280 // x
olhos[1,1] = GetSpriteHeight(1000) - 280 // y
olhos[1,3] = olhosHp // hp
CreateSprite(5, 3)
olhos[2,0] = GetSpriteWidth(1000)/2 // x
olhos[2,1] = 230 // y
olhos[2,3] = olhosHp // hp
CreateSprite(6, 3)
olhos[3,0] = GetSpriteWidth(1000)/2 // x
olhos[3,1] = GetSpriteHeight(1000) - 280 // y
olhos[3,3] = olhosHp // hp
CreateSprite(7, 3)
olhos[4,0] = GetSpriteWidth(1000) - 350 // x
olhos[4,1] = 230 // y
olhos[4,3] = olhosHp // hp
CreateSprite(8, 3)
olhos[5,0] = GetSpriteWidth(1000) - 350 // x
olhos[5,1] = GetSpriteHeight(1000) - 280 // y
olhos[5,3] = olhosHp // hp
