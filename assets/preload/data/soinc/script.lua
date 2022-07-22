local u = 0

local beettween = 1
local beet = false

function onUpdate(elapsed)
    if beet then
		setProperty('camGame.zoom',beettween)
		setProperty('camHUD.zoom',((beettween/3)-1/3)+1)
	end

	if beettween > 1 then
		beettween = beettween - 0.02
	end
	
end

function onBeatHit()

	if beet then
		beettween = 1.2
	end
end

function onMoveCamera(c)

	if c == 'dad' then
		setProperty('defaultCamZoom',1.075)
	else
		setProperty('defaultCamZoom',1.2)
	end

end