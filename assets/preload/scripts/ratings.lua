function onCreate()
	makeAnimatedLuaSprite("ratings","rating",1050.1,460);
	addLuaSprite("ratings",true);
	setScrollFactor('ratings',0,0);
	setObjectCamera('ratings','hud');
	scaleObject('ratings', 0.65, 0.65);
	
	--animações
	
	addAnimationByPrefix('ratings','rating0000','rating0000',24,true);
	addAnimationByPrefix('ratings','rating0001','rating0001',24,true);
	addAnimationByPrefix('ratings','rating0002','rating0002',24,true);
	addAnimationByPrefix('ratings','rating0003','rating0003',24,true);
	addAnimationByPrefix('ratings','rating0004','rating0004',24,true);
	addAnimationByPrefix('ratings','rating0005','rating0005',24,true);
	addAnimationByPrefix('ratings','rating0006','rating0006',24,true);
	
end

function onUpdate()
	if rating >= 1 then
		--doTweenX('whtwx', 'ratings', 1070.1, 0.1, 'linear');
		--doTweenY('whtwy', 'ratings', 525.2, 0.1, 'linear');

        objectPlayAnimation('ratings','rating0000',false)
    elseif rating >= 0.98 then
		--doTweenX('Stwx', 'ratings', 1070.1, 0.1, 'linear');
		--doTweenY('Stwy', 'ratings', 525.2, 0.1, 'linear');

        objectPlayAnimation('ratings','rating0006',false)
    elseif rating >= 0.90 then
		--doTweenX('Atwx', 'ratings', 1085.1, 0.1, 'linear');
		--doTweenY('Atwy', 'ratings', 540.2, 0.1, 'linear');

		objectPlayAnimation('ratings','rating0005',false)
    elseif rating >= 0.80 then
		--doTweenX('Btwx', 'ratings', 1085.1, 0.1, 'linear');
		--doTweenY('Btwy', 'ratings', 540.2, 0.1, 'linear');

		objectPlayAnimation('ratings','rating0004',false)
    elseif rating >= 0.70 then
		--doTweenX('Ctwx', 'ratings', 1085.1, 0.1, 'linear');
		--doTweenY('Ctwy', 'ratings', 540.2, 0.1, 'linear');

		objectPlayAnimation('ratings','rating0003',false)
    elseif rating >= 0.35 then
		--doTweenX('Dtwx', 'ratings', 1085.1, 0.1, 'linear');
		--doTweenY('Dtwy', 'ratings', 540.2, 0.1, 'linear');

		objectPlayAnimation('ratings','rating0002',false)
    elseif rating <= 0.20 then
		--doTweenX('Etwx', 'ratings', 1085.1, 0.1, 'linear');
		--doTweenY('Etwy', 'ratings', 540.2, 0.1, 'linear');

		objectPlayAnimation('ratings','rating0000',false)
	end
end

function onBeatHit()
    -- triggered 2 times per section
    if curBeat % 1 == 0 then
        setProperty('ratings.angle', 10);
        doTweenAngle('bip', 'ratings', 0,0.25,'cubicOut');
    end
    -- triggered 4 times per section
    if curBeat % 2 == 0 then
        setProperty('ratings.angle', -10);
        doTweenAngle('bip', 'ratings', 0,0.25,'cubicOut');
    end
end