function onCreate()
    initSaveData('vsGhostyShop')
    coin = getDataFromSave('vsGhostyShop', 'coin', 0)

    makeLuaText('coinCounter', 'Soul Coins: 0', 400, 435, 47)
    setTextAlignment('coinCounter', 'center')
    setTextSize('coinCounter', 18)
    setProperty('coinCounter.visible', true)
    addLuaText('coinCounter')
end

function onUpdate()
    setTextString('coinCounter', 'Soul Coins: ' .. getDataFromSave('vsGhostyShop', 'coin'))
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if not botplay then
        coin = coin + math.random(0, 1)
	    setDataFromSave('vsGhostyShop', 'coin', coin)
	    flushSaveData('vsGhostyShop')
    end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
    if coin >= 2 then
        coin = coin - math.random(1, 2)
    end
    setDataFromSave('vsGhostyShop', 'coin', coin)
    flushSaveData('vsGhostyShop')
end

function onGameOver()
    if coin >= 25 then
        coin = coin - 25
    end
    setDataFromSave('vsGhostyShop', 'coin', coin)
    flushSaveData('vsGhostyShop')
    return Function_Continue;
end

