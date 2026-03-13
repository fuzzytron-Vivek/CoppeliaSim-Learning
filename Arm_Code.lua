sim = require'sim'
--lets begin nice and smooth 
function sysCall_thread()
    --lets get the joints and initialize them 
    local jointHandles = {}
    for i=1,6,1 do
        jointHandles[i] = sim.getObject('../joint',{index = i-1})
        end 
    --next lets predefine acceleration , velocity and jerk values required for the movement 
    local vel = 100
    local acc = 40
    local jerk = 80
    --lets now set values of maxAccel , maxVel, and maxJerk for each of the joints for passing them into the moveToConfig function 
    local maxAccel = {acc*math.pi/180,acc*math.pi/180,acc*math.pi/180,acc*math.pi/180,acc*math.pi/180,acc*math.pi/180}
    local maxVel = {vel*math.pi/180,vel*math.pi/180,vel*math.pi/180,vel*math.pi/180,vel*math.pi/180,vel*math.pi/180}
    local maxJerk = {jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180}
    --lets predefine poses for our arm 
    local home ={0,0,0,0,0,0}
    local pick={90,50,50,-20,-90,0}
    local drop={-180,-50,-50,20,90,0} 
    --local p3={90,90,60,70,80,0}
    --lets create a helper function to convert these pose values into radians 
    local function ToRad(pose)
        r = {}
        for i=1 , #pose , 1 do 
            r[i]=pose[i]*math.pi/180
        end 
        return r
    end
    --now the since the preparation for all the values to be used in the moveToConfig function are ready , lets shoot
    while true do 
        sim.moveToConfig({joints = jointHandles,maxAccel = maxAccel , maxVel = maxVel , maxJerk = maxJerk , targetPos = ToRad(home)})
        sim.moveToConfig({joints = jointHandles,maxAccel = maxAccel , maxVel = maxVel , maxJerk = maxJerk , targetPos = ToRad(pick)})
        sim.setIntegerSignal('gripperCommand' , 1)
        sim.wait(10)
        sim.moveToConfig({joints = jointHandles,maxAccel = maxAccel , maxVel = maxVel , maxJerk = maxJerk , targetPos = ToRad(drop)})
        sim.setIntegerSignal('gripperCommand',0)
        sim.wait(10)
        --sim.moveToConfig({joints = jointHandles,maxAccel = maxAccel , maxVel = maxVel , maxJerk = maxJerk , targetPos = ToRad(p3)})
        sim.moveToConfig({joints = jointHandles,maxAccel = maxAccel , maxVel = maxVel , maxJerk = maxJerk , targetPos = ToRad(home)})
        
        --sim.moveToConfig({joints = jointHandles,maxAccel = maxAccel , maxVel = maxVel , maxJerk = maxJerk , targetPos = ToRad(p1)})
        
    end
end 
        
        
        