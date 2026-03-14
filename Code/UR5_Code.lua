sim=require'sim'

-- This is a threaded script, and is just an example!

function sysCall_thread()
    local jointHandles = {}
    for i=1,6,1 do 
        jointHandles[i]= sim.getObject('../joint',{index=i-1})
    end
    
    --setting local velocities , accelerations and jerk values 
    local vel = 100
    local acc = 40 
    local jerk = 80 
    --convert values of v , acc and jerk into radians for all 6 joints 
    local maxVel ={vel*math.pi/180,vel*math.pi/180,vel*math.pi/180,vel*math.pi/180,vel*math.pi/180,vel*math.pi/180}
    local maxAcc ={acc*math.pi/180,acc*math.pi/180,acc*math.pi/180,acc*math.pi/180,acc*math.pi/180,acc*math.pi/180}
    local maxJerk ={jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180,jerk*math.pi/180}
    --set predefined poses to which the bot can go to 
    pose1 = {90,45,-45,90,90,0}
    pose2 ={90,-45,90,0,0,0}
    
    home = {90,60,-60,10,30,0}
    --defining a function to convert angular values of pose into radians 
    function toRad(pose)
        local r = {}
        for i =1 , #pose , 1 do
            r[i] = pose[i]*math.pi/180
            end
        return r 
    end
    --executing every move in a sequence 
    while true do 
    --sim.moveToConfig({joints = jointHandles , maxVel = maxVel , maxAccel = maxAcc , maxJerk = maxJerk , targetPos = toRad(pose1)})
    --sim.moveToConfig({joints = jointHandles , maxVel = maxVel , maxAccel = maxAcc , maxJerk = maxJerk , targetPos = toRad(pose2)})
    sim.moveToConfig({joints = jointHandles , maxVel = maxVel , maxAccel = maxAcc , maxJerk = maxJerk , targetPos = toRad(home)})
        sim.wait(1)
    end 
end 