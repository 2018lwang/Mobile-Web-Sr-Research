scriptId = 'com.thalmic.examples.canvascontrol'
scriptTitle = "Canvas Control"
scriptDetailsUrl = ""

mouseEnabled = false 
downEnabled = false
myo.setLockingPolicy("none")
function onForegroundWindowChange(app, title)	-- determine if the script should be active , fires every time a new app is in the foregound 
	myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
	return true
end

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
	myo.debug("Scroll Down")
	myo.mouseScrollBy(20)
	--myo.keyboard("tab", "press") 
end

function onWaveIn()	--undo
	myo.debug("Scroll Up")
	myo.mouseScrollBy(-20)
	--myo.keyboard("tab", "press", "shift") 
end

function onFist()
	myo.debug("Toggle Mouse")
	mouseEnabled = not mouseEnabled
	myo.controlMouse(mouseEnabled)
	-- myo.keyboard("return", "press") 
end

function onFingersSpread()
	myo.debug("Hold Left Click")
	downEnabled = not downEnabled
	if (downEnabled) then
		myo.mouse("left","down")
	else
		myo.mouse("left","up")
	end 
	--myo.debug("Escape")
	--myo.keyboard("escape", "press") 
end

function onDoubleTap()
	myo.debug("Left Click")
	myo.mouse("left", "click")
	-- myo.centerMousePosition()
	-- myo.presentationPointer(mouseEnabled, false)
	-- myo.centerPresentationPointer()
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
