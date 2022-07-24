easingstyle = "sineInOut"

function onEvent(name, value1, value2)
	if name == 'BacknForth' then
		for i = value1, 1, -1 do
			notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
			notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
			notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
			notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
			notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
			notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
			notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
			notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')
	
			noteTweenX("0", 0, (notePosX0 + 635), 2, easingstyle)
			noteTweenX("02", 1, (notePosX1 + 635), 2, easingstyle)
			noteTweenX("03", 2, (notePosX2 + 635), 2, easingstyle)
			noteTweenX("04", 3, (notePosX3 + 635), 2, easingstyle)
			noteTweenX("05", 4, (notePosX4 - 635), 2, easingstyle)
			noteTweenX("06", 5, (notePosX5 - 635), 2, easingstyle)
			noteTweenX("07", 6, (notePosX6 - 635), 2, easingstyle)
			noteTweenX("08", 7, (notePosX7 - 635), 2, easingstyle)
		end
	end
end

function onTweenCompleted(tag)
	notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	if tag == "0" then
		noteTweenX("1", 0, (notePosX0 - 635), 2, easingstyle)
		noteTweenX("12", 1, (notePosX1 - 635), 2, easingstyle)
		noteTweenX("13", 2, (notePosX2 - 635), 2, easingstyle)
		noteTweenX("14", 3, (notePosX3 - 635), 2, easingstyle)

		noteTweenX("15", 4, (notePosX4 + 635), 2, easingstyle)
		noteTweenX("16", 5, (notePosX5 + 635), 2, easingstyle)
		noteTweenX("17", 6, (notePosX6 + 635), 2, easingstyle)
		noteTweenX("18", 7, (notePosX7 + 635), 2, easingstyle)
	end
	if tag == "1" then
		noteTweenX("0", 0, (notePosX0 + 635), 2, easingstyle)
		noteTweenX("02", 1, (notePosX1 + 635), 2, easingstyle)
		noteTweenX("03", 2, (notePosX2 + 635), 2, easingstyle)
		noteTweenX("04", 3, (notePosX3 + 635), 2, easingstyle)

		noteTweenX("05", 4, (notePosX4 - 635), 2, easingstyle)
		noteTweenX("06", 5, (notePosX5 - 635), 2, easingstyle)
		noteTweenX("07", 6, (notePosX6 - 635), 2, easingstyle)
		noteTweenX("08", 7, (notePosX7 - 635), 2, easingstyle)
	end
end