if CLIENT then

	hook.Add("PopulateToolMenu", "BuuBaseSettings", function()
	
		spawnmenu.AddToolMenuOption("Options", "Buu Base Settings", "Client", "Client", "", "", function(panel)

			local BuuBaseSettings = {
				Options = {}, 
				CVars = {}, 
				Label = "#Presets", 
				MenuButton = "1", 
				Folder = "Buu Base Settings"
			}
			
			BuuBaseSettings.Options["#Default"] = {	
				cl_buu_crosshairhealth = "0",
				cl_buu_crosshairstyle =	"1",
				cl_buu_crosshairred =	"255",
				cl_buu_crosshairgreen =	"255",
				cl_buu_crosshairblue =	"255",
				cl_buu_crosshairalpha =	"255",
				cl_buu_ironsightrolling = "1",
				cl_buu_barrelsmoke=	"1",
				cl_buu_customjump =	"1",
				cl_buu_custombob =	"1",
				cl_buu_customsway =	"1",
				cl_buu_customflashlight = "1",
				cl_buu_ironsensitivity = "0.7",
				cl_buu_scopesensitivity = "0.3",
				cl_buu_lowammowarn = "1"
			}

			panel:AddControl("ComboBox", BuuBaseSettings)
			
			panel:AddControl("CheckBox", {
				Label = "Crosshair shows health",
				Command = "cl_buu_crosshairhealth",
			})
			
			panel:AddControl("Slider", {
				Label 	= "Crosshair Style",
				Command 	= "cl_buu_crosshairstyle",
				Type 		= "Integer",
				Min 		= "0",
				Max 		= "4",
			})
			
			panel:AddControl("Slider", {
				Label 	= "Crosshair Red",
				Command 	= "cl_buu_crosshairred",
				Type 		= "Integer",
				Min 		= "0",
				Max 		= "255",
			})
			
			panel:AddControl("Slider", {
				Label 	= "Crosshair Green",
				Command 	= "cl_buu_crosshairgreen",
				Type 		= "Integer",
				Min 		= "0",
				Max 		= "255",
			})
			
			panel:AddControl("Slider", {
				Label 	= "Crosshair Blue",
				Command 	= "cl_buu_crosshairblue",
				Type 		= "Integer",
				Min 		= "0",
				Max 		= "255",
			})
			
			panel:AddControl("Slider", {
				Label 	= "Crosshair Alpha",
				Command 	= "cl_buu_crosshairalpha",
				Type 		= "Integer",
				Min 		= "0",
				Max 		= "255",
			})
			
			panel:AddControl("Label", {Text = ""})
			
			panel:AddControl("CheckBox", {
				Label = "Barrel Smoke",
				Command = "cl_buu_barrelsmoke",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Ironsight rolling",
				Command = "cl_buu_ironsightrolling",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Custom Jumping animation",
				Command = "cl_buu_customjump",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Custom Bob",
				Command = "cl_buu_custombob",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Custom Sway",
				Command = "cl_buu_customsway",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Custom Flashlight",
				Command = "cl_buu_customflashlight",
			})
			
			panel:AddControl("Label", {Text = ""})
			
			panel:AddControl("Slider", {
				Label 	= "Ironsight sensitivity",
				Command 	= "cl_buu_ironsensitivity",
				Type 		= "Float",
				Min 		= "0",
				Max 		= "1",
			})
			
			panel:AddControl("Slider", {
				Label 	= "Scope Sensitivity",
				Command 	= "cl_buu_scopesensitivity",
				Type 		= "Float",
				Min 		= "0",
				Max 		= "1",
			})
			
			panel:AddControl("Label", {Text = ""})
			
			panel:AddControl("CheckBox", {
				Label = "Guns click on low ammo",
				Command = "cl_buu_lowammowarn",
			})
			
			panel:AddControl("Label", {Text = ""})
			panel:AddControl("Label", {Text = "By buu342"})
			
		end)
	
		spawnmenu.AddToolMenuOption("Options", "Buu Base Settings", "Server", "Server", "", "", function(panel)

			local BuuBaseSettings = {
				Options = {}, 
				CVars = {}, 
				Label = "#Presets", 
				MenuButton = "1", 
				Folder = "Buu Base Settings"
			}
			
			BuuBaseSettings.Options["#Default"] = {	
				sv_buu_ironsights =	"1",
				sv_buu_crosshair = "1",
				sv_buu_sprinting = "1",
				sv_buu_nearwall = "1",
				sv_buu_headshotinstantkill = "0",
				sv_buu_ironsightsway = "1",
				sv_buu_shotgunwreckdoors = "1",
				sv_buu_sniperbreath = "1",
				sv_buu_magdrop = "1",
				sv_buu_magdroplifetime = "10"
			}

			panel:AddControl("ComboBox", BuuBaseSettings)
			
			panel:AddControl("CheckBox", {
				Label = "Enable crosshair",
				Command = "sv_buu_crosshair",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Enable ironsights",
				Command = "sv_buu_ironsights",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Enable sprinting",
				Command = "sv_buu_sprinting",
			})
		
			panel:AddControl("CheckBox", {
				Label = "Enable near-wall",
				Command = "sv_buu_nearwall",
			})
			
			panel:AddControl("Label", {Text = ""})
			
			panel:AddControl("CheckBox", {
				Label = "Headshots instant kill",
				Command = "sv_buu_headshotinstantkill",
			})
			
			panel:AddControl("Label", {Text = ""})
			
			panel:AddControl("CheckBox", {
				Label = "Ironsight sway",
				Command = "sv_buu_ironsightsway",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Shotguns destroy doors",
				Command = "sv_buu_shotgunwreckdoors",
			})
			
			panel:AddControl("CheckBox", {
				Label = "Snipers can hold breath",
				Command = "sv_buu_sniperbreath",
			})
			
			panel:AddControl("Label", {Text = ""})

			panel:AddControl("CheckBox", {
				Label = "Mag dropping",
				Command = "sv_buu_magdrop",
			})
			
			panel:AddControl("Slider", {
				Label 	= "Dropped mags lifetime",
				Command 	= "sv_buu_magdroplifetime",
				Type 		= "Integer",
				Min 		= "1",
				Max 		= "10000",
			})
			
			panel:AddControl("Label", {Text = ""})
			panel:AddControl("Label", {Text = "By buu342"})
			
		end)
	
	end)
	
end


/*===============================================================
							Clientside
===============================================================*/

if !ConVarExists("cl_buu_crosshairhealth") then
    CreateClientConVar("cl_buu_crosshairhealth", '0', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_crosshairstyle") then
    CreateClientConVar("cl_buu_crosshairstyle", '1', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_crosshairred") then
    CreateClientConVar("cl_buu_crosshairred", '255', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_crosshairgreen") then
    CreateClientConVar("cl_buu_crosshairgreen", '255', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_crosshairblue") then
    CreateClientConVar("cl_buu_crosshairblue", '255', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_crosshairalpha") then
    CreateClientConVar("cl_buu_crosshairalpha", '255', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_barrelsmoke") then
    CreateClientConVar("cl_buu_barrelsmoke", '1', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_ironsightrolling") then
    CreateClientConVar("cl_buu_ironsightrolling", '1', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_customjump") then
    CreateClientConVar("cl_buu_customjump", '1', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_custombob") then
    CreateClientConVar("cl_buu_custombob", '1', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_customsway") then
    CreateClientConVar("cl_buu_customsway", '1', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_customflashlight") then
    CreateClientConVar("cl_buu_customflashlight", '1', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_ironsensitivity") then
    CreateClientConVar("cl_buu_ironsensitivity", '0.7', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_scopesensitivity") then
    CreateClientConVar("cl_buu_scopesensitivity", '0.3', FCVAR_ARCHIVE)
end

if !ConVarExists("cl_buu_lowammowarn") then
    CreateClientConVar("cl_buu_lowammowarn", '255', FCVAR_ARCHIVE)
end


/*===============================================================
							Serverside
===============================================================*/

if !ConVarExists("sv_buu_ironsights") then
    CreateConVar("sv_buu_ironsights", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_crosshair") then
    CreateConVar("sv_buu_crosshair", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_sprinting") then
    CreateConVar("sv_buu_sprinting", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_nearwall") then
    CreateConVar("sv_buu_nearwall", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_headshotinstantkill") then
    CreateConVar("sv_buu_headshotinstantkill", '0', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_ironsightsway") then
    CreateConVar("sv_buu_ironsightsway", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_shotgunwreckdoors") then
    CreateConVar("sv_buu_shotgunwreckdoors", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_sniperbreath") then
    CreateConVar("sv_buu_sniperbreath", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_magdrop") then
    CreateConVar("sv_buu_magdrop", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end

if !ConVarExists("sv_buu_magdroplifetime") then
    CreateConVar("sv_buu_magdroplifetime", '10', FCVAR_ARCHIVE + FCVAR_NOTIFY)
end