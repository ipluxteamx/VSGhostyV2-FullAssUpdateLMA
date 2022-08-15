-- SCRIPT BY TKTEMS
-- STOP USING MY SCRIPTS AND CALLING THEM YOURS PLEASE

local arrayNumber = 0;
local creditsRemoved = false;

local songArrays = {
	{song = 'Despair', composer = 'iplux', spriters = 'iplux and Jilthr33', charters = 'iplux, ThatMomentWhen'},
	{song = 'Disturbance', composer = 'iplux', spriters = 'iplux and Jilthr33', charters = 'iplux, ThatMomentWhen'},
	{song = 'Anger', composer = 'iplux (Inspired by 2Hot)', spriters = 'iplux and Jilthr33', charters = 'iplux'},
	{song = 'Fantomatique', composer = 'iplux', spriters = 'iplux', charters = 'iplux'},
	{song = 'Another It', composer = 'iplux', spriters = 'iplux and Samy', charters = 'iplux'},
	{song = 'Happening', composer = 'iplux', spriters = 'iplux and Samy', charters = 'iplux'},
	{song = 'Boss Battle', composer = 'iplux', spriters = 'iplux and Samy', charters = 'iplux'},
	{song = 'Opening', composer = 'iplux', spriters = 'iplux and Samy', charters = 'iplux'},
	{song = 'Portal', composer = 'iplux', spriters = 'iplux', charters = 'iplux'},
	{song = 'Remorse', composer = 'iplux', spriters = 'iplux', charters = 'iplux'}
}

function onCreate()
	for i = 1, #(songArrays) do
		if songName == songArrays[i].song then
			arrayNumber = i
		end
	end

	makeLuaSprite('bg', '', 0, (downscroll and -70 or 730))
	makeGraphic('bg', 1280, 70, '000000')
	setObjectCamera('bg', 'other');
	setProperty('bg.alpha', 0.5)
	addLuaSprite('bg')

	if arrayNumber == 0 then
		setProperty('bg.alpha', 0)
	end

	makeLuaText('creditsText', songArrays[arrayNumber].song .. " by " .. songArrays[arrayNumber].composer .. (songArrays[arrayNumber].spriters == '' and '' or " | Sprites by ".. songArrays[arrayNumber].spriters) .. (songArrays[arrayNumber].charters == '' and '' or " | Chart by " .. songArrays[arrayNumber].charters), 0, 0, (downscroll and -20 or 730));
	setTextBorder('creditsText', 2, '000000');
	setTextSize('creditsText', 20);
	screenCenter('creditsText', 'X')
	addLuaText('creditsText');
	setObjectCamera('creditsText', 'other');
end

function onSongStart()
	doTweenY('aumddCredits', 'creditsText', (downscroll and 5 or 690), 0.3, 'elasticOut')
	doTweenY('addCreditBG', 'bg', (downscroll and -35 or 685), 0.3, 'elasticOut')
end

function onUpdate()
	if hits == 1 and not creditsRemoved then
		doTweenY('removeCredits', 'creditsText', (downscroll and -20 or 730), 0.3, 'elasticIn')
		doTweenY('removeCreditBG', 'bg', (downscroll and -70 or 725), 0.3, 'elasticIn')
		creditsRemoved = true
	end
end