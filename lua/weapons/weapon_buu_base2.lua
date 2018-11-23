/*-------------------------------------------------------------------------------------------------------------------------------------
Hello there fellow hooman Bean.
This is a complete remake of my weapon_buu_copypaste_base
I have tried to keep everything as neat as possible for readibility
Sadly, my old sweps broke as a result, so those need to be fixed
- If you came here to learn, go for it, but it might not be perfect
- If you came here to steal, Please give me credit, no one will judge you for using part of someone's code :(
- If you came here to borrow code for your weapon of mass destruction, feel free to do so but please leave Portugal intact, I like it here
- If you came here for any other reason, sorry I ignored you :((
Have fun! And bring some tissues because this stuff might be ugly

Todo:
	- Fix viewmodel sway when turning too fast
        - Smoke Trail net fakelag
        - Viewpunch buggy in multiplayer
    - Flashlight in multiplayer?
        - Make reload ANIM CLIENT and net it to SERVER
    - Pistol sprint animation
	- Standardize crosshair gap (use MP5 for good standard)
	- Custom 3rd person animations
-------------------------------------------------------------------------------------------------------------------------------------*/

/*
if ( CLIENT && IsFirstTimePredicted( ) ) then
    local recoil = math.Rand( 0.5, 1.5 );
	local _eyes = self.Owner:EyeAngles( );
	_eyes.pitch = math.Clamp( _eyes.pitch - recoil, -90, 90 );
	self.Owner:SetEyeAngles( _eyes );
end
*/

if ( CLIENT ) then
	SWEP.DrawAmmo = true
	SWEP.DrawCrosshair = false
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

SWEP.ViewModel = "models/weapons/c_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"

SWEP.Primary.Sound = Sound("weapons/smg1/smg1_fire1.wav")
SWEP.Primary.SoundSilenced = Sound("")
SWEP.Primary.Recoil = 0.2
SWEP.Primary.Damage = 4
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.02
SWEP.Primary.Delay = 0.05
SWEP.Primary.TakeAmmo = 1

SWEP.Primary.ClipSize = 45
SWEP.Primary.DefaultClip = 500
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false 
SWEP.Secondary.Ammo = "none"


/*==================================================================
					Custom settings start here
==================================================================*/
SWEP.Primary.Sounds = { SWEP.Primary.Sound } -- Table to put all the shooting sounds (if you want more than one)
SWEP.Primary.SoundChannelSwap = false -- Swap between CHAN_WEAPON and another channel during shooting (Helps some weapons sound better)
SWEP.BurstFire = false -- Burst fire instead of semi auto/auto
SWEP.BurstTime = 0.075 -- Time between burst shots

SWEP.Silenced = false -- Gives you silenced muzzle flash and uses SWEP.Primary.SoundSilenced
SWEP.Hold = "rifle" -- pistol, shotgun, rifle


/*======================= Laser Settings =======================*/

SWEP.Laser = false -- Enable/disable laser
SWEP.LaserBone = "ValveBiped.Bip01_R_Hand" -- What bone to attach the laser to
SWEP.LaserPos = Vector(0,0,0) -- What position to translate the laser
SWEP.LaserAng = Angle(0,0,0) -- What angle to translate the laser


/*======================= Shotgun Settings =======================*/

SWEP.Shotgun = false -- Shotgun reload?
SWEP.ShotgunSwitchMode = false -- Allow swap between auto and pump mode?
SWEP.ShotgunMode2Delay = 0.95 -- If using a different shotgun shoot animation, what's the delay per shot?
SWEP.ShotgunMode = 0 -- Pump (0) or Auto (1)
SWEP.ShotgunReloadAmount = 1 -- How many shells to reload at once
SWEP.DestroyDoor = false -- Does a shotgun break down doors?


/*======================== Scope Settings ========================*/

SWEP.Sniper         = false -- Sniper rifle scope?
SWEP.AutoSniper     = false -- Get out of scope when shooting
SWEP.SniperZoom 	= 30 -- Zoom on sniper rifle
SWEP.ScopeScale 	= 0.5 -- How much of the screen does the sniper scope take up
SWEP.SniperTexture  = "scope/fc3Scope" -- scope texture


/*======================== Reload Timers ========================*/

SWEP.ReloadAmmoTime = 0.7 -- When does the ammo appear in the mag?
SWEP.ReloadAmmoTimeLast = 0.7 -- When does the ammo appear in the mag when you using act_vm_reload_empty


/*========================= Mag Dropping =========================*/

SWEP.MagDrop = false -- Drop a mag on reload?
SWEP.MagModel = "" -- Mag model
SWEP.MagDropTime = 0.5 -- When to drop mag model (in seconds)


/*======================== Viewmodel Stuff =======================*/

SWEP.BuuSwayScale = 60 -- How much weapon sway

SWEP.IronSightsPos = Vector(-6.481, 0, 1.039) -- Ironsight
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.RunArmPos = Vector(1.358, 1.228, -0.94) -- Sprinting and near wall
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

SWEP.CrouchPos = Vector(-1,-1,.5) -- Moves the gun when you crouch
SWEP.CrouchAng = Vector(0, 0, 0)

SWEP.UseNormalShootIron = true -- Use act_vm_primaryattack in ironsights?

-- If above is false, it will use this as the animation. Just give it the 
-- same value as your Ironsights but with the Y pushed back a bit to simulate
-- the gun going back when you shoot.
SWEP.IronSightsShootPos = SWEP.IronSightsPos 
SWEP.IronSightsShootAng = SWEP.IronSightsAng


/*====================== Ironsight Settings ======================*/

SWEP.IronsightFOV = 65 -- FOV when in ironsights
SWEP.IronsightMoveIntensity = 2 -- Ironsight sway

SWEP.IronsightSound = 2 -- none (0), pistol (1), smg (2), rifle (3)


/*========================= Animations ==========================*/

SWEP.UseLastShoot = false -- Do you have a act_vm_primaryattack_empty?
SWEP.UseLastReload = false -- Do you have a act_vm_reload_empty?
SWEP.UseLastIdle = false -- Do you have a act_vm_idle_empty?
SWEP.UseLastDraw = false-- Do you have a act_vm_draw_empty? 

SWEP.EmptySound = Sound("buu/base/empty.wav")


/*==================================================================
					Custom settings end here
==================================================================*/

SWEP.IsBuuBase = true -- Don't touch

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
	self:NetworkVar("Float",9,"Buu_ScopeBreathe") -- Predicted timer for scope breathing
	self:NetworkVar("Float",10,"Buu_LastFire") -- Predicted timer for smoke trail effect
	self:NetworkVar("Float",11,"Buu_LastBurst") -- Predicted timer for burst fire
	self:NetworkVar("Int",0,"Buu_BurstCount") -- Burst fire count
    self:NetworkVar("Bool",0,"Buu_Reloading") -- Are we reloading?
    self:NetworkVar("Bool",1,"Buu_CanCancelReloading") -- Can we stop the shotgun's reload?
    self:NetworkVar("Bool",2,"Buu_Ironsights") -- Are we in ironsights?
    self:NetworkVar("Bool",3,"Buu_Sprinting") -- Do I really need to explain what this does?
	self:NetworkVar("Bool",4,"Buu_Smoking") -- Do I really need to explain what this does?
	self:NetworkVar("Bool",5,"Buu_NearWall") -- Do I really need to explain what this does?
end


function SWEP:Initialize()
    -- Set other stuff
	if CLIENT then
		self.JumpTime = 0
		self.LandTime = 0
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
    
	self.Owner:DrawViewModel( true )
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())
	self.Owner:GetViewModel():SetBodygroup(0,0)
	self.Owner:GetViewModel():SetBodygroup(1,0)
	self.Owner:GetViewModel():SetBodygroup(2,0)
end


function SWEP:Holster(holsterto)
	self:FinishMyReload()
    self:SetBuu_ReloadTimer(0)
    self:SetBuu_Reloading(false)
    self:SetBuu_ReloadGiveAmmo(0)
	self:SetBuu_LastFire(0)
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
	if self.Burst then
		self:ShootCode()
	elseif self.Primary.Automatic2 == true && self.Owner:KeyDown(IN_ATTACK) then
		self:ShootCode()
	elseif self.Primary.Automatic2 == false && self.Owner:KeyPressed(IN_ATTACK) then
		self:ShootCode()
	end
end

local shootchannel = CHAN_WEAPON
function SWEP:ShootCode() -- Did this here to make SWEP.Primary.Automatic work

	if self:GetNextPrimaryFire() > CurTime() then return end

    if self.Shotgun && self:GetBuu_Reloading() && self:GetBuu_CanCancelReloading() == true then
        self:FinishMyReload()
    end
    
    if self:GetBuu_Reloading() == true then return end
	
    if self.Shotgun && self.ShotgunSwitchMode == true then
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
        if self:GetBuu_Sprinting() == false && !self:GetBuu_NearWall() then
            if self.Weapon:Clip1() <= 0 then 
                self:EmitSound( "weapons/shotgun/shotgun_empty.wav", 75, 100, 1, CHAN_ITEM ) 
                self.Primary.Automatic = false
				return
			end

            if self:GetBuu_BurstCount() >= 3 || !self.Owner:KeyDown(IN_ATTACK) then
                self:SetBuu_BurstCount(0)
                self:SetBuu_LastBurst(0)
                self:SetBuu_GotoIdle(CurTime() + 0.04)
                self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
                self.Primary.Automatic = false
            elseif (self:GetBuu_BurstCount() < 3 && self:GetBuu_LastBurst() < CurTime()) || !self.BurstFire then
                myrecoil = myrecoil + 10
                if self.BurstFire then
                    self.Primary.Automatic = self.Primary.Automatic2
                else
                    self.Primary.Automatic = true
                end
                self:Recoil()
                self:ShootEffects()
                if GetConVar("cl_buu_barrelsmoke"):GetInt() == 1 then
                    if self:GetBuu_LastFire() < self.Primary.Delay*10 then
                        self:SetBuu_LastFire(self:GetBuu_LastFire()+self.Primary.Delay*4)
                    end
                end
                if IsFirstTimePredicted() then
                    if self:GetBuu_Ironsights() then
                        self.Owner:ViewPunch(Angle(self:GetBuu_ViewPunch1() * (self.Primary.Recoil / 2), self:GetBuu_ViewPunch2() * (self.Primary.Recoil / 2), 0))
                    else
                        self.Owner:ViewPunch(Angle(self:GetBuu_ViewPunch1() * (self.Primary.Recoil), self:GetBuu_ViewPunch2() * (self.Primary.Recoil), 0))
                    end
                end
                self:CSShootBullet(self.Primary.Damage, self.Primary.Delay, self.Primary.NumShots, self.Primary.Cone)
                if self.Primary.SoundChannelSwap == true then
                    if shootchannel == CHAN_WEAPON then
                        shootchannel = CHAN_WEAPON+100
                    else
                        shootchannel = CHAN_WEAPON
                    end
                end
                if self.Silenced == false then
                    self:EmitSound(self.Primary.Sounds[math.random(1, #self.Primary.Sounds)],100,math.random(97,102), 1, shootchannel)
                else
                    self:EmitSound(self.Primary.SoundSilenced,100,math.random(97,102),1,shootchannel)
                end
                if self:Clip1() <= math.ceil(self.Primary.ClipSize/4) && GetConVar("cl_buu_lowammowarn"):GetInt() == 1 then
                    self:EmitSound("weapons/shotgun/shotgun_empty.wav",75,100,1,CHAN_ITEM)
                end
                self:TakePrimaryAmmo(self.Primary.TakeAmmo)
                if self.BurstFire then
                    self:SetBuu_BurstCount(self:GetBuu_BurstCount() + 1)
					self:SetBuu_LastBurst(CurTime()+self.BurstTime)
                else
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

    -- Set the correct shooting sound
    if #self.Primary.Sounds == 1 && self.Primary.Sounds[1] != self.Primary.Sound then
        self.Primary.Sounds[1] = self.Primary.Sound
    end

	if self.BurstFire && !self.Owner:KeyDown(IN_ATTACK) && self:GetBuu_BurstCount() < CurTime() && self:GetBuu_BurstCount() != 0 then
		self:SetBuu_BurstCount(0)
		self:SetBuu_LastBurst(0)
		self:SetBuu_GotoIdle(CurTime() + 0.04)
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		self.Primary.Automatic = false
	end
	
	local Tr = self.Owner:GetEyeTrace()
	if Tr.Hit and Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40 && GetConVar("sv_buu_nearwall"):GetInt() == 1 then
		self:SetBuu_NearWall(true)
	else
		self:SetBuu_NearWall(false)
	end

	local Tr = self.Owner:GetEyeTrace()
	if !self.Shotgun && self.Owner:KeyPressed(IN_RELOAD) && CurTime() > self:GetNextPrimaryFire() && !self:GetBuu_Reloading() && self.Weapon:Clip1() < self.Primary.ClipSize && self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) > 0 then -- Witness me!
        local anim
        if self.Weapon:Clip1() <= 0 && self.UseLastReload then 
            anim = ACT_VM_RELOAD_EMPTY
            self.Weapon:SendWeaponAnim(anim)
            self:SetBuu_ReloadTimer(CurTime() + self.Owner:GetViewModel():SequenceDuration())
            self:SetBuu_ReloadGiveAmmo(CurTime() + self.Owner:GetViewModel():SequenceDuration()*self.ReloadAmmoTimeLast)
        else
            anim = ACT_VM_RELOAD
            self.Weapon:SendWeaponAnim(anim)
            self:SetBuu_ReloadTimer(CurTime() + self.Owner:GetViewModel():SequenceDuration())
            self:SetBuu_ReloadGiveAmmo(CurTime() + self.Owner:GetViewModel():SequenceDuration()*self.ReloadAmmoTime)
        end
        if SERVER then
            net.Start("BuuBaseSendReloadToClient")
            net.WriteInt(anim, 32)
            net.Send(self.Owner)
        end
        if CLIENT then return end
		self:SetBuu_Reloading(true)
		self:SetBuu_BurstCount(0)
		self:SetBuu_LastBurst(0)
        self:SetBuu_MagDropTime(CurTime()+self.MagDropTime)
        
        
		if self.Hold == "pistol" then
			self:SetWeaponHoldType( "pistol" )
			self:SetHoldType("pistol")
		elseif self.Hold == "revolver" then
			self:SetHoldType("revolver")
			self:SetWeaponHoldType( "revolver" )
		elseif self.Hold == "rifle" then
			self:SetWeaponHoldType( "smg" )
			self:SetHoldType("smg")
		elseif self.Hold == "shotgun" then
			self:SetWeaponHoldType( "shotgun" )
			self:SetHoldType("shotgun")
		end
		
		self.Owner:SetAnimation(PLAYER_RELOAD)
	elseif self.Shotgun && self.Owner:KeyPressed(IN_RELOAD) && CurTime() > self:GetNextPrimaryFire() && self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) > 0 && self:GetBuu_Reloading() == false && self.Weapon:Clip1() < self.Primary.ClipSize then
        self:SetBuu_Reloading(true)
        self:StartMyReload()
    end
	if (self.Owner:KeyDown(IN_ATTACK2) && !self:GetBuu_Sprinting() && !self:GetBuu_NearWall() && self:GetBuu_Reloading() == false) then
        if self:GetBuu_Ironsights() == false then
            self:SetBuu_TimeToScope(CurTime()+0.25)
			if !(self.Sniper == false && GetConVar("sv_buu_ironsights"):GetInt() == 0) then
				self:SetBuu_Ironsights(true)
			end
			if GetConVar("sv_buu_ironsights"):GetInt() == 1 then
				if self.IronsightSound == 1 then
					self:EmitSound( "buu/base/ironsight_pistol"..tostring(math.random(1,5))..".wav", 75, 100, 1, CHAN_VOICE2 ) 
				elseif self.IronsightSound == 2 then
					self:EmitSound( "buu/base/ironsight_smg"..tostring(math.random(1,5))..".wav", 75, 100, 1, CHAN_VOICE2 ) 
				elseif self.IronsightSound == 3 then
					self:EmitSound( "buu/base/ironsight_rifle"..tostring(math.random(1,5))..".wav", 75, 100, 1, CHAN_VOICE2 ) 
				end
			end
        end
		if self.Sniper && self:GetBuu_TimeToScope() < CurTime() then
			self.Owner:DrawViewModel( false )
			self.Owner:GetViewModel():SetRenderMode(RENDERMODE_TRANSALPHA)
			self.Owner:GetViewModel():SetColor(Color(255,255,255,0))
			self.Owner:SetFOV( self.SniperZoom, 0.01 )
		end
	else
		if self:GetBuu_Ironsights() == true then
			self:SetBuu_Ironsights(false)
			if GetConVar("sv_buu_ironsights"):GetInt() == 1 then
				if self.IronsightSound == 1 then
					self:EmitSound( "buu/base/ironsight_pistol"..tostring(math.random(1,5))..".wav", 75, 100, 1, CHAN_VOICE2 ) 
				elseif self.IronsightSound == 2 then
					self:EmitSound( "buu/base/ironsight_smg"..tostring(math.random(1,5))..".wav", 75, 100, 1, CHAN_VOICE2 ) 
				elseif self.IronsightSound == 3 then
					self:EmitSound( "buu/base/ironsight_rifle"..tostring(math.random(1,5))..".wav", 75, 100, 1, CHAN_VOICE2 ) 
				end
			end
        end
        self:SetBuu_TimeToScope(0)
        if self.Sniper then
			self.Owner:DrawViewModel( true )
			self.Owner:GetViewModel():SetRenderMode(RENDERMODE_NORMAL)
			self.Owner:GetViewModel():SetColor(Color(255,255,255,255))
			self.Owner:SetFOV( 0, 0.01 )
        end
	end
    if self.Sniper && !self.AutoSniper && CurTime() < self:GetNextPrimaryFire() && self:GetBuu_Ironsights() then
		self:SetBuu_Ironsights(false)
        self:SetBuu_TimeToScope(0)
        if self.Sniper then
			self.Owner:DrawViewModel( true )
			self.Owner:GetViewModel():SetRenderMode(RENDERMODE_NORMAL)
			self.Owner:GetViewModel():SetColor(Color(255,255,255,255))
			self.Owner:SetFOV( 0, 0.01 )
        end
    end
	if self.Owner:KeyDown(IN_SPEED) && self.Owner:GetVelocity():Length() > self.Owner:GetWalkSpeed() && (!self.Owner:KeyDown(IN_DUCK) || (self.Owner.Sliding && GetConVar("sv_buu_slideshoot"):GetInt() == 0)) && self.Owner:IsOnGround() && (self.Owner:KeyDown(IN_FORWARD) || self.Owner:KeyDown(IN_BACK) || self.Owner:KeyDown(IN_MOVELEFT) ||self.Owner:KeyDown(IN_MOVERIGHT)) && GetConVar("sv_buu_sprinting"):GetInt() == 1 then -- Amazing chest ahead
		self:SetBuu_Sprinting(true)
	else
		self:SetBuu_Sprinting(false)
	end
	
	-- Holdtypes
	if !self:GetBuu_Reloading() == true && !self:GetBuu_Sprinting() && !self:GetBuu_NearWall() then
		if self.Hold == "pistol" || self.Hold == "revolver" then
			if self:GetBuu_Ironsights() then
				self:SetWeaponHoldType( "revolver" )
			else
				self:SetWeaponHoldType( "pistol" )
			end
		elseif self.Hold == "rifle" then
			if self:GetBuu_Ironsights() then
				self:SetWeaponHoldType( "ar2" )
			else
				self:SetWeaponHoldType( "shotgun" )
			end
		elseif self.Hold == "shotgun" then
			if self:GetBuu_Ironsights() then
				self:SetWeaponHoldType( "ar2" )
			else
				self:SetWeaponHoldType( "shotgun" )
			end
		end
	elseif !self:GetBuu_Reloading() == true then
		if self.Hold == "pistol" || self.Hold == "revolver" then
			self:SetWeaponHoldType( "normal" )
		else
			self:SetWeaponHoldType( "passive" )
		end
	end
	
	if SERVER then
        sv_myrecoil = Lerp(6*FrameTime(),sv_myrecoil,0)
        sv_myrecoilyaw = Lerp(6*FrameTime(),sv_myrecoilyaw,0)
        sv_e_recoilyaw = Lerp(6*FrameTime(),sv_e_recoilyaw,sv_myrecoilyaw)
	end
    if self:GetBuu_GotoIdle() < CurTime() && !(self:GetBuu_GotoIdle() == 0) then
        self:SetBuu_GotoIdle(0)
    end

    if self:GetBuu_ReloadTimer() < CurTime() && !(self:GetBuu_ReloadTimer() == 0) && self:GetBuu_Reloading() == true then
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
                local shellstofill = math.min(self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()), self.ShotgunReloadAmount)
                if self:Clip1()+shellstofill > self:GetMaxClip1() then
                    shellstofill = self:GetMaxClip1() - self:Clip1()
                end
                self.Owner:RemoveAmmo( shellstofill, self.Weapon:GetPrimaryAmmoType() )
                self.Weapon:SetClip1(self:Clip1()+shellstofill)
                self:SetBuu_ReloadGiveAmmo(0)
            end
        end
    end
    if self.Shotgun then
        self:DoMyReload() -- Predicted shotgun reload function
    end
    self:MagazineDrop() -- Predicted mag drop function
	
	-- Custom jumping animation
	if CLIENT then
		if !self.Owner:IsOnGround() then
			self.LandTime = RealTime() + 0.31
		end

		if (self.Owner:GetMoveType() == MOVETYPE_NOCLIP || self.Owner:GetMoveType() == MOVETYPE_LADDER || self.Owner:WaterLevel() > 1 ) || (self.LandTime < RealTime() && self.LandTime != 0) then
			self.LandTime = 0
			self.JumpTime = 0
		end

		if self.Owner:KeyDownLast( IN_JUMP ) then
			if self.JumpTime == 0 then
				self.JumpTime = RealTime() + 0.31
				self.LandTime = 0
			end
		end
	end
	
	-- Clientise settings stuff
	if GetConVar("cl_buu_custombob"):GetInt() == 1 then
		self.BobScale = 0
	else
		self.BobScale = 1
	end
	
	if GetConVar("cl_buu_customsway"):GetInt() == 1 then
		self.SwayScale = 0
	else
		self.SwayScale = 1
	end
	
	-- Holding breath while using scope
	if GetConVar("sv_buu_sniperbreath"):GetInt() == 1 then
		if self.Sniper then
			if self.Owner:KeyPressed(IN_WALK) && self:GetBuu_ScopeBreathe() == 0 && self:GetBuu_Ironsights() then
				self:SetBuu_ScopeBreathe(CurTime()+3)
				self:EmitSound("buu/base/breathe_in"..math.random(1,2)..".wav", 75, 100, 1, CHAN_ITEM )
			elseif !(self:GetBuu_ScopeBreathe() <= 0) && (self:GetBuu_ScopeBreathe() < CurTime() || self.Owner:KeyReleased(IN_WALK) || !self:GetBuu_Ironsights()) then
				self:SetBuu_ScopeBreathe(-2)
				self:EmitSound("buu/base/breathe_out"..math.random(1,3)..".wav", 75, 100, 1, CHAN_ITEM )
			end
		end
		if self:GetBuu_ScopeBreathe() < 0 then
			if self:GetBuu_ScopeBreathe() < -1 && self:GetBuu_ScopeBreathe() != 0 then
				self:SetBuu_ScopeBreathe(self:GetBuu_ScopeBreathe()+0.01)
			end
			if self:GetBuu_ScopeBreathe() > -1 then
				self:SetBuu_ScopeBreathe(0)
			end
		end
	end
	
    -- Flashlight    
    if GetConVar("cl_buu_customflashlight"):GetInt() == 1 then
		if SERVER && self.Owner:GetNWBool("BuuBase_Flashlight", false) then
			self.flashlight = ents.Create( "env_projectedtexture" )
	
			self.flashlight:SetKeyValue( "enableshadows", 1 )
			self.flashlight:SetKeyValue( "nearz", 1 )
			self.flashlight:SetKeyValue( "lightfov", math.Clamp( 50, 10, 170 ) ) 
            
			local dist = 712
			if ( !game.SinglePlayer() ) then dist = math.Clamp( dist, 64, 2048 ) end
			self.flashlight:SetKeyValue( "farz", dist )

			local c = Color(255,255,255,255)
			local b = 1
			if ( !game.SinglePlayer() ) then b = math.Clamp( b, 0, 8 ) end
			self.flashlight:SetKeyValue( "lightcolor", Format( "%i %i %i 255", c.r * b, c.g * b, c.b * b ) )

            self.flashlight:SetParent( self.Owner:GetViewModel() )
			
            self:HandleMuzzleAttachmentFlashlight(self.flashlight, self.Owner:GetViewModel())
            
            self.flashlight:Spawn()
			self.flashlight:Remove()
		end
	end
    
	-- Barrel Smoke
	//self.Owner:ChatPrint(self:GetBuu_LastFire().." / "..self.Primary.Delay*10)
	if GetConVar("cl_buu_barrelsmoke"):GetInt() == 1 && ((game.SinglePlayer() && SERVER ) || (!game.SinglePlayer() && IsFirstTimePredicted())) then
		if self:GetBuu_LastFire() > 0 then
			self:SetBuu_LastFire(self:GetBuu_LastFire()-0.01)
		elseif self:GetBuu_Smoking() == true then
			self:SetBuu_Smoking(false)
		end
		if self:GetBuu_LastFire() > self.Primary.Delay*10 && !self.Owner:KeyDown(IN_ATTACK) then
			if self:GetBuu_Smoking() == false then

				self:SetBuu_Smoking(true)
				local fx = EffectData( )
				fx:SetOrigin( self.Owner:GetShootPos( ) )
				fx:SetEntity( self )
				fx:SetStart( self.Owner:GetShootPos( ) )
				fx:SetNormal( self.Owner:GetAimVector( ) )
				fx:SetAttachment( 1 )
                util.Effect( "buu_smoketrail", fx )
			end
		end
	end
    
    -- Sliding
    if SERVER then
        local vel = self.Owner:GetVelocity()
        if self.Owner.SlideCond == nil then
            self.Owner.SlideCond = false
            self.Owner.SlideTime = nil
            self.Owner.Sliding = false
            self.Owner.SlideLastDir = self.Owner:GetForward()
            self.Owner.NextSlideEffect = CurTime()
            net.Start("BuuBaseSendSlideToClient")
            net.WriteBool(self.Owner.Sliding)
            net.WriteEntity(self.Owner)
            net.Broadcast()
        end
        
        if GetConVar("sv_buu_canslide"):GetInt() == 1 then
            local tr = util.QuickTrace(self.Owner:GetPos(), (self.Owner:GetUp() * -1) * 20, self.Owner);
            
            if tr.Hit then
                self.Owner.CanSlide = true
            else
                self.Owner.CanSlide = false
            end
            if !self.Owner.SlideCond && self.Owner:KeyDown(IN_SPEED) && self.Owner:KeyDown(IN_DUCK) && self.Owner.CanSlide && vel:Length() >= self.Owner:GetRunSpeed() then
                if SERVER then
                    self.Owner:EmitSound("physics/body/body_medium_impact_soft3.wav", math.Rand(80, 100), math.Rand(90, 120))
                end
                self.Owner.SlideCond = true
                self.Owner.SlideLastVel = vel:Length()
                self.Owner.SlideLastDir = vel:GetNormalized()
                self.Owner.SlideTime = CurTime() + math.Clamp(self.Owner.SlideLastVel / 600, 0, 2)
            elseif self.Owner.SlideCond && self.Owner.Sliding && !self.Owner:KeyDown(IN_SPEED) || !self.Owner:KeyDown(IN_DUCK) || !self.Owner.CanSlide then
                self.Owner.SlideCond = false
                self.Owner.SlideTime = nil
                self.Owner.Sliding = false
            end
            
            if self.Owner.SlideCond && self.Owner.SlideLastVel > 0 then
                self.Owner.Sliding = true
                self.Owner.SlideCond = true
                
                if self.Owner.SlideTime && self.Owner.SlideTime < CurTime() then
                    self.Owner.SlideLastVel = self.Owner.SlideLastVel - FrameTime() * 600
                end	
                
                self.Owner:SetLocalVelocity(self.Owner.SlideLastDir * self.Owner.SlideLastVel)
                
                if self.Owner.NextSlideEffect <= CurTime() then
                    self.Owner.NextSlideEffect = CurTime() + 0.03
                    local effect = EffectData()
                    effect:SetOrigin(tr.HitPos)
                    effect:SetEntity(self.Owner)
                    effect:SetNormal(tr.HitNormal)
                    util.Effect("buu_slidedust",effect)
                end	
            elseif self.Owner.Sliding && self.Owner.SlideLastVel <= 0 || self.Owner.Sliding && !self.Owner.CanSlide then
                self.Owner.SlideTime = nil
                self.Owner.Sliding = false
                self.Owner.SlideCond1 = false
            end
            
            local tr = util.QuickTrace(self.Owner:GetPos() + Vector(0,0,50) , (self.Owner.SlideLastDir * 50), self.Owner);
            if tr && tr.Hit && self.Owner.Sliding && self.Owner.SlideCond then
                self.Owner.SlideTime = nil
                self.Owner.Sliding = false
                self.Owner.SlideCond = false
        
                self.Owner:SetVelocity(self.Owner:GetAimVector(), 0)
                if SERVER then
                    self.Owner:EmitSound("physics/body/body_medium_impact_hard" .. math.random(1, 6) .. ".wav", math.Rand(80, 100), math.Rand(90, 120))
                end
                if tr.Entity:IsValid() && GetConVar("sv_buu_slidedamage"):GetInt() == 1 then
                    tr.Entity:TakeDamage(self.Owner.SlideLastVel / 20, self.Owner)
                end
                local shake = ents.Create( "env_shake" )
                shake:SetOwner(self.Owner)
                shake:SetPos( tr.HitPos )
                shake:SetKeyValue( "amplitude", "2500" )
                shake:SetKeyValue( "radius", "100" )
                shake:SetKeyValue( "duration", "0.5" )
                shake:SetKeyValue( "frequency", "255" )
                shake:SetKeyValue( "spawnflags", "4" )	
                shake:Spawn()
                shake:Activate()
                shake:Fire( "StartShake", "", 0 )
            end	
            
            if self.Owner.LastSlide == nil then
                self.Owner.LastSlide = false
            end
            
            if self.Owner.LastSlide != self.Owner.Sliding then
                self.Owner.LastSlide = self.Owner.Sliding
                net.Start("BuuBaseSendSlideToClient")
                net.WriteBool(self.Owner.Sliding)
                net.WriteEntity(self.Owner)
                net.Broadcast()
            end
        end
    end
end

function SWEP:HandleMuzzleAttachmentHelper(attachments)
	for k, v in pairs(attachments) do
		if v.name == "muzzle" then return v.name end
		if v.name == "spark" then return v.name end
		if v.name == "laser" then return v.name end
		if v.name == "1" then return v.name end
	end
	return "nil"
end

function SWEP:HandleMuzzleAttachmentFlashlight(flashlight, viewmodel)
	local attachs = viewmodel:GetAttachments()
	local name = self:HandleMuzzleAttachmentHelper(attachs)

	if not (name == "nil") and viewmodel:GetOwner():Alive() then
		flashlight:SetParent(viewmodel)
		flashlight:Fire("SetParentAttachment", tostring(name) )
	elseif viewmodel:GetOwner():Alive() then
		flashlight:SetParent(viewmodel)
		timer.Simple(0, function() 
            flashlight:SetPos(viewmodel:GetPos()) 
            flashlight:SetAngles(viewmodel:GetAngles()) 
            flashlight:SetParent(viewmodel) 
        end)
	end
end

-- Real men code their own SWEP:Reload() (Mine's in think)
function SWEP:Reload() 
end


-- Dropping Mags
function SWEP:MagazineDrop()
	if !self.MagDrop then return end
	if GetConVar("sv_buu_magdrop"):GetInt() == 0 && self:GetBuu_MagDropTime() < CurTime() && !(self:GetBuu_MagDropTime() == 0) then
		self:SetBuu_MagDropTime(0)
		return
	end
    if self:GetBuu_MagDropTime() < CurTime() && !(self:GetBuu_MagDropTime() == 0) then
        self:SetBuu_MagDropTime(0)
        local magpos = self.Owner:GetShootPos()
        magpos = magpos + self.Owner:GetForward()*10
        magpos = magpos + self.Owner:GetRight()*5
        magpos = magpos + self.Owner:GetUp()*-10
        if (SERVER) then
                
            local mag = ents.Create("gun_clip")
            if (IsValid(mag)) then
                mag:SetPos(magpos)
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
function BuusSuperSexyCalcView(ply,origin,angles,fov,vm_origin,vm_angles)
    if ply:GetActiveWeapon().IsBuuBase && GetConVar("cl_buu_slidetilt"):GetInt() == 1 then
        if !ply:Alive() then return end

		local DistIn
		local DistOut
		
		if ply.Sliding == nil or ply.SlideLeanAngle == nil then
			ply.Sliding = false
			ply.SlideLeanAngle = 0
		end
		
		if ply.Sliding and ply.SlideLeanAngle < 20 then
			DistIn = ply.SlideLeanAngle - 20
			ply.SlideLeanAngle = math.Approach(ply.SlideLeanAngle, 20, FrameTime() * (DistIn * 6))
		elseif !ply.Sliding and ply.SlideLeanAngle > 0 then 
			DistOut = ply.SlideLeanAngle - 0
			ply.SlideLeanAngle = math.Approach(ply.SlideLeanAngle, 0, FrameTime() * (DistOut * 6))
		end
	
		if ply.SlideLeanAngle != 0 then -- no more affect other calc view
			angles.roll = angles.roll + ply.SlideLeanAngle
		end
    end
	if ply:GetActiveWeapon().IsBuuBase && !ply:GetActiveWeapon().Sniper then
		local m_PlayerCam = GAMEMODE:CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
		m_PlayerCam.origin = origin
		m_PlayerCam.angles = angles
		m_PlayerCam.fov = myfov
		myfov = Lerp(10*FrameTime(),myfov,myfov_t)
		if ply:GetActiveWeapon():GetBuu_Ironsights() then 	
			myfov_t = ply:GetActiveWeapon().IronsightFOV
		else 
			myfov_t = LocalPlayer():GetInfoNum("fov_desired",90)
		end
        
		/*myrecoil = Lerp(20*FrameTime(),myrecoil,0)
		myrecoilyaw = Lerp(20*FrameTime(),myrecoilyaw,0)
		e_recoilyaw = Lerp(20*FrameTime(),e_recoilyaw,myrecoilyaw)
		
		m_PlayerCam.angles = Angle(angles.p-myrecoil,angles.y-e_recoilyaw ,angles.r)*/
		return m_PlayerCam,GAMEMODE:CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
	end
end
hook.Add( "CalcView", "BuusSuperSexyCalcView", BuusSuperSexyCalcView )

-- Makes your gun spit bullets
function SWEP:CSShootBullet(dmg, recoil, numbul, cone)

	numbul 		= numbul or 1
	cone 			= cone or 0.01

	local bullet 	= {}
	bullet.Num  	= numbul
	bullet.Src 		= self.Owner:GetShootPos()
    bullet.Dir 		= (self.Owner:EyeAngles() + self.Owner:GetViewPunchAngles() + Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0) * 33):Forward()
	bullet.Spread 	= Vector(cone, cone, 0)
	bullet.Tracer 	= 0
	bullet.Force 	= 0.5 * dmg
	bullet.Damage 	= dmg
	bullet.Callback = HitImpact

	self.Owner:FireBullets(bullet)	
    
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

	if trace.HitPos:Distance(self.Owner:GetShootPos()) > 250 or self.DestroyDoor == 0 or GetConVar("sv_buu_shotgunwreckdoors"):GetInt() == 0 then return end

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


function SWEP:GetBoneOrientation( ent, bonename )
	
	local pos, ang

	if (!ent:LookupBone(bonename)) then return nil, nil end
	
	local bone = ent:GetBoneMatrix(ent:LookupBone(bonename))
	if (bone) then
		pos, ang = bone:GetTranslation(), bone:GetAngles()
	else
		pos, ang = Vector(0,0,0), Angle(0,0,0)
	end
	
	return pos, ang
end

local tr = {}
local LaserBeam  = Material('effects/buu_laser')
local LaserPoint = Material('sprites/redglow1')
local LastLaserPos = Vector(0,0,0)
local point_pos = Vector(0,0,0)
function SWEP:ViewModelDrawn(vm)
    if self.Laser == true || self:GetClass() == "weapon_buu_base2" then
        if self:GetClass() == "weapon_buu_base2" then
            self.LaserBone = "ValveBiped.base"
            self.LaserPos = Vector(0,13,0)
            self.LaserAng = Angle(90,0,0)
        end
        local pos, ang = self:GetBoneOrientation( vm, self.LaserBone )
        local aim = self.Owner:EyeAngles()
        pos = pos + ang:Right() * self.LaserPos.x + ang:Up() * self.LaserPos.y + ang:Forward() * self.LaserPos.z
        ang:RotateAroundAxis(ang:Right(), self.LaserAng.p)
        ang:RotateAroundAxis(ang:Up(), self.LaserAng.y)
        ang:RotateAroundAxis(ang:Forward(), self.LaserAng.r)
        ang = ang:Forward()
        dir = ang
        
        tr.start = pos
        tr.endpos = tr.start + dir * 8192
        tr.filter = self.Owner
        
        trace = util.TraceLine(tr)
        
        if util.PointContents(trace.HitPos) != CONTENTS_SOLID then
            dist = tr.start:Distance(trace.HitPos)
            
            render.SetMaterial(LaserBeam)
            render.DrawBeam(pos + dir, pos + dir * math.Clamp(dist, 0, 75), 0.5, 0, 0.99, Color(255,0,0))
            
            if !(dist < 172) && (self:GetBuu_Sprinting() || self:GetBuu_NearWall() || (!self.Owner:IsOnGround() && self.Owner:GetMoveType() != MOVETYPE_NOCLIP) || self.LandTime > RealTime() || self.Owner:GetVelocity():Length() > 30 || self:GetBuu_Reloading()) then
                point_pos = LerpVector(10*FrameTime(), trace.HitPos, point_pos)
            elseif dist < 172 then
                point_pos = LerpVector(1-dist/172, point_pos, trace.HitPos)
            else
                point_pos = LerpVector(30*FrameTime(), point_pos, self.Owner:GetEyeTrace().HitPos)
            end
            
            render.DrawBeam(point_pos, LastLaserPos, 3, 0, 1, Color(255, 0, 0, 255))
            render.SetMaterial(LaserPoint)
            render.DrawSprite(point_pos, 3, 3, Color(255, 0, 0, 255))
            
            LastLaserPos = point_pos
            
        end
    end
end

hook.Add("PostDrawTranslucentRenderables", "DrawPreviewRope", function()
    for k, v in pairs( player.GetAll() ) do
        if v:GetActiveWeapon().IsBuuBase && v:GetActiveWeapon().Laser && GetViewEntity() != v then
            local trace = v:GetEyeTrace()
            local pos = trace.HitPos
            local ang = trace.HitNormal:Angle() + Angle(90,0,0)
            render.SetMaterial(LaserPoint)
            render.DrawSprite(pos, 6, 6, Color(255, 0, 0, 255))
        end
    end
end)


if CLIENT then
	-- This is where all the sexy movement in the viewmodel happens. This shit is bootyfull
	-- If you guys get the chance, go give Kudo's to MushroomGuy for teaching me Lerp
	-- Lerp is one of the coolest and most sexy things to come to Garry's Mod
	-- Wow are these comments that interesting that you're still reading them?
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
	local ironsighttime = 0
	SWEP.LastEyePosition = Angle(0,0,0)
	SWEP.EyePosition = Angle(0,0,0)
	
	function SWEP:GetViewModelPosition(pos, ang)
		if !IsValid(self.Owner) then return end
		local ply = LocalPlayer()
		local weapon = ply:GetActiveWeapon()
		local walkspeed = self.Owner:GetVelocity():Length() 
		
		
		/*--------------------------------------------
				  Animation Transition Speed 
		--------------------------------------------*/
		
		if self.LandTime > RealTime() && !(self.Owner:KeyDown(IN_SPEED) && self.Owner:IsOnGround()) then
			TestVector = LerpVector(20*FrameTime(),TestVector,TestVectorTarget) 
            TestVectorAngle = LerpVector(20*FrameTime(),TestVectorAngle,TestVectorAngleTarget)
        elseif IsValid(self.Owner) && !self.Owner:KeyDown(IN_SPEED) && !(self.Owner:KeyDown(IN_DUCK) && walkspeed > 40) then
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
		
		
		/*--------------------------------------------
		Ironsight, Crouching, Near Wall, and Sprinting
		--------------------------------------------*/
		
		local maxroll = 30 // How much to roll the gun when going to ironsights
        if self:GetBuu_Ironsights() && !self:GetBuu_Reloading() == true && GetConVar("sv_buu_ironsights"):GetInt() then 	
        	if (self:GetBuu_GotoIdle() > CurTime() && self.UseNormalShootIron == false) || self:GetBuu_LastBurst() > CurTime() then
                TestVectorTarget = self.IronSightsPos + (self.IronSightsShootPos-self.IronSightsPos)
            else
                TestVectorTarget = self.IronSightsPos
            end
			ironsighttime = Lerp(10*FrameTime(), ironsighttime+1, maxroll)
			local targettime = 0
			if GetConVar("cl_buu_ironsightrolling"):GetInt() == 1 then
				targettime = (-(ironsighttime-(maxroll/2))^2 + (maxroll/2)^2)/(maxroll/2) // Parabolas! Thank you https://www.desmos.com for some nice visuals.
			end
			TestVectorAngleTarget = self.IronSightsAng + Vector(-targettime/(maxroll/3),0,-targettime)
        elseif self:GetBuu_Sprinting() && !self:GetBuu_Reloading() == true && (!self.Owner:KeyDown(IN_DUCK) || (self.Owner.Sliding && GetConVar("sv_buu_slideshoot"):GetInt() == 0)) && GetConVar("sv_buu_sprinting"):GetInt() == 1 then 
            TestVectorTarget = self.RunArmPos
            TestVectorAngleTarget = self.RunArmAngle
        elseif self:GetBuu_NearWall() && (self:Clip1() == self.Primary.ClipSize || !self:GetBuu_Reloading() == true) then 
            TestVectorTarget = self.RunArmPos
            TestVectorAngleTarget = self.RunArmAngle
        elseif self.Owner:Crouching() && !self:GetBuu_NearWall() then 
            TestVectorTarget = self.CrouchPos
            TestVectorAngleTarget = self.CrouchAng
        else
            TestVectorTarget = Vector(0,0,0)
            TestVectorAngleTarget = Vector(0,0,0)
        end
		ironsighttime = math.Clamp(ironsighttime - 1, 0, maxroll)
		
        
		
		/*--------------------------------------------
					 Viewmodel Jump Sway
		--------------------------------------------*/
		
		if GetConVar("cl_buu_customjump"):GetInt() == 1 then
			-- Use this if you gotta https://www.desmos.com/calculator/cahqdxeshd
			local function BezierY(f,a,b,c)
				f = f*3.2258
				return (1-f)^2 *a + 2*(1-f)*f*b + (f^2)*c
			end
			if !self:GetBuu_Ironsights() && self.Owner:WaterLevel() < 1 then
				if self.JumpTime > RealTime() then
					local f = 0.31 - (self.JumpTime-RealTime())

					local xx = BezierY(f,0,-4,0)
					local yy = 0
					local zz = BezierY(f,0,-2,-5)
					
					local pt = BezierY(f,0,-4.36,10)
					local yw = xx
					local rl = BezierY(f,0,-10.82,-5)
					
					TestVectorTarget = TestVectorTarget + Vector(xx, yy, zz)
					TestVectorAngleTarget = TestVectorAngleTarget + Vector(pt, yw, rl)
				elseif !ply:IsOnGround() && ply:GetMoveType() != MOVETYPE_NOCLIP then
					local BreatheTime = RealTime() * 30
					TestVectorTarget = TestVectorTarget + Vector(math.cos(BreatheTime/2)/16, 0, -5+(math.sin(BreatheTime/3)/16))
					TestVectorAngleTarget = TestVectorAngleTarget + Vector(10-(math.sin(BreatheTime/3)/4), math.cos(BreatheTime/2)/4, -5)
				elseif self.LandTime > RealTime() then
					local f = (self.LandTime-RealTime())
					
					local xx = BezierY(f,0,-4,0)
					local yy = 0
					local zz = BezierY(f,0,-2,-5)
					
					local pt = BezierY(f,0,-4.36,10)
					local yw = xx
					local rl = BezierY(f,0,-10.82,-5)
					
					TestVectorTarget = TestVectorTarget + Vector(xx, yy, zz)
					TestVectorAngleTarget = TestVectorAngleTarget + Vector(pt, yw, rl)
				end
			else
				TestVectorTarget = TestVectorTarget + Vector(0 ,0 , math.Clamp(self.Owner:GetVelocity().z / 1000,-1,1))
			end
		end
		
		
		/*--------------------------------------------
					  Viewmodel Bobbing
		--------------------------------------------*/
		
        if ply:IsOnGround() && GetConVar("cl_buu_custombob"):GetInt() == 1 then
			if self:GetBuu_Sprinting() && (!self:GetBuu_Reloading() == true) && GetConVar("sv_buu_sprinting"):GetInt() == 1 && !self.Owner.Sliding then
				local BreatheTime = RealTime() * 18
				TestVectorTarget = TestVectorTarget - Vector(((math.cos(BreatheTime/2)+1)*1.25)*walkspeed/400,0,math.cos(BreatheTime)*walkspeed/400)
				TestVectorAngleTarget = TestVectorAngleTarget - Vector(((math.cos(BreatheTime/2)+1)*-2.5)*walkspeed/400,((math.cos(BreatheTime/2)+1)*7.5)*walkspeed/400,0)
			elseif walkspeed > 20 && !self:GetBuu_NearWall() && !self.Owner.Sliding then
				local BreatheTime = RealTime() * 16
				if self:GetBuu_Ironsights() then
					TestVectorAngleTarget = TestVectorAngleTarget - Vector((math.cos(BreatheTime)/2)*walkspeed/200, (math.cos(BreatheTime / 2) / 2)*walkspeed/200,0)
				else
                    local roll = 0
                    local yaw = 0
                    if self.Owner:KeyDown(IN_MOVERIGHT) then
                        roll = -7*(walkspeed/self.Owner:GetWalkSpeed())
                    elseif self.Owner:KeyDown(IN_MOVELEFT) then
                        yaw = 7*(walkspeed/200)
                    end
					TestVectorTarget = TestVectorTarget - Vector((-math.cos(BreatheTime/2)/5)*walkspeed/200+yaw/5,0,0)
					TestVectorAngleTarget = TestVectorAngleTarget - Vector((math.Clamp(math.cos(BreatheTime),-0.3,0.3)*1.2)*walkspeed/200,(-math.cos(BreatheTime/2)*1.2)*walkspeed/200+yaw,roll)
				end
			elseif !self:GetBuu_Ironsights() then
				local BreatheTime = RealTime() * 2
				TestVectorTarget = TestVectorTarget - Vector(math.cos(BreatheTime/4)/4,0,-math.cos(BreatheTime/5)/4)
				TestVectorAngleTarget = TestVectorAngleTarget - Vector(math.cos(BreatheTime/5),math.cos(BreatheTime/4),math.cos(BreatheTime/7))
			end
		end
		
	
		/*--------------------------------------------
						Viewmodel Sway
		--------------------------------------------*/
		
		if GetConVar("cl_buu_customsway"):GetInt() == 1 then
			self.LastEyePosition = self.EyePosition
			
			Current_Aim = LerpAngle(5*FrameTime(), Current_Aim, ply:EyeAngles())
			
			self.EyePosition = Current_Aim - ply:EyeAngles()
			self.EyePosition.y = math.AngleDifference( Current_Aim.y, ply:EyeAngles().y ) -- Thank you MushroomGuy for telling me this function even existed
			
			ang:RotateAroundAxis(ang:Right(), math.Clamp(4*self.EyePosition.p/self.BuuSwayScale,-4,4))
			ang:RotateAroundAxis(ang:Up(), math.Clamp(-4*self.EyePosition.y/self.BuuSwayScale,-4,4))

			pos = pos + math.Clamp((-1.5*self.EyePosition.p/self.BuuSwayScale),-1.5,1.5) * ang:Up()
			pos = pos + math.Clamp((-1.5*self.EyePosition.y/self.BuuSwayScale),-1.5,1.5) * ang:Right()
		end
		
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
	if IsValid(weapon) && weapon.IsBuuBase && GetConVar("sv_buu_ironsightsway"):GetInt() == 1 then
		local ang = cmd:GetViewAngles()

		if weapon:GetBuu_Ironsights() then
			local ft = FrameTime()
			local BreatheTime = RealTime() * 2
			local MoveForce = CalcMoveForce(ply)
				   
			if weapon:GetBuu_ScopeBreathe() > CurTime() then
				MoveForce = MoveForce*20
			end
			ang.pitch = ang.pitch + math.cos(BreatheTime)*weapon.IronsightMoveIntensity / MoveForce
			ang.yaw = ang.yaw + math.cos(BreatheTime/2)*weapon.IronsightMoveIntensity / MoveForce
			
		end
		if !IsValid(weapon) then return end
		cmd:SetViewAngles(ang) 
		return
	else
		return
	end
end
hook.Add ("CreateMove", "BuuIronIdleMove", IronIdleMove)


-- Custom muzzleflashes
function SWEP:FireAnimationEvent(pos,ang,event)

	if (event==5001) then 
		if !IsValid(self.Owner) then return end
		if self.Silenced == true then
			local fx = EffectData( );
			fx:SetOrigin( self.Owner:GetShootPos( ) );
			fx:SetEntity( self );
			fx:SetStart( self.Owner:GetShootPos( ) );
			fx:SetNormal( self.Owner:GetAimVector( ) );
			fx:SetAttachment( 1 );
			util.Effect( "buu_muzzle_silenced", fx );
		else
			local fx = EffectData( );
			fx:SetOrigin( self.Owner:GetShootPos( ) );
			fx:SetEntity( self );
			fx:SetStart( self.Owner:GetShootPos( ) );
			fx:SetNormal( self.Owner:GetAimVector( ) );
			fx:SetAttachment( 1 );
			util.Effect( "buu_muzzle", fx );
		end	
		return true
	end

end


-- Shotgun reload stuff
function SWEP:StartMyReload()
	if !self.Shotgun then return end
    local anim = ACT_SHOTGUN_RELOAD_START
    self.Weapon:SendWeaponAnim(anim)
    if CLIENT then return end
    net.Start("BuuBaseSendReloadToClient")
    net.WriteInt(anim, 32)
    net.Send(self.Owner)
    self:SetBuu_Reloading(true)
    self:SetBuu_CanCancelReloading(false)
    self:SetBuu_StartShotgunReload(CurTime() + self.Owner:GetViewModel():SequenceDuration())
end

function SWEP:DoMyReload()
	if !self.Shotgun then return end
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
	if !self.Shotgun then return end
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
		return GetConVar("cl_buu_scopesensitivity"):GetFloat()
	elseif self:GetBuu_Ironsights() then
		return GetConVar("cl_buu_ironsensitivity"):GetFloat()
	else
		return 1
	end
end

-- Last but not least comes the drawing of the scope on the screen and crosshairs
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
        elseif !self:GetBuu_Ironsights() && !self:GetBuu_NearWall() && !self:GetBuu_Sprinting() && !self:GetBuu_Reloading() && GetConVar("sv_buu_crosshair"):GetInt() == 1 then
			self.DrawCrosshair = false
			if GetConVar("cl_buu_crosshairstyle"):GetInt() == 1 then
				self.DrawCrosshair = true
			elseif GetConVar("cl_buu_crosshairstyle"):GetInt() == 2 then
				local x, y
				local scale = 16
				if ( self.Owner == LocalPlayer() && self.Owner:ShouldDrawLocalPlayer() ) then // If thirdperson
					local tr = util.GetPlayerTrace( self.Owner )
					tr.mask = ( CONTENTS_SOLID+CONTENTS_MOVEABLE+CONTENTS_MONSTER+CONTENTS_WINDOW+CONTENTS_DEBRIS+CONTENTS_GRATE+CONTENTS_AUX )
					local trace = util.TraceLine( tr )

					local coords = trace.HitPos:ToScreen()
					x, y = coords.x, coords.y

				else
					x, y = ScrW()/2, ScrH()/2
				end
				if GetConVar("cl_buu_crosshairhealth"):GetInt() == 0 then
					surface.SetDrawColor( GetConVar("cl_buu_crosshairred"):GetInt(), GetConVar("cl_buu_crosshairgreen"):GetInt(), GetConVar("cl_buu_crosshairblue"):GetInt(), GetConVar("cl_buu_crosshairalpha"):GetInt() )
				else
					local hp = LocalPlayer():Health()
					local maxhp = LocalPlayer():GetMaxHealth()
					local r = math.Clamp(255*2-(hp*2/maxhp)*255, 0, 255)
					local g = math.Clamp((hp*2/maxhp)*255, 0, 255)
					local b = 0
					surface.SetDrawColor( r, g, b, GetConVar("cl_buu_crosshairalpha"):GetInt() )
				end
				
				surface.SetTexture(surface.GetTextureID("scope/xhair_zdoom"))
				surface.DrawTexturedRect(x-scale/2,y-scale/2,scale,scale)
				
			elseif GetConVar("cl_buu_crosshairstyle"):GetInt() == 3 then
				local x, y

				if ( self.Owner == LocalPlayer() && self.Owner:ShouldDrawLocalPlayer() ) then // If thirdperson
					local tr = util.GetPlayerTrace( self.Owner )
					tr.mask = ( CONTENTS_SOLID+CONTENTS_MOVEABLE+CONTENTS_MONSTER+CONTENTS_WINDOW+CONTENTS_DEBRIS+CONTENTS_GRATE+CONTENTS_AUX )
					local trace = util.TraceLine( tr )

					local coords = trace.HitPos:ToScreen()
					x, y = coords.x, coords.y

				else
					x, y = ScrW()/2, ScrH()/2
				end

				local scale = 1
				local LastShootTime = self:GetNextPrimaryFire()
				scale = scale * ( 2 - math.Clamp( ( CurTime() - LastShootTime )*3, -1.0, 1.0 ) ) + math.Clamp(LocalPlayer():GetVelocity():Length()/300, 0, 1.5)
				if GetConVar("cl_buu_crosshairhealth"):GetInt() == 0 then
					surface.SetDrawColor( GetConVar("cl_buu_crosshairred"):GetInt(), GetConVar("cl_buu_crosshairgreen"):GetInt(), GetConVar("cl_buu_crosshairblue"):GetInt(), GetConVar("cl_buu_crosshairalpha"):GetInt() )
				else
					local hp = LocalPlayer():Health()
					local maxhp = LocalPlayer():GetMaxHealth()
					local r = math.Clamp(255*2-(hp*2/maxhp)*255, 0, 255)
					local g = math.Clamp((hp*2/maxhp)*255, 0, 255)
					local b = 0
					surface.SetDrawColor( r, g, b, GetConVar("cl_buu_crosshairalpha"):GetInt() )
				end
				local gap = math.Clamp(0.03*2000*scale , 2, 150)
				local length = math.max(20 + gap, 4)
				surface.DrawLine( x - length, y, x - gap, y )	-- Left
				surface.DrawLine( x + length, y, x + gap, y )	-- Right
				surface.DrawLine( x-1, y - length, x-1, y - gap )	-- Top
				surface.DrawLine( x-1, y + length, x-1, y + gap )	-- Bottom
			elseif GetConVar("cl_buu_crosshairstyle"):GetInt() == 4 then
				local x, y

				if ( self.Owner == LocalPlayer() && self.Owner:ShouldDrawLocalPlayer() ) then // If thirdperson
					local tr = util.GetPlayerTrace( self.Owner )
					tr.mask = ( CONTENTS_SOLID+CONTENTS_MOVEABLE+CONTENTS_MONSTER+CONTENTS_WINDOW+CONTENTS_DEBRIS+CONTENTS_GRATE+CONTENTS_AUX )
					local trace = util.TraceLine( tr )

					local coords = trace.HitPos:ToScreen()
					x, y = coords.x, coords.y

				else
					x, y = ScrW()/2, ScrH()/2
				end

				local scale = 1
				local LastShootTime = self:GetNextPrimaryFire()
				scale = scale * ( 2 - math.Clamp( ( CurTime() - LastShootTime )*3, -1.0, 1.0 ) ) + math.Clamp(LocalPlayer():GetVelocity():Length()/300, 0, 1.5)
				local r = GetConVar("cl_buu_crosshairred"):GetInt()
				local g = GetConVar("cl_buu_crosshairgreen"):GetInt()
				local b = GetConVar("cl_buu_crosshairblue"):GetInt()
				local a = GetConVar("cl_buu_crosshairalpha"):GetInt()
				if GetConVar("cl_buu_crosshairhealth"):GetInt() == 0 then
					surface.SetDrawColor( r, g, b, a )
				else
					local hp = LocalPlayer():Health()
					local maxhp = LocalPlayer():GetMaxHealth()
					r = math.Clamp(255*2-(hp*2/maxhp)*255, 0, 255)
					g = math.Clamp((hp*2/maxhp)*255, 0, 255)
					b = 0
					surface.SetDrawColor( r, g, b, a )
				end
				local gap = math.Clamp(0.03*2000*scale , 2, 150)
				if self.Sniper then
					scale = scale/2
					gap = math.max(50*scale , 2) + 50
				end
				if self.Shotgun == false then
					surface.SetTexture(surface.GetTextureID("scope/xhair_fc3"))
					surface.DrawTexturedRectRotated(x,y+gap+5,4,16,0)
					surface.DrawTexturedRectRotated(x+gap+5,y,4,16,90)
					if !self.Sniper then
						surface.DrawTexturedRectRotated(x,y-gap-5,4,16,180)
					end
					surface.DrawTexturedRectRotated(x-gap-5,y,4,16,270)
				else
					surface.DrawCircle( x, y, self.Primary.Cone*500 + scale*10-1, Color(r*0.61, g*0.61, b*0.61, a))
					surface.DrawCircle( x, y, self.Primary.Cone*500 + scale*10+1, Color(r*0.61, g*0.61, b*0.61, a))
					surface.DrawCircle( x, y, self.Primary.Cone*500 + scale*10, Color(r, g, b, a) )
				end
			end
		else
			self.DrawCrosshair = false
		end
    end
end

-- Everything from here is hooks/Net messages

-- Headshot damage hooks
hook.Add( "ScalePlayerDamage", "BuuBaseScalePlayerDamage", function( ply, hitgroup, dmginfo )
	if !dmginfo:GetInflictor():IsPlayer() || !IsValid(dmginfo:GetInflictor():GetActiveWeapon()) || dmginfo:GetInflictor():GetActiveWeapon():GetClass() == nil then return end
	if !(GetConVar("sv_buu_headshotinstantkill"):GetInt() == 1 && (dmginfo:GetInflictor():GetActiveWeapon().IsBuuBase || dmginfo:GetInflictor():GetActiveWeapon().IsBuuBase)) then return end
	if ( hitgroup == HITGROUP_HEAD ) && GetConVar("sv_buu_headshotinstantkill"):GetInt() == 1 && IsValid(ply) && SERVER then
		ply:TakeDamage( ply:Health(), dmginfo:GetAttacker(), dmginfo:GetInflictor() )
 	else
		dmginfo:ScaleDamage( 1 )
	end
end)

hook.Add( "ScaleNPCDamage", "BuuBaseScaleNPCDamage", function( ent, hitgroup, dmginfo )
	if !dmginfo:GetInflictor():IsPlayer() ||!IsValid(dmginfo:GetInflictor():GetActiveWeapon()) || dmginfo:GetInflictor():GetActiveWeapon():GetClass() == nil then return end
	if !(GetConVar("sv_buu_headshotinstantkill"):GetInt() == 1 && (dmginfo:GetInflictor():GetActiveWeapon().IsBuuBase || dmginfo:GetInflictor():GetActiveWeapon().IsBuuBase)) then return end
	if ( hitgroup == HITGROUP_HEAD ) && IsValid(ent) && SERVER then
		ent:TakeDamage( ent:Health(), dmginfo:GetAttacker(), dmginfo:GetInflictor() )
 	else
		dmginfo:ScaleDamage( 1 )
	end
end)

-- Hide HL2 crosshair if not using that crosshair setting
hook.Add( "HUDShouldDraw", "HideHUDBuuBase2", function( name )
	local ply = LocalPlayer()
	if !IsValid(ply) then return end
	local weapon = ply:GetActiveWeapon()
	if IsValid(weapon) && weapon.IsBuuBase && (GetConVar("sv_buu_crosshair"):GetInt() == 0 || GetConVar("cl_buu_crosshairstyle"):GetInt() != 1) then
		if name == "CHudCrosshair" then return false end
	end
end)

-- Custom flashlight positioning hooks

hook.Add( "PlayerSwitchFlashlight", "FlashlightBuuToggle", function( ply, enabled )
	if !IsValid(ply) || !IsValid(ply:GetActiveWeapon()) || ply:GetActiveWeapon():GetClass() == nil then return end
    if GetConVar("cl_buu_customflashlight"):GetInt() == 0 then return end
    if ply.SwitchingFromBuu then
        ply.SwitchingFromBuu = false
        if IsValid(ply.flashlight) then
            ply.flashlight:Remove()
        end
    elseif ply:GetActiveWeapon().IsBuuBase || ply.SwitchingToBuu then
		ply:SetNWBool("BuuBase_Flashlight", !ply:GetNWBool("BuuBase_Flashlight", false))
		ply:EmitSound("items/flashlight1.wav")
        local self = ply
        timer.Simple(0, function() 
            if ply:GetNWBool("BuuBase_Flashlight") then
                self.flashlight = ents.Create( "env_projectedtexture" )
        
                self.flashlight:SetKeyValue( "enableshadows", 1 )
                self.flashlight:SetKeyValue( "nearz", 1 )
                self.flashlight:SetKeyValue( "lightfov", math.Clamp( 50, 10, 170 ) ) 
                
                local dist = 712
                if ( !game.SinglePlayer() ) then dist = math.Clamp( dist, 64, 2048 ) end
                self.flashlight:SetKeyValue( "farz", dist )

                local c = Color(255,255,255,255)
                local b = 1
                if ( !game.SinglePlayer() ) then b = math.Clamp( b, 0, 8 ) end
                self.flashlight:SetKeyValue( "lightcolor", Format( "%i %i %i 255", c.r * b, c.g * b, c.b * b ) )

                self.flashlight:SetParent( self:GetViewModel() )
                
                self:GetActiveWeapon():HandleMuzzleAttachmentFlashlight(self.flashlight, self:GetViewModel())
                
                self.flashlight:Spawn()
            elseif !ply:GetNWBool("BuuBase_Flashlight") && IsValid(ply.flashlight) then
                ply.flashlight:Remove()
            end
        end)
        if ply:FlashlightIsOn() && ply.SwitchingToBuu then
            ply.SwitchingToBuu = false
            return true
        else
            return false
        end
    end
end)

hook.Add("PlayerSpawn", "FlashlightBuuSpawn",  function(ply)
	ply:SetNWBool("BuuBase_Flashlight", false)
    ply.flashlight = nil
    ply.Sliding = false
end)

-- Flashlight hooks
hook.Add("PlayerSwitchWeapon", "FlashlightBuuSwitchWeapon", function(ply, old, new)
    if !IsValid(ply) || !IsValid(ply:GetActiveWeapon()) || ply:GetActiveWeapon():GetClass() == nil then return end
    if GetConVar("cl_buu_customflashlight"):GetInt() == 0 then return end
    if SERVER then
        if !old.IsBuuBase && new.IsBuuBase && ply:FlashlightIsOn() then
            ply.SwitchingToBuu = true
            ply:Flashlight(false)
            ply:SetNWBool("BuuBase_Flashlight", true)
        elseif !new.IsBuuBase && old.IsBuuBase && ply:GetNWBool("BuuBase_Flashlight", false) then
            ply.SwitchingFromBuu = true
            ply:Flashlight(true)
            ply:SetNWBool("BuuBase_Flashlight", false)     
        end
    end
end)

if SERVER then
    util.AddNetworkString( "BuuBaseSendReloadToClient" )
    util.AddNetworkString( "BuuBaseSendSlideToClient" )
end

-- Sliding hooks

if CLIENT then

    net.Receive( "BuuBaseSendReloadToClient", function(len, ply)
        local anim = net.ReadInt(32)
        if IsValid(ply) then 
            ply:GetActiveWeapon():SendWeaponAnim(anim)
        end
    end)
    
    net.Receive( "BuuBaseSendSlideToClient", function()
        local receive = net.ReadBool()
        local ply = net.ReadEntity()
        if IsValid(ply) && ply:Health() > 0 then 
            ply.Sliding = receive
        end
    end)

end

hook.Add("CalcMainActivity", "BuuBaseSlidingAnimation", function(ply, velocity)

	if IsValid(ply) && ply.Sliding then
		ply.CalcIdeal = ACT_MP_WALK
		ply.CalcSeqOverride = -1
        ply.CalcSeqOverride = ply:LookupSequence( "zombie_slump_idle_02" )
		return ply.CalcIdeal, ply.CalcSeqOverride
	end
    
end)

    
hook.Add("RenderScreenspaceEffects", "BuuBaseSlidingSound", function()
    local ply = LocalPlayer()
    if ply.Sliding then
        if !SlideSound then
            SlideSound = CreateSound(ply, "physics/flesh/flesh_scrape_rough_loop.wav")
            SlideSound:Play()
        end			
    else
        if SlideSound then
            SlideSound:Stop()
            SlideSound = nil
        end	
    end
end)

-- Dumbledore kills Snape