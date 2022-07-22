
-- function onCreate()
-- 	makeLuaSprite('bg','dmbg',-343.15, -295.45)
-- 	addLuaSprite('bg',false)
	
-- end


function onCreatePost()
    setPropertyFromClass("openfl.Lib", "application.window.title", "Last Straw.")
end

function onStepHit()
    if curStep % 4 == 0 then
        doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
        doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
    end
    if curStep % 4 == 2 then
        doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
        doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
    end
end

function onUpdate(elapsed)
    songPos = getSongPosition()
    local curentbea = (songPos/5000)*(curBpm/60)
    
    -- if curStep >= 768 and curStep <= 1264 then 
    if curStep >= 768 then
        local shitStuffX = ((screenWidth - 675) - (20 / 2)) + (math.sin((curentbea * 3) + 0) * 350)
        local shitStuffY = ((screenHeight / 2.5) - (20 / 2)) + (math.cos((curentbea * 3) + 0) * 50)

        local variable = 0
        
        for i = 0,3 do
            variable = variable + 1.5
            setPropertyFromGroup('strumLineNotes',i,'alpha',0.15)
            setPropertyFromGroup('strumLineNotes',i,'x',(shitStuffX - (20 / 2)) + (math.sin((curentbea * 3) + variable * 8) * 250))
            setPropertyFromGroup('strumLineNotes',i,'y',(shitStuffY - (20 / 2)) + (math.sin((curentbea * 3) + variable) * 250))
        end

        for i = 4,7 do
            --create variable that increments by 1.5 each turn and starts by being 0
            variable = variable + 1.5
            setPropertyFromGroup('strumLineNotes',i,'x',(shitStuffX - (20 / 2)) + (math.sin((curentbea * 3) + variable * 16) * 100))
            setPropertyFromGroup('strumLineNotes',i,'y',(shitStuffY - (20 / 2)) + (math.sin((curentbea * 3) + variable) * 100))
        end

        for i = 0,7 do
            --setPropertyFromGroup('playerStrums', 4, 'direction', 200)
            setPropertyFromGroup('strumLineNotes',i,'y', defaultPlayerStrumY0 + 175 - 45*math.sin((currentBeat * 8 + i) * 0.25)*math.pi)
        end


        --noteTweenX('defaultPlayerStrumX0', 4, (shitStuffX - (20 / 2)) + (math.sin((curentbea * 3) + 0) * 100), 0.001)
        --noteTweenX('defaultPlayerStrumX1', 5, (shitStuffX - (20 / 2)) + (math.sin((curentbea * 3) + 1.5) * 100), 0.001)
        --noteTweenX('defaultPlayerStrumX2', 6, (shitStuffX - (20 / 2)) + (math.sin((curentbea * 3) + 3) * 100), 0.001)
        --noteTweenX('defaultPlayerStrumX3', 7, (shitStuffX - (20 / 2)) + (math.sin((curentbea * 3) + 4.5) * 100), 0.001)
        --noteTweenY('defaultPlayerStrumY0', 4, (shitStuffY - (20 / 2)) + (math.cos((curentbea * 3) + 0) * 100), 0.001)
        --noteTweenY('defaultPlayerStrumY1', 5, (shitStuffY - (20 / 2)) + (math.cos((curentbea * 3) + 1.5) * 100), 0.001)
        --noteTweenY('defaultPlayerStrumY2', 6, (shitStuffY - (20 / 2)) + (math.cos((curentbea * 3) + 3) * 100), 0.001)
        --noteTweenY('defaultPlayerStrumY3', 7, (shitStuffY - (20 / 2)) + (math.cos((curentbea * 3) + 4.5) * 100), 0.001)

        --noteTweenAlpha('defaultoStrumAlpha0', 0, 0, 0.007)
        --noteTweenAlpha('defaultoStrumAlpha1', 1, 0, 0.007)
        --noteTweenAlpha('defaultoStrumAlpha2', 2, 0, 0.007)
        --noteTweenAlpha('defaultoStrumAlpha3', 3, 0, 0.007)
    end

    -- if curStep >= 1264 then
        -- noteTweenAlpha('defaultpStrumAlpha0', 4, 0, 0.007)
        -- noteTweenAlpha('defaultpStrumAlpha1', 5, 0, 0.007)
        -- noteTweenAlpha('defaultpStrumAlpha2', 6, 0, 0.007)
        -- noteTweenAlpha('defaultpStrumAlpha3', 7, 0, 0.007)
    -- end

    if curStep >= 0 then
    	doTweenY(dadTweenY, 'dad', 300-110*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
end

function onBeatHit()
    if curBeat % 1 == 0 then
		setProperty('defaultCamZoom', 0.8);
    end
end

