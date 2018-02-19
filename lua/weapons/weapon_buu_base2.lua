/*-------------------------------------------------------------------------------------------------------------------------------------
--Hello there fellow hooman Bean.
--This is a complete remake of my weapon_buu_copypaste_base
--I have tried to keep everything as neat as possible for readibility
--Sadly, my old sweps broke as a result, so those need to be fixed
--- If you came here to learn, go for it, but it might not be perfect
--- If you came here to steal, Please give me credit, no one will judge you for using part of someone's code :(
--- If you came here to borrow code for your weapon of mass destruction, feel free to do so but please leave Portugal intact, I like it here
--- If you came here for any other reason, sorry I ignored you :((
--Have fun! And bring some tissues because this stuff might be ugly
-------------------------------------------------------------------------------------------------------------------------------------*/

if ( CLIENT ) then
	SWEP.DrawAmmo = true
	SWEP.DrawCrosshair = true
	SWEP.ViewModelFOV = 45
	SWEP.ViewModelFlip = false
	SWEP.CSMuzzleFlashes = true
end

SWEP.Author = "Buu342"
SWEP.Name = "Buu Base"
SWEP.Contact = "buu342@hotmail.com"
SWEP.Purpose = "To act as a base for my sweps"
SWEP.Instructions = "Left click to shoot, right click to use sights."
SWEP.Category = "Buu342"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false 
SWEP.AdminOnly = false

SWEP.UseHands = true
SWEP.HoldType = "pistol"

//SWEP.ViewModel = "models/weapons/monstermash/c_colt.mdl" 
SWEP.ViewModel = "models/weapons/c_mp5.mdl"
SWEP.WorldModel = "models/weapons/FC3W/FC3stgw.mdl"

SWEP.Primary.Sound 		= Sound("FC3/weapons/stg/stg-1.wav")
SWEP.Primary.SoundSilenced = Sound("")
SWEP.Primary.Recoil = 1.2
SWEP.Primary.Damage = 40
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.001
SWEP.Primary.Delay = 0.05
SWEP.Primary.TakeAmmo = 1

SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = 500
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pistol"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false 
SWEP.Secondary.Ammo = "none"

SWEP.BobScale = 0 -- Real men code their own bob
SWEP.SwayScale = 0 -- I'm too lazy to code my own sway, plus this one works just fine soooooo....

-- Custom settings start here --

SWEP.BuuSwayScale = 60

SWEP.IronSightsPos = Vector(-4.825, -9.233, 2.049)
SWEP.IronSightsAng = Vector(0.14, -3.32, -3.004)

SWEP.RunArmOffset = Vector(8.595, -13.676, -4.376)
SWEP.RunArmAngle = Vector(-0.617, 70, -15.205)

SWEP.CrouchPos = Vector(-1,-1,.5) -- Moves the gun when you crouch

SWEP.IronsightFOV = 65 -- FOV when in ironsights
SWEP.IronsightMoveIntensity = 0.5 -- Ironsight sway

SWEP.IronSightsShootPos = SWEP.IronSightsPos -- This is for weapons to have custom shoot animations in ironsights. Just give it a vector with the weapon pushed back a bit
SWEP.IronSightsShootAng = SWEP.IronSightsAng -- Same but vectors

SWEP.ReloadAmmoTime = 0.7 -- When does the ammo appear in the mag?
SWEP.ReloadAmmoTimeLast = 0.7 -- When does the ammo appear in the mag when you using act_vm_reload_empty

SWEP.UseLastShoot = false -- Do you have a act_vm_primaryattack_empty?
SWEP.UseLastReload = false -- Do you have a act_vm_reload_empty?
SWEP.UseLastIdle = false -- Do you have a act_vm_idle_empty?
SWEP.UseLastDraw = false-- Do you have a act_vm_draw_empty? 

SWEP.UseNormalShootIron = true -- Use act_vm_primaryattack in ironsights?

SWEP.Laser = false -- Don't touch, it's broken
SWEP.Silenced = false -- Gives you silenced muzzle flash and uses SWEP.Primary.SoundSilenced

SWEP.Shotgun = false -- Shotgun reload?
SWEP.ShotgunSwitchMode = false -- Allow swap between auto and pump mode?
SWEP.ShotgunMode2Delay = 0.95 -- If using a different shotgun shoot animation, what's the delay per shot?
SWEP.ShotgunMode = 0 -- Pump (0) or Auto (1)
SWEP.DestroyDoor = false -- Does a shotgun break down doors?

SWEP.Sniper         = false -- Sniper rifle scope?
SWEP.SniperZoom 	= 30 -- Zoom on sniper rifle
SWEP.ScopeScale 	= 0.5 -- Don't change
SWEP.SniperTexture  = "scope/fc3Scope" -- scope texture

SWEP.MagDrop = false -- Drop a mag on reload?
SWEP.MagModel = "" -- Mag model
SWEP.MagDropTime = 0.5 -- When to drop mag model (in seconds)?

-- Networked Variables for Prediction
function SWEP:SetupDataTables()
    self:NetworkVar("Float",0,"Buu_GotoIdle") -- Predicted timer for setting variables when you go to the idle animation
    self:NetworkVar("Float",1,"Buu_ReloadTimer") -- Predicted timer for reloading
    self:NetworkVar("Float",2,"Buu_ReloadGiveAmmo") -- Predicted timer for giving the ammo during the reload
    self:NetworkVar("Float",3,"Buu_GotoIdleAnim") -- Predicted timer for changing the animation to idle
    self:NetworkVar("Float",4,"Buu_StartShotgunReload") -- Boy I wonder what this does
    self:NetworkVar("Float",5,"Buu_ViewPunch1") -- Custom (predicted) viewpunch
    self:NetworkVar("Float",6,"Buu_ViewPunch2")
    self:NetworkVar("Float",7,"Buu_MagDropTime") -- Predicted timer for dropping a mag model
    self:NetworkVar("Float",8,"Buu_TimeToScope") -- Predicted timer for going to the scope on a sniper rifle
    self:NetworkVar("Bool",0,"Buu_Reloading") -- Are we reloading?
    self:NetworkVar("Bool",1,"Buu_CanCancelReloading") -- Can we stop the shotgun's reload?
    self:NetworkVar("Bool",2,"Buu_Ironsights") -- Are we in ironsights?
    self:NetworkVar("Bool",3,"Buu_Sprinting") -- Do I really need to explain what this does?
end

function SWEP:Initialize()
	if CLIENT then
	
		-- We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()
		
		-- These tables are used to draw things like scopes and crosshairs to the HUD.
		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight*self.ScopeScale
		self.ScopeTable.x1 = 0.5*(iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5*(iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5*(iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5*(iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1
		
		self.ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale -- I don't know why this works, but it does.
        
        -- This is for drawing the black bars that surround the scope
		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3

		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2*self.ScopeTable.l
		self.LensTable.h = 2*self.ScopeTable.l
		
	end
	self.Primary.Automatic2 = self.Primary.Automatic
end

function SWEP:Deploy() 
    self:SetBuu_ViewPunch1(math.Rand(-0.5,-2.5)) -- This sets the V
    self:SetBuu_ViewPunch2(math.Rand(-1,1))
    if self.Weapon:Clip1() <= 0 && self.UseLastDraw then 
        self.Weapon:SendWeaponAnim( ACT_VM_DRAW_EMPTY )
    else
        self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
    end
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Owner:GetViewModel():SetBodygroup(0,0)
	self.Owner:GetViewModel():SetBodygroup(1,0)
	self.Owner:GetViewModel():SetBodygroup(2,0)
end

function SWEP:Holster()
    self:SetBuu_ReloadTimer(0)
    self:SetBuu_Reloading(false)
    self:SetBuu_ReloadGiveAmmo(0)
    return true
end

local myrecoil = 0
local myrecoilyaw = 0
local e_recoilyaw = 0
local move = 1

local sv_myrecoil = 0
local sv_myrecoilyaw = 0
local sv_e_recoilyaw = 0
local sv_move = 1

function SWEP:PrimaryAttack() -- This is because SWEP.Primary.Automatic wasn't working properly
	if self.Primary.Automatic2 == true && self.Owner:KeyDown(IN_ATTACK) then
		self:ShootCode()
	elseif self.Primary.Automatic2 == false && self.Owner:KeyPressed(IN_ATTACK) then
		self:ShootCode()
	end
end

function SWEP:ShootCode() -- Did this here to make SWEP.Primary.Automatic work

	if self:GetNextPrimaryFire() > CurTime() then return end

    local Tr = self.Owner:GetEyeTrace()
    if self.Shotgun && self:GetBuu_Reloading() && self:GetBuu_CanCancelReloading() == true && !(Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40 ) then
        self:FinishMyReload()
    end
    
    if self:GetBuu_Reloading() == true then return end
    if self.Shotgun && self.ShotgunSwitchMode == true  then
        if self.Owner:KeyDown(IN_USE) then
			if self.ShotgunMode == 1 then
				self.ShotgunMode = 0
				self.Owner:PrintMessage( HUD_PRINTCENTER, "Automatic Mode" )
				self.Weapon:SetNextSecondaryFire(CurTime() + 1)
				self.Weapon:SetNextPrimaryFire(CurTime() + 1)
			else
				self.ShotgunMode = 1
				self.Owner:PrintMessage( HUD_PRINTCENTER, "Pump Mode" )
				self.Weapon:SetNextSecondaryFire(CurTime() + 1)
				self.Weapon:SetNextPrimaryFire(CurTime() + 1)
			end
        end
    end
    if !self.Owner:KeyDown(IN_USE) then
        if self:GetBuu_Sprinting() == false && !(Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40 ) then
            if self.Weapon:Clip1() <= 0 then 
                self:EmitSound( "Weapon_Shotgun.Empty",75,100,CHAN_ITEM )
                self.Primary.Automatic = false
            else
                myrecoil = myrecoil + 10
                self.Primary.Automatic = self.Primary.Automatic2
                self:Recoil()
                if self:GetBuu_Ironsights() then
                    self.Owner:ViewPunch(Angle(self:GetBuu_ViewPunch1() * (self.Primary.Recoil / 2), self:GetBuu_ViewPunch2() * (self.Primary.Recoil / 2), 0))
                else
                    self.Owner:ViewPunch(Angle(self:GetBuu_ViewPunch1() * (self.Primary.Recoil), self:GetBuu_ViewPunch2() * (self.Primary.Recoil), 0))
                end
                self:CSShootBullet(self.Primary.Damage, self.Primary.Delay, self.Primary.NumShots, self.Primary.Cone)
                if self.Silenced == false then
                    self.Weapon:EmitSound(self.Primary.Sound,100,math.random(97,102))
                else
                    self.Weapon:EmitSound(self.Primary.SoundSilenced,100,math.random(97,102))
                end
                self:TakePrimaryAmmo(self.Primary.TakeAmmo)
                if self.Shotgun && self.ShotgunMode == 0 then
                    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
                elseif self.Shotgun && self.ShotgunMode == 1 then
                    self:SetNextPrimaryFire(CurTime() + self.ShotgunMode2Delay)
                else
                    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
                end
                self:SetBuu_GotoIdle(CurTime() + 0.04)
            end
        end
    end

end

function SWEP:Recoil() -- Custom weapon recoil because Garry's is shitty shit shit
	if CLIENT then
		if not IsFirstTimePredicted() then return end
		if self:GetBuu_Ironsights() then 
			myrecoil = myrecoil + self.Primary.Recoil / 4
			myrecoilyaw = math.random(-myrecoil,myrecoil) / 4
		else
			myrecoil = myrecoil + self.Primary.Recoil
			myrecoilyaw = math.random(-myrecoil,myrecoil)
		end
	end
	
	if SERVER then
		if self:GetBuu_Ironsights() then 
			sv_myrecoil = sv_myrecoil + self.Primary.Recoil / 4
			sv_myrecoilyaw = math.random(-sv_myrecoil,sv_myrecoil) / 4
		else
			sv_myrecoil = sv_myrecoil + self.Primary.Recoil
			sv_myrecoilyaw = math.random(-sv_myrecoil,sv_myrecoil)
		end
	end
end

-- Real men don't need SWEP:SecondaryAttack()
function SWEP:SecondaryAttack() 
end


-- Where the real magic happens
function SWEP:Think() 
    local Tr = self.Owner:GetEyeTrace()
    if (Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40 ) then -- Near a wall?
        
        -- This needs revision because it doesn't work. I'll fix it sometime
        --if self.Weapon:Clip1() <= 0 && self.UseLastIdle then 
        --self.Weapon:SendWeaponAnim( ACT_VM_IDLE_EMPTY )
        --else
        --self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
        --end

    end
    
	if !self.Shotgun && self.Owner:KeyPressed(IN_RELOAD) && CurTime() > self:GetNextPrimaryFire() && !self:GetBuu_Reloading() == true && self.Weapon:Clip1() < self.Primary.ClipSize && self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) > 0 then -- Witness me!
		self:SetBuu_Reloading(true)
        self:SetBuu_MagDropTime(CurTime()+self.MagDropTime)
        if self.Weapon:Clip1() <= 0 && self.UseLastReload then 
            self:SetBuu_Reloading(true)
            self.Weapon:SendWeaponAnim(ACT_VM_RELOAD_EMPTY)
            self:SetBuu_ReloadTimer(CurTime() + self.Owner:GetViewModel():SequenceDuration())
            self:SetBuu_ReloadGiveAmmo(CurTime() + self.Owner:GetViewModel():SequenceDuration()*self.ReloadAmmoTimeLast)
        else
            self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
            self:SetBuu_ReloadTimer(CurTime() + self.Owner:GetViewModel():SequenceDuration())
            self:SetBuu_ReloadGiveAmmo(CurTime() + self.Owner:GetViewModel():SequenceDuration()*self.ReloadAmmoTime)
        end
	end
    if self.Shotgun && self.Owner:KeyPressed(IN_RELOAD) && CurTime() > self:GetNextPrimaryFire() && self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) > 0 && !self:GetBuu_Reloading() == true && self.Weapon:Clip1() < self.Primary.ClipSize then
        self:SetBuu_Reloading(true)
        self:StartMyReload()
    end
	if (self.Owner:KeyDown(IN_ATTACK2) && !self:GetBuu_Sprinting() && !(Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40 ) && !self:GetBuu_Reloading() == true) then
        if self:GetBuu_Ironsights() == false then
            self:SetBuu_TimeToScope(CurTime()+0.25)
        end
		self:SetBuu_Ironsights(true)
        self.DrawCrosshair = false
        if self.Sniper && self:GetBuu_TimeToScope() < CurTime() then
            self.Owner:DrawViewModel( false )
            self.Owner:GetViewModel():SetRenderMode(RENDERMODE_TRANSALPHA)
            self.Owner:GetViewModel():SetColor(Color(255,0,0,0)) -- Setting the viewmodel to red is just for testing. You can change it if you want, but leave alpha as 0
            self.Owner:SetFOV( self.SniperZoom, 0.02 )
        end
	else
        self.DrawCrosshair = true
		self:SetBuu_Ironsights(false)
        self:SetBuu_TimeToScope(0)
        if self.Sniper then
        self.Owner:DrawViewModel( true )
        self.Owner:GetViewModel():SetRenderMode(RENDERMODE_NORMAL)
        self.Owner:GetViewModel():SetColor(Color(255,255,255,255))
        self.Owner:SetFOV( 0, 0.01 )
        end
	end
    if self.Sniper && CurTime() < self:GetNextPrimaryFire() && self:GetBuu_Ironsights() then
        self.DrawCrosshair = true
		self:SetBuu_Ironsights(false)
        self:SetBuu_TimeToScope(0)
        if self.Sniper then
        self.Owner:DrawViewModel( true   )
        self.Owner:GetViewModel():SetRenderMode(RENDERMODE_NORMAL)
        self.Owner:GetViewModel():SetColor(Color(255,255,255,255))
        self.Owner:SetFOV( 0, 0.01 )
        end
    end
	if self.Owner:KeyDown(IN_SPEED) && !self.Owner:KeyDown(IN_DUCK) && self.Owner:IsOnGround() && (self.Owner:KeyDown(IN_FORWARD) || self.Owner:KeyDown(IN_BACK) || self.Owner:KeyDown(IN_MOVELEFT) ||self.Owner:KeyDown(IN_MOVERIGHT)) then -- Amazing chest ahead
		self:SetBuu_Sprinting(true)
	else
		self:SetBuu_Sprinting(false)
	end
	self:SetWeaponHoldType( self.HoldType )
	if SERVER then
        sv_myrecoil = Lerp(6*FrameTime(),sv_myrecoil,0)
        sv_myrecoilyaw = Lerp(6*FrameTime(),sv_myrecoilyaw,0)
        sv_e_recoilyaw = Lerp(6*FrameTime(),sv_e_recoilyaw,sv_myrecoilyaw)
	end
    if self:GetBuu_GotoIdle() < CurTime() && !(self:GetBuu_GotoIdle() == 0) then
        self:SetBuu_GotoIdle(0)
    end

    if self:GetBuu_ReloadTimer() < CurTime() && !(self:GetBuu_ReloadTimer() == 0) then
        self:SetBuu_Reloading(false)
        self:SetBuu_ReloadTimer(0)
        self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
    end
    if self:GetBuu_ReloadGiveAmmo() < CurTime() && !(self:GetBuu_ReloadGiveAmmo() == 0) then -- Be wary of horse therefore try lick
        if !self.Shotgun then
            local ammo = self.Owner:GetAmmoCount(self:GetPrimaryAmmoType())
            self.Owner:RemoveAmmo( self.Primary.ClipSize - self.Weapon:Clip1(), self.Weapon:GetPrimaryAmmoType() )
            if ammo > self.Primary.ClipSize then
            self.Weapon:SetClip1(self.Primary.ClipSize)
            else
            self.Weapon:SetClip1(math.min(self.Primary.ClipSize,self.Weapon:Clip1() + ammo))
            end
            self:SetBuu_ReloadGiveAmmo(0)
        else
            local ammo = self.Owner:GetAmmoCount(self:GetPrimaryAmmoType())
            if ammo > 0 then
                self.Owner:RemoveAmmo( 1, self.Weapon:GetPrimaryAmmoType() )
                self.Weapon:SetClip1(self:Clip1()+1)
                self:SetBuu_ReloadGiveAmmo(0)
            end
        end
    end
    if self.Shotgun then
        self:DoMyReload() -- Predicted shotgun reload function
    end
    self:MagazineDrop() -- Predicted mag drop function
end

-- Real men code their own SWEP:Reload() (Mine's in think)
function SWEP:Reload() 
end

-- Dropping Mags
function SWEP:MagazineDrop()
    if self:GetBuu_MagDropTime() < CurTime() && !(self:GetBuu_MagDropTime() == 0) && self.DropMag then
        self:SetBuu_MagDropTime(0)
        local shotpos = self.Owner:GetShootPos()
        shotpos = shotpos + self.Owner:GetForward()*-15
        shotpos = shotpos + self.Owner:GetRight()*5
        shotpos = shotpos + self.Owner:GetUp()*-10
        if (SERVER) then
                
            local mag = ents.Create("gun_clip")
            if (IsValid(mag)) then
                mag:SetPos(shotpos)
                mag:SetOwner(self.Owner)
                mag:SetModel( self.MagModel )
                mag:Spawn()
                mag.Owner = self.Owner
            end
        end
    end
end

-- This is my super sexy CalcView. Don't touch it
local myfov = 75
local myfov_t = 90
function MySuperSexyCalcView(ply,origin,angles,fov,vm_origin,vm_angles)
	if ply:GetActiveWeapon() == "weapon_buu_base2" then
		local m_PlayerCam = GAMEMODE:CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
		m_PlayerCam.origin = origin
		m_PlayerCam.angles = angles
		m_PlayerCam.fov = myfov
		myfov = Lerp(10*FrameTime(),myfov,myfov_t)
		if ply:KeyDown(IN_ATTACK2) then 	
			myfov_t = ply:GetActiveWeapon().IronsightFOV
		else 
			myfov_t = LocalPlayer():GetInfoNum("fov_desired",90)
		end
		myrecoil = Lerp(6*FrameTime(),myrecoil,0)
		myrecoilyaw = Lerp(6*FrameTime(),myrecoilyaw,0)
		e_recoilyaw = Lerp(6*FrameTime(),e_recoilyaw,myrecoilyaw)
		
		m_PlayerCam.angles = Angle(angles.p-myrecoil,angles.y-e_recoilyaw ,angles.r)
		
		return m_PlayerCam,GAMEMODE:CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
	end
end
hook.Add( "CalcView", "BuusSuperSexyCalcView", MySuperSexyCalcView )

-- Makes your gun spit bullets
function SWEP:CSShootBullet(dmg, recoil, numbul, cone)

	numbul 		= numbul or 1
	cone 			= cone or 0.01

	local bullet 	= {}
	bullet.Num  	= numbul
	bullet.Src 		= self.Owner:GetShootPos()
    bullet.Dir = (self.Owner:EyeAngles() + self.Owner:GetPunchAngle() + Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0) * 33):Forward()
	bullet.Spread 	= Vector(cone, cone, 0)
	bullet.Tracer 	= 0
	bullet.Force 	= 0.5 * dmg
	bullet.Damage 	= dmg
	bullet.Callback 	= HitImpact

	self.Owner:FireBullets(bullet)
    
    local Vm = self.Owner:GetViewModel()
    local fx = EffectData()
    fx:SetEntity(self.Weapon)
    fx:SetOrigin(self.Owner:GetShootPos())
    fx:SetNormal(self.Owner:GetAimVector())
    fx:SetAttachment(Vm:LookupAttachment( "1" ))
    util.Effect("buu_muzzle_silenced",fx)
    
	if self.Owner:KeyDown(IN_ATTACK2) && !self.UseNormalShootIron then
        if self.Weapon:Clip1() <= 1 && self.UseLastShoot then
        self.Weapon:SendWeaponAnim(ACT_VM_DEPLOYED_IRON_DRYFIRE)
        else
		self.Weapon:SendWeaponAnim(ACT_VM_DEPLOYED_IRON_FIRE)
        end
    else
        if self.Weapon:Clip1() <= 1 && self.UseLastShoot then -- Woman ahead, Weakness: Hole
            self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK_EMPTY)
        else
            if self.ShotgunMode == 0 then
                self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
            else
                self.Weapon:SendWeaponAnim(ACT_SHOTGUN_PUMP)
            end
        end
	end
	self.Owner:SetAnimation(PLAYER_ATTACK1)
    if SERVER then
        self:SetBuu_ViewPunch1(math.Rand(-0.5,-2.5))
        self:SetBuu_ViewPunch2(math.Rand(-1,1))
    end
	if ( (game.SinglePlayer() && SERVER) || ( !game.SinglePlayer() && CLIENT && IsFirstTimePredicted() ) ) then
	
		local eyeang = self.Owner:EyeAngles()
		eyeang.pitch = eyeang.pitch - (recoil * 1 * 0.5)
		eyeang.yaw = eyeang.yaw - (recoil * math.random(-1, 1) * 0.25)
		self.Owner:SetEyeAngles( eyeang )

	end

    -- Breaking doors (This is a lot of fun, but it's recycled code from my SPAS-12, might be unoptimized.)
    
	local trace = self.Owner:GetEyeTrace();

	if trace.HitPos:Distance(self.Owner:GetShootPos()) > 250 or self.DestroyDoor == 0 then return end

	if self.Shotgun && trace.Entity:GetClass() == "prop_door_rotating" and (SERVER) then

		trace.Entity:Fire("open", "", 0.001)
		trace.Entity:Fire("unlock", "", 0.001)

		local pos = trace.Entity:GetPos()
		local ang = trace.Entity:GetAngles()
		local model = trace.Entity:GetModel()
		local skin = trace.Entity:GetSkin()

		trace.Entity:SetNotSolid(true)
		trace.Entity:SetNoDraw(true)

		local function ResetDoor(door, fakedoor)
			door:SetNotSolid(false)
			door:SetNoDraw(false)
			fakedoor:Remove()
		end

		local norm = (pos - self.Owner:GetPos())
		norm:Normalize()
		local push = 1000 * norm
		local ent = ents.Create("prop_physics")

		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:SetModel(model)

		if(skin) then
			ent:SetSkin(skin)
		end

		ent:Spawn()

		timer.Simple(0.01, function() if ent and push then ent:GetPhysicsObject():SetVelocity(push) end end)              
		timer.Simple(0.01, function() if ent and push then ent:GetPhysicsObject():SetVelocity(push) end end)
		timer.Simple(25, function() if IsValid(ent) then ResetDoor( trace.Entity, ent, 10) end end )
	end
end

-- Not working Laser. For the love of god don't touch this broken piece of shit
local LASER = Material('cable/redlaser')
function SWEP:ViewModelDrawn()
    if self.Laser == true then
        local vm = self.Owner:GetViewModel()
        local ang = vm:GetAngles()
        local att = vm:LookupAttachment("1")
        local Angle = self.Owner:GetViewModel():GetAttachment(1).Ang
        local Vec1 = self.Owner:GetViewModel():GetAttachment(1).Pos
        local Vec2 = self.Owner:GetViewModel():GetAttachment(1).Pos + Angle:Forward()*100
        render.SetMaterial(LASER)
        render.DrawBeam(Vec1, Vec2, 2, 0, 1, Color(255,0,0))
    end
end

-- This is where all the sexy movement in the viewmodel happens. This shit is bootyfull
-- If you guys get the chance, go give Kudo's to MushroomGuy for teaching me Lerp
-- Lerp is one of the coolest and most sexy things to come to Garry's Mod
-- Wow are these comments that interesting that you're still reading them?
if CLIENT then
	local TestVector = Vector(0,0,0)
	local TestVectorAngle = Vector(0,0,0)
	local TestVector2 = Vector(0,0,0)
	local TestVectorAngle2 = Vector(0,0,0)
	local TestVectorTarget = Vector(0,0,0)
	local TestVectorAngleTarget = Vector(0,0,0)
	local CrouchAng=0
	local CrouchAng2=0
	local Current_Aim = Angle(0,0,0)
	local Off, Off2, Off3, dist = 0, 0, 0, 0
	SWEP.LastEyeSpeed = Angle(0,0,0)
	SWEP.EyeSpeed = Angle(0,0,0)
	function SWEP:GetViewModelPosition(pos, ang)
		if !IsValid(self.Owner) then return end
		local ply = LocalPlayer()
		local weapon = ply:GetActiveWeapon()
		local walkspeed = self.Owner:GetVelocity():Length() 
		
        if IsValid(self.Owner) && !self.Owner:KeyDown(IN_SPEED) && !(self.Owner:KeyDown(IN_DUCK) && walkspeed > 40) then
            TestVector = LerpVector(10*FrameTime(),TestVector,TestVectorTarget) 
            TestVectorAngle = LerpVector(10*FrameTime(),TestVectorAngle,TestVectorAngleTarget) 
        elseif self.Owner:KeyDown(IN_DUCK) && walkspeed > 40 then 
			if self:GetBuu_Ironsights() == false then
				TestVector = LerpVector(4*FrameTime(),TestVector,TestVectorTarget) 
				TestVectorAngle = LerpVector(4*FrameTime(),TestVectorAngle,TestVectorAngleTarget) 
			else
				TestVector = LerpVector(10*FrameTime(),TestVector,TestVectorTarget) 
				TestVectorAngle = LerpVector(10*FrameTime(),TestVectorAngle,TestVectorAngleTarget) 
			end
		else
            TestVector = LerpVector(5*FrameTime(),TestVector,TestVectorTarget) 
            TestVectorAngle = LerpVector(5*FrameTime(),TestVectorAngle,TestVectorAngleTarget) 
        end
		
		ang:RotateAroundAxis(ang:Right(),TestVectorAngle.x  )
		ang:RotateAroundAxis(ang:Up(),TestVectorAngle.y )
		ang:RotateAroundAxis(ang:Forward(),TestVectorAngle.z)
		
		pos = pos + TestVector.z * ang:Up()
		pos = pos + TestVector.y * ang:Forward()
		pos = pos + TestVector.x * ang:Right()
		if !IsValid(self.Owner) then return end
		local Tr = self.Owner:GetEyeTrace()
		local walkspeed = self.Owner:GetVelocity():Length() 
        if self:GetBuu_Ironsights() && !self:GetBuu_Reloading() == true then 	
        	if self:GetBuu_GotoIdle() > CurTime() && self.UseNormalShootIron == false then
                TestVectorTarget = self.IronSightsPos + (self.IronSightsShootPos-self.IronSightsPos)
            else
                TestVectorTarget = self.IronSightsPos
            end
            TestVectorAngleTarget = self.IronSightsAng
        elseif self:GetBuu_Sprinting() && !self:GetBuu_Reloading() == true && !self.Owner:KeyDown(IN_DUCK) then 
            TestVectorTarget = self.RunArmOffset
            TestVectorAngleTarget = self.RunArmAngle
        elseif Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40 && (self:Clip1() == self.Primary.ClipSize || !self:GetBuu_Reloading() == true) then 
            TestVectorTarget = self.RunArmOffset
            TestVectorAngleTarget = self.RunArmAngle
        elseif self.Owner:Crouching() && !(Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40) then 
            TestVectorTarget = self.CrouchPos
            TestVectorAngleTarget = Vector(0,0,0)
        else
            TestVectorTarget = Vector(0,0,0)
            TestVectorAngleTarget = Vector(0,0,0)
        end
        
		
		/*--------------------------------------------
		--				  Jump Sway					--
		--------------------------------------------*/
		
		TestVectorTarget = TestVectorTarget + Vector(0 ,0 , -math.Clamp(self.Owner:GetVelocity().z / 300,-1,1))
		
		
		/*--------------------------------------------
		--			  Viewmodel Bobbing				--
		--------------------------------------------*/
        
		/*if ply:IsOnGround() && self:GetBuu_Sprinting() && (self:Clip1() == self.Primary.ClipSize || !self:GetBuu_Reloading() == true)	 then

		else*/if ply:IsOnGround() && walkspeed > 20 && !(Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40) then
			local BreatheTime = RealTime() * 16
			if self:GetBuu_Ironsights() then
				TestVectorAngleTarget = TestVectorAngleTarget - Vector((math.cos(BreatheTime)/2)*walkspeed/200, (math.cos(BreatheTime / 2) / 2)*walkspeed/200,0)
			else
				TestVectorTarget = TestVectorTarget - Vector((-math.cos(BreatheTime/2)/5)*walkspeed/200,0,0)
				TestVectorAngleTarget = TestVectorAngleTarget - Vector((math.Clamp(math.cos(BreatheTime),-0.3,0.3)*1.2)*walkspeed/200,(-math.cos(BreatheTime/2)*1.2)*walkspeed/200,0)
			end
			
        end
		
		/*--------------------------------------------
		--				Viewmodel Sway				--
		--------------------------------------------*/
		
		self.LastEyeSpeed = self.EyeSpeed
		
		Current_Aim = LerpAngle(5*FrameTime(), Current_Aim, ply:EyeAngles())
		
		self.EyeSpeed = Current_Aim - ply:EyeAngles()
		self.EyeSpeed.y = math.AngleDifference( Current_Aim.y, ply:EyeAngles().y ) -- Thank you MushroomGuy for telling me this function even existed
		
		ang:RotateAroundAxis(ang:Right(), math.Clamp(4*self.EyeSpeed.p/self.BuuSwayScale,-4,4))
		ang:RotateAroundAxis(ang:Up(), math.Clamp(-4*self.EyeSpeed.y/self.BuuSwayScale,-4,4))

		pos = pos + math.Clamp((-1.5*self.EyeSpeed.p/self.BuuSwayScale),-1.5,1.5) * ang:Up()
		pos = pos + math.Clamp((-1.5*self.EyeSpeed.y/self.BuuSwayScale),-1.5,1.5) * ang:Right()
		return pos, ang
	end
end

-- Now comes Ironsight swaying. 
function CalcMoveForce(ply)
	if !IsValid(LocalPlayer()) then return end
	local weapon = ply:GetActiveWeapon()
	MoveForce = ply:GetFOV()
	if !ply:Crouching() then
		if IsValid(weapon) && !weapon:GetDTBool( 2 ) then
			MoveForce = ply:GetFOV() * 10
		else
			MoveForce = ply:GetFOV() * 50
		end
	else
		MoveForce = ply:GetFOV() * 120
	end
	
	return MoveForce
end

function IronIdleMove(cmd)
	local ply = LocalPlayer()
	local weapon = ply:GetActiveWeapon()
	if !IsValid(ply) then return end
	if weapon.Base == "weapon_buu_base2" && weapon:GetBuu_Ironsights() then
		local ang = cmd:GetViewAngles()

		local ft = FrameTime()
		local BreatheTime = RealTime() * weapon.IronsightMoveIntensity
		local MoveForce = CalcMoveForce(ply)
			   
		ang.pitch = ang.pitch + math.cos(BreatheTime) / MoveForce
		ang.yaw = ang.yaw + math.cos(BreatheTime/2) / MoveForce
		if !IsValid(weapon) then return end
		cmd:SetViewAngles(ang) 
	end
end
hook.Add ("CreateMove", "BuuIronIdleMove", IronIdleMove)

-- Had to do this shit to get the slienced muzzleflash thing to work. Pretty annoying because it makes my code larger :/
function SWEP:FireAnimationEvent(pos,ang,event)
	if self.Silenced == true then
		if (event==5001) then 
        return true
        end
	end
    
    if ( !self.CSMuzzleFlashes ) then return end

	-- CS Muzzle flashes
	if ( event == 5001 or event == 5011 or event == 5021 or event == 5031 ) then
	
		local data = EffectData()
		data:SetFlags( 0 )
		data:SetEntity( self.Owner:GetViewModel() )
		data:SetAttachment( math.floor( ( event - 4991 ) / 10 ) )
		data:SetScale( 1 )

		if ( self.CSMuzzleX ) then
			util.Effect( "CS_MuzzleFlash_X", data )
		else
			util.Effect( "CS_MuzzleFlash", data )
		end
	
		return true
	end
end

-- Shotgun reload stuff
function SWEP:StartMyReload()
    self:SetBuu_Reloading(true)
    self:SetBuu_CanCancelReloading(false)
    self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
    self:SetBuu_StartShotgunReload(CurTime() + self.Owner:GetViewModel():SequenceDuration())
end

function SWEP:DoMyReload()
    if self:GetBuu_StartShotgunReload() < CurTime() && !(self:GetBuu_StartShotgunReload() == 0) then
        self:SetBuu_CanCancelReloading(true)
        self:SetBuu_StartShotgunReload(0)
        if (self:Clip1() == self.Primary.ClipSize) || self.Owner:GetAmmoCount( self:GetPrimaryAmmoType() ) == 0 then
            self:FinishMyReload()
        elseif self:Clip1() == 0 && self.UseLastReload then
           self:SendWeaponAnim(ACT_VM_RELOAD_EMPTY)
           self:SetBuu_ReloadGiveAmmo(CurTime() + self.Owner:GetViewModel():SequenceDuration()*self.ReloadAmmoTimeLast)
           self:SetBuu_StartShotgunReload(CurTime() + self.Owner:GetViewModel():SequenceDuration())
        else
           self:SendWeaponAnim(ACT_VM_RELOAD)
           self:SetBuu_ReloadGiveAmmo(CurTime() + self.Owner:GetViewModel():SequenceDuration()*self.ReloadAmmoTime)
           self:SetBuu_StartShotgunReload(CurTime() + self.Owner:GetViewModel():SequenceDuration())
        end
    end 
end

function SWEP:FinishMyReload()
    if (self:GetBuu_Reloading() == true) then
        self:SetBuu_StartShotgunReload(0)
        self:SetBuu_ReloadGiveAmmo(0)
        self:SetBuu_CanCancelReloading(false)
        self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
        self:SetBuu_ReloadTimer(CurTime() + self.Owner:GetViewModel():SequenceDuration())
    end
end

-- Adjust mouse sensitivity for use in scopes
function SWEP:AdjustMouseSensitivity()
	if self.Sniper && self:GetBuu_TimeToScope() < CurTime() && self:GetBuu_Ironsights() then
		return 0.3
	elseif self:GetBuu_Ironsights() then
		return 0.7
	else
		return 1
	end
end

-- Last but not least comes the drawing of the scope on the screen.
if CLIENT then
    local iScreenWidth = surface.ScreenWidth()
    local iScreenHeight = surface.ScreenHeight()

    local SCOPEFADE_TIME = 0.4
    function SWEP:DrawHUD()
        if self.Sniper && self:GetBuu_TimeToScope() < CurTime() && self:GetBuu_Ironsights() then
        -- Draw the crosshair
        surface.SetDrawColor(0, 0, 0, 255)

        -- Put the texture
        surface.SetDrawColor(0, 0, 0, 255)
        surface.SetTexture(surface.GetTextureID(self.SniperTexture))
        surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)

        -- Fill in everything else with blackness
        surface.SetDrawColor(0, 0, 0, 255)
        surface.DrawRect(self.QuadTable.x1 - 2.5, self.QuadTable.y1 - 2.5, self.QuadTable.w1 + 5, self.QuadTable.h1 + 5)
        surface.DrawRect(self.QuadTable.x2 - 2.5, self.QuadTable.y2 - 2.5, self.QuadTable.w2 + 5, self.QuadTable.h2 + 5)
        surface.DrawRect(self.QuadTable.x3 - 2.5, self.QuadTable.y3 - 2.5, self.QuadTable.w3 + 5, self.QuadTable.h3 + 5)
        surface.DrawRect(self.QuadTable.x4 - 2.5, self.QuadTable.y4 - 2.5, self.QuadTable.w4 + 5, self.QuadTable.h4 + 5)
        end
    end
end
-- Dumbledore kills Snape