/**************************************************************
            Buu's Base Silenced Muzzleflash Effect
https://github.com/buu342/GMod-BuuBaseRedone
**************************************************************/


/*-----------------------------
    Init
    Initializes the effect
    @Param Effect data
-----------------------------*/

function EFFECT:Init(data)
    -- Initialize the effect with the effect data
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	
    -- Store some variables with our position and direction
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	
    -- Ensure the weapon exists
	if (!IsValid(self.WeaponEnt) || self.WeaponEnt:GetOwner() == nil) then return end
    
    -- Create the smoke effect itself
	local AddVel = self.WeaponEnt:GetOwner():GetVelocity()
	local emitter = ParticleEmitter(self.Position)
	for i=1,3 do 
		local particle = emitter:Add("particle/particle_smokegrenade", self.Position)
		particle:SetVelocity(10*i*self.Forward + 8*VectorRand() + AddVel)
		particle:SetDieTime(math.Rand(1, 2))
		particle:SetStartAlpha(math.Rand(30, 60))
		particle:SetStartSize(math.random(1, 2)*i)
		particle:SetEndSize(math.Rand(3, 4)*i)
		particle:SetRoll(math.Rand(180, 480))
		particle:SetRollDelta(math.Rand(-1, 1))
		particle:SetColor(200, 200, 200)
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