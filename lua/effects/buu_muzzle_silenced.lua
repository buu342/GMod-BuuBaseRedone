

function EFFECT:Init(data)
	
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	
	local AddVel = self.WeaponEnt:GetOwner():GetVelocity()
	
	local emitter = ParticleEmitter(self.Position)
		
	for i=1,3 do 
		local particle = emitter:Add("particle/particle_smokegrenade", self.Position)
		particle:SetVelocity(50*i*self.Forward + 8*VectorRand() + AddVel)
		particle:SetDieTime(math.Rand(0.28,0.34))
		particle:SetStartAlpha(math.Rand(30,60))
		particle:SetStartSize(math.random(0.01,0.02)*i)
		particle:SetEndSize(math.Rand(3,5)*i)
		particle:SetRoll(math.Rand(180,480))
		particle:SetRollDelta(math.Rand(-1,1))
		particle:SetColor(200,200,200)
		particle:SetAirResistance(140)
	end

	emitter:Finish()

end


function EFFECT:Think()

	return false
	
end


function EFFECT:Render()

	
end



