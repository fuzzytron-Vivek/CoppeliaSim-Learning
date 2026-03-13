sim = require'sim'

function sysCall_thread()
    local oc1 = sim.getObject('../openCloseJoint')
    local oc2 = sim.getObject('../openCloseJoint0')

    while true do
        local cmd = sim.getIntegerProperty(sim.handle_scene, 'signal.gripperCommand')

        if cmd == 1 then
            -- close
            sim.setJointTargetVelocity(oc1, -0.02)
            sim.setJointTargetVelocity(oc2, -0.02)
        elseif cmd == 0 then
            -- open
            sim.setJointTargetVelocity(oc1, 0.02)
            sim.setJointTargetVelocity(oc2, 0.02)
        else
            -- no signal yet, stay still
            sim.setJointTargetVelocity(oc1, 0)
            sim.setJointTargetVelocity(oc2, 0)
        end

        sim.wait(0.1)
    end
end