function onCreate()
	-- background shit
	makeLuaSprite('oh', 'oh', -1000, -300);
	setLuaSpriteScrollFactor('oh', 0.9, 0.9);
	scaleLuaSprite('oh', 1.75, 1.75);
	addLuaSprite('oh', false);
	
	addGlitchEffect('oh', 0.35);
	addVCREffect('camGame', 0.0025);
	addVCREffect('camHUD', 0.001);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end