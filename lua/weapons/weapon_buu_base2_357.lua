DEFINE_BASECLASS "weapon_buu_base2"

SWEP.PrintName = "#weapon_357"
SWEP.Category = "Half-Life 2 ( Buu Base 2 )"
SWEP.Spawnable = true
SWEP.Author = "KM_CM"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = "Primary to fire, hold secondary to aim down sights."

SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"

SWEP.HoldType = "revolver"
SWEP.CrosshairType = 3

SWEP.Slot = 1
SWEP.ViewModelFOV = 54

SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 6
SWEP.Primary.Delay = .8
SWEP.Primary.Automatic = false
SWEP.Primary.Cone = 0 // No, I am not kidding. The HL2 357 also has zero inaccuracy
SWEP.Primary.Recoil = 5
SWEP.Primary.Sound = "Weapon_357.Single"
SWEP.Primary.Damage = 40
SWEP.Primary.Ammo = "357"
SWEP.IronSightsPos = Vector( -4.62, 0, .67 )
