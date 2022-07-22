function onCreatePost()
    addVCREffect('camGame');
    addVCREffect('camHUD', false);
end

function onUpdate(elapsed)
	if curBeat>1 then
		songPos = getSongPosition()
		local currentBeat = (songPos / 1000)*(bpm / 60)
		for i = 0, 3
			do noteTweenX(defaultPlayerStrumX..i, i + 4, (defaultPlayerStrumX + i) + 20 * math.sin((currentBeat + i * 0.25) * math.pi), 0.1)
		end
	end
end