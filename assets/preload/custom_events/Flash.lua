-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Flash' then
		makeLuaSprite('flash', 'FX/flash', -1000, -1000);
		scaleObject('flash', 1580, 1000);
		setLuaSpriteScrollFactor('flash', 0, 0);
		addLuaSprite('flash', true);
		doTweenAlpha('flash', 'flash', 0, 1, 'linear')
		runTimer('flashaway', 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft) 
	if name == 'flashaway' then
		removeLuaSprite('flash', true)
	end
end