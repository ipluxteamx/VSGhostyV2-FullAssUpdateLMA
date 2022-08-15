local allowCountdown = false
easingstyle = "sineInOut"

function onCreate()
	setProperty('skipCountdown', true)
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onUpdate(elapsed)
	local songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	local things = {total = 3, current = 0, varNames = {}}
	
	for i = 0,3 do
		if not inGameOver then
			setPropertyFromGroup('strumLineNotes',i,'alpha',0.5)
			setPropertyFromGroup('strumLineNotes',i,'y', defaultPlayerStrumY0 - 15*math.sin((currentBeat+i*0.25)*math.pi))
		end
	end


	--noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - 20*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - 20*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - 20*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - 20*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY4', 4, defaultPlayerStrumY4 - 20*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY5', 5, defaultPlayerStrumY5 - 20*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY6', 6, defaultPlayerStrumY6 - 20*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY7', 7, defaultPlayerStrumY7 - 20*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
	--noteTweenY('defaultOpponentStrumY8', 8, defaultPlayerStrumY8 - 20*math.sin((currentBeat+8*0.25)*math.pi), 0.5)
	
	--noteTweenY('defaultPlayerStrumY9', 9, defaultPlayerStrumY0 - 20*math.sin((currentBeat+9*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY10', 10, defaultPlayerStrumY1 - 20*math.sin((currentBeat+10*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY11', 11, defaultPlayerStrumY2 - 20*math.sin((currentBeat+11*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY12', 12, defaultPlayerStrumY3 - 20*math.sin((currentBeat+12*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY13', 13, defaultPlayerStrumY4 - 20*math.sin((currentBeat+13*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY14', 14, defaultPlayerStrumY5 - 20*math.sin((currentBeat+14*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY15', 15, defaultPlayerStrumY6 - 20*math.sin((currentBeat+15*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY16', 16, defaultPlayerStrumY7 - 20*math.sin((currentBeat+16*0.25)*math.pi), 0.5)
	--noteTweenY('defaultPlayerStrumY17', 17, defaultPlayerStrumY8 - 20*math.sin((currentBeat+17*0.25)*math.pi), 0.5)
end

function onGameOver()
	exit()
end