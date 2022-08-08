curSel = 0
function onCreate()
    initSaveData('vsGhostyShop')
    makeLuaSprite('ShopBG', 'titleBG', 0, 0)
    addLuaSprite('ShopBG', false)
    setObjectCamera('ShopBG', 'other')
    setTextSize('coinCounter', 36)
    addLuaText('coinCounter', true)
    setObjectCamera('coinCounter', 'other')
    makeLuaSprite('dahard', 'shopImages/dahard', 435, 200)
    addLuaSprite('dahard', true)
    setObjectCamera('dahard', 'other')
    makeLuaSprite('candy', 'shopImages/candy', 435, 200)
    addLuaSprite('candy', true)
    setObjectCamera('candy', 'other')
    makeLuaSprite('emergency', 'shopImages/emergency', 435, 200)
    addLuaSprite('emergency', true)
    setObjectCamera('emergency', 'other')
end

function onStartCountdown()
    return Function_Stop;
end

function onUpdate()
    if keyPressed('space') then
        setDataFromSave('vsGhostyShop', 'daHardUnlock', 0)
        setDataFromSave('vsGhostyShop', 'candyUnlock', 0)
        setDataFromSave('vsGhostyShop', 'coin', 0)
        flushSaveData('vsGhostyShop')
        loadSong('despair')
    end

    if keyPressed('escape') then
        endSong()
    end

    setTextString('coinCounter', 'Soul Coins: ' .. getDataFromSave('vsGhostyShop', 'coin'))

    if keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'daHardUnlock') == 0 and getDataFromSave('vsGhostyShop', 'coin') >= 500 and curSel == 0 then
        setDataFromSave('vsGhostyShop', 'daHardUnlock', 1)
        setDataFromSave('vsGhostyShop', 'coin', getDataFromSave('vsGhostyShop', 'coin') - 500)
        flushSaveData('vsGhostyShop')
        loadSong('dahard')
    elseif keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'daHardUnlock') == 1 and curSel == 0 then
        loadSong('dahard')
    end

    if keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'candyUnlock') == 0 and getDataFromSave('vsGhostyShop', 'coin') >= 750 and curSel == 1 then
        setDataFromSave('vsGhostyShop', 'candyUnlock', 1)
        setDataFromSave('vsGhostyShop', 'coin', getDataFromSave('vsGhostyShop', 'coin') - 750)
        flushSaveData('vsGhostyShop')
        loadSong('candy')
    elseif keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'candyUnlock') == 1 and curSel == 1 then
        loadSong('candy')
    end

    if keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'emergencyUnlock') == 0 and getDataFromSave('vsGhostyShop', 'coin') >= 800 and curSel == 2 then
        setDataFromSave('vsGhostyShop', 'emergencyUnlock', 1)
        setDataFromSave('vsGhostyShop', 'coin', getDataFromSave('vsGhostyShop', 'coin') - 2150)
        flushSaveData('vsGhostyShop')
        loadSong('emergency')
    elseif keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'emergencyUnlock') == 1 and curSel == 2 then
        loadSong('emergency')
    end

    if curSel == 0 then
        setProperty('dahard.visible', true)
        setProperty('candy.visible', false)
        setProperty('emergency.visible', false)
    end
    if curSel == 1 then
        setProperty('dahard.visible', false)
        setProperty('candy.visible', true)
        setProperty('emergency.visible', false)
    end
    if curSel == 2 then
        setProperty('dahard.visible', false)
        setProperty('candy.visible', false)
        setProperty('emergency.visible', true)
    end

    if keyJustPressed('left') and curSel > 0 then
        curSel = curSel - 1
        --setProperty('dahard.visible', false)
        playSound('scrollMenu', 2, 'move')
    end
    if keyJustPressed('right') and curSel < 2 then
        curSel = curSel + 1
        --setProperty('dahard.visible', false)
        playSound('scrollMenu', 2, 'move')
    end
end
