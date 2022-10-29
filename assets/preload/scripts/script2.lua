-- SCRIPT BY TKTEMS
-- STOP USING MY SCRIPTS AND CALLING THEM YOURS PLEASE

local arrayNumber = 0;
local creditsRemoved = false;

local songArrays = {
	{song = 'Odd', composer = 'skyblueanon', spriters = 'skyblueanon', charters = 'cyn-8'},
	{song = 'Unknown Suffering', composer = 'Jhiax', spriters = 'skyblueanon & This is fine', charters = 'niffirg & Alex Director'},
	{song = 'For Hire', composer = 'Pancho', spriters = 'Anonymous & Pancho', charters = 'Pancho & Alex Director'},
	{song = 'Sky Forever', composer = 'bb-panzu', spriters = 'skyblueanon & bb-panzu', charters = 'bb-panzu & Alex Director'},
	{song = 'Skycrack', composer = 'bb-panzu', spriters = 'Meteor A & bb-panzu', charters = 'Alex Director'},
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