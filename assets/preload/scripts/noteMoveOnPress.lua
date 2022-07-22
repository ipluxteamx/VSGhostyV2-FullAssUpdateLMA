local strumLinePlayer
local strumLineOpponent
local sicks
local goods
local bads
local shits
local moveAmount = 20
local tweenAmount = 0.1
function onCreatePost()
    for i = 0, 3 do
        strumLinePlayer = getPropertyFromGroup('strumLineNotes', i + 4, 'y')
        strumLineOpponent = getPropertyFromGroup('strumLineNotes', i, 'y')
    end
    sicks = getProperty("sicks")
    goods = getProperty("goods")
    bads = getProperty("bads")
    shits = getProperty("shits")
end

function onUpdatePost(elapsed)
    if downscroll then
        if sicks then
            moveAmount = 15
        elseif goods then
            moveAmount = 10
        elseif bads then
            moveAmount = 5
        elseif shits then
            moveAmount = 2.5
        end
    elseif not downscroll then
        if sicks then
            moveAmount = 0 - 15
        elseif goods then
            moveAmount = 0 - 10
        elseif bads then
            moveAmount = 0 - 5
        elseif shits then
            moveAmount = 0 - 2.5
        end
    end
    if getPropertyFromClass('PlayState', 'isPixelStage') then
        moveAmount = moveAmount * 1.2
        tweenAmount = 0.01
    else
        moveAmount = moveAmount
        tweenAmount = 0.1
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    for i = 0, 3 do
        if noteData == i and not isSustainNote then
            noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer + moveAmount, tweenAmount, 'circOut')
            runTimer('returnPlayer' .. i, 0.1, 1)
        end
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    for i = 0, 3 do
        if noteData == i and not isSustainNote then
            noteTweenY('moveOpponent' .. i, i, strumLineOpponent + moveAmount, tweenAmount, 'circOut')
            runTimer('returnOpponent' .. i, 0.1, 1)
        end
    end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if prefs.wierdStupidKindaDumb then
    	for i = 0, 3 do
        	if counter == 3 then
            	noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer + moveAmount / 2, tweenAmount, tweenType)
            	noteTweenY('moveOpponent' .. i, i, strumLineOpponent + moveAmount / 2, tweenAmount, tweenType)
        	elseif counter == 4 then
            	runTimer('returnPlayer' .. i, tweenAmount, 1)
            	runTimer('returnOpponent' .. i, tweenAmount, 1)
        	end
    	end
    end
end

function onTimerCompleted(tag, loop, loopsLeft)
    for i = 0, 3 do
        if tag == 'returnPlayer' .. i then
            noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer, tweenAmount, 'circOut')
        elseif tag == 'returnOpponent' .. i then
            noteTweenY('moveOpponent' .. i, i, strumLineOpponent, tweenAmount, 'circOut')
        end
    end
end

function onSongStart()
	if getPropertyFromClass('PlayState', 'chartingMode') then
		debugPrint(Credits.Wip, Credits.ISH52806)
	end
end