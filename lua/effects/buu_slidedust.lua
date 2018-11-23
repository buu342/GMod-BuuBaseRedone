

function EFFECT:Init(data)
	
	self.Ent = data:GetEntity()
	
	self.Position = data:GetOrigin()
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	
	if !(IsValid(self.Ent) && self.Ent:GetOwner() != nil) then return end
	local AddVel = self.Ent:GetVelocity()
	
	local emitter = ParticleEmitter(self.Position)
		
    local particle = emitter:Add("particle/particle_smokegrenade", self.Position)
    particle:SetVelocity(30*self.Forward + 64*VectorRand() + AddVel)
    particle:SetDieTime(math.Rand(1,2))
    particle:SetStartAlpha(math.Rand(30,60))
    particle:SetStartSize(math.random(4,24))
    particle:SetEndSize(math.Rand(9,12))
    particle:SetRoll(math.Rand(180,480))
    particle:SetRollDelta(math.Rand(-1,1))
    particle:SetColor(230,200,200)
    particle:SetAirResistance(140)

	emitter:Finish()

end


function EFFECT:Think()

	return false
	
end


function EFFECT:Render()

	
end



