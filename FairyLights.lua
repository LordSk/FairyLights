function Initialize()
	lightSwitch = false
	lightsOff = {}
	lightsOn = {}
	lightNum = 13
	
	for i = 1, lightNum do
		lightsOff[#lightsOff + 1] = SKIN:GetMeter('MeterLightOff'..i)
		lightsOff[#lightsOff]:Show()
		
		lightsOn[#lightsOn + 1] = SKIN:GetMeter('MeterLightOn'..i)
		lightsOn[#lightsOn]:Hide()
	end
end

function Update()
	lightSwitch = not lightSwitch
	
	for i = 1, lightNum do
		if lightSwitch then
			lightsOn[i]:Show()
			lightsOff[i]:Hide()
		else
			lightsOn[i]:Hide()
			lightsOff[i]:Show()
		end
	end
end

