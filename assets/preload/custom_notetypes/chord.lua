function onCreate()
    -- creates object for bf ghost
    makeAnimatedLuaSprite("pgchord","PG_RunningFromTaxes_Body",0,0)
    addAnimationByIndices("pgchord","singLEFT","PG_Left_Run","0,1,2,3,4,5,6,7",24) --replace PG_Left_Run with desired xml animation for singLEFT, if you know how, i also reccomend switching to addAnimationByPrefix  
    addAnimationByIndices("pgchord","singDOWN","PG_Down_Run","0,1,2,3,4,5,6,7",24) --replace PG_Down_Run with desired xml animation for singDOWN
    addAnimationByIndices("pgchord","singUP","PG_Up_Run","0,1,2,3,4,5,6,7",24) --replace PG_Up_Run with desired xml animation for singUP
    addAnimationByIndices("pgchord","singRIGHT","PG_Right_Run","0,1,2,3,4,5,6,7",24) --replace PG_Right_Run with desired xml animation for singRIGHT

    -- creates object for dad ghost
    makeAnimatedLuaSprite("tkchord","TKK_Run",getProperty("dad.x") - 200,getProperty("dad.y") + 20) -- replace x and y pos with dad x and y
    addAnimationByPrefix("tkchord","singLEFT","TKK_Left",24,false) --replace TKK_Left with desired xml animation for singLEFT
    addAnimationByPrefix("tkchord","singDOWN","TKK_Down",24,false) --ditto, but down
    addAnimationByPrefix("tkchord","singUP","TKK_UP",24,false) --ditto, but up
    addAnimationByPrefix("tkchord","singRIGHT","TKK_Right",24,false) -- ditto, but right
end

function onCreatePost()

    addLuaSprite("pgchord",true) -- replace true with false if you want ghost to appear behind bf
    scaleObject("pgchord",1.5,1.5) -- replace 1.5 with bf char's scale in json
    setProperty("pgchord.alpha",0)

    addLuaSprite("tkchord",false) -- replace false with true if you want ghost to appear behind dad
    scaleObject("tkchord",1.5,1.5) -- replace 1.5 with dad char's scale in json
    setProperty("tkchord.alpha",0)

    for i = 0, getProperty('unspawnNotes.length')-1 do

        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'chord' then

            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

        end

    end

end

function onUpdate()
    
    if getProperty("boyfriend.animation.curAnim.name") == "singLEFT" then
        setProperty("pgchord.x",getProperty("boyfriend.x") + 236) -- replace "+ 236" with animation offset x for p1 singLEFT *-1
        setProperty("pgchord.y",getProperty("boyfriend.y") + 126) -- ditto, but for y
    elseif getProperty("boyfriend.animation.curAnim.name") == "singDOWN" then
        setProperty("pgchord.x",getProperty("boyfriend.x") + 275) -- ditto, but for singDOWN
        setProperty("pgchord.y",getProperty("boyfriend.y") + 177)
    elseif getProperty("boyfriend.animation.curAnim.name") == "singUP" then
        setProperty("pgchord.x",getProperty("boyfriend.x") + 313) -- ditto, but for singUP
        setProperty("pgchord.y",getProperty("boyfriend.y") + 100)
    elseif getProperty("boyfriend.animation.curAnim.name") == "singRIGHT" then
        setProperty("pgchord.x",getProperty("boyfriend.x") + 301) -- ditto, but for singRIGHT
        setProperty("pgchord.y",getProperty("boyfriend.y") + 155)
    end

    -- UNCOMMENT AND ADD OFFSETS FOR DAD

    --[[
    if getProperty("dad.animation.curAnim.name") == "singLEFT" then
        setProperty("tkchord.x",getProperty("dad.x"))
        setProperty("tkchord.y",getProperty("dad.y"))
    elseif getProperty("dad.animation.curAnim.name") == "singDOWN" then
        setProperty("tkchord.x",getProperty("dad.x"))
        setProperty("tkchord.y",getProperty("dad.y"))
    elseif getProperty("dad.animation.curAnim.name") == "singUP" then
        setProperty("tkchord.x",getProperty("dad.x"))
        setProperty("tkchord.y",getProperty("dad.y"))
    elseif getProperty("dad.animation.curAnim.name") == "singRIGHT" then
        setProperty("tkchord.x",getProperty("dad.x"))
        setProperty("tkchord.y",getProperty("dad.y"))
    end
    ]]

end

-- below is just code to play animations

function goodNoteHit(id, direction, noteType, isSustain)

    if noteType == "chord" then

        if direction == 0 then
            playAnim("pgchord","singLEFT",true)
            setProperty("pgchord.alpha",0.5)
            doTweenAlpha("pgchordfade","pgchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 1 then
            playAnim("pgchord","singDOWN",true)
            setProperty("pgchord.alpha",0.5)
            doTweenAlpha("pgchordfade","pgchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 2 then
            playAnim("pgchord","singUP",true)
            setProperty("pgchord.alpha",0.5)
            doTweenAlpha("pgchordfade","pgchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 3 then
            playAnim("pgchord","singRIGHT",true)
            setProperty("pgchord.alpha",0.5)
            doTweenAlpha("pgchordfade","pgchord",0,crochet / 1000 * 2,"expoOut")
        end

    end

end

function opponentNoteHit(id, direction, noteType, isSustain)

    if noteType == "chord" then

        if direction == 0 then
            playAnim("tkchord","singLEFT",true)
            setProperty("tkchord.alpha",0.25)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 1 then
            playAnim("tkchord","singDOWN",true)
            setProperty("tkchord.alpha",0.25)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 2 then
            playAnim("tkchord","singUP",true)
            setProperty("tkchord.alpha",0.25)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 3 then
            playAnim("tkchord","singRIGHT",true)
            setProperty("tkchord.alpha",0.25)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        end

    end

end