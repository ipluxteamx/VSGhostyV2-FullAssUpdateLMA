function onCreate()
	-- background shit
	makeLuaSprite('ghostyHouse', 'ghostyHouse', -450, -225);
	setLuaSpriteScrollFactor('ghostyHouse', 1, 1);
	scaleObject('ghostyHouse', 1.25, 1.25);
	
	addLuaSprite('ghostyHouse', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end