function EFFECT:Init(data)

	self:SetRenderMode( RENDERMODE_TRANSALPHA )
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	self.IsBuuSmokeTrail = true
	
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	
	if !(IsValid(self.WeaponEnt) && self.WeaponEnt:GetOwner() != nil) then return end
	
	self.Particles = {self.Position}
	self.ParCount = 0
	self.Width = 2
	self.Dead = false
	
	self.LifeTime = CurTime()+3
	self.WaitTime = 0.2
	self.NextTime = CurTime()+self.WaitTime
	
end


function EFFECT:Think()
	
	self.Position = self:GetTracerShootPos(self.Position, self.WeaponEnt, self.Attachment)
	if self.Dead == false && self.Particles[1] != nil then
		self.Particles[table.Count(self.Particles)].Pos = self.Position
	end
	
	for k, p in pairs( self.Particles ) do
		if p.Pos != nil then
			p.Pos = p.Pos + p.Vel
			p.Size = p.Size + p.SizeInc
			p.Alpha = p.Alpha - FrameTime()*10
			if p.Alpha < 0 then
				table.remove( self.Particles, 1 )
			end
		end
	end
	
	if !IsValid(self.WeaponEnt) || !IsValid(self.WeaponEnt:GetOwner()) || !IsValid(self.WeaponEnt:GetOwner():GetActiveWeapon()) then return end
	if self.LifeTime > CurTime() && self.WeaponEnt:GetOwner():GetActiveWeapon() == self.WeaponEnt then
		if self.NextTime < CurTime() then
			local p = {}
				p.Pos = self.Position
				p.Vel = Vector(math.Rand(-0.025,0.025),math.Rand(-0.025,0.025),0.1)
				p.Size = 0.3
				p.SizeInc = 0.01
				p.Alpha = 50
			table.insert( self.Particles, p )
			table.insert( self.Particles, p )
			self.ParCount = table.Count( self.Particles )
			self.NextTime = CurTime()+self.WaitTime
		end
	elseif self.Dead == false then
		self.Dead = true
		local p = {}
			p.Pos = nil
			p.Vel = Vector(math.Rand(-0.025,0.025),math.Rand(-0.025,0.025),0.1)
			p.Size = 0.3
			p.SizeInc = 0.01
			p.Alpha = 50
		table.insert( self.Particles, p )
	end
	
	if table.Count(self.Particles) == 1 && self.Dead then
		return false
	end
	
	return true
	
end

local BloodSprite = Material( "trails/smoke" )
function EFFECT:Render()

	render.SetMaterial( BloodSprite )
	
	local LastPos = nil
	local pCount = 0
	

	for k, p in pairs( self.Particles ) do
		if p.Pos != nil then
			local LightColor = render.GetLightColor( p.Pos ) * 255
			LightColor.r = math.Clamp( LightColor.r, 0, 255 )
			LightColor.g = math.Clamp( LightColor.g, 0, 255 )
			LightColor.b = math.Clamp( LightColor.b, 0, 255 )
			local color = Color( LightColor.r*4, LightColor.g*4, LightColor.b*4, p.Alpha )
		
			local Sin = math.sin( (pCount / (self.ParCount-2)) * math.pi )
			
			if ( LastPos ) then
			
				render.DrawBeam( LastPos, p.Pos, p.Size, 1,	0, color )
		
			end
			
			pCount = pCount + 1
			LastPos = p.Pos
		end
	end
	
	
	//render.DrawSprite( self.Entity:GetPos(), 32, 32, color_white )
	
end



