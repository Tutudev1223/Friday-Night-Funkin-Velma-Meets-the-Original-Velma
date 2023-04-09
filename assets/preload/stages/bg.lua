local x = 800+500;
local y = 200;
local x2 = 470+500;
local y2 = 250;
local followchars = true;

function onCreate()
	makeLuaSprite('bg3','bg3',600,0)
	setGraphicSize('bg3', getProperty('bg3.width') * 1.4);
	addLuaSprite('bg3')

	makeLuaSprite('bg2','bg2',600,0)
	setGraphicSize('bg2', getProperty('bg2.width') * 1.4);
	addLuaSprite('bg2')

	makeLuaSprite('bg1','bg1',100,0)
	setGraphicSize('bg1', getProperty('bg1.width') * 1.5);
	addLuaSprite('bg1')

	makeLuaSprite('hudlight','hudlight',0,0)
	setObjectCamera('hudlight', 'camother')
	setBlendMode('hudlight', 'screen')
	addLuaSprite('hudlight')
	setObjectOrder('hudlight', 3)

	makeLuaSprite('hudvingette','hudvingette',0,0)
	setObjectCamera('hudvingette', 'camother')
	addLuaSprite('hudvingette')
	setObjectOrder('hudvingette', 4)

	makeLuaSprite('hpBar','hpBar',50,0)
	setObjectCamera('hpBar', 'camHUD')
	setObjectOrder('hpBar', 1)
	setObjectOrder('healthBar', 2)

	makeLuaSprite('credits','credits',-290,0)
	setObjectCamera('credits', 'camother')
	addLuaSprite('credits')
	
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'dead');

	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'blood'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder

end

function onBeatHit()
	if curBeat == 1 then
		doTweenX('cr1', 'credits', 0, 1, 'circOut')
	end
	if curBeat == 9 then
		doTweenX('cr2', 'credits', -290, 1, 'circIn')
	end
	if curBeat == 128 then
		setProperty('bg2.visible', true)
		setProperty('bg3.visible', false)
		setProperty('bg1.visible', false)

		triggerEvent('Change Character', 'dad', 'scoobshow')
		triggerEvent('Change Character', 'boyfriend', 'scoobshow')
		cameraFlash('game', 'FFFFFF', crochet / 1000)

		setProperty('boyfriend.visible', false)
		setProperty('dad.visible', true)
		setProperty('bg1.visible', false)
	end
	
	if curBeat == 192 then
		setProperty('bg3.visible', true)
		setProperty('bg1.visible', false)
		setProperty('bg2.visible', false)
		
		triggerEvent('Change Character', 'dad', 'ogs')
		triggerEvent('Change Character', 'boyfriend', 'ogv')
		cameraFlash('game', 'FFFFFF', crochet / 1000)
	end
	
	if curBeat == 320 then
		setProperty('bg3.visible', false)
		setProperty('bg1.visible', false)
		setProperty('bg2.visible', true)
		
		triggerEvent('Change Character', 'dad', 'scoobshow')
		triggerEvent('Change Character', 'boyfriend', 'scoobshow')
		cameraFlash('game', 'FFFFFF', crochet / 1000)
		
		setProperty('boyfriend.visible', false)
	end
	if curBeat == 524 then
		cameraFlash('HUD', 'FFFFFF', crochet / 1000)
		
		setProperty('camGame.visible', false)
	end
end

function onCreatePost()
	addCharacterToList('scoobshow', 'dad')
	addCharacterToList('scoobshow', 'boyfriend')
	addCharacterToList('ogv', 'boyfriend')
	addCharacterToList('ogs', 'dad')
	if not middleScroll then
        setPropertyFromGroup('opponentStrums', 0, 'x', -5000);
        setPropertyFromGroup('opponentStrums', 1, 'x', -5000);
        setPropertyFromGroup('opponentStrums', 2, 'x', -5000);
        setPropertyFromGroup('opponentStrums', 3, 'x', -5000);

        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 320);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 320);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 320);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 320);
	end
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
end

function onUpdate(elapsed)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.angle', 90)
	setProperty('healthBar.x', 902)
	setProperty('healthBar.y', screenHeight / 2 - 45)
	setHealthBarColors('000000', 'FFFFFF')
	setProperty('healthbarBG.alpha', 0)
	setProperty('healthBar.scale.y', 5)


	if dadName == 'scooblack' then
		setCharacterX('dad', x)
		setCharacterY('dad', y)
	end
	if dadName == 'scoobshow' then
		setCharacterX('dad', x)
		setCharacterY('dad', y)
	end
	if boyfriendName == 'scoobshow' then
		setCharacterX('boyfriend', x2)
		setCharacterY('boyfriend', y2)
	end
	if dadName == 'ogs' then
		setCharacterX('dad', 1200)
		setCharacterY('dad', 300)
	end
	if boyfriendName == 'velmashow' then
		setCharacterX('boyfriend', x2)
		setCharacterY('boyfriend', y2)
	end
	if boyfriendName == 'ogv' then
		setCharacterX('boyfriend', 2000)
		setCharacterY('boyfriend', 250)
	end
end