Config = {}

Config.Locations = {
    {
        name = "emlak1",
        coords = vector3(-80.74, -802.32, 243.4),
        blipEnabled = true,
        job = "emlak1"
    },
    {
        name = "emlak2",
        coords = vector3(-126.7, -640.92, 169.71),
        blipEnabled = true,
        job = "emlak2"
    },
    {
        name = "emlak3",
        coords = vector3(-1013.111, -419.870, 67.661),
        blipEnabled = true,
        job = "emlak3"
    },
    {
        name = "emlak4",
        coords = vector3(-1556.810, -574.976, 109.411),
        blipEnabled = true,
        job = "emlak4"
    },
    {
        name = "emlak5",
        coords = vector3(394.662, -61.536, 107.958),
        blipEnabled = true,
        job = "emlak5"
    },
    {
        name = "emlak6",
        coords = vector3(-598.873, -719.067, 117.600),
        blipEnabled = true,
        job = "emlak6"
    },
    {
        name = "emlak7",
        coords = vector3(-1006.392, -750.414, 66.489),
        blipEnabled = true,
        job = "emlak7"
    },
    -- {
    --     name = "emlak8",
    --     coords = vector3(-585.33, -337.08, 35.23),
    --     blipEnabled = false,
    --     job = "emlak8"
    -- }
}


Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true					-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.ThirdEyeName = 'qb-target' 			-- Name of third eye aplication
Config.Use3DText = true                        -- Use 3D text to interact
Config.NHMenu = false						-- Use NH-Context [https://github.com/nighmares/nh-context]
Config.QBMenu = true						-- Use QB-Menu (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-input]
Config.OXLib = false						-- Use the OX_lib (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib] !! must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!
Config.ElevatorWaitTime = 1					-- How many seconds until the player arrives at their floor

Config.Notify = {
	enabled = true,							-- Display hint notification?
	distance = 3.0,							-- Distance from elevator that the hint will show
	message = "Kullanılacak asansörü hedefleyin"	-- Text of the hint notification
}

Config.Elevators = {
	Mafia1 = {	
		{
			coords = vector3(-812.32, -684.09, 123.42), heading = 0.0, level = "2 Kat", label = "2.nci kat",
		},
		{ 																											--	Use this as example and make your elevatores
			coords = vector3(-812.82, -693.08, 28.06), heading = 0.0, level = "1 Kat", label = "1.nci kat",
		},
	},

	Mafia2 = {	
		{
			coords = vector3(-78.85, -832.97, 243.39), heading = 0.0, level = "2 Kat", label = "2.nci kat",
		},
		{ 																											--	Use this as example and make your elevatores
			coords = vector3(-68.80, -801.61, 44.23), heading = 0.0, level = "1 Kat", label = "1.nci kat",
		},
	},


    Mafia3 = {	
	    {
		    coords = vector3(-1399.30, -480.24, 72.04), heading = 0.0, level = "2 Kat", label = "2.nci kat",
 	    },
	    { 																											--	Use this as example and make your elevatores
		    coords = vector3(-1377.99, -499.75, 33.16), heading = 0.0, level = "1 Kat", label = "1.nci kat",
	    },
	},	

	Mafia4 = {	
		{
		    coords = vector3(-1570.35, -576.35, 114.45), heading = 0.0, level = "3 Kat", label = "Çatı kat",
 	    },
	    {
		    coords = vector3(-1582.80, -559.00, 108.52), heading = 0.0, level = "2 Kat", label = "2.nci kat",
 	    },
	    { 																											--	Use this as example and make your elevatores
		    coords = vector3(-1581.68, -557.87, 34.95), heading = 0.0, level = "1 Kat", label = "1.nci kat",
	    },
	},
	
	Mafia5 = {	
		{ 																											--	Use this as example and make your elevatores
		    coords = vector3(-581.56, -716.11, 129.89), heading = 0.0, level = "3 Kat", label = "Catı Katı",
	    },
	    {
		    coords = vector3(-577.99, -714.51, 113.01), heading = 0.0, level = "2 Kat", label = "2.nci kat",
 	    },
	    { 																											--	Use this as example and make your elevatores
		    coords = vector3(-589.60, -706.74, 36.28), heading = 0.0, level = "1 Kat", label = "1.nci kat",
	    },
	},
	
	Mafia6 = {	
		{ 																											--	Use this as example and make your elevatores
		    coords = vector3(-1024.74, -433.72, 77.37), heading = 0.0, level = "3 Kat", label = "Catı Katı",
	    },
	    {
		    coords = vector3(-1029.79, -434.12, 63.86), heading = 0.0, level = "2 Kat", label = "2.nci kat",
 	    },
	    { 																											--	Use this as example and make your elevatores
		    coords = vector3(-1033.22, -420.77, 39.62), heading = 0.0, level = "1 Kat", label = "1.nci kat",
	    },
	},

	Mafia7 = {	
		{ 																											--	Use this as example and make your elevatores
		    coords = vector3(383.74, -51.85, 122.54), heading = 0.0, level = "3 Kat", label = "Catı Katı",
	    },
	    {
		    coords = vector3(373.23, -58.28, 103.36), heading = 0.0, level = "2 Kat", label = "2.nci kat",
 	    },
	    { 																											--	Use this as example and make your elevatores
		    coords = vector3(389.07, -75.60, 68.18), heading = 0.0, level = "1 Kat", label = "1.nci kat",
	    },
	},

	Mafia8 = {	
	    {
		    coords = vector3(-141.14, -614.36, 168.82), heading = 0.0, level = "2 Kat", label = "2.nci kat",
 	    },
	    { 																											--	Use this as example and make your elevatores
		    coords = vector3(-115.42, -603.73, 36.28), heading = 0.0, level = "1 Kat", label = "1.nci kat",
	    },
	},

	Mafia9 = {	
		{
		    coords = vector3(-1000.9647827148, -751.70654296875, 76.536834716797), heading = 0.0, level = "3 Kat", label = "Çatı kat",
 	    },
	    {
		    coords = vector3(-1003.2376708984, -774.20581054688, 61.894390106201), heading = 0.0, level = "2 Kat", label = "2.nci kat",
 	    },
	    { 																											--	Use this as example and make your elevatores
		    coords = vector3(-1038.8078613281, -756.29974365234, 19.839488983154), heading = 0.0, level = "1 Kat", label = "1.nci kat",
	    },
	},


}
