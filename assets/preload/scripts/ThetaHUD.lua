function onCreatePost()
  local noteSize = 0.675

    removeLuaScript("custom_events/zCameraFix")
    addLuaScript("custom_events/zCameraFix")
--disable timebar
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false)

--make the timer
    makeLuaText('timer', '', 500, 385, 90)
    setTextAlignment('timer', 'center')
    setTextSize('timer', 28)
    setProperty('timer.visible', false)
    addLuaText('timer')

--make the ratings
    makeLuaText('ratings', ' ', 600, 335, 20)
    setTextAlignment('ratings', 'Center')
    setTextSize('ratings', 16)
    setProperty('ratings.visible', false)
    addLuaText('ratings')

--make score and acc
    makeLuaText('score-n-acc', '', 500, 375, 615)
    setTextAlignment('score-n-acc', 'right')
    setTextSize('score-n-acc', 18)
    setProperty('score-n-acc.visible', false)
    addLuaText('score-n-acc')

  --make song title
    makeLuaText('songTitle', (songName), 500, 375, 665)
    setTextAlignment('songTitle', 'right')
    setTextSize('songTitle', 20)
    setProperty('songTitle.visible', false)
    addLuaText('songTitle')

    --downscroll
      if (downscroll) then
        setProperty('timer.y', 610)
        setProperty('ratings.y',  685)
        setProperty('score-n-acc.x', 375)
        setProperty('score-n-acc.y', 105)
        setProperty('songTitle.y', 55)
      end

    --middlescroll
      if (middlescroll and downscroll) then
        setTextAlignment('score-n-acc', 'center')
        setProperty('score-n-acc.x', 400)
        setTextSize('timer', 20)
        setProperty('timer.x', 225)
        setProperty('timer.y', 55)

      elseif (middlescroll) then
        setTextAlignment('score-n-acc', 'center')
        setProperty('score-n-acc.x', 400)
        setTextSize('timer', 20)
        setProperty('timer.x', 245)
        setProperty('timer.y', 665)
      else
        setTextSize('timer', 20)
        setProperty('timer.x', 245)
        setProperty('timer.y', 665)
      end

      for i=0,7 do
        setPropertyFromGroup("strumLineNotes", i, "scale.x", noteSize)
        setPropertyFromGroup("strumLineNotes", i, "scale.y", noteSize)
        setPropertyFromGroup("strumLineNotes", i, "alpha", 0.875)
        setPropertyFromGroup("strumLineNotes", i, "alpha", 0.875)
      end  

      makeLuaSprite('scoreThing', '', getPropertyFromGroup('score-n-acc.y'), 0)
      makeGraphic('scoreThing', screenWidth, getPropertyFromGroup('score-n-acc.height'), '000000')
      setProperty('scoreThing', '.alpha', 0.425)
      setObjectCamera('scoreThing', 'hud')
      addLuaSprite('scoreThing', false)
end

function onSongStart()
    setProperty('timer.visible', true)
    setProperty('ratings.visible', true)
    setProperty('score-n-acc.visible', true)
    setProperty('songTitle.visible', true)
end

function onUpdatePost()
--timer
    local timerX = 385
    local timerY = 150


--getting song length in seconds
    local  timeElapsed = math.floor(getProperty('songTime')/1000)
    local  timeTotal = math.floor(getProperty('songLength')/1000)

--converting seconds into (mm:ss) format
    local timeElapsedFixed = string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60)
    local timeTotalFixed = string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60)

  -- SFC? GFC? FC? SDBC?
    local fcTier = '?'

    if getProperty('sicks') >= 1 and getProperty('goods') == 0 and getProperty('bads') == 0 and getProperty('shits') == 0 and getProperty('songMisses') == 0 then
      fcTier = 'SFC'
    elseif getProperty('goods') >= 1 and getProperty('bads') == 0 and getProperty('shits') == 0 and getProperty('songMisses') == 0 then
      fcTier = 'GFC'
    elseif getProperty('bads') >= 1 and getProperty('songMisses') == 0 then
      fcTier = 'FC'
    elseif getProperty ('shits') >= 1 and getProperty('songMisses') == 0 then
      fcTier = 'FC'
    elseif getProperty('songMisses') >= 1 and getProperty('songMisses') < 10 then
      fcTier = 'SDBC'
    elseif getProperty('songMisses') >= 10 then
      fcTier = 'Clear'
    else
      fcTier = '?'
    end


--timer
    setTextString('timer', timeElapsedFixed .. ' / ' .. timeTotalFixed)


--rating counter
    setTextString('ratings', 'Sicks: ' .. getProperty('sicks') .. ' | ' .. 'Goods: ' .. getProperty('goods') .. ' | ' .. 'Bads: ' .. getProperty('bads') .. ' | ' .. 'Shits: ' .. getProperty('shits') .. ' | ' .. 'Misses: ' .. getProperty('songMisses'))

--formatting acc with 2 decimals

-- score n accuracy
    setTextString('score-n-acc', 'Score: ' .. score .. ' | ' .. 'Accuracy: ' .. string.format("%.2f%%", rating * 100) .. ' ' .. '(' .. fcTier .. ')')



--icons and time
	setProperty('iconP1.x', screenWidth - 430)
	setProperty('iconP2.x', 285)
end