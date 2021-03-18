/**************************************************************
Hello there!
This is a complete remake of my weapon_buu_base
I have tried to keep everything as neat as possible for readibility
Sadly, my old sweps broke as a result, so those need to be fixed
- If you came here to learn, go for it! Everything should be as commented as possible
- If you came here to steal, please give me credit, no one will judge you for using part of someone's code :(
- If you came here to borrow code for your weapon of mass destruction, feel free to do so but please leave Portugal intact, I like it here
- If you came here for any other reason, sorry I ignored you :((
Have fun!
If you need anything, I'm always reachable ^^
https://github.com/buu342/GMod-BuuBaseRedone
**************************************************************/

AddCSLuaFile()

// SWEP Info
SWEP.Author       = "Buu342"
SWEP.Name         = "Buu Base"
SWEP.Contact      = "buu342@hotmail.com"
SWEP.Purpose      = "To act as a base for my sweps"
SWEP.Instructions = "Left click to shoot, right click to use sights."
SWEP.Category     = "Buu342"

// Spawning settings
SWEP.Spawnable      = false
SWEP.AdminSpawnable = false 
SWEP.AdminOnly      = false

// HUD and viewmodel settings
SWEP.DrawAmmo        = true
SWEP.DrawCrosshair   = false
SWEP.ViewModelFOV    = 45
SWEP.ViewModelFlip   = false
SWEP.UseHands        = true

// Model settings
SWEP.ViewModel  = "models/weapons/c_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"

// Primary Fire Mode
SWEP.Primary.Sound       = Sound("weapons/smg1/smg1_fire1.wav")  // This can be a table for multiple sounds!
SWEP.Primary.Recoil      = 0.2
SWEP.Primary.Damage      = 4
SWEP.Primary.NumShots    = 1
SWEP.Primary.Cone        = 0.02
SWEP.Primary.Delay       = 0.05
SWEP.Primary.TakeAmmo    = 1
SWEP.Primary.ClipSize    = 45
SWEP.Primary.DefaultClip = 500
SWEP.Primary.Automatic   = true
SWEP.Primary.Ammo        = "smg1"

// Secondary Fire Mode
SWEP.Secondary.Sound       = ""
SWEP.Secondary.ClipSize    = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic   = false 
SWEP.Secondary.Ammo        = "none"


/*=============================================================
                   Custom settings start here
=============================================================*/

SWEP.HoldType      = "pistol"                    // "pistol", "revolver", "smg", "rifle", or "shotgun"
SWEP.CrosshairType = 1                           // None (0), Normal (1), Sniper (2), Shotgun (3)
SWEP.EmptySound    = Sound("buu/base/empty.wav") // Empty firing sound
SWEP.MuzzleEffect  = "buu_muzzle"                // Muzzleflash
SWEP.MuzzleEffectS = "buu_muzzle_silenced"       // Silenced muzzleflash

SWEP.CanIronsight     = true // Allow using ironsights? (Not needed for snipers)
SWEP.CanSprint        = true // Allow sprinting to holster the weapon?
SWEP.CanNearWall      = true // Allow being near a wall to holster the weapon?
SWEP.CanLadder        = true // Allow being on a ladder causing the weapon to holster?
SWEP.CanSlide         = true // Allow sliding
SWEP.CanSmoke         = true // Allow smoke trail if firing for very long
SWEP.CustomFlashlight = true // Use custom flashlight


/*================= Extra Shooting Settings =================*/

SWEP.ChangeFireModes = false // Allow switching between fire modes with E+Mouse1?
                             // If fire mode is enabled, the values of SWEP.Secondary will be used instead
                            
SWEP.Primary.Silenced         = false // Use a silenced muzzleflash?
SWEP.Primary.SoundChannelSwap = false // Swap between CHAN_WEAPON and another channel during shooting (Helps some weapons sound better)
SWEP.Primary.BurstFire        = false // Burst fire (Requires Automatic = false)
SWEP.Primary.BurstCount       = 3     // Number of burst shots
SWEP.Primary.BurstTime        = 0.075 // Time between burst shots
SWEP.Primary.CancelBurst      = true  // Allow canceling burstfire early
SWEP.Primary.DelayLastShot    = nil   // Delay value to use when firing the last shot

SWEP.Secondary.Silenced         = false
SWEP.Secondary.SoundChannelSwap = false 
SWEP.Secondary.BurstFire        = false  
SWEP.Secondary.BurstCount       = 3     
SWEP.Secondary.BurstTime        = 0.075 
SWEP.Secondary.CancelBurst      = true  
SWEP.Secondary.DelayLastShot    = nil   


/*==================== Ironsight Settings ===================*/

SWEP.IronsightFOV   = 65 // FOV when in ironsights
SWEP.IronsightSway  = 2  // Ironsight sway amount
SWEP.IronsightSound = 2  // Sound to play when ironsighting. None (0), pistol (1), smg (2), rifle (3)


/*================= Lua Viewmodel Animations ================*/

SWEP.BuuSwayScale = 60     // How much weapon swaying
SWEP.PistolSprint = false  // Use pistol sprint animation

// Ironsight positions
SWEP.IronSightsPos = Vector(-6.431, 0, 1.039)
SWEP.IronSightsAng = Vector(0, 0, 0)

// Sprinting/Nearwall positions
SWEP.RunArmPos   = Vector(1.358, 1.228, -0.94)
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

// Crouching positions
SWEP.CrouchPos = Vector(-1,-1,.5)
SWEP.CrouchAng = Vector(0, 0, 0)

// Use ACT_VM_PRIMARYATTACK in ironsights?
SWEP.UseNormalShootIron = true 

// If above is false, it will use this as the animation. Just give it the 
// same value as your Ironsights but with the Y pushed back a bit to simulate
// the gun going back when you shoot.
SWEP.IronSightsShootPos = SWEP.IronSightsPos 
SWEP.IronSightsShootAng = SWEP.IronSightsAng


/*====================== Reload Timers ======================*/

SWEP.ReloadAmmoTime      = 0.7 // When does the ammo appear in the mag? (percent of animation) (Set to nil to give ammo at the end of the animation)
SWEP.ReloadAmmoTimeEmpty = nil // When does the ammo appear in the mag when no ammo? (set to nil to use the time above)


/*======================= Mag Dropping ======================*/

SWEP.MagModel          = nil   // The mag model to drop (nil to not use)
SWEP.MagEmptyBodygroup = 0     // Which bodygroup to use if an empty mag is dropped
SWEP.MagDropTime       = 0.5   // When to drop mag model (percent of animation)


/*====================== Laser Settings =====================*/

SWEP.Laser     = false                     // Enable/disable laser
SWEP.LaserBone = "ValveBiped.Bip01_R_Hand" // What bone to attach the laser to
SWEP.LaserPos  = Vector(0,0,0)             // What position to translate the laser
SWEP.LaserAng  = Angle(0,0,0)              // What angle to translate the laser


/*====================== Scope Settings =====================*/

SWEP.Sniper          = false            // Enable sniper scope?
SWEP.AutoSniper      = false            // Enable to disable leaving the scope after firing
SWEP.AllowBreath     = true             // Allow pressing ALT to hold breath (which stabilises the scope)
SWEP.SniperZoom 	 = 30               // How much FOV zoom
SWEP.ScopeScale 	 = 0.5              // How much percent of the screen does the sniper scope take up
SWEP.SniperTexture   = "scope/fc3Scope" // Scope texture


/*===================== Shotgun Settings ===================*/

SWEP.Shotgun             = false // Shotgun reload
SWEP.DestroyDoor         = false // Does a shotgun break down doors?
SWEP.ShotgunReloadAmount = 1     // How many shells to reload at once


/*=================== Animation Settings ===================*/

// Normal animations. Use nil to not use any animation
SWEP.DrawAnim           = ACT_VM_DRAW               // Draw
SWEP.IdleAnim           = ACT_VM_IDLE               // Idle
SWEP.Primary.Anim       = ACT_VM_PRIMARYATTACK      // Primaryfire
SWEP.Primary.AnimIron   = nil                       // Primaryfire + Ironsight
SWEP.Secondary.Anim     = ACT_VM_PRIMARYATTACK      // Secondaryfire
SWEP.Secondary.AnimIron = nil                       // Secondaryfire + Ironsight
SWEP.ReloadAnim         = ACT_VM_RELOAD             // Reload
SWEP.HolsterAnim        = nil                       // Holster
SWEP.ReloadAnimSStart   = ACT_SHOTGUN_RELOAD_START  // Shotgun reload start
SWEP.ReloadAnimSEnd     = ACT_SHOTGUN_RELOAD_FINISH // Shotgun reload end
SWEP.ModeAnim           = nil                       // Changing weapon mode

// Empty animations (When you fire the last bullet)
SWEP.DrawAnimEmpty           = nil
SWEP.IdleAnimEmpty           = nil
SWEP.Primary.AnimEmpty       = nil
SWEP.Primary.AnimIronEmpty   = nil
SWEP.Secondary.AnimEmpty     = nil
SWEP.Secondary.AnimIronEmpty = nil
SWEP.ReloadAnimEmpty         = nil
SWEP.HolsterAnimEmpty        = nil
SWEP.ReloadAnimSStartEmpty   = nil
SWEP.ReloadAnimSEndEmpty     = nil
SWEP.ModeAnimEmpty           = nil


/*=============================================================
                    Custom settings end here
=============================================================*/

SWEP.IsBuuBase = true // Don't touch


/*-----------------------------
    SetupDataTables
    Initializes predicted variables
-----------------------------*/

function SWEP:SetupDataTables()

    // I'm starting the values at 10 so that bases that derive this one
    // don't need to worry about overriding my NetworkVars
    self:NetworkVar("Float", 10, "Buu_GotoIdle")        // Predicted timer for going to the idle animation
    self:NetworkVar("Float", 11, "Buu_NextBurst")       // Predicted timer for the next burst shot
    self:NetworkVar("Float", 12, "Buu_ReloadAmmoTime")  // Predicted timer for giving ammo during reload
    self:NetworkVar("Float", 13, "Buu_FireTime")        // Stores the time the player last fired
    self:NetworkVar("Float", 14, "Buu_TimeToScope")     // Predicted timer for going to sniper scope
    self:NetworkVar("Float", 15, "Buu_MagDropTime")     // Predicted timer for magazine dropping
	self:NetworkVar("Float", 16, "Buu_ScopeBreathe")    // Predicted timer for scope breathing
	self:NetworkVar("Float", 17, "Buu_StateTimer")      // Multi-use predicted timer
    self:NetworkVar("Int",   10, "Buu_BurstCount")      // Burst fire count
    self:NetworkVar("Int",   11, "Buu_SpecialState")    // Special state for stuff. 1,2,3 used for shotgun reload, -1 for holster
    self:NetworkVar("Int",   12, "Buu_FireMode")        // Weapon firing mode (0 = self.Primary, 1 = self.Secondary)
    self:NetworkVar("Bool",  10, "Buu_Reloading")       // Are we reloading?
    self:NetworkVar("Bool",  11, "Buu_Ironsights")      // Are we in ironsights?
    self:NetworkVar("Bool",  12, "Buu_Sprinting")       // Are we sprinting?
    self:NetworkVar("Bool",  13, "Buu_NearWall")        // Are we near a wall?
    self:NetworkVar("Bool",  14, "Buu_OnLadder")        // Are we on a ladder?
    self:NetworkVar("Bool",  15, "Buu_UsingFlashlight") // Are we using a flashlight?
end


/*-----------------------------
    PrecacheStuff
    Precaches things to prevent lag spikes when
    using the weapon
-----------------------------*/

function SWEP:PrecacheStuff()

    // List of models
    local modelist = {
        self.ViewModel,
        self.WorldModel,
        self.MagModel
    }
    
    // Precache all the models in that list
    for k, v in pairs(modelist) do
        if (v != nil && v != "") then
            util.PrecacheModel(v)
        end
    end
    
    // List of sounds
    local soundlist = {
        self.Primary.Sound,
        self.Secondary.Sound,
    }
    
    // Precache all the sounds in that list
    for k, v in pairs(soundlist) do
        if (v != nil) then
            if (istable(v)) then
                for _, snd in pairs(v) do
                    util.PrecacheSound(snd)
                end
            else
                util.PrecacheSound(v)
            end
        end
    end
    
    // Buu base specific sounds
    util.PrecacheSound("weapons/shotgun/shotgun_empty.wav")
    util.PrecacheSound("buu/base/ironsight_pistol1.wav")
    util.PrecacheSound("buu/base/ironsight_pistol2.wav")
    util.PrecacheSound("buu/base/ironsight_pistol3.wav")
    util.PrecacheSound("buu/base/ironsight_pistol4.wav")
    util.PrecacheSound("buu/base/ironsight_pistol5.wav")
    util.PrecacheSound("buu/base/ironsight_smg1.wav")
    util.PrecacheSound("buu/base/ironsight_smg2.wav")
    util.PrecacheSound("buu/base/ironsight_smg3.wav")
    util.PrecacheSound("buu/base/ironsight_smg4.wav")
    util.PrecacheSound("buu/base/ironsight_smg5.wav")
    util.PrecacheSound("buu/base/ironsight_rifle1.wav")
    util.PrecacheSound("buu/base/ironsight_rifle2.wav")
    util.PrecacheSound("buu/base/ironsight_rifle3.wav")
    util.PrecacheSound("buu/base/ironsight_rifle4.wav")
    util.PrecacheSound("buu/base/ironsight_rifle5.wav")
    util.PrecacheSound("buu/base/breathe_in1.wav")
    util.PrecacheSound("buu/base/breathe_in2.wav")
    util.PrecacheSound("buu/base/breathe_out1.wav")
    util.PrecacheSound("buu/base/breathe_out2.wav")
end


/*-----------------------------
    Initialize
    Initializes the weapon
-----------------------------*/

function SWEP:Initialize()

    // Precache all the weapon related stuff
    self:PrecacheStuff()
    
    // Initialize clientside variables
    if (CLIENT) then
		self.JumpTime = 0
		self.LandTime = 0
        
		// We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()
		
		// Helper table for drawing the scope
		local ScopeTable = {}
		ScopeTable.l = iScreenHeight*self.ScopeScale
		ScopeTable.x1 = 0.5*(iScreenWidth + ScopeTable.l)
		ScopeTable.y1 = 0.5*(iScreenHeight - ScopeTable.l)
		ScopeTable.x2 = ScopeTable.x1
		ScopeTable.y2 = 0.5*(iScreenHeight + ScopeTable.l)
		ScopeTable.x3 = 0.5*(iScreenWidth - ScopeTable.l)
		ScopeTable.y3 = ScopeTable.y2
		ScopeTable.x4 = ScopeTable.x3
		ScopeTable.y4 = ScopeTable.y1
		ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale
        
        // This is for drawing the black bars that surround the scope
		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3

        // The actual scope texture
		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2*ScopeTable.l
		self.LensTable.h = 2*ScopeTable.l
	end
end


/*-----------------------------
    Deploy
    Called when the weapon is deployed
    @Return Whether to allow switching away from this weapon
-----------------------------*/

function SWEP:Deploy() 
    local time = 0
    local anim = self.DrawAnim


    // Decide the animation to use
    if (self:Clip1() <= 0 && self.DrawAnimEmpty != nil) then 
        anim = self.DrawAnimEmpty
    end
    time = CurTime() + self.Owner:GetViewModel():SequenceDuration()
    
    // If we have no animation, fallback to a safe value
    if (anim == nil) then
        anim = ACT_RESET
        time = 1
    end
    
    // Play the animation and disable shooting for its duration
    self:SendWeaponAnim(anim)
	self:SetNextPrimaryFire(time)
    
    // Create the flashlight if needed
    if (SERVER && GetConVar("sv_buu_customflashlight"):GetBool() && self.Owner:FlashlightIsOn() && self.Owner:GetActiveWeapon().CustomFlashlight) then
        self.Owner:Flashlight(false)
        self.Owner:GetActiveWeapon():SetBuu_UsingFlashlight(true)
    end
    
    // Reset some variables
    self:SetBuu_GotoIdle(time)
    self:SetBuu_BurstCount(0)
    self:SetBuu_SpecialState(0)
    self:SetBuu_ReloadAmmoTime(0)
    self:SetBuu_Reloading(false)
    
    // Return true to allow switching away from this weapon using lastinv command
    return true
end


/*-----------------------------
    Holster
    Called when the weapon is holstered
    @Param  The weapon being holstered to
    @Return Whether to allow holstering
-----------------------------*/

function SWEP:Holster(holsterto)

    // Prevent holstering if we're shotgun reloading
    if (self.Shotgun && self:GetBuu_Reloading()) then
        if (self:GetBuu_SpecialState() > 1) then
            self:FinishShotgunReload()
            return false
        end
    end
    
    // If there's a holster animation, play it
    if (self.HolsterAnim != nil && self:GetBuu_SpecialState() != -1 && IsValid(self.Owner:GetViewModel())) then
        // Don't allow if we're still mid firing or reload
        if (self:GetNextPrimaryFire() > CurTime() || self:GetBuu_Reloading()) then
            return false
        end
        
        // Set the animation
        local anim = self.HolsterAnim
        local animtime = 0
        if (self.HolsterAnimEmpty != nil) then
            anim = self.HolsterAnimEmpty
        end
        self:SendWeaponAnim(anim)
        
        // Set us to holster state and set timers based on the animation duration
        animtime = CurTime() + self.Owner:GetViewModel():SequenceDuration()
        self:SetBuu_SpecialState(-1)
        self:SetBuu_StateTimer(animtime)
        self:SetNextPrimaryFire(animtime)
        self.HolsterTo = holsterto
        return false
    end

    // If we're in holster state, only allow to switch when the timer is done
    if (self:GetBuu_SpecialState() == -1) then
        if (self:GetBuu_StateTimer() < CurTime()) then
            self:Cleanup()
            return true
        end
        return false
    end
    
    // Clean up the flashlight and viewmodel color if we were removed suddenly
    self:Cleanup()
    
    // otherwise, allow holstering
    return true
end


/*-----------------------------
    OnRemove
    Called when the weapon is removed
-----------------------------*/

function SWEP:OnRemove()
    self:Cleanup()
end


/*-----------------------------
    PrimaryAttack
    Called when left clicking
-----------------------------*/

function SWEP:PrimaryAttack() 

    // Get the weapon mode
    local mode = self.Primary
    if (self:GetBuu_FireMode() == 1) then
        mode = self.Secondary
    end

    // Allow changing weapon mode
    if (self.ChangeFireModes && self.Owner:KeyDown(IN_USE)) then
        if (self:GetNextPrimaryFire() < CurTime() && !self:GetBuu_Reloading() && self.Owner:KeyPressed(IN_ATTACK)) then
            local time = 0.5
            local anim = self.ModeAnim

            // Change the firemode and notify the player
            self:SetBuu_FireMode((self:GetBuu_FireMode()+1)%2)
            self.Owner:PrintMessage(HUD_PRINTCENTER, "Fire Mode Set To "..(self:GetBuu_FireMode()+1))
            
            // Play an animation if we have one
            if (self.ModeAnim != nil) then
                if (self.ModeAnimEmpty != nil) then
                    anim = self.ModeAnimEmpty
                end
                self:SendWeaponAnim(anim)
                time = self.Owner:GetViewModel():SequenceDuration()
            else
                // Play a sound effect
                if (self:GetBuu_FireMode() == 0) then
                    self:EmitSound("weapons/smg1/switch_burst.wav", 40, 100, 1, CHAN_ITEM)
                else
                    self:EmitSound("weapons/smg1/switch_single.wav", 40, 100, 1, CHAN_ITEM)
                end
            end
            
            // Delay the next action for some time
            self:SetNextPrimaryFire(CurTime() + time)
        end
        return
    end

    // Make sure we can shoot
    if (self:GetBuu_FireMode() == 0 && !mode.BurstFire && self:GetBuu_BurstCount() >= mode.BurstCount) then return end
    if (self:GetNextPrimaryFire() > CurTime()) then return end
    
    // Allow for canceling shotgun reload
    if (self.Shotgun && self:GetBuu_Reloading()) then
        if (self:GetBuu_SpecialState() > 1) then
            self:FinishShotgunReload()
        end
        return
    end
    
    // Play empty sound if we're out of ammo
    if (self:Clip1() == 0) then 
        self:EmitSound("weapons/shotgun/shotgun_empty.wav", 40, 100, 1, CHAN_ITEM)
        self:SetNextPrimaryFire(CurTime() + 0.2)
        return 
    end 
    
    // Don't allow to shoot if reloading, sprinting, near a wall, or on a ladder
    if (self:GetBuu_Reloading() || self:GetBuu_Sprinting() || self:GetBuu_NearWall() || self:GetBuu_OnLadder()) then return end
    
    // Make sure we have a valid shoot mode
    if (mode == nil) then return end
    
    // Enable lag compensation
    if (self.Owner:IsPlayer()) then
        self.Owner:LagCompensation(true)
    end
    
    // Shoot the bullet
    self:ShootCode(mode)
    
    // Do animations
    local anim = mode.Anim
    if (self:Clip1() <= 0 && (mode.AnimEmpty != nil || mode.AnimIronEmpty != nil)) then
        if (self:GetBuu_Ironsights() && !self.UseNormalShootIron && mode.AnimIronEmpty != nil) then
            anim = mode.AnimIronEmpty
        elseif (mode.AnimEmpty != nil) then
            anim = mode.AnimEmpty
        end
    elseif (self:GetBuu_Ironsights() && !self.UseNormalShootIron && mode.AnimIron != nil) then
        anim = mode.AnimIron
    end

    // If we have no animation, fallback to a safe value
    if (anim == nil) then
        anim = ACT_RESET
    end
    
    // Play the shooting animation
    self:SendWeaponAnim(anim)
    self.Owner:MuzzleFlash()
	self.Owner:SetAnimation(PLAYER_ATTACK1)
    
    // Handle shooting sound channel
    if (self.ShootChannel == nil) then
        self.ShootChannel = CHAN_WEAPON
    end
    if (mode.SoundChannelSwap) then
        if (self.ShootChannel == CHAN_WEAPON) then
            self.ShootChannel = CHAN_WEAPON+100
        else
            self.ShootChannel = CHAN_WEAPON
        end
    end
    
    // Play the shooting sound
    if (mode.Sound != nil) then
        local sound = mode.Sound
        if (istable(mode.Sound)) then
            sound = mode.Sound[math.random(1, #mode.Sound)]
        end
        local volume = 100
        if (mode.Silenced) then
            volume = 60
        end
        self:EmitSound(sound, volume, math.random(97,102), 1, self.ShootChannel)
    end
    
    // Clicking sound on low ammo
    if (self:Clip1() <= math.ceil(self.Primary.ClipSize/4) && GetConVar("cl_buu_lowammowarn"):GetBool()) then
        self:EmitSound("weapons/shotgun/shotgun_empty.wav", 50, 100, 1, CHAN_ITEM)
    end
    
    // Handle viewpunch
    local recoil = mode.Recoil or 1
    if (self:GetBuu_Ironsights()) then
        recoil = recoil/2
    end
    self.Owner:ViewPunch(Angle(util.SharedRandom("ViewPunchBuu", -0.5,-2.5)*recoil, util.SharedRandom("ViewPunchBuu", -1,1)*recoil, 0))
    self:TakePrimaryAmmo(mode.TakeAmmo or 1)
    
    // Handle burst fire
    local delay = mode.Delay
    if (mode.BurstFire) then
        self:SetBuu_BurstCount(self:GetBuu_BurstCount() + 1)
        if (self:GetBuu_BurstCount() != mode.BurstCount) then
            self:SetBuu_NextBurst(CurTime()+mode.BurstTime)
            delay = mode.BurstTime
        end
    end
    
    // Handle last shot delay
    if (self:Clip1() == 0 && mode.DelayLastShot != nil) then
        delay = mode.DelayLastShot
    end
    
    // If the delay is nil, fallback to a safe value
    if (delay == nil) then
        delay = 0.1
    end
    
    // Set timers and delay
    self:SetNextPrimaryFire(CurTime() + delay)
    self:SetBuu_GotoIdle(CurTime() + self.Owner:GetViewModel():SequenceDuration())
    self:SetBuu_FireTime(CurTime())
    
    // Disable lag compensation
    if (self.Owner:IsPlayer()) then
        self.Owner:LagCompensation(false)
    end
end


/*-----------------------------
    SecondaryAttack
    Unused
-----------------------------*/

function SWEP:SecondaryAttack()
end


/*-----------------------------
    Reload
    Called when the player presses reload
-----------------------------*/

function SWEP:Reload()
    if (self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) <= 0) then return end
    if (self:GetNextPrimaryFire() > CurTime()) then return end
    
    // If we are missing bullets, and we aren't reloading already
    if (self:Clip1() < self:GetMaxClip1() && !self:GetBuu_Reloading()) then 
    
        // If we're a shotgun, do a shotgun reload instead
        if (self.Shotgun) then
            self:StartShotgunReload()
            return
        end
    
        // Initialize the animation
        local anim = self.ReloadAnim
        local time = self.ReloadAmmoTime
        
        // Decide if we're using empty animation stuff
        if (self:Clip1() <= 0 && self.ReloadAnimEmpty != nil) then 
            anim = self.ReloadAnimEmpty
            if (self.ReloadAmmoTimeEmpty != nil) then
                time = CurTime+self.ReloadAmmoTimeEmpty
            end
        end
        
        // If we have no animation, then fallback to a safe value
        if (anim == nil) then
            anim = ACT_RESET
            time = 1
        end
        
        // Play the reload animation
        self:SendWeaponAnim(anim)
        self:HandleHoldtypes("reload")
        self.Owner:SetAnimation(PLAYER_RELOAD)
        self:SetBuu_Reloading(true)
        self:SetBuu_GotoIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration())
        self:SetBuu_BurstCount(0) 
        
        // Drop a mag on the floor
        if (GetConVar("cl_buu_magdrop"):GetBool() && self.MagModel != nil && self.MagModel != "") then
            self:SetBuu_MagDropTime(CurTime()+self.Owner:GetViewModel():SequenceDuration()*self.MagDropTime)
        end
        
        // Start the reload ammo timer
        if (time == nil) then
            self:SetBuu_ReloadAmmoTime(self:GetBuu_GotoIdle()) 
        else
            self:SetBuu_ReloadAmmoTime(CurTime()+self.Owner:GetViewModel():SequenceDuration()*time)
        end
    end
end


/*-----------------------------
    Think
    Logic that runs every frame
-----------------------------*/

function SWEP:Think()
    
    // Initialize is sometimes not called Clientside, so this will correct that
    if (self.JumpTime == nil) then
        self:Initialize()
    end
    
    // Handle ironsight state
    self:HandleIronsights()

    // Handle sprinting state
    self:HandleSprinting()

    // Handle nearwall state
    self:HandleNearWall()

    // Handle ladder state
    self:HandleLadder()
    
    // Handle burstfire logic
    self:HandleBurstFire()
    
    // Handle idle state
    self:HandleIdle()
    
    // Handle shotgun reload
    self:HandleShotgunReload()
    
    // Handle when you receive ammo during a reload
    self:HandleReloadAmmo()
    
    // Handle holding your breath while scoped
    self:HandleSniperBreath()
    
    // Handle thirdperson holdtypes
    if (self:GetBuu_Reloading()) then
        self:HandleHoldtypes("reload")
    elseif (self:GetBuu_Ironsights()) then
        self:HandleHoldtypes("aim")
    elseif (self:GetBuu_Sprinting() || self:GetBuu_NearWall() || self:GetBuu_OnLadder()) then
        self:HandleHoldtypes("holster")
    else
        self:HandleHoldtypes("idle")
    end

    // Handle magazine drops
    if (self:GetBuu_MagDropTime() != 0 && self:GetBuu_MagDropTime() < CurTime()) then
        self:SetBuu_MagDropTime(0)
        if (!game.SinglePlayer() && SERVER) then
            net.Start("BuuBase_DropMag")
                net.WriteEntity(self.Owner)
                net.WriteEntity(self)
            net.Broadcast()
        else
            MagazineDrop(nil, self.Owner, self)
        end
    end
        
    // Handle holstering
    if (self:GetBuu_SpecialState() == -1 && self:GetBuu_StateTimer() < CurTime()) then
        if (!game.SinglePlayer() && CLIENT && self.HolsterTo != nil) then
            input.SelectWeapon(self.HolsterTo)
        elseif (SERVER && self.HolsterTo != nil) then
            self.Owner:SelectWeapon(self.HolsterTo)
        end
    end
        
    // Handle barrel Smoke
	self:HandleBarrelSmoke()
              
    // Handle HL2 weapon bobbing
	if (GetConVar("cl_buu_custombob"):GetBool()) then
		self.BobScale = 0
	else
		self.BobScale = 1
	end
	
    // Handle HL2 weapon swaying
	if (GetConVar("cl_buu_customsway"):GetBool()) then
		self.SwayScale = 0
	else
		self.SwayScale = 1
	end
end


/*-----------------------------
    ShootCode
    Handles bullet shooting logic
    @Param The firemode to use
-----------------------------*/

function SWEP:ShootCode(mode)
    local dmg = mode.Damage or 0
    local numbul = mode.NumShots or 1
	local cone 	 = mode.Cone or 0.01
    
    // If we have ironsights, reduce the spread
    if (self:GetBuu_Ironsights()) then
        cone = cone*0.65
    end

    // Create our bullet structure and fire it
	local bullet 	= {}
	bullet.Num  	= numbul
	bullet.Src 		= self.Owner:GetShootPos()
    bullet.Dir 		= (self.Owner:EyeAngles() + self.Owner:GetViewPunchAngles() + Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0) * 33):Forward()
	bullet.Spread 	= Vector(cone, cone, 0)
	bullet.Tracer 	= 0
	bullet.Force 	= 0.5*dmg
	bullet.Damage 	= dmg
	bullet.Callback = HitImpact
	self.Owner:FireBullets(bullet)	

    // Door destruction
	local tr = self.Owner:GetEyeTrace()
	if (!self.DestroyDoor || !GetConVar("sv_buu_shotgunwreckdoors"):GetBool()) then return end
    if (tr.HitPos:Distance(self.Owner:GetShootPos()) > 250) then return end
	if (tr.Entity:GetClass() == "prop_door_rotating" and SERVER) then

        // Force the door to open
		tr.Entity:Fire("open", "", 0.001)
		tr.Entity:Fire("unlock", "", 0.001)

        // Get data from the door
		local pos = tr.Entity:GetPos()
		local ang = tr.Entity:GetAngles()
		local model = tr.Entity:GetModel()
		local skin = tr.Entity:GetSkin()

        // Disable the real door
		tr.Entity:SetNotSolid(true)
		tr.Entity:SetNoDraw(true)
    
        // Helper function for enabling the door
		local function ResetDoor(door, fakedoor)
			door:SetNotSolid(false)
			door:SetNoDraw(false)
			fakedoor:Remove()
		end

        // Get the angles and calculate the force
		local norm = (pos - self.Owner:GetPos())
		norm:Normalize()
		local push = 2000 * norm
		local ent = ents.Create("prop_physics")

        // Set the fake door's data
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:SetModel(model)
        ent:SetSkin(skin)
		ent:Spawn()

        // Add some force to the door
		timer.Simple(0.01, function() if (ent && push) then ent:GetPhysicsObject():SetVelocity(push) end end)   

        // Reset the door after some time
		timer.Simple(25, function() if (IsValid(ent)) then ResetDoor(tr.Entity, ent, 10) end end)
	end
end


/*-----------------------------
    HandleIronsights
    Handles ironsight logic
-----------------------------*/

// Initialize a lookup table for sounds
local ironsounds = {
    "pistol",
    "smg",
    "rifle",
}
function SWEP:HandleIronsights()

    // Initialize the predicted TimeToScope variable
    if (self.TimeToScope == nil) then
        self.TimeToScope = 0
    end
    
    // Check if the player is ironsighting
    if (self.Owner:KeyDown(IN_ATTACK2) && !self:GetBuu_Sprinting() && !self:GetBuu_OnLadder() && !self:GetBuu_NearWall() && !self:GetBuu_Reloading()) then
        if (!self:GetBuu_Ironsights()) then
        
            // Start the Lua scope animation
            if (self.TimeToScope < UnPredictedCurTime()) then
                self.TimeToScope = UnPredictedCurTime()+0.15
            end
            self:SetBuu_TimeToScope(CurTime()+0.15)
            
            // Allow ironsights if they're enabled serverside, or if a sniper is being used
			if ((GetConVar("sv_buu_ironsights"):GetBool() && self.CanIronsight) || self.Sniper) then
				self:SetBuu_Ironsights(true)
            
                // Play the ironsight sound
                if (ironsounds[self.IronsightSound] != nil) then
                    self:EmitSound("buu/base/ironsight_"..ironsounds[self.IronsightSound]..tostring(math.random(1,5))..".wav", 40, 100, 1, CHAN_VOICE2) 
                end
			end
        end
        
        // Set the FOV if the scoping animation is finished
		if (self.Sniper && self.TimeToScope < UnPredictedCurTime()) then
			self.Owner:SetFOV(self.SniperZoom, 0)
		end
	else
        // Stop ironsighting if it's on
		if (self:GetBuu_Ironsights()) then
			self:SetBuu_Ironsights(false)
            
            // Play the ironsight sound
			if ((GetConVar("sv_buu_ironsights"):GetBool() && self.CanIronsight) || self.Sniper) then
                if (ironsounds[self.IronsightSound] != nil) then
                    self:EmitSound("buu/base/ironsight_"..ironsounds[self.IronsightSound]..tostring(math.random(1,5))..".wav", 40, 100, 1, CHAN_VOICE2) 
                end
			end
        end
        
        // Reset the ironsight variables and FOV
        self.TimeToScope = 0
        self:SetBuu_TimeToScope(0)
        if (self.Sniper) then
			self.Owner:SetFOV(0, 0)
        end
	end
    
    // If we're not using an autosniper, and we can't shoot, unscope
    if (self.Sniper && !self.AutoSniper && CurTime() < self:GetNextPrimaryFire() && self:GetBuu_Ironsights()) then
		self:SetBuu_Ironsights(false)
        self.TimeToScope = 0
        self:SetBuu_TimeToScope(0)
        if (self.Sniper) then
			self.Owner:SetFOV(0, 0)
        end
    end
end


/*-----------------------------
    HandleSprinting
    Handles sprinting logic
-----------------------------*/

function SWEP:HandleSprinting()

    // Check if we're allowed to enter the sprint state
    if ((GetConVar("sv_buu_sprinting"):GetBool() && self.CanSprint) || self.Owner:GetNWBool("Buu_Sliding")) then
        local issprinting = false
        
        // Check they're running AND if they're holding down a movement key
        if (self.Owner:KeyDown(IN_SPEED) && self.Owner:GetVelocity():Length() > self.Owner:GetWalkSpeed() && (!self.Owner:KeyDown(IN_DUCK) || (self.Owner:GetNWBool("Buu_Sliding") && !GetConVar("sv_buu_slideshoot"):GetBool())) && self.Owner:IsOnGround()) then
            if (self.Owner:KeyDown(IN_FORWARD) || self.Owner:KeyDown(IN_BACK) || self.Owner:KeyDown(IN_MOVELEFT) || self.Owner:KeyDown(IN_MOVERIGHT)) then
                issprinting = true
                self:SetBuu_BurstCount(0) 
            end
        end
        
        // Set the sprint variable
        self:SetBuu_Sprinting(issprinting)
    end
end


/*-----------------------------
    HandleNearWall
    Handles nearwall logic
-----------------------------*/

function SWEP:HandleNearWall()

    // Check if we're allowed to enter the nearwall state
    if (GetConVar("sv_buu_nearwall"):GetBool() && self.CanNearWall && self.Owner:IsPlayer()) then
    
        // Enable lag compensation to prevent jitter due to player movement
        self.Owner:LagCompensation(true)
        
        // Perform a trace to see if the player is near a wall
        local Tr = util.TraceLine(util.GetPlayerTrace(self.Owner))
        if (Tr.Hit && Tr.HitPos:Distance(self.Owner:GetShootPos()) < 40) then
            self:SetBuu_NearWall(true)
            self:SetBuu_BurstCount(0) 
        else
            self:SetBuu_NearWall(false)
        end
        
        // Stop lag compensation
        self.Owner:LagCompensation(false)
    end
end  


/*-----------------------------
    HandleNearWall
    Handles nearwall logic
-----------------------------*/

function SWEP:HandleLadder()

    // Check if we're allowed to enter the ladder state
    if (GetConVar("sv_buu_ladder"):GetBool() && self.CanLadder) then
    
        // Check if the player is on a ladder
        if (self.Owner:GetMoveType() == MOVETYPE_LADDER) then
            self:SetBuu_OnLadder(true)
            self:SetBuu_BurstCount(0) 
        else
            self:SetBuu_OnLadder(false)
        end
    end
end


/*-----------------------------
    HandleBurstFire
    Handles burstfire logic
-----------------------------*/

function SWEP:HandleBurstFire()

    // If we're using a weapon with burstfire
    if ((self:GetBuu_FireMode() == 0 && self.Primary.BurstFire) || (self:GetBuu_FireMode() == 1 && self.Secondary.BurstFire)) then
    
        // Get the fire mode
        local mode = self.Primary
        if (self:GetBuu_FireMode() == 1) then
            mode = self.Secondary
        end
        
        // If we still have bullets to shoot, shoot 'em, otherwise reset the burst fire state
        if (self:Clip1() != 0 && self:GetBuu_BurstCount() != 0 && self:GetBuu_BurstCount() < mode.BurstCount && self:GetBuu_NextBurst() < CurTime()) then
            self:PrimaryAttack()
        elseif ((mode.CancelBurst && !self.Owner:KeyDown(IN_ATTACK)) || (self:GetBuu_BurstCount() == mode.BurstCount && self:GetNextPrimaryFire() < CurTime())) then
            self:SetBuu_BurstCount(0) 
        end
    end
end


/*-----------------------------
    HandleIdle
    Handles going into idle state
-----------------------------*/

function SWEP:HandleIdle()

    // If the timer for the idle state is done
    if (self:GetBuu_GotoIdle() != 0 && self:GetBuu_GotoIdle() < CurTime()) then
        
        // Set the idle animation
        local anim = self.IdleAnim
        if (self:Clip1() <= 0 && self.IdleAnimEmpty != nil) then
            anim = self.IdleAnimEmpty
        end
        
        // If we have no animation, fallback to a safe value
        if (anim == nil) then
            anim = ACT_RESET
        end
        
        // Play the animation
        self:SetBuu_GotoIdle(0)
        self:SendWeaponAnim(anim)
        
        // Stop reloading
        if (self:GetBuu_Reloading()) then
            self:SetBuu_Reloading(false)
            self:SetBuu_SpecialState(0)
        end
    end
end


/*-----------------------------
    HandleShotgunReload
    Handles shotgun reload logic
-----------------------------*/

function SWEP:HandleShotgunReload()

    // If we're doing a shotgun reload
    if (self.Shotgun && self:GetBuu_Reloading() && self:GetBuu_StateTimer() < CurTime()) then
        // If we just finished the starting animation, transition to the next state
        if (self:GetBuu_SpecialState() == 1) then
            self:SetBuu_SpecialState(2)
        end
        
        // Perform the reload loop
        if (self:GetBuu_SpecialState() == 2) then
            self:DoShotgunReload()
        end
    end
end


/*-----------------------------
    HandleReloadAmmo
    Handles when ammo is given during a reload
-----------------------------*/

function SWEP:HandleReloadAmmo()

    // If the timer for giving us ammo is over
    if (self:GetBuu_ReloadAmmoTime() != 0 && self:GetBuu_ReloadAmmoTime() < CurTime()) then
        local takeammo = 0
        local setammo = 0
        local ammo = self.Owner:GetAmmoCount(self:GetPrimaryAmmoType())
        
        // Decide what reload to perform based on what the weapon is
        if (self.Shotgun) then
            // Shotgun reload
            local shellstofill = math.min(self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()), self.ShotgunReloadAmount)
            if (self:Clip1()+shellstofill > self:GetMaxClip1()) then
                shellstofill = self:GetMaxClip1() - self:Clip1()
            end
            takeammo = shellstofill
            setammo = self:Clip1()+shellstofill
        else
            // Normal reload
            takeammo = self.Primary.ClipSize - self:Clip1()
            setammo = math.min(self.Primary.ClipSize, self:Clip1() + ammo)
        end
        
        // Put ammo in the clip
        self.Owner:RemoveAmmo(takeammo, self:GetPrimaryAmmoType())
        self:SetClip1(setammo)
        self:SetBuu_ReloadAmmoTime(0)
    end
end


/*-----------------------------
    HandleSniperBreath
    Handles holding breath while scoped
-----------------------------*/

function SWEP:HandleSniperBreath()

    // If we're allowed to hold our breath
	if (GetConVar("sv_buu_sniperbreath"):GetBool() && self.AllowBreath) then
        // If we're a sniper
		if (self.Sniper)then
            // Breathe in if we press alt, or stop breathing after some time or when we unscope
			if (self.Owner:KeyPressed(IN_WALK) && self:GetBuu_ScopeBreathe() == 0 && self:GetBuu_Ironsights()) then
				self:SetBuu_ScopeBreathe(CurTime()+3)
				self:EmitSound("buu/base/breathe_in"..math.random(1,2)..".wav", 40, 100, 1, CHAN_ITEM)
			elseif !(self:GetBuu_ScopeBreathe() <= 0) && (self:GetBuu_ScopeBreathe() < CurTime() || self.Owner:KeyReleased(IN_WALK) || !self:GetBuu_Ironsights()) then
				self:SetBuu_ScopeBreathe(-2)
				self:EmitSound("buu/base/breathe_out"..math.random(1,3)..".wav", 40, 100, 1, CHAN_ITEM)
			end
		end
        
        // Only allow breathing in again after a second
		if (self:GetBuu_ScopeBreathe() < 0) then
			if (self:GetBuu_ScopeBreathe() < -1 && self:GetBuu_ScopeBreathe() != 0) then
				self:SetBuu_ScopeBreathe(self:GetBuu_ScopeBreathe()+0.01)
			end
			if (self:GetBuu_ScopeBreathe() > -1) then
				self:SetBuu_ScopeBreathe(0)
			end
		end
	end
end


/*-----------------------------
    HandleHoldtypes
    Handles thirdperson holdtypes
    @Param The current anim, can be "idle", "aim", "reload", or "holster"
-----------------------------*/

// Initialize the lookup tables
local holdanims = {
    ["idle"] = {"pistol", "pistol", "pistol", "crossbow", "crossbow"},
    ["aim"] = {"revolver", "revolver", "smg", "ar2", "ar2"},
    ["reload"] = {"pistol", "revolver", "smg", "ar2", "shotgun"},
    ["holster"] = {"normal", "normal", "normal", "passive", "passive"},
}
local holdtypes = {
    ["pistol"] = 1,
    ["revolver"] = 2,
    ["smg"] = 3,
    ["rifle"] = 4,
    ["shotgun"] = 5,
}
function SWEP:HandleHoldtypes(anim)
    if (self.HoldType == nil) then return end
    self:SetHoldType(holdanims[anim][holdtypes[self.HoldType]] or "normal")
    self:SetWeaponHoldType(self:GetHoldType())
end


/*-----------------------------
    HandleBarrelSmoke
    Handles emitting smoke from the barrel
-----------------------------*/

function SWEP:HandleBarrelSmoke()
    if (GetConVar("cl_buu_barrelsmoke"):GetBool() && self.CanSmoke && (SERVER || IsFirstTimePredicted())) then
    
        // Initialize the variables if they aren't already
		if (self.Smoke == nil) then
            self.Smoke = 0
            self.NextSmoke = 0
        end
        
        // Calculate the smoke value based on the firing delay
        if (self:GetBuu_FireTime()+0.2 > CurTime()) then
            self.Smoke = self.Smoke + self.Primary.Delay*2
        end
        self.Smoke = math.max(self.Smoke-self.Primary.Delay/10, 0)
        
        // If we hit a arbitrary firing amount, and the player stopped firing, emit the smoke effect
        if (self.Smoke >= self.Primary.Delay*100 && self.NextSmoke < CurTime() && (!self.Owner:KeyDown(IN_ATTACK) || self:Clip1() == 0) && self:GetBuu_FireTime()+0.5 < CurTime()) then
            self.Smoke = 0
            self.NextSmoke = CurTime()+3
            
            // Emit the smoke effect on the gun's barrel
            local fx = EffectData()
            fx:SetOrigin(self.Owner:GetShootPos())
            fx:SetEntity(self.Owner:GetActiveWeapon())
            fx:SetStart(self.Owner:GetShootPos())
            fx:SetNormal(self.Owner:GetAimVector())
            fx:SetAttachment(1)
            util.Effect("buu_smoketrail", fx)
        end
	end
end


/*-----------------------------
    StartShotgunReload
    Starts a shotgun reload
-----------------------------*/

function SWEP:StartShotgunReload()
    if (self:GetBuu_SpecialState() != 0) then return end

    // Play the shotgun starting reload animation
    local anim = self.ReloadAnimSStart
    if (self:Clip1() == 0 && self.ReloadAnimSStartEmpty != nil) then
        anim = self.ReloadAnimSStartEmpty
    end
    self:SendWeaponAnim(anim)
    
    // Set us to a reload state
    self:SetBuu_Reloading(true)
    self:SetBuu_SpecialState(1)
    self:SetBuu_StateTimer(CurTime()+self.Owner:GetViewModel():SequenceDuration())
end


/*-----------------------------
    DoShotgunReload
    Performs the shotgun reload logic
-----------------------------*/

function SWEP:DoShotgunReload()
        
    // Stop reloading we're full, or out of ammo
    if (self:Clip1() == self:GetMaxClip1()) || self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) == 0 then
        self:FinishShotgunReload()
        return
    end
    
    // Get the animation data 
    local anim = self.ReloadAnim
    local time = self.ReloadAmmoTime
    
    // Decide if we're using empty animation stuff
    if (self:Clip1() == 0 && self.ReloadAnimEmpty != nil) then
       anim = self.ReloadAnimEmpty
       time = self.ReloadAmmoTimeEmpty
    end
    
    // Fallback if we don't have a valid animation
    if (anim == nil) then
        anim = ACT_RESET
        time = 1
    end
    
    // Play the reload animation
    self:SendWeaponAnim(anim)
    self.Owner:SetAnimation(PLAYER_RELOAD)
    self:SetBuu_StateTimer(CurTime()+self.Owner:GetViewModel():SequenceDuration())
    
    // Start the reload ammo timer
    if (time == nil) then
        self:SetBuu_ReloadAmmoTime(self:GetBuu_StateTimer()) 
    else
        self:SetBuu_ReloadAmmoTime(CurTime()+self.Owner:GetViewModel():SequenceDuration()*time)
    end
end


/*-----------------------------
    FinishShotgunReload
    Stops a shotgun reload
-----------------------------*/

function SWEP:FinishShotgunReload()
    if (self:GetBuu_SpecialState() == 3) then return end

    // Pick the shotgun ending animation
    local anim = self.ReloadAnimSEnd
    if (self:Clip1() == 0 && self.ReloadAnimSEndEmpty != nil) then
        anim = self.ReloadAnimSEndEmpty
    end
    
    // Fallback if we don't have a valid animation
    if (anim == nil) then
        anim = ACT_RESET
    end
    
    // Play the shotgun ending reload animation
    self:SendWeaponAnim(anim)
    
    // Set us to a finishing reload state
    self:SetBuu_SpecialState(3)
    self:SetBuu_StateTimer(0)
    self:SetBuu_ReloadAmmoTime(0)
    self:SetBuu_GotoIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration())
end


/*-----------------------------
    MagazineDrop
    Drops a clientsided magazine on the floor
    @Param The length of the network message
    @Param The owner of the weapon
    @Param The weapon
-----------------------------*/

function MagazineDrop(len, ply, wep)
    if (CLIENT && (game.SinglePlayer() || IsFirstTimePredicted() || len != nil)) then
    
        // Check if we received this as a network message
        if (len != nil) then
            ply = net.ReadEntity()
            wep = net.ReadEntity()
            
            // Discard it if we received one that mentions us
            if (ply == LocalPlayer()) then
                return
            end
        end
    
        // Create the prop
        local mag = ents.CreateClientProp()
        mag:SetPos(ply:GetPos()+Vector(0,0,50))
        mag:SetAngles(ply:GetAngles())
        mag:SetModel(wep.MagModel)
        if (wep:Clip1() == 0) then
            mag:SetBodygroup(0, wep.MagEmptyBodygroup)
        end
        
        // Spawn it and enable physics
        mag:Spawn()
        mag:Activate()
        mag:PhysicsInit(SOLID_VPHYSICS)
        mag:SetSolid(SOLID_VPHYSICS)
        local phys = mag:GetPhysicsObject() 
        if (IsValid(phys)) then
            phys:Wake()
        end
        mag:SetMoveType(MOVETYPE_VPHYSICS) 
        
        // Remove the mag after some time
        if (GetConVar("cl_buu_magdroplifetime"):GetInt() != 0) then
            timer.Simple(GetConVar("cl_buu_magdroplifetime"):GetInt(), function() if (IsValid(mag)) then mag:Remove() end end)
        end
    end
end
net.Receive("BuuBase_DropMag", MagazineDrop)


/*-----------------------------
    Cleanup
    Fixes anything due to suddenly being removed, like
    flashlight and viewmodel colors
-----------------------------*/

function SWEP:Cleanup()
    if self.Owner == nil then return end

    // If the player is using the flashlight
    if (self:GetBuu_UsingFlashlight()) then
    
        // Remove the flashlight from the viewmodel
        if (CLIENT && IsValid(self.Owner) && self.Owner:GetViewModel().FlashLight != nil) then
            self.Owner:GetViewModel().FlashLight:Remove()
            self.Owner:GetViewModel().FlashLight = nil
        end
        
        // Enable flashlight on the next tick
        if (SERVER) then
            timer.Simple(0, function() if (IsValid(self) && IsValid(self.Owner) && self.Owner:Alive()) then self.Owner:Flashlight(true) end end)
        end
    end
    self.Owner.FixViewmodelColor = true
end


/*-----------------------------
    FireAnimationEvent
    Allows for overriding of viewmodel events
    @Param  The position of the effect
    @Param  The Angle of the effect
    @Param  The event that ocurred
    @Return Whether to override the effect or not
-----------------------------*/

function SWEP:FireAnimationEvent(pos, ang, event)

    // Muzzle flash replacement
	if (event == 5001 || event == 21 || event == 22) then 
		if !IsValid(self.Owner) then return end
        
        // Select which effect to use
        local effect = self.MuzzleEffect
		if ((self:GetBuu_FireMode() == 0 && self.Primary.Silenced) || (self:GetBuu_FireMode() == 1 && self.Secondary.Silenced)) then
			effect = self.MuzzleEffectS
		end
        
        // If we have no effect, then stop
        if (effect == nil) then
            return false
        end
        
        // Use the muzzle effect
        local fx = EffectData()
        fx:SetOrigin(self.Owner:GetShootPos())
        fx:SetEntity(self)
        fx:SetStart(self.Owner:GetShootPos())
        fx:SetNormal(self.Owner:GetAimVector())
        fx:SetAttachment(1)
        util.Effect(effect, fx)
        
        // Disable original muzzleflash effect
		return true
	end
end


/*-----------------------------
    GetBoneOrientation
    Helper function for getting bones data
    @Param  The entity to get bones from
    @Param  The bone name to get the data of
    @Return Position and angle of the bone, or nil
-----------------------------*/

function SWEP:GetBoneOrientation(ent, bonename)
	local pos, ang = Vector(0,0,0), Angle(0,0,0)

    // Make sure the bone exists
	if (!ent:LookupBone(bonename)) then return nil, nil end
    
    // Get the bone matrix and get its data,
	local bone = ent:GetBoneMatrix(ent:LookupBone(bonename))
	if (bone) then
		pos, ang = bone:GetTranslation(), bone:GetAngles()
	end
    
    // Return the data
	return pos, ang
end


/*-----------------------------
    BuuBase_Sliding
    Allows the player to slide on the floor
    @param The Player
    @param The move data
-----------------------------*/

local function BuuBase_Sliding(ply, mv)

    // Initialize the sliding variables if they aren't
    if (ply.Buu_SlidingInitialized == nil) then
        ply:SetNWBool("Buu_Sliding", false)
        ply:SetNWFloat("Buu_SlideVel", 0)
        ply:SetNWVector("Buu_SlideDir", ply:GetForward())
        ply:SetNWFloat("Buu_SlideCooldown", 0)
        ply.Buu_SlidingInitialized = true
    end
    
    // If the player is alive and they're holding a buu base weapon
    local vel = ply:GetVelocity()
    if (ply:Alive() && ply:GetActiveWeapon() != nil && ply:GetActiveWeapon().IsBuuBase && ply:GetActiveWeapon().CanSlide && GetConVar("sv_buu_canslide"):GetBool()) then
        
        // And they pressed the sliding key combo
        if (!ply:GetNWBool("Buu_Sliding") && ply:KeyDown(IN_SPEED) && ply:KeyDown(IN_DUCK) && ply:IsOnGround() && vel:Length() >= ply:GetRunSpeed()) then
            // Play a sound signaling we started sliding
            if (game.SinglePlayer() || (CLIENT && IsFirstTimePredicted())) then
                ply:EmitSound("physics/body/body_medium_impact_soft3.wav", 50, math.Rand(90, 120))
            end
            
            // Play a sliding sound in a loop
            if (ply.SlideSound == nil && (SERVER || IsFirstTimePredicted())) then
                ply.SlideSound = CreateSound(ply, "physics/flesh/flesh_scrape_rough_loop.wav")
                ply.SlideSound:Play()
                ply.SlideSound:ChangeVolume(0.3)
            end
            
            // Set us to a sliding state
            ply:SetNWBool("Buu_Sliding", true)
            ply:SetNWFloat("Buu_SlideCooldown", CurTime()+1)
            ply:SetNWFloat("Buu_SlideVel", vel:Length())
            ply:SetNWVector("Buu_SlideDir", vel:GetNormalized())
            ply:SetNWFloat("Buu_SlideTime", CurTime())
            
            // Network to the server
            if (CLIENT && IsFirstTimePredicted()) then
                net.Start("BuuBase_StartedSliding")
                    net.WriteFloat(ply:GetNWFloat("Buu_SlideVel"))
                    net.WriteVector(ply:GetNWVector("Buu_SlideDir"))
                net.SendToServer()
            end
        elseif (ply:GetNWBool("Buu_Sliding") && (!ply:KeyDown(IN_SPEED) || !ply:KeyDown(IN_DUCK) || !ply:IsOnGround())) then
            ply:SetNWBool("Buu_Sliding", false)
        end
    end
    
    // If the player is sliding
    if (ply:GetNWBool("Buu_Sliding") && ply:GetNWFloat("Buu_SlideVel") > 0) then
        // Decrease the slide velocity over time
        if (SERVER || IsFirstTimePredicted()) then
            ply:SetNWFloat("Buu_SlideVel", ply:GetNWFloat("Buu_SlideVel")-(CurTime()-ply:GetNWFloat("Buu_SlideTime"))*3)
        end

        // Set the player velocity
        if (ply:GetNWFloat("Buu_SlideVel") <= 10 || !ply:IsOnGround()) then
            ply:SetNWBool("Buu_Sliding", false)
        else
            mv:SetVelocity(ply:GetNWVector("Buu_SlideDir")*ply:GetNWFloat("Buu_SlideVel"))
        end
        
        // Emit dust particles
        if (ply.NextSlideEffect == nil || ply.NextSlideEffect <= CurTime()) then
            ply.NextSlideEffect = CurTime() + 0.03
            local tr = util.QuickTrace(ply:GetPos(), ply:GetUp()*(-20), ply)
            local effect = EffectData()
            effect:SetOrigin(tr.HitPos)
            effect:SetEntity(ply)
            effect:SetNormal(tr.HitNormal)
            util.Effect("buu_slidedust", effect)
        end	
    end
    
    // Check if they collided with something
    local tr = util.QuickTrace(ply:GetPos()+Vector(0,0,50), (ply:GetNWVector("Buu_SlideDir")*50), ply)
    if (tr && tr.Hit && ply:GetNWBool("Buu_Sliding")) then
    
        // Stop sliding
        ply:SetNWBool("Buu_Sliding", false)
        mv:SetVelocity(Vector(0, 0, 0))
        if (SERVER) then
            // Damage what we collided with
            ply:EmitSound("physics/body/body_medium_impact_hard" .. math.random(1, 6) .. ".wav", math.Rand(80, 100), math.Rand(90, 120))
            if (tr.Entity:IsValid() && GetConVar("sv_buu_slidedamage"):GetBool()) then
                tr.Entity:TakeDamage(ply:GetNWFloat("Buu_SlideVel")/20, ply)
            end
            
            // Shake the screen
            local shake = ents.Create("env_shake")
            shake:SetOwner(ply)
            shake:SetPos(tr.HitPos)
            shake:SetKeyValue("amplitude", "2500")
            shake:SetKeyValue("radius", "100")
            shake:SetKeyValue("duration", "0.5")
            shake:SetKeyValue("frequency", "255")
            shake:SetKeyValue("spawnflags", "4")	
            shake:Spawn()
            shake:Activate()
            shake:Fire("StartShake", "", 0)
        end
    end	
    
    // Stop sliding sound if it's still going
    if (!ply:GetNWBool("Buu_Sliding") && ply.SlideSound != nil) then
        ply.SlideSound:Stop()
        ply.SlideSound = nil
    end	
end
hook.Add("Move", "BuuBase_Sliding", BuuBase_Sliding)


/*-----------------------------
    BuuBase_Sliding_Thirdperson
    Handles the sliding animation in thirdperson
    @param The Player
    @param The player's velocity
-----------------------------*/

local function BuuBase_Sliding_Thirdperson(ply, vel)

    // If we're sliding, play the zombie slump animation
	if (IsValid(ply) && ply:GetNWBool("Buu_Sliding")) then
		ply.CalcIdeal = ACT_MP_WALK
		ply.CalcSeqOverride = -1
        ply.CalcSeqOverride = ply:LookupSequence("zombie_slump_idle_02")
		return ply.CalcIdeal, ply.CalcSeqOverride
	end
end
hook.Add("CalcMainActivity", "BuuBase_Sliding_Thirdperson", BuuBase_Sliding_Thirdperson)


if (SERVER) then
    util.AddNetworkString("BuuBase_StartedSliding")
    util.AddNetworkString("BuuBase_DropMag")

    
    /*-----------------------------
        BuuBase_ConfirmSlide
        Confirms if the player can actually slide serverside
        @param The length of incoming network data
        @param The player to check
    -----------------------------*/
    
    local function BuuBase_ConfirmSlide(len, ply)
        local vel = net.ReadFloat()
        local dir = net.ReadVector()
        
        // Confirm if we're sliding
        if !ply:GetNWBool("Buu_Sliding") && ply:KeyDown(IN_SPEED) && ply:KeyDown(IN_DUCK) && ply:IsOnGround() && ply:GetVelocity():Length() >= ply:GetRunSpeed() then
            ply:SetNWFloat("Buu_SlideVel", vel:Length())
            ply:SetNWVector("Buu_SlideDir", dir)
            ply:SetNWBool("Buu_Sliding", true)
            ply:SetNWFloat("Buu_SlideCooldown", CurTime()+1)
            ply:SetNWFloat("Buu_SlideTime", CurTime())
        end
    end
    net.Receive("BuuBase_StartedSliding", BuuBase_ConfirmSlide)
    
    
    /*-----------------------------
        BuuBase_HandleFlashlight
        Stops flashlight serverside if using buu base
        @param The player
        @param Whether it was requested to be turned on or off
    -----------------------------*/
    
    function BuuBase_HandleFlashlight(ply, tostate)
    
        // If we're holding a buu weapon
        if (ply:GetActiveWeapon() != nil && ply:GetActiveWeapon().IsBuuBase) then
        
            // Check if we can use the custom flashlight
            if (!GetConVar("sv_buu_customflashlight"):GetBool() || !ply:GetActiveWeapon().CustomFlashlight) then
                return true
            end
            
            // Toggle the custom flashlight
            ply:GetActiveWeapon():SetBuu_UsingFlashlight(!ply:GetActiveWeapon():GetBuu_UsingFlashlight())
            ply:EmitSound("items/flashlight1.wav")
            return !tostate
        end
    end
    hook.Add("PlayerSwitchFlashlight", "BuuBase_HandleFlashlight", BuuBase_HandleFlashlight)
end


if (CLIENT) then

    /*-----------------------------
        ManipulateViewModel
        Performs Lua based viewmodel animations
        @param  The position of the viewmodel
        @Param  The angle of the viewmodel
        @Return The final position and angle
    -----------------------------*/

    // Initialize globals
	local FinalVector = Vector(0,0,0)
	local FinalVectorAngle = Vector(0,0,0)
	local TargetVector = Vector(0,0,0)
	local TargetVectorAngle = Vector(0,0,0)
	local Current_Aim = Angle(0,0,0)
	local ironsighttime = 0
    local lastfire = 0
    local ironfiretime = 0
	function SWEP:ManipulateViewModel(pos, ang)
		if !IsValid(self.Owner) then return end
        
		local ply = LocalPlayer()
		local weapon = ply:GetActiveWeapon()
		local walkspeed = self.Owner:GetVelocity():Length() 
		local Tr = self.Owner:GetEyeTrace()
        
        // Initialize uninitialized object variables
        if (self.LastEyePosition == nil) then
            self.LastEyePosition = Angle(0,0,0)
        end
        if (self.EyePosition == nil) then
            self.EyePosition = Angle(0,0,0)
        end
		
		
		/*--------------------------------------------
				  Animation Transition Speed 
		--------------------------------------------*/
		
        // Decide the animation speed based on what the player is currently doing
        local animspeed = 5
        if (self.LandTime > RealTime() && !(self.Owner:KeyDown(IN_SPEED) && self.Owner:IsOnGround())) then
            animspeed = 20
        elseif (IsValid(self.Owner) && !self.Owner:KeyDown(IN_SPEED) && !(self.Owner:KeyDown(IN_DUCK) && walkspeed > 40)) then
            animspeed = 10
        elseif (self.Owner:KeyDown(IN_DUCK) && walkspeed > 40) then 
			if !self:GetBuu_Ironsights() then
                animspeed = 4
			else
                animspeed = 10
			end
        end
        
        // Smoothly transition the vectors with the target values
        FinalVector = LerpVector(animspeed*FrameTime(), FinalVector, TargetVector) 
        FinalVectorAngle = LerpVector(animspeed*FrameTime(), FinalVectorAngle, TargetVectorAngle) 
        
        // Change the angles and positions with the new vectors
		ang:RotateAroundAxis(ang:Right(), FinalVectorAngle.x)
		ang:RotateAroundAxis(ang:Up(), FinalVectorAngle.y)
		ang:RotateAroundAxis(ang:Forward(), FinalVectorAngle.z)
		pos = pos + FinalVector.z*ang:Up()
		pos = pos + FinalVector.y*ang:Forward()
		pos = pos + FinalVector.x*ang:Right()
        

        /*--------------------------------------------
		   Ironsight, Crouching, Near Wall, Ladder,
                    Sliding, and Sprinting
		--------------------------------------------*/
		
		local maxroll = 30 // How much to roll the gun when going into ironsights
        if (self:GetBuu_Ironsights() && !self:GetBuu_Reloading()) then
			local targettime = 0
            
            // If just fired, reset the shooting animation timer
            if (self:GetBuu_FireTime() != lastfire) then
                lastfire = self:GetBuu_FireTime()
                ironfiretime = CurTime()+0.04
            end
        
            // If we just fired, handle ironsight shooting animations
        	if (ironfiretime > CurTime() && !self.UseNormalShootIron) then
                TargetVector = self.IronSightsPos + (self.IronSightsShootPos-self.IronSightsPos)
            else
                TargetVector = self.IronSightsPos
            end
            
            // Calculate the time to perform the rolling animation
			ironsighttime = Lerp(10*FrameTime(), ironsighttime+1, maxroll)
			if (GetConVar("cl_buu_ironsightrolling"):GetBool()) then
				targettime = (-(ironsighttime-(maxroll/2))^2 + (maxroll/2)^2)/(maxroll/2) // Parabolas! Thank you https://www.desmos.com for some nice visuals.
			end
            
            // Modify the final angle with the roll
			TargetVectorAngle = self.IronSightsAng + Vector(-targettime/(maxroll/3),0,-targettime)
        elseif (self:GetBuu_OnLadder()) then 
            
            // Lower the gun if on a ladder
            TargetVector = Vector(0,0,2)
            TargetVectorAngle = Vector(-40,0,0)
        elseif (self:GetBuu_Sprinting() && !self:GetBuu_Reloading() && (!self.Owner:KeyDown(IN_DUCK) || (self.Owner:GetNWBool("Buu_Sliding") && !GetConVar("sv_buu_slideshoot"):GetBool()))) then 
            
            // Do the sprinting and/or sliding animation
            TargetVector = self.RunArmPos
            TargetVectorAngle = self.RunArmAngle
        elseif (self.Owner:GetNWBool("Buu_Sliding") && GetConVar("cl_buu_slidetilt"):GetBool()) then 
        
            // Tilt the viewmodel if we're sliding
            TargetVector = Vector(0,0,0)
            TargetVectorAngle = Vector(0,0,20)   
        elseif (self:GetBuu_NearWall() && (self:Clip1() == self.Primary.ClipSize || !self:GetBuu_Reloading())) then 
        
            // Do "Near Wall" animation
            TargetVector = self.RunArmPos
            TargetVectorAngle = self.RunArmAngle
        elseif (self.Owner:Crouching() && !self:GetBuu_NearWall()) then 
        
            // Change the position if crouching
            TargetVector = self.CrouchPos
            TargetVectorAngle = self.CrouchAng
        else
            TargetVector = Vector(0,0,0)
            TargetVectorAngle = Vector(0,0,0)
        end
        
        // Calculate the next ironsight tiime
		ironsighttime = math.Clamp(ironsighttime - 1, 0, maxroll)
		
		
		/*--------------------------------------------
					 Viewmodel Jump Sway
		--------------------------------------------*/
		
        // Custom jumping animation
		if (GetConVar("cl_buu_customjump"):GetBool()) then
        
            // If we're not on the ground, reset the landing animation time
            if (!self.Owner:IsOnGround()) then
                self.LandTime = RealTime() + 0.31
            end
            
            // If we're noclipping, ignore everything
            if (self.Owner:GetMoveType() == MOVETYPE_NOCLIP || self:GetBuu_OnLadder() || self.Owner:WaterLevel() > 1) || (self.LandTime < RealTime() && self.LandTime != 0) then
                self.LandTime = 0
                self.JumpTime = 0
            end

            // If we jumped, start the animation
            if (self.Owner:KeyDownLast(IN_JUMP)) then
                if (self.JumpTime == 0) then
                    self.JumpTime = RealTime() + 0.31
                    self.LandTime = 0
                end
            end
        
			// Helpful bezier function. Use this if you gotta: https://www.desmos.com/calculator/cahqdxeshd
			local function BezierY(f,a,b,c)
				f = f*3.2258
				return (1-f)^2 *a + 2*(1-f)*f*b + (f^2)*c
			end
            
            // If we're not ironsighting, then use the custom Lua animation
			if (!self:GetBuu_Ironsights() && self.Owner:WaterLevel() < 1) then
                
                // Decide what to do based on the jump arc
				if (self.JumpTime > RealTime()) then
                
                    // If we jumped, do a curve upwards
					local f = 0.31 - (self.JumpTime-RealTime())
					local xx = BezierY(f,0,-4,0)
					local yy = 0
					local zz = BezierY(f,0,-2,-5)
					local pt = BezierY(f,0,-4.36,10)
					local yw = xx
					local rl = BezierY(f,0,-10.82,-5)
					TargetVector = TargetVector + Vector(xx, yy, zz)
					TargetVectorAngle = TargetVectorAngle + Vector(pt, yw, rl)
				elseif (!ply:IsOnGround() && (ply:GetMoveType() != MOVETYPE_NOCLIP && !self:GetBuu_OnLadder())) then
                
                    // Shaking while falling
					local BreatheTime = RealTime() * 30
					TargetVector = TargetVector + Vector(math.cos(BreatheTime/2)/16, 0, -5+(math.sin(BreatheTime/3)/16))
					TargetVectorAngle = TargetVectorAngle + Vector(10-(math.sin(BreatheTime/3)/4), math.cos(BreatheTime/2)/4, -5)
				elseif (self.LandTime > RealTime()) then
                
                    // If we landed, do a fancy curve downwards
					local f = (self.LandTime-RealTime())
					local xx = BezierY(f,0,-4,0)
					local yy = 0
					local zz = BezierY(f,0,-2,-5)
					local pt = BezierY(f,0,-4.36,10)
					local yw = xx
					local rl = BezierY(f,0,-10.82,-5)
					TargetVector = TargetVector + Vector(xx, yy, zz)
					TargetVectorAngle = TargetVectorAngle + Vector(pt, yw, rl)
				end
			else
                
                // Otherwise, just bob the viewmodel up and down
				TargetVector = TargetVector + Vector(0 ,0 , math.Clamp(self.Owner:GetVelocity().z / 1000,-1,1))
			end
		end
		
		
		/*--------------------------------------------
					  Viewmodel Bobbing
		--------------------------------------------*/
		
        // Handle viewmodel bobbing
        if (ply:IsOnGround() && GetConVar("cl_buu_custombob"):GetBool()) then
			if (self:GetBuu_Sprinting() && !self:GetBuu_Reloading() && GetConVar("sv_buu_sprinting"):GetBool() && !self.Owner:GetNWBool("Buu_Sliding")) then
            
                // Sprinting bobbing
                local BreatheTime = RealTime() * 18
                if (self.PistolSprint) then
                    TargetVector = TargetVector - Vector(math.cos(BreatheTime/2)*walkspeed/400, -math.cos(BreatheTime)*walkspeed/400,0)
                    TargetVectorAngle = TargetVectorAngle - Vector(math.cos(BreatheTime/2)*walkspeed/400,0,0)
                else
                    TargetVector = TargetVector - Vector(((math.cos(BreatheTime/2)+1)*1.25)*walkspeed/400,0,math.cos(BreatheTime)*walkspeed/400)
                    TargetVectorAngle = TargetVectorAngle - Vector(((math.cos(BreatheTime/2)+1)*-2.5)*walkspeed/400,((math.cos(BreatheTime/2)+1)*7.5)*walkspeed/400,0)
                end
			elseif (walkspeed > 20 && !self:GetBuu_NearWall() && !self.Owner:GetNWBool("Buu_Sliding")) then
            
                // Walking bobbing
				local BreatheTime = RealTime() * 16
				if (self:GetBuu_Ironsights()) then
					TargetVectorAngle = TargetVectorAngle - Vector((math.cos(BreatheTime)/2)*walkspeed/200, (math.cos(BreatheTime / 2) / 2)*walkspeed/200,0)
				else
                    local roll = 0
                    local yaw = 0
                    if (self.Owner:KeyDown(IN_MOVERIGHT)) then
                        roll = -7*(walkspeed/self.Owner:GetWalkSpeed())
                    elseif (self.Owner:KeyDown(IN_MOVELEFT)) then
                        yaw = 4*(walkspeed/200)
                    end
					TargetVector = TargetVector - Vector((-math.cos(BreatheTime/2)/5)*walkspeed/200+yaw/5,0,0)
					TargetVectorAngle = TargetVectorAngle - Vector((math.Clamp(math.cos(BreatheTime),-0.3,0.3)*1.2)*walkspeed/200,(-math.cos(BreatheTime/2)*1.2)*walkspeed/200+yaw,roll)
				end
			elseif !self:GetBuu_Ironsights() then
            
                // Ironsight bobbing
				local BreatheTime = RealTime() * 2
				TargetVector = TargetVector - Vector(math.cos(BreatheTime/4)/4,0,-math.cos(BreatheTime/5)/4)
				TargetVectorAngle = TargetVectorAngle - Vector(math.cos(BreatheTime/5),math.cos(BreatheTime/4),math.cos(BreatheTime/7))
			end            
		end
		
	
		/*--------------------------------------------
						Viewmodel Sway
		--------------------------------------------*/
		
        // Handle viewmodel swaying
		if (GetConVar("cl_buu_customsway"):GetBool()) then
			self.LastEyePosition = self.EyePosition
			
			Current_Aim = LerpAngle(5*FrameTime(), Current_Aim, ply:EyeAngles())
			
			self.EyePosition = Current_Aim - ply:EyeAngles()
			self.EyePosition.y = math.AngleDifference(Current_Aim.y, math.NormalizeAngle(ply:EyeAngles().y))   
			
			ang:RotateAroundAxis(ang:Right(), math.Clamp(4*self.EyePosition.p/self.BuuSwayScale,-4,4))
			ang:RotateAroundAxis(ang:Up(), math.Clamp(-4*self.EyePosition.y/self.BuuSwayScale,-4,4))

			pos = pos + math.Clamp((-1.5*self.EyePosition.p/self.BuuSwayScale),-1.5,1.5) * ang:Up()
			pos = pos + math.Clamp((-1.5*self.EyePosition.y/self.BuuSwayScale),-1.5,1.5) * ang:Right()
		end
		
        // Return the final calculated position and angle
		return pos, ang
	end
    
    
    /*-----------------------------
        ManipulateViewModel
        Performs Lua based viewmodel animations
        @param  The position of the viewmodel
        @Param  The angle of the viewmodel
        @Return The final position and angle
    -----------------------------*/
    
    // Initialize constants
    local myfov = 75
    local myfov_t = 90
    local function BuuBase_CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
        if (ply:Alive() && ply:GetActiveWeapon().IsBuuBase) then
            local vmpos, vmang = ply:GetActiveWeapon():ManipulateViewModel(Vector(origin.x, origin.y, origin.z), Angle(angles.p,angles.y,angles.r))
            ply:GetViewModel():SetRenderOrigin(vmpos) 
            ply:GetViewModel():SetRenderAngles(vmang)

            // Tilt the view when sliding
            if (GetConVar("cl_buu_slidetilt"):GetBool()) then
                local DistIn
                local DistOut
                
                // Initialize the variables if they aren't
                if (ply.SlideLeanAngle == nil) then
                    ply.SlideLeanAngle = 0
                end
                
                // Calculate the lean angle
                if (ply:GetNWBool("Buu_Sliding") && ply.SlideLeanAngle < 20) then
                    DistIn = ply.SlideLeanAngle - 20
                    ply.SlideLeanAngle = math.Approach(ply.SlideLeanAngle, 20, FrameTime() * (DistIn * 6))
                elseif (!ply:GetNWBool("Buu_Sliding") && ply.SlideLeanAngle > 0) then 
                    DistOut = ply.SlideLeanAngle - 0
                    ply.SlideLeanAngle = math.Approach(ply.SlideLeanAngle, 0, FrameTime() * (DistOut * 6))
                end
            
                // Roll the view if we have a nonzero lean angle
                if (ply.SlideLeanAngle != 0) then
                    angles.roll = angles.roll + ply.SlideLeanAngle
                end
            end
            
            // Ironsight FOV
            if !ply:GetActiveWeapon().Sniper then
                local m_PlayerCam = GAMEMODE:CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
                m_PlayerCam.origin = origin
                m_PlayerCam.angles = angles
                m_PlayerCam.fov = myfov
                myfov = Lerp(10*FrameTime(),myfov,myfov_t)
                if (ply:GetActiveWeapon():GetBuu_Ironsights()) then
                    myfov_t = ply:GetActiveWeapon().IronsightFOV
                else 
                    myfov_t = LocalPlayer():GetInfoNum("fov_desired", 90)
                end
                return m_PlayerCam, GAMEMODE:CalcView(ply, origin, angles, fov, vm_origin, vm_angles)
            end
        else
            ply:GetViewModel():SetRenderOrigin(vm_origin) 
            ply:GetViewModel():SetRenderAngles(vm_angles)
        end
    end
    hook.Add("CalcView", "BuuBase_CalcView", BuuBase_CalcView)
    
    
    /*-----------------------------
        BuuBase_HideViewModelScope
        Hides the viewmodel if using a sniper scope
        @Param  The viewmodel
        @Param  The player
        @Param  The weapon
        @Return Whether to override drawing
    -----------------------------*/

    local function BuuBase_HideViewModelScope(vm, ply, wep)
    
        // If we're holding a buu weapon
        if (wep.IsBuuBase) then
            if (wep.Sniper && wep.TimeToScope < UnPredictedCurTime() && wep:GetBuu_Ironsights()) then
                vm:SetRenderMode(RENDERMODE_TRANSCOLOR)
                vm:SetColor(Color(255, 255, 255, 1))
            
                // Remove the flashlight if it exists
                if (vm.FlashLight != nil) then
                    vm.FlashLight:Remove()
                    vm.FlashLight = nil
                end
                
                // Prevent drawing the VM normally
                return true
            else
                ply.FixViewmodelColor = true
            end
        end
        
        // Reset our viewmodel color
        if (ply.FixViewmodelColor) then
            vm:SetRenderMode(RENDERMODE_NORMAL)
            vm:SetColor(Color(255, 255, 255, 255))
            ply.FixViewmodelColor = false
            return false
        end
    end
    hook.Add("PreDrawViewModel", "BuuBase_HideViewModelScope", BuuBase_HideViewModelScope)
    
    
    /*-----------------------------
        AdjustMouseSensitivity
        Changes the mouse sensitivity
        Used for Ironsights/Scoping
        @Return The sensitivity to set 
    -----------------------------*/
    
    function SWEP:AdjustMouseSensitivity()
    
        // Change the sensitivity if using a sniper scope or ironsight, otherwise set it back to normal
        if (self.Sniper && self.TimeToScope < UnPredictedCurTime() && self:GetBuu_Ironsights()) then
            return GetConVar("cl_buu_scopesensitivity"):GetFloat()
        elseif (self:GetBuu_Ironsights()) then
            return GetConVar("cl_buu_ironsensitivity"):GetFloat()
        else
            return 1
        end
    end
    
    
    /*-----------------------------
        IronIdleMove
        Modifies player input to simulate ironsight swaying
        @Param The User Command data
    -----------------------------*/

    local function IronsightSway(cmd)
        local wep = LocalPlayer():GetActiveWeapon()
        if (!IsValid(LocalPlayer()) || !IsValid(wep)) then return end
        
        // If ironsight sway is enabled
        if (wep.IsBuuBase && GetConVar("sv_buu_ironsightsway"):GetBool()) then
            local ang = cmd:GetViewAngles()

            // If we're using ironsights
            if (wep:GetBuu_Ironsights()) then
                local ft = FrameTime()
                local BreatheTime = RealTime()*2
                local MoveForce = LocalPlayer():GetFOV()*50
                
                // If we're crouching, reduce the sway
                if (LocalPlayer():Crouching()) then
                    MoveForce = LocalPlayer():GetFOV()*120
                end
                
                // If we're holding our breath, reduce the sway
                if (wep:GetBuu_ScopeBreathe() > CurTime()) then
                    MoveForce = MoveForce*20
                end
                
                // Calculate the sway angle and modify the view
                ang.pitch = ang.pitch + math.cos(BreatheTime)*wep.IronsightSway / MoveForce
                ang.yaw = ang.yaw + math.cos(BreatheTime/2)*wep.IronsightSway / MoveForce
                cmd:SetViewAngles(ang) 
            end
        end
    end
    hook.Add("CreateMove", "BuuBase_IronIdleMove", IronsightSway)
    
    
    /*-----------------------------
        HandleMuzzleAttachmentHelper
        A useful function for getting viewmodel muzzle attachments
        @Param The muzzle attachment name, or nil
    -----------------------------*/
    
    local muzzlenames = {
        ["muzzle"] = true,
        ["spark"] = true,
        ["laser"] = true, 
        ["1"] = true
    }
    function SWEP:HandleMuzzleAttachmentHelper(vm)

        // Look through the attachments to see if we have a valid muzzle one
        for k, v in pairs(vm:GetAttachments()) do
            if (muzzlenames[v.name]) then 
                return v.name 
            end
        end
        return nil
    end
    
    
    /*-----------------------------
        ViewModelDrawn
        Code that runs after the viewmodel is drawn
        Used for laser and flashlight handling in firstperson
        @Param The viewmodel
    -----------------------------*/

    // Initialize globals
    local tr = {}
    local LaserBeam  = Material('effects/buu_laser')
    local LaserPoint = Material('sprites/redglow1')
    local LastLaserPos = Vector(0,0,0)
    local point_pos = Vector(0,0,0)
    function SWEP:ViewModelDrawn(vm)
    
        // Don't draw the laser/flashlight if the sniper scope is on
        if (self.Sniper && self.TimeToScope < UnPredictedCurTime() && self:GetBuu_Ironsights()) then
            return 
        end

        // If laser is enabled (or we're holding the weapon base), then handle laser logic
        if (self.Laser || self:GetClass() == "weapon_buu_base2") && self.Owner:GetViewModel(0) == vm then
        
            // Since the weapon base is a special case, define those values
            if (self:GetClass() == "weapon_buu_base2") then
                self.LaserBone = "ValveBiped.base"
                self.LaserPos = Vector(0,13,0)
                self.LaserAng = Angle(90,0,0)
            end
            
            // Get bone information
            local pos, ang = self:GetBoneOrientation(vm, self.LaserBone)
            
            // If the positions are invalid, stop
            if (pos == nil || ang == nil) then return end
            
            // Calculate the laser position and angles
            local aim = self.Owner:EyeAngles()
            pos = pos + ang:Right() * self.LaserPos.x + ang:Up() * self.LaserPos.y + ang:Forward() * self.LaserPos.z
            ang:RotateAroundAxis(ang:Right(), self.LaserAng.p)
            ang:RotateAroundAxis(ang:Up(), self.LaserAng.y)
            ang:RotateAroundAxis(ang:Forward(), self.LaserAng.r)
            ang = ang:Forward()
            dir = ang
            
            // Create a trace to see if the laser hits a wall
            tr.start = pos
            tr.endpos = tr.start + dir * 8192
            tr.filter = self.Owner
            trace = util.TraceLine(tr)
            
            // If we didn't hit anything solid
            if (util.PointContents(trace.HitPos) != CONTENTS_SOLID) then
                dist = tr.start:Distance(trace.HitPos)
                
                // Draw the beam
                render.SetMaterial(LaserBeam)
                render.DrawBeam(pos + dir, pos + dir * math.Clamp(dist, 0, 75), 0.5, 0, 0.99, Color(255,0,0))
                
                // Calculate where the laser point hit
                local viewpunch = (self.Owner:EyeAngles() + self.Owner:GetViewPunchAngles()):Forward()
                local ttr = util.TraceLine({
                    start = LocalPlayer():EyePos(),
                    endpos = LocalPlayer():EyePos() + viewpunch * 10000,
                    filter = function(ent) if (ent == self.Owner) then return false end end
                })
                
                // Position the laser based on how close it was to something
                if !(dist < 172) && (self:GetBuu_Sprinting() || self:GetBuu_NearWall() || (!self.Owner:IsOnGround() && self.Owner:GetMoveType() != MOVETYPE_NOCLIP && !self:GetBuu_OnLadder()) || self.LandTime > RealTime() || self.Owner:GetVelocity():Length() > 30 || self:GetBuu_Reloading()) then
                    point_pos = LerpVector(10*FrameTime(), trace.HitPos, point_pos)
                elseif (dist < 172) then
                    point_pos = LerpVector(1-dist/172, point_pos, trace.HitPos)
                else
                    point_pos = LerpVector(30*FrameTime(), point_pos, ttr.HitPos)
                end
                
                // Draw the laser point
                if !(ttr.HitPos:Distance(ttr.StartPos) > 10000) then
                    render.DrawBeam(point_pos, LastLaserPos, 3, 0, 1, Color(255, 0, 0, 255))
                    render.SetMaterial(LaserPoint)
                    render.DrawSprite(point_pos, 3, 3, Color(255, 0, 0, 255))
                end
                LastLaserPos = point_pos
            end
        end
        
        // If the flashlight is enabled
        if (self:GetBuu_UsingFlashlight()) && self.Owner:GetViewModel(0) == vm then
            // Make sure we can attach to the muzzle
            local attach = self:HandleMuzzleAttachmentHelper(vm)
            if (attach == nil) then return end
            
            // Create the flashlight if it doesn't exist yet
            local muzzle = vm:GetAttachment(vm:LookupAttachment(attach))
            if (vm.FlashLight == nil) then
                vm.FlashLight = ProjectedTexture()
                vm.FlashLight:SetTexture("effects/flashlight001")
                vm.FlashLight:SetFarZ(712)
                vm.FlashLight:SetFOV(50)
            end
            
            // Update its position and angles
            vm.FlashLight:SetPos(muzzle.Pos)
            vm.FlashLight:SetAngles(muzzle.Ang)
            vm.FlashLight:Update()
        elseif (vm.FlashLight != nil) then
            vm.FlashLight:Remove()
            vm.FlashLight = nil
        end
    end


    /*-----------------------------
        BuuBase_ThirdPersonRendering
        Handles rendering the laser and flashlight in third person
    -----------------------------*/

    local function BuuBase_ThirdPersonRendering()
        
        // Check all players
        for k, v in pairs(player.GetAll()) do
            local wep = v:GetActiveWeapon()
            
            // Check if we're holding a buu weapon and we're not in firstperson
            if (wep.IsBuuBase && (v != LocalPlayer() || v:ShouldDrawLocalPlayer())) then
            
                // Check if the laser is enabled
                if (GetConVar("cl_buu_thirdpersonlaser"):GetBool() && wep.Laser) then
                    local tr
                    local pos, ang
                    
                    // If the player isn't aiming, have the laser follow the gun, otherwise follow the eyes
                    if (wep:GetBuu_Reloading() || wep:GetBuu_Sprinting() || wep:GetBuu_NearWall() || wep:GetBuu_OnLadder()) then
                        pos, ang = wep:GetBoneOrientation(v, "ValveBiped.Bip01_R_Hand")
                        tr = util.TraceLine({
                            start = pos,
                            endpos = pos + ang:Forward()*10000,
                            filter = function(ent) return true end
                        })
                    else
                        tr = v:GetEyeTrace()
                    end
                    
                    // Set the laser's hit position and draw it
                    if (tr.Hit) then
                        pos = tr.HitPos
                        ang = tr.HitNormal:Angle() + Angle(90,0,0)
                        render.SetMaterial(LaserPoint)
                        render.DrawSprite(pos, 6, 6, Color(255, 0, 0, 255))
                    end
                end
                
                // Remove the firstperson flashlight if it exists
                if (v:GetViewModel().FlashLight != nil) then
                    v:GetViewModel().FlashLight:Remove()
                    v:GetViewModel().FlashLight = nil
                end
                
                // If we're using the flashlight
                if (wep:GetBuu_UsingFlashlight()) then
                    local pos, ang = wep:GetBoneOrientation(v, "ValveBiped.Bip01_R_Hand")
                    
                    // If the positions are invalid, stop
                    if (pos == nil || ang == nil) then return end
                    
                    // Create the flashlight if it doesn't exist yet
                    if (v.FlashlightEntBuu == nil) then
                        local lamp = ProjectedTexture()
                        v.FlashlightEntBuu = lamp
                        v.FlashlightEntBuu:SetTexture("effects/flashlight001")
                        v.FlashlightEntBuu:SetFarZ(712)
                        v.FlashlightEntBuu:SetFOV(50)
                    end
                    
                    // Update its position and angles
                    v.FlashlightEntBuu:SetPos(pos) 
                    v.FlashlightEntBuu:SetAngles(ang)
                    v.FlashlightEntBuu:Update()
                elseif (v.FlashlightEntBuu != nil) then
                    v.FlashlightEntBuu:Remove()
                    v.FlashlightEntBuu = nil
                end
            end
            
            // If we're not in thirdperson, remove the flashlight entity
            if (!(wep.IsBuuBase && (v != LocalPlayer() || v:ShouldDrawLocalPlayer())) && v.FlashlightEntBuu != nil) then
                v.FlashlightEntBuu:Remove()
                v.FlashlightEntBuu = nil
            end
        end
    end
    hook.Add("PostDrawTranslucentRenderables", "BuuBase_ThirdPersonLaser", BuuBase_ThirdPersonRendering)   

    
    /*-----------------------------
        DrawHUD
        Draw stuff to the HUD
        Used for crosshairs/scope
    -----------------------------*/
    
    // Initialize globals
    local togap = 0
    local finalgap = 0
    local lastfirehud = 0
    function SWEP:DrawHUD()
    
        // Draw the sniper scope in using it, or the crosshair if not
        if (self.Sniper && self.TimeToScope < UnPredictedCurTime() && self:GetBuu_Ironsights()) then
			// Draw the scope texture
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID(self.SniperTexture))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)

			// Fill in everything else with a black as dark as my heart
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(self.QuadTable.x1 - 2.5, self.QuadTable.y1 - 2.5, self.QuadTable.w1 + 5, self.QuadTable.h1 + 5)
			surface.DrawRect(self.QuadTable.x2 - 2.5, self.QuadTable.y2 - 2.5, self.QuadTable.w2 + 5, self.QuadTable.h2 + 5)
			surface.DrawRect(self.QuadTable.x3 - 2.5, self.QuadTable.y3 - 2.5, self.QuadTable.w3 + 5, self.QuadTable.h3 + 5)
			surface.DrawRect(self.QuadTable.x4 - 2.5, self.QuadTable.y4 - 2.5, self.QuadTable.w4 + 5, self.QuadTable.h4 + 5)
        elseif (GetConVar("sv_buu_crosshair"):GetInt() == 1 && !self:GetBuu_Ironsights() && !self:GetBuu_NearWall() && !self:GetBuu_Sprinting() && !self:GetBuu_OnLadder() && !self:GetBuu_Reloading()) then
			self.DrawCrosshair = false
            if (self.CrosshairType == 0) then return end
            
            // Pick the Crosshair
			if (GetConVar("cl_buu_crosshairstyle"):GetInt() == 1) then
            
                // Enable HL2 Croshair
				self.DrawCrosshair = true
			else
				local x, y
                local r, g, b
				local scale = 1
                local movementgap = math.Clamp(LocalPlayer():GetVelocity():Length()/300, 0, 1.5)
                
                // Calculate crosshair scale and gap
                if (GetConVar("cl_buu_crosshairstyle"):GetInt() == 2) then
                    scale = 16
                else
                    if (lastfirehud != self:GetBuu_FireTime()) then
                        togap = togap + 10+self.Primary.Recoil*5
                        lastfirehud = self:GetBuu_FireTime()
                    end
                    togap = Lerp(0.04, togap, 0)
                end
                if (self.Sniper) then
                    scale = scale/2
                end
                finalgap = Lerp(1, finalgap, movementgap*50+scale*40+togap+self.Primary.Recoil*15)
                
                // Set the crosshair X+Y where the player is looking in thirdperson, or the center of the screen in first person
				if (self.Owner == LocalPlayer() && self.Owner:ShouldDrawLocalPlayer()) then
					local tr = util.GetPlayerTrace(self.Owner)
					tr.mask = (CONTENTS_SOLID+CONTENTS_MOVEABLE+CONTENTS_MONSTER+CONTENTS_WINDOW+CONTENTS_DEBRIS+CONTENTS_GRATE+CONTENTS_AUX)
					local trace = util.TraceLine(tr)
					local coords = trace.HitPos:ToScreen()
					x, y = coords.x, coords.y
				else
					x, y = ScrW()/2, ScrH()/2
				end
                
                // Set the crosshair color
				if (GetConVar("cl_buu_crosshairhealth"):GetInt() == 0) then
					r = GetConVar("cl_buu_crosshairred"):GetInt()
                    g = GetConVar("cl_buu_crosshairgreen"):GetInt()
                    b = GetConVar("cl_buu_crosshairblue"):GetInt()
				else
					local hp = LocalPlayer():Health()
					local maxhp = LocalPlayer():GetMaxHealth()
					r = math.Clamp(255*2-(hp*2/maxhp)*255, 0, 255)
					g = math.Clamp((hp*2/maxhp)*255, 0, 255)
					b = 0
				end
                surface.SetDrawColor(r, g, b, GetConVar("cl_buu_crosshairalpha"):GetInt())
                
                if (GetConVar("cl_buu_crosshairstyle"):GetInt() == 2) then
                
                    // Draw ZDoom crosshair
                    surface.SetTexture(surface.GetTextureID("scope/xhair_zdoom"))
                    surface.DrawTexturedRect(x-scale/2,y-scale/2,scale,scale)
                elseif (GetConVar("cl_buu_crosshairstyle"):GetInt() == 3) then
                
                    // CSS Crosshair
                    local length = math.max(20 + finalgap, 4)
                    surface.DrawLine(x - length, y, x - finalgap, y) // Left line
                    surface.DrawLine(x + length, y, x + finalgap, y) // Right line
                    if (self.CrosshairType != 2) then
                        surface.DrawLine(x-1, y - length, x-1, y - finalgap) // Top line
                    end
                    surface.DrawLine(x-1, y + length, x-1, y + finalgap) // Bottom line
                elseif (GetConVar("cl_buu_crosshairstyle"):GetInt() == 4) then
                
                    // Far Cry 3 Crosshair
                    if (self.CrosshairType < 3) then
                    
                        // 4 line crosshair
                        surface.SetTexture(surface.GetTextureID("scope/xhair_fc3"))
                        surface.DrawTexturedRectRotated(x,y+finalgap+5,4,16,0)
                        surface.DrawTexturedRectRotated(x+finalgap+5,y,4,16,90)
                        if (self.CrosshairType != 2) then
                            surface.DrawTexturedRectRotated(x,y-finalgap-5,4,16,180)
                        end
                        surface.DrawTexturedRectRotated(x-finalgap-5,y,4,16,270)
                    else
                        
                        // Circular crosshair
                        surface.DrawCircle(x, y, self.Primary.Cone*finalgap*5-1, Color(r*0.61, g*0.61, b*0.61, GetConVar("cl_buu_crosshairalpha"):GetInt()))
                        surface.DrawCircle(x, y, self.Primary.Cone*finalgap*5+1, Color(r*0.61, g*0.61, b*0.61, GetConVar("cl_buu_crosshairalpha"):GetInt()))
                        surface.DrawCircle(x, y, self.Primary.Cone*finalgap*5, Color(r, g, b, GetConVar("cl_buu_crosshairalpha"):GetInt()))
                    end
                end
			end
		else
			self.DrawCrosshair = false
		end
    end


    /*-----------------------------
        DrawWeaponSelection
        Draws the weapon on the HL2 selection
        @Param Panel X coordinate
        @Param Panel Y coordinate
        @Param Panel Width
        @Param Panel Height
        @Param Panel Alpha
    -----------------------------*/

    function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
    
        // Borders
        y = y 
        x = x+10
        w = w-20

        // Draw the Icon
        surface.SetDrawColor(255, 255, 255, alpha)
        surface.SetTexture(self.WepSelectIcon)
        surface.DrawTexturedRect(x, y, w, h)

        // Draw the ammo
        draw.SimpleTextOutlined(self:Clip1().."/"..self.Owner:GetAmmoCount(self.Primary.Ammo), "HudSelectionText", x+w, y+h-48, Color(255,255,255,255) , TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 2, Color(0,0,0,255))
        
        // Draw the rest of the weapon info
        self:PrintWeaponInfo(x+w+20, y+h*0.95, alpha)
    end
end