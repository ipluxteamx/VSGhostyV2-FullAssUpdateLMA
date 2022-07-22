function onCreate()
    initSaveData('vsGhostyShop')

    makeLuaSprite('g', 'shopImages/antipiracy', 0, 0)
    addLuaSprite('g', true)
    setObjectCamera('g', 'other')
    setProperty('g.visible', false)
    scaleObject('g', 0.675, 0.675)
end --among us in real life scary 3 am

function onStartCountdown()
    if getDataFromSave('vsGhostyShop', 'daHardUnlock') == 0 then
        return Function_Stop;
    end
    if getDataFromSave('vsGhostyShop', 'daHardUnlock') == 1 then
        return Function_Continue;
    end
end

function onUpdate()
    if getDataFromSave('vsGhostyShop', 'daHardUnlock') == 0 then
        setProperty('g.visible', true)
    end

    if keyPressed('space') then
        loadSong('shop')
    end
end