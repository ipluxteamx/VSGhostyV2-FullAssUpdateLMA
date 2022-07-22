function onCreate()
	-- background shit
	makeLuaSprite('bgGod', 'bgGod', -2800, -5000);
	setLuaSpriteScrollFactor('bgGod', 0.9, 0.9);
	scaleObject('bgGod', 10, 10);
	
	makeLuaSprite('groundGod', 'groundGod', -600, 600);
	setLuaSpriteScrollFactor('groundGod', 1, 1);
	scaleObject('groundGod', 1.8, 1.8);

	addLuaSprite('bgGod', false);
	addLuaSprite('groundGod', false);
	
	addGlitchEffect('bgGod', 0.025);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end