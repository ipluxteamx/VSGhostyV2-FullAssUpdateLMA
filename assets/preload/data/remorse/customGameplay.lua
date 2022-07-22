function onCreatePost()
	--Script by ProgramerGamerZone, or GamerZone for short. ty ily no homo
	--CONFIG

	RotateScreen = false --Rotates screen, pretty self explanatory.
	NotesRotate = false --Rotates notes, also pretty self explanatory.
	NotesMove = false --Notes move randomly from left to right, and from right to left.
	FlashStuff = false --Makes stuff flash (dissappear and appear again).
	FunColors = false --Every beat colors change, pretty nice effect.
	
	--END OF CONFIG

	--these are not part of the config but you can change them I guess
	CamAngleChange = -0.2
	NoteAngleChange = -0.2
	AlphaChange = 1
end

function onUpdatePost()
	if RotateScreen then
		doTweenAngle(math.random(1,3840934), 'camHUD', CamAngleChange, 1, 'cubic');
		doTweenAngle(math.random(1,3840934), 'camGame', CamAngleChange, 1, 'cubic');
		--doTweenAngle(math.random(1,3840934), 'camOther', CamAngleChange, 1, 'cubic');
	end

	if NotesRotate then
		noteTweenAngle(math.random(1,3840934), 0, NoteAngleChange, 1, 'cubic')
		noteTweenAngle(math.random(1,3840934), 1, NoteAngleChange, 1, 'cubic')
		noteTweenAngle(math.random(1,3840934), 2, NoteAngleChange, 1, 'cubic')
		noteTweenAngle(math.random(1,3840934), 3, NoteAngleChange, 1, 'cubic')
		noteTweenAngle(math.random(1,3840934), 4, NoteAngleChange, 1, 'cubic')
		noteTweenAngle(math.random(1,3840934), 5, NoteAngleChange, 1, 'cubic')
		noteTweenAngle(math.random(1,3840934), 6, NoteAngleChange, 1, 'cubic')
		noteTweenAngle(math.random(1,3840934), 7, NoteAngleChange, 1, 'cubic')
	end
	if NotesMove then
		noteTweenX(math.random(1,3840934), 0, defaultOpponentStrumX0+math.random(-60,60), 1, 'cubic')
		noteTweenX(math.random(1,3840934), 1, defaultOpponentStrumX1+math.random(-60,60), 1, 'cubic')
		noteTweenX(math.random(1,3840934), 2, defaultOpponentStrumX2+math.random(-60,60), 1, 'cubic')
		noteTweenX(math.random(1,3840934), 3, defaultOpponentStrumX3+math.random(-60,60), 1, 'cubic')
		noteTweenX(math.random(1,3840934), 4, defaultPlayerStrumX0+math.random(-60,60), 1, 'cubic')
		noteTweenX(math.random(1,3840934), 5, defaultPlayerStrumX1+math.random(-60,60), 1, 'cubic')
		noteTweenX(math.random(1,3840934), 6, defaultPlayerStrumX2+math.random(-60,60), 1, 'cubic')
		noteTweenX(math.random(1,3840934), 7, defaultPlayerStrumX3+math.random(-60,60), 1, 'cubic')
	end

	if FlashStuff then
		doTweenAlpha(math.random(1,3840934), 'camHUD', AlphaChange, 0.2, 'cubic');
		--doTweenAlpha(math.random(1,3840934), 'camGame', AlphaChange, 0.2, 'cubic'); this one is too flashy
		--doTweenAlpha(math.random(1,3840934), 'camOther', AlphaChange, 0.2, 'cubic');
		noteTweenAlpha(math.random(1,3840934), 4, AlphaChange, 0.2, 'cubic')
		noteTweenAlpha(math.random(1,3840934), 5, AlphaChange, 0.2, 'cubic')
		noteTweenAlpha(math.random(1,3840934), 6, AlphaChange, 0.2, 'cubic')
		noteTweenAlpha(math.random(1,3840934), 7, AlphaChange, 0.2, 'cubic')
		noteTweenAlpha(math.random(1,3840934), 0, AlphaChange, 0.2, 'cubic')
		noteTweenAlpha(math.random(1,3840934), 1, AlphaChange, 0.2, 'cubic')
		noteTweenAlpha(math.random(1,3840934), 2, AlphaChange, 0.2, 'cubic')
		noteTweenAlpha(math.random(1,3840934), 3, AlphaChange, 0.2, 'cubic')
	end

	CamAngleChange = CamAngleChange-math.random(0.1,1)
	NoteAngleChange = NoteAngleChange-math.random(2,4)
	AlphaChange = math.random(0,1)
end

function onBeatHit()
	if FunColors then
		randomColor = math.random(1,16)
		if randomColor == 1 then
			coolColorTween('CFD5D6')
		elseif randomColor == 2 then
			coolColorTween('E06101')
		elseif randomColor == 3 then
			coolColorTween('A9309F')
		elseif randomColor == 4 then
			coolColorTween('2489C7')
		elseif randomColor == 5 then
			coolColorTween('F1AF15')
		elseif randomColor == 6 then
			coolColorTween('5EA918')
		elseif randomColor == 7 then
			coolColorTween('D5658F')
		elseif randomColor == 8 then
			coolColorTween('373A3E')
		elseif randomColor == 9 then
			coolColorTween('7D7D73')
		elseif randomColor == 10 then
			coolColorTween('157788')
		elseif randomColor == 11 then
			coolColorTween('64209C')
		elseif randomColor == 12 then
			coolColorTween('2D2F8F')
		elseif randomColor == 13 then
			coolColorTween('603C20')
		elseif randomColor == 14 then
			coolColorTween('495B24')
		elseif randomColor == 15 then
			coolColorTween('8E2121')
		elseif randomColor == 16 then
			coolColorTween('080A0F')
		end
	end
end

function coolColorTween(color)
	doTweenColor(math.random(1,3840934), 'boyfriend', color, 0.00000001, 'linear')
	doTweenColor(math.random(1,3840934), 'gf', color, 0.00000001, 'linear')
	doTweenColor(math.random(1,3840934), 'dad', color, 0.00000001, 'linear')
	doTweenColor(math.random(1,3840934), 'iconP1', color, 0.00000001, 'linear')
	doTweenColor(math.random(1,3840934), 'iconP2', color, 0.00000001, 'linear')
	doTweenColor(math.random(1,3840934), 'healthBar', color, 0.00000001, 'linear')
end
