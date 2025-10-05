/**************************************************************
                 Buu's Base Muzzleflash Effect
https://github.com/buu342/GMod-BuuBaseRedone
**************************************************************/


/*-----------------------------
    Init
    Initializes the effect
    @Param Effect data
-----------------------------*/

function EFFECT:Init(data)
    -- Initialize the effect with the effect data
    self:SetRenderMode(RENDERMODE_TRANSALPHA)
    self.WeaponEnt = data:GetEntity()
    self.Attachment = data:GetAttachment()
    
    -- Store some variables with our positio and direction
    self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
    self.Forward = data:GetNormal()
    self.Angle = self.Forward:Angle()
    self.Right = self.Angle:Right()

    -- Ensure the weapon exists
    if (!IsValid(self.WeaponEnt) || self.WeaponEnt:GetOwner() == nil) then return end
    
    -- Create the muzzle effect itself
    local AddVel = self.WeaponEnt:GetOwner():GetVelocity()
    local emitter = ParticleEmitter(self.Position)
    for i=1,2 do 
        local particle = emitter:Add("effects/muzzleflash"..math.random(1,4), self.Position)
        particle:SetVelocity(Vector(0, 0, 0)+AddVel)
        particle:SetDieTime(0.1)
        particle:SetStartAlpha(255)
        particle:SetEndAlpha(math.Rand(0, 255))
        particle:SetStartSize(1*i)
        particle:SetEndSize(7*i)
        particle:SetRoll(math.Rand(180, 480))
        particle:SetRollDelta(math.Rand(-1, 1))
        particle:SetColor(255, 255, 255)
        particle:SetAirResistance(160)
    end

    -- Create smoke from the muzzleflash
    for i=1,3 do 
        local particle = emitter:Add("particle/particle_smokegrenade", self.Position)
        particle:SetVelocity(Vector(math.random(-20,20),math.random(-20,20),math.random(-20,20)))
        particle:SetDieTime(math.Rand(0.5,1))
        particle:SetStartAlpha(math.Rand(50,155))
        particle:SetStartSize(math.random(0.5,1)*i)
        particle:SetEndSize(math.Rand(2,3)*i)
        particle:SetRoll(math.Rand(180,480))
        particle:SetRollDelta(math.Rand(-1,1))
        particle:SetColor(200,200,200)
        particle:SetAirResistance(140)
    end
    
    -- Kill the emitter
    emitter:Finish()
end


/*-----------------------------
    Think
    Handles effect logic every tick
    @Return Whether the effect should live
-----------------------------*/

function EFFECT:Think()
    return false
end


/*-----------------------------
    Render
    Renders the effect
-----------------------------*/

function EFFECT:Render()
end