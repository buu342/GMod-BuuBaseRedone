/**************************************************************
           Buu's Base Muzzleflash Smoke Trail Effect
https://github.com/buu342/GMod-BuuBaseRedone
**************************************************************/


/*-----------------------------
    Init
    Initializes the effect
    @Param Effect data
-----------------------------*/

function EFFECT:Init(data)
    -- Initialize the effect with the effect data
    self:SetRenderMode(RENDERMODE_TRANSALPHA)
    self.WeaponEnt = data:GetEntity()
    self.Attachment = data:GetAttachment()
    
    -- Store some variables with our positio and direction
    self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
    self.Forward = data:GetNormal()
    self.Angle = self.Forward:Angle()
    self.Right = self.Angle:Right()
    
    -- Ensure the weapon exists
    if (!IsValid(self.WeaponEnt) || self.WeaponEnt:GetOwner() == nil) then return end
    
    -- Initialize the smoketrail table and variables
    self.Particles = {Pos = self.Position}
    self.ParCount = 0
    self.Width = 2
    self.Dead = false
    
    -- Initialize the timers
    self.LifeTime = CurTime() + 3
    self.WaitTime = 0.2
    self.NextTime = CurTime() + self.WaitTime
end


/*-----------------------------
    Think
    Handles effect logic every tick
    @Return Whether the effect should live
-----------------------------*/

function EFFECT:Think()
    self.Position = self:GetTracerShootPos(self.Position, self.WeaponEnt, self.Attachment)
    
    -- If the particle table doesn't exist, stop
    if (self.Particles == nil) then
        return 
    end
    
    -- Go through the variable table (If the game isn't paused)
    if (!game.SinglePlayer() || !gui.IsGameUIVisible()) then
        for k, p in pairs(self.Particles) do
            if (p.Pos != nil) then
            
                -- Update each strand
                p.Pos = p.Pos + p.Vel
                p.Size = p.Size + p.SizeInc
                p.Alpha = p.Alpha - FrameTime()*10
                
                -- If the strand is invisible, remove it from the table
                if (p.Alpha < 0) then
                    table.remove(self.Particles, 1)
                end
            end
        end
    end
    
    -- Ensure the weapon we're attached to exists
    if (!IsValid(self.WeaponEnt) || !IsValid(self.WeaponEnt:GetOwner()) || !IsValid(self.WeaponEnt:GetOwner():GetActiveWeapon())) then return end
    
    -- If we're still alive
    if (self.LifeTime > CurTime() && self.WeaponEnt:GetOwner():GetActiveWeapon() == self.WeaponEnt) then
    
        -- If it's time to create a particle
        if (self.NextTime < CurTime()) then
        
            -- Create a particle and add it to the table
            local p = {}
                p.Pos = self.Position
                p.Vel = Vector(math.Rand(-0.025,0.025),math.Rand(-0.025,0.025),0.1)
                p.Size = 0.3
                p.SizeInc = 0.01
                p.Alpha = 50
            table.insert(self.Particles, p)
            self.ParCount = #self.Particles
            
            -- Do this again after some time
            self.NextTime = CurTime()+self.WaitTime
        end
    elseif (!self.Dead) then
    
        -- Otherwise, mark ourself for deletion, adding one last strand
        self.Dead = true
        local p = {}
            p.Pos = nil
            p.Vel = Vector(math.Rand(-0.025,0.025),math.Rand(-0.025,0.025),0.1)
            p.Size = 0.3
            p.SizeInc = 0.01
            p.Alpha = 50
        table.insert( self.Particles, p )
    end
    
    -- Stop if dead, or the table is empty
    if (table.Count(self.Particles) == 1 && self.Dead) then
        return false
    end
    
    -- Otherwise, continue existing
    return true
end


/*-----------------------------
    Render
    Renders the effect
-----------------------------*/

local SmokeSprite = Material( "trails/smoke" )
function EFFECT:Render()
    render.SetMaterial(SmokeSprite)
    
    -- Initialize our position trackers
    local LastPos = nil
    local pCount = 0

    -- If the particle table is empty, stop
    if (self.Particles == nil) then
        return 
    end

    -- Go through the particle table
    for k, p in pairs(self.Particles) do
        if (p.Pos != nil) then
            -- Retrieve the light color
            local LightColor = render.GetLightColor(p.Pos)*255
            LightColor.r = math.Clamp(LightColor.r, 0, 255)
            LightColor.g = math.Clamp(LightColor.g, 0, 255)
            LightColor.b = math.Clamp(LightColor.b, 0, 255)
            local color = Color(LightColor.r*4, LightColor.g*4, LightColor.b*4, p.Alpha)
            
            -- Render the particle strand
            if (LastPos) then
                render.DrawBeam(LastPos, p.Pos, p.Size, 1,    0, color)
            end
            
            -- Increment our position tracker
            pCount = pCount + 1
            LastPos = p.Pos
        end
    end
end