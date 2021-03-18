/**************************************************************
                Buu's Base Sliding Dust Effect
https://github.com/buu342/GMod-BuuBaseRedone
**************************************************************/


/*-----------------------------
    Init
    Initializes the effect
    @Param Effect data
-----------------------------*/

function EFFECT:Init(data)
    // Initialize the effect with the effect data
	self.Ent = data:GetEntity()
	
    // Store some variables with our position and direction
	self.Position = data:GetOrigin()
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	
    // Ensure the player exists exists
	if (!IsValid(self.Ent) || self.Ent:GetOwner() == nil) then return end
	
    // Create the dust effect itself
	local AddVel = self.Ent:GetVelocity()
	local emitter = ParticleEmitter(self.Position)
    local particle = emitter:Add("particle/particle_smokegrenade", self.Position)
    particle:SetVelocity(30*self.Forward + 64*VectorRand() + AddVel)
    particle:SetDieTime(math.Rand(1, 2))
    particle:SetStartAlpha(math.Rand(30, 60))
    particle:SetStartSize(math.random(4, 24))
    particle:SetEndSize(math.Rand(9, 12))
    particle:SetRoll(math.Rand(180, 480))
    particle:SetRollDelta(math.Rand(-1, 1))
    particle:SetColor(230, 200, 200)
    particle:SetAirResistance(140)

    // Kill the emitter
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