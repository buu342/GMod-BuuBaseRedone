AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Gun Clip"
ENT.Author			= "Buu342"
ENT.Information		= ""
ENT.Category		= "Buu342"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false

/*---------------------------------------------------------
   Name: DrawPre
---------------------------------------------------------*/
function ENT:Draw()
	
	self.Entity:DrawModel()
end

/*---------------------------------------------------------
   Name: Initialize

   This is the spawn function. It's called when a client calls the entity to be spawned.
   If you want to make your SENT spawnable you need one of these functions to properly create the entity.
   ply is the name of the player that is spawning it.
   tr is the trace from the player's eyes.
---------------------------------------------------------*/
function ENT:SpawnFunction(ply, tr)

	if (!tr.Hit) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	
	local ent = ents.Create("gun_clip")
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end


/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()

	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow(false)
	
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
	end

	timer.Simple(30,function() if !IsValid(self.Entity) then return end if SERVER then self:Remove() end end)
end


/*---------------------------------------------------------
   Name: PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data, physobj)
	
	// Play sound on bounce
	if (data.Speed > 80 and data.DeltaTime > 0.2) then
		self.Entity:EmitSound("Default.ImpactSoft")
	end
end

/*---------------------------------------------------------
   Name: OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage(dmginfo)

	// React physically when shot/getting blown
	self.Entity:TakePhysicsDamage(dmginfo)
end
