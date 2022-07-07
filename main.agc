
// Project: Harcalia 
// Created: 2022-04-12

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Harcalia" )
SetWindowSize( 1366, 768 , 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1366, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts



// SPRITES E IMAGENS



LoadImage(1000, "bg.jpg")
ResizeImage(1000, 1366*2, 768*2)
CreateSprite(1000, 1000)


LoadImage(1, "sword.png")
ResizeImage(1, 80, 80)
CreateSprite(1, 1)

LoadImage(2, "ball.png")
ResizeImage(2, 24, 24)
CreateSprite(2, 2)

LoadImage(3, "olho.png")
ResizeImage(3, 100, 60)



// MÚSICAS E SONS
LoadSound(1, "shoot.wav")
LoadSound(2, "tp.wav")
LoadSound(3, "chirp.wav")
LoadSound(4, "dmg.wav")
LoadSound(5, "hit.wav")
LoadSound(6, "eyedeath.wav")
LoadSound(7, "shift.wav")
LoadSound(8, "cassino_loss.wav")

LoadMusicOGG(1, "nocturne.ogg")
LoadMusicOGG(2, "anfitras.ogg")



// JOGO
dim game[3]
game[0] = 0 // wave
game[1] = 0 // record
game[2] = 90 // menu color
SetSpriteColorRed(1000, game[0]*10)


// CAMERA
dim camera[2]
camera[0] = 0 // cameraX
camera[1] = 0 // cameraY



// PLAYER
dim player[8]
player[0] = 0 // mouseAngle
player[1] = GetVirtualWidth() - GetSpriteWidth(1)/2 // x
player[2] = GetVirtualHeight() - GetSpriteHeight(1)/2 + 30 // y
player[3] = 0 // xSpd
player[4] = 0 // ySpd
player[5] = 5 // acceleration
player[6] = 10 // HP
player[7] = 0 // Invul
player[8] = 0 // TP Cooldown



// ATAQUE
dim attack[6]
attack[0] = 0 // cooldown
attack[1] = 0 // attActive
attack[2] = 0 // attX
attack[3] = 0 // attY
attack[4] = 0 // attXSpd
attack[5] = 0 // attYSpd



// INIMIGOS
#insert "monstersInit.agc"


//MENU
LoadImage(1001, "menu.jpg")



do
	if(game[0] = 0)
		CreateSprite(1001, 1001)
		SetSpriteVisible(1000, 0)
		game[0] = -1
		StopMusicOGG(1)
		PlayMusicOGG(2, 1)
		player[3] = 0 // xSpd
		player[4] = 0 // ySpd
		SetViewOffset(0, 0)
	endif
	
	if(game[0] = -1)
		game[2] = game[2] + 1
		SetSpriteColorRed(1001, 127*(1+sin(game[2])))
		if(GetRawMouseLeftState() = 1)
			DeleteSprite(1001)
			SetSpriteVisible(1000, 1)
			game[0] = 1
			StopMusicOGG(2)
			PlayMusicOGG(1, 1)
		endif
	endif
	
	if(game[0] > 0)
		#insert "playerMovement.agc"
		#insert "mouse.agc"
		#insert "camera.agc"
		#insert "monsters.agc"
		#insert "player.agc"
		
		printC(" Estabilidade (HP): ")
		print(player[6])
		printC(" Divergência (Wave): ")
		print(game[0])
	endif
		printC(" Record: ")
		print(game[1])
	
    Sync()
loop
