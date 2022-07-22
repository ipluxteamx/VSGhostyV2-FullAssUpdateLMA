curSel = 0
function onCreate()
    initSaveData('vsGhostyShop')
    makeLuaSprite('ShopBG', 'titleBG', 0, 0)
    addLuaSprite('ShopBG', false)
    setObjectCamera('ShopBG', 'other')
    setTextSize('coinCounter', 36)
    addLuaText('coinCounter', true)
    setObjectCamera('coinCounter', 'other')
    makeAnimatedLuaSprite('shopImages', 'shopImages/shopImages', 435, 200)
    addLuaSprite('shopImages', true)
    setObjectCamera('shopImages', 'other')
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

    setTextString('coinCounter', 'Soul Coins: ' .. getDataFromSave('vsGhostyShop', 'coin'))

    if keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'daHardUnlock') == 0 and getDataFromSave('vsGhostyShop', 'coin') >= 1550 and curSel == 0 then
        setDataFromSave('vsGhostyShop', 'daHardUnlock', 1)
        setDataFromSave('vsGhostyShop', 'coin', getDataFromSave('vsGhostyShop', 'coin') - 1550)
        flushSaveData('vsGhostyShop')
        loadSong('dahard')
    elseif keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'daHardUnlock') == 1 and curSel == 0 then
        loadSong('dahard')
    end

    if keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'candyUnlock') == 0 and getDataFromSave('vsGhostyShop', 'coin') >= 2150 and curSel == 1 then
        setDataFromSave('vsGhostyShop', 'candyUnlock', 1)
        setDataFromSave('vsGhostyShop', 'coin', getDataFromSave('vsGhostyShop', 'coin') - 2150)
        flushSaveData('vsGhostyShop')
        loadSong('candy')
    elseif keyJustPressed('accept') and getDataFromSave('vsGhostyShop', 'candyUnlock') == 1 and curSel == 1 then
        loadSong('candy')
    end

    if curSel == 0 then
        objectPlayAnimation('shopImages', 'dahard', true)
    end
    if curSel == 1 then
        objectPlayAnimation('shopImages', 'candy', true)
    end

    if keyJustPressed('left') and curSel > 0 then
        curSel = curSel - 1
        --setProperty('dahard.visible', false)
        playSound('scrollMenu', 2, 'move')
    end
    if keyJustPressed('right') and curSel < 1 then
        curSel = curSel + 1
        --setProperty('dahard.visible', false)
        playSound('scrollMenu', 2, 'move')
    end
end
