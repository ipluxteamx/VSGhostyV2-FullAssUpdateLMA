bruh = 5

function onCreatePost()
	addGlitchEffect('hud', 0.0015, 0.0015)
end

function onUpdatePost()

	setPropertyFromGroup('playerStrums', 1, 'direction', 240)
	setPropertyFromGroup('playerStrums', 2, 'direction', 240)
	setPropertyFromGroup('playerStrums', 3, 'direction', 0)
	setPropertyFromGroup('playerStrums', 4, 'direction', 200)

	setTextString('timeTxt', 'Fak u:bitsh')

end

function onSongStart()

end

function opponentNoteHit(ipiss, piss2, piss3, sus)
    health = getProperty('health')
    setProperty('health', health- 0.005);

    if piss2 == 0 then
        setPropertyFromClass('openfl.Lib','application.window.x', getPropertyFromClass('openfl.Lib','application.window.x')-bruh)
    elseif piss2 == 1 then
        setPropertyFromClass('openfl.Lib','application.window.y', getPropertyFromClass('openfl.Lib','application.window.y')+bruh)
    elseif piss2 == 2 then
        setPropertyFromClass('openfl.Lib','application.window.y', getPropertyFromClass('openfl.Lib','application.window.y')-bruh)
    elseif piss2 == 3 then
        setPropertyFromClass('openfl.Lib','application.window.x', getPropertyFromClass('openfl.Lib','application.window.x')+bruh)
    end
end

function onUpdate(elapsed)
	if curStep >= 0 and curStep < 42069 then
		songPos = getSongPosition()
		local curenBea = (songPos/5000)*(curBpm/60)

		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 75*math.sin((curenBea+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 400 + 2000*math.sin((curenBea+8*0.25)*math.pi), 4)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 75*math.sin((curenBea+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 400 + 2000*math.sin((curenBea+8*0.25)*math.pi), 2.5)
		
		if curStep >= 0 and curStep < 25 then
			noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + -50*math.sin((curenBea+4*0.25)*math.pi), 0.5)
			noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 350 - 2000*math.sin((curenBea+8*0.25)*math.pi), 3)
			noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + -50*math.sin((curenBea+4*0.25)*math.pi), 0.5)
			noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 350 - 2000*math.sin((curenBea+8*0.25)*math.pi), 3)
		end
	end
end



