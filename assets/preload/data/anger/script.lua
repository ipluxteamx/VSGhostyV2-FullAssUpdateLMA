local defaultNotePos = {};
local arrowMoveX = 14;

--function onSongStart()
--	for i = 0,7 do
---		x = getPropertyFromGroup('strumLineNotes', i, 'x')
--		y = getPropertyFromGroup('strumLineNotes', i, 'y')
--	end
--bumpArrow(5, 80, 50);
--end

function onUpdate(elapsed)
	local songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	local things = {total = 3, current = 0, varNames = {}}
	local varValues = {8,2,8,5}
	
	for i = 0,3 do
		if not inGameOver then
			setPropertyFromGroup('strumLineNotes',i,'alpha',0.5)
			setPropertyFromGroup('strumLineNotes',i,'y', defaultPlayerStrumY0 + 175 - 30*math.sin((currentBeat * 8 + i) * 0.25)*math.pi)
		end
	end
	
	--ghosty strumnotes
	--noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - 20*math.sin((currentBeat+8*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - 20*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - 20*math.sin((currentBeat+8*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - 20*math.sin((currentBeat+5*0.25)*math.pi), 0.5)

	--for i = 0,7 do
	--	setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
	--end
end

function lerp(a, b, t)
	return a + (b - a) * t
end







