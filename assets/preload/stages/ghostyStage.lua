function onCreate()
	-- background shit
	makeLuaSprite('ghostyStage', 'ghostyStage', -600, -200);
	setLuaSpriteScrollFactor('ghostyStage', 1, 1);

	addLuaSprite('ghostyStage', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end