# Buu342's Weapon Base 2

<img src=".github/action.gif" />

This is a complete remake of my original weapon base.</br></br>
The original was buggy, contained code from a myriad of sources, and in general was a mess to maintain. I've been trying to refurbish it for quite some time, with this version being the final one that I'm happy to release to the wild.</br></br>
I've done the best I could to keep the code as clean as possible, commenting whenever I could. This should hopefully contain a lot of cool stuff for people to learn from!</br></br>

### Features
* Fully commented source code
* Fully predicted, so that laggy clients have the best experience
* Super customizable and easy to edit
* Shotgun reloading
* Sniper scope with swaying
* Ironsights
* Sprinting animations
* Near-Wall detection
* Ladder detection
* Barrel smoke trail
* Low ammo clicking
* Silencer
* Multiple crosshairs, customizable too
* Firemode switching with E+Mouse1
* Burst fire
* Tactical Sliding
* Laser Pointer (Also in thirdperson)
* Flashlight that follows the gun (Also in thirdperson)
* Idle, holster, ironsight, and empty animation support
* Lua based animations, including breathing, idle, bobbing, swaying, crouching, and jumping
* Ammo being given during animation, instead of at the end
* Clientside magazine dropping
* Holding breath while scoping with ALT
* Shotgun door destruction
* Lots of clientside and serverside settings, also available in the Q menu
* Thirdperson animations
</br></br>

### Clientside options
```lua
cl_buu_crosshairhealth  0
cl_buu_crosshairstyle   1
cl_buu_crosshairred     255
cl_buu_crosshairgreen   255
cl_buu_crosshairblue    255
cl_buu_crosshairalpha   255
cl_buu_ironsightrolling 1
cl_buu_barrelsmoke      1
cl_buu_customjump       1
cl_buu_custombob        1
cl_buu_customsway       1
cl_buu_magdrop          1
cl_buu_magdroplifetime  10
cl_buu_ironsensitivity  0.7
cl_buu_scopesensitivity 0.3
cl_buu_lowammowarn      1
cl_buu_slidetilt        1
cl_buu_thirdpersonlaser 1
```
</br>

### Serverside options
```lua
sv_buu_ironsights        1
sv_buu_crosshair         1
sv_buu_sprinting         1
sv_buu_nearwall          1
sv_buu_ladder            1
sv_buu_ironsightsway     1
sv_buu_shotgunwreckdoors 1
sv_buu_sniperbreath      1
sv_buu_canslide          1
sv_buu_slidedamage       1
sv_buu_slideshoot        1
sv_buu_customflashlight  1
```
</br>


### Credits
A huge thank you to Mushroom Guy, for putting up with me for so many years and teaching me so much valuable information. None of this would've been possible without you!</br>
And love to all the following people, for being awesome, for teaching me things, providing feedback, testing, and so much more (in no particular order):
* Ghetto
* BFG9000
* Matsilagi
* Stiffy
* Pyromancer
* Demo/CougarMagnum
* Trigger Hurt
* Spastik
* ErrolLiamP + Blaziken
* ZeqMacaw
* xDShot
* datae
* Spartains
