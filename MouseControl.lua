scriptId = 'com.thalmic.examples.mousecontrol'
scriptTitle = "My First Script"
scriptDetailsUrl = ""

mouseEnabled = false 
myo.setLockingPolicy("none")
function onForegroundWindowChange(app, title)	-- determine if the script should be active , fires every time a new app is in the foregound 
	myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
	return true
end

-- function conditionallySwapWave(pose)
-- 	if myo.getArm() == "left" then
-- 		if pose == "waveIn" then 
-- 			pose == "waveOut"	
-- 		elseif pose == "waveOut" then 
-- 			pose == "waveIn"
-- 		end
-- 	end
-- 	return pose
-- end 

function onPoseEdge(pose, edge) 		-- detecting the poses 
	myo.debug("onPoseEdge: " ..pose..": " ..edge)

	-- pose = conditionallySwapWave(pose)

	if(edge == "on") then 
		if(pose == "waveOut") then 
			onWaveOut()
		elseif(pose == "waveIn") then 
			onWaveIn()
		elseif(pose == "fist") then 
			onFist()
		elseif(pose == "fingersSpread") then
			onFingersSpread()
		elseif(pose == "doubleTap") then 
			onDoubleTap()
		end 
	end 
end
-- myo.keyboard(keyname, edge, modifiers) edge --> down, up or press 


function onWaveOut()
	myo.debug("scrollDown")
	myo.mouseScrollBy(20)
	--myo.keyboard("tab", "press") 
end

function onWaveIn()
	myo.debug("ScrollUp")
	myo.mouseScrollBy(-20)
	--myo.keyboard("tab", "press", "shift") 
end

function onFist()
	myo.debug("Enter")
	myo.keyboard("return", "press") 
end

function onFingersSpread()
	myo.debug("Left Click")
	myo.mouse("left","click")
	--myo.debug("Escape")
	--myo.keyboard("escape", "press") 
end

function onDoubleTap()
	myo.debug("ToggleMouse")
	mouseEnabled = not mouseEnabled
	myo.controlMouse(mouseEnabled)
end
