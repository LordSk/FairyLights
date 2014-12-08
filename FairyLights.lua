function clamp(val, min , max)
	if val < min then
		return min
	elseif val > max then
		return max
	end
	return val
end

function Initialize()
	math.randomseed(os.time())
	
	lightsOff = {}
	lightsOn = {}
	lightNum = 13
	
	for i = 1, lightNum do
		lightsOff[#lightsOff + 1] = SKIN:GetMeter('MeterLightOff'..i)
		lightsOff[#lightsOff]:Show()
		
		lightsOn[#lightsOn + 1] = SKIN:GetMeter('MeterLightOn'..i)
		lightsOn[#lightsOn]:Hide()
	end
	
	-- Light patterns
	patterns = {}
	patterns[1] = {
		{1,1,1,1,1,1,1,1,1,1,1,1,1},
		{0,0,0,0,0,0,0,0,0,0,0,0,0},
		{1,1,1,1,1,1,1,1,1,1,1,1,1},
		{0,0,0,0,0,0,0,0,0,0,0,0,0},
	}
	patterns[2] = {
		{0,1,0,1,0,1,0,1,0,1,0,1,0},
		{1,0,1,0,1,0,1,0,1,0,1,0,1},
		{0,1,0,1,0,1,0,1,0,1,0,1,0},
		{1,0,1,0,1,0,1,0,1,0,1,0,1},
	}
	patterns[3] = {
		{1,1,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,1,1,0,0,0,0,0,1,1,1,1},
		{1,1,1,1,1,1,0,1,1,1,1,1,1},
		{1,1,1,1,1,1,1,1,1,1,1,1,1},
		{0,0,0,0,0,0,0,0,0,0,0,0,0},
	}
	
	patternCur = 1
	lightPatternOptn = SELF:GetNumberOption('LightPattern', 0)
	pattChosen = clamp(lightPatternOptn, 1, #patterns)
	
	-- random pattern
	if lightPatternOptn == 0 then
		pattChosen = math.random(1, #patterns)
	end
end

function Update()
	for i = 1, lightNum do
		if patterns[pattChosen][patternCur][i] == 1 then
			lightsOn[i]:Show()
			lightsOff[i]:Hide()
		else
			lightsOn[i]:Hide()
			lightsOff[i]:Show()
		end
	end
	
	-- Current pattern ended
	if lightPatternOptn == 0 and patternCur == #patterns[pattChosen] then
		pattChosen = math.random(1, #patterns)
		patternCur = 1
	else
		patternCur = patternCur%#patterns[pattChosen] + 1
	end
end

