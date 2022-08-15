function onCreate()
    -- creates object for dad ghost
    makeAnimatedLuaSprite("tkchord","BOYFRIEND",getProperty("boyfriend.x") - 200,getProperty("boyfriend.y") + 20) -- replace x and y pos with dad x and y
    addAnimationByPrefix("tkchord","singLEFT","BF NOTE LEFT",24,false) --replace TKK_Left with desired xml animation for singLEFT
    addAnimationByPrefix("tkchord","singDOWN","BF NOTE DOWN",24,false) --ditto, but down
    addAnimationByPrefix("tkchord","singUP","BF NOTE UP",24,false) --ditto, but up
    addAnimationByPrefix("tkchord","singRIGHT","BF NOTE RIGHT",24,false) -- ditto, but right
end

function onCreatePost()

    addLuaSprite("tkchord",true) -- replace false with true if you want ghost to appear behind dad
    scaleObject("tkchord",1,1) -- replace 1.5 with dad char's scale in json
    setProperty("tkchord.alpha",0)

    for i = 0, getProperty('unspawnNotes.length')-1 do

        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'chord' then

            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

        end

    end

end

function onUpdate()
    
    if getProperty("boyfriend.animation.curAnim.name") == "singLEFT" then
        setProperty("tkchord.x",getProperty("boyfriend.x") + 236) -- replace "+ 236" with animation offset x for p1 singLEFT *-1
        setProperty("tkchord.y",getProperty("boyfriend.y") + 126) -- ditto, but for y
    elseif getProperty("boyfriend.animation.curAnim.name") == "singDOWN" then
        setProperty("tkchord.x",getProperty("boyfriend.x") + 275) -- ditto, but for singDOWN
        setProperty("tkchord.y",getProperty("boyfriend.y") + 177)
    elseif getProperty("boyfriend.animation.curAnim.name") == "singUP" then
        setProperty("tkchord.x",getProperty("boyfriend.x") + 313) -- ditto, but for singUP
        setProperty("tkchord.y",getProperty("boyfriend.y") + 100)
    elseif getProperty("boyfriend.animation.curAnim.name") == "singRIGHT" then
        setProperty("tkchord.x",getProperty("boyfriend.x") + 301) -- ditto, but for singRIGHT
        setProperty("tkchord.y",getProperty("boyfriend.y") + 155)
    end
end

-- below is just code to play animations

function goodNoteHit(id, direction, noteType, isSustain)

    if noteType == "chord" then

        if direction == 0 then
            playAnim("tkchord","singLEFT",true)
            setProperty("tkchord.alpha",0.5)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 1 then
            playAnim("tkchord","singDOWN",true)
            setProperty("tkchord.alpha",0.5)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 2 then
            playAnim("tkchord","singUP",true)
            setProperty("tkchord.alpha",0.5)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        elseif direction == 3 then
            playAnim("tkchord","singRIGHT",true)
            setProperty("tkchord.alpha",0.5)
            doTweenAlpha("tkchordfade","tkchord",0,crochet / 1000 * 2,"expoOut")
        end

    end

end