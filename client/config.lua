Config = {}

-- 'bone' use bonetag https://pastebin.com/D7JMnX1g
-- x,y,z are offsets

Config.WeaponCategoryOffsets = {
	{category = 'handguns', bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0},
	{category = 'utilityhandgun', bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0},
	{category = 'smallmelee', bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
	{category = 'bigmelee', bone = 24818, x = 0.25, y = -0.2, z = -0.2, xRot = -10.0, yRot = -45.0, zRot = 0.0},
	{category = 'utilitymelee', bone = 58271, x = 0.1, y = 0.1,  z = -0.15, xRot = -90.0,  yRot = 0.90, zRot = 90.0},
	{category = 'machine', bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 10.0, yRot = 160.0, zRot = 10.0},
	{category = 'assault', bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 10.0, yRot = 160.0, zRot = 10.0},
	{category = 'shotgun', bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 10.0, yRot = 160.0, zRot = 10.0},
	{category = 'sniper', bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 10.0, yRot = 160.0, zRot = 10.0},
	{category = 'heavy', bone = 24818, x = 0.09, y = -0.15, z = 0.1, xRot = 10.0, yRot = 160.0, zRot = 10.0},
	
	-- QUEDAN POR HACER:
	-- • Rifles tácticos, por delante del chaleco.
	{category = 'tacticalrifle', bone = 24818, x = 0.01, y = 0.22, z = 0.1, xRot = 20.0, yRot = 150.0, zRot = 10.0},
	-- • Pistolas detrás.
	{category = 'backhandgun', bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0},
	-- • Pistolas en la cadena
	{category = 'leghandgun', bone = 51826, x = 0.175, y = 0.02, z = 0.134,  xRot = -100.0, yRot = -0.0,  zRot = -13.0}
}

Config.RealWeapons = {

	{name = 'WEAPON_KNIFE', 			category = 'smallmelee', 	model = 'prop_w_me_knife_01'},
	{name = 'WEAPON_NIGHTSTICK', 		category = 'utilitymelee', 	model = 'w_me_nightstick'},
	{name = 'WEAPON_HAMMER', 			category = 'utilitymelee',	model = 'prop_tool_hammer'},
	{name = 'WEAPON_BAT', 				category = 'bigmelee', 		model = 'w_me_bat'},
	{name = 'WEAPON_GOLFCLUB', 			category = 'bigmelee', 		model = 'w_me_gclub'},
	{name = 'WEAPON_CROWBAR', 			category = 'utilitymelee', 	model = 'w_me_crowbar'},
	{name = 'WEAPON_BOTTLE', 			category = 'smallmelee', 	model = 'prop_w_me_bottle'},
	--{name = 'WEAPON_KNUCKLE', 		category = 'melee', 		model = 'prop_w_me_dagger'},
	{name = 'WEAPON_HATCHET', 			category = 'bigmelee', 		model = 'w_me_hatchet'},
	{name = 'WEAPON_BATTLEAXE', 		category = 'smallmelee', 	model = 'w_me_battleaxe'},
	{name = 'WEAPON_STONE_HATCHET', 	category = 'smallmelee', 	model = 'w_me_stonehatchet'},
	{name = 'WEAPON_MACHETE', 			category = 'smallmelee', 	model = 'prop_ld_w_me_machette'},
	--{name = 'WEAPON_SWITCHBLADE', 	category = 'melee', 		model = 'w_me_switchblade'},
	{name = 'WEAPON_FLASHLIGHT', 		category = 'utilitymelee', 	model = 'w_me_flashlight'},

	{name = 'WEAPON_PISTOL', 			category = 'handguns', 		model = 'w_pi_pistol'},
	{name = 'WEAPON_COMBATPISTOL', 		category = 'handguns', 		model = 'w_pi_combatpistol'},
	{name = 'WEAPON_APPISTOL', 			category = 'handguns', 		model = 'w_pi_appistol'},
	{name = 'WEAPON_PISTOL50', 			category = 'handguns', 		model = 'w_pi_pistol50'},
	{name = 'WEAPON_VINTAGEPISTOL', 	category = 'handguns', 		model = 'w_pi_vintage_pistol'},
	{name = 'WEAPON_HEAVYPISTOL', 		category = 'handguns', 		model = 'w_pi_heavypistol'},
	{name = 'WEAPON_SNSPISTOL', 		category = 'handguns', 		model = 'w_pi_sns_pistol'},
	{name = 'WEAPON_FLAREGUN', 			category = 'utilityhandgun',model = 'w_pi_flaregun'},
	{name = 'WEAPON_MARKSMANPISTOL', 	category = 'handguns', 		model = 'w_pi_singleshot'},
	{name = 'WEAPON_REVOLVER', 			category = 'handguns', 		model = 'w_pi_revolver'},
	{name = 'WEAPON_STUNGUN', 			category = 'utilityhandgun',model = 'w_pi_stungun'},
	{name = 'WEAPON_DOUBLEACTION', 		category = 'handguns', 		model = 'w_pi_wep1_gun'},

	{name = 'WEAPON_MICROSMG', 			category = 'machine', 	model = 'w_sb_microsmg'},
	{name = 'WEAPON_SMG', 				category = 'machine', 	model = 'w_sb_smg'},
	{name = 'WEAPON_MG', 				category = 'machine', 	model = 'w_mg_mg'},
	{name = 'WEAPON_COMBATMG', 			category = 'machine', 	model = 'w_mg_combatmg'},
	{name = 'WEAPON_GUSENBERG', 		category = 'machine', 	model = 'w_sb_gusenberg'},
	{name = 'WEAPON_COMBATPDW', 		category = 'machine', 	model = 'w_sb_pdw'},
	{name = 'WEAPON_MACHINEPISTOL', 	category = 'machine', 	model = 'w_sb_compactsmg'},
	{name = 'WEAPON_ASSAULTSMG', 		category = 'machine', 	model = 'w_sb_assaultsmg'},
	{name = 'WEAPON_MINISMG', 			category = 'machine', 	model = 'w_sb_minismg'},

	{name = 'WEAPON_ASSAULTRIFLE', 		category = 'assault', 	model = 'w_ar_assaultrifle'}, 
	{name = 'WEAPON_CARBINERIFLE', 		category = 'assault', 	model = 'w_ar_carbinerifle'},
	{name = 'WEAPON_ADVANCEDRIFLE', 	category = 'assault', 	model = 'w_ar_advancedrifle'},
	{name = 'WEAPON_SPECIALCARBINE', 	category = 'assault', 	model = 'w_ar_specialcarbine'},
	{name = 'WEAPON_BULLPUPRIFLE', 		category = 'assault', 	model = 'w_ar_bullpuprifle'},
	{name = 'WEAPON_COMPACTRIFLE', 		category = 'assault', 	model = 'w_ar_assaultrifle_smg'},

	{name = 'WEAPON_PUMPSHOTGUN', 		category = 'shotgun', 	model = 'w_sg_pumpshotgun'},
	{name = 'WEAPON_SAWNOFFSHOTGUN', 	category = 'shotgun', 	model = 'w_sg_sawnoff'},
	{name = 'WEAPON_BULLPUPSHOTGUN', 	category = 'shotgun', 	model = 'w_sg_bullpupshotgun'},
	{name = 'WEAPON_ASSAULTSHOTGUN', 	category = 'shotgun', 	model = 'w_sg_assaultshotgun'},
	{name = 'WEAPON_MUSKET', 			category = 'shotgun', 	model = 'w_ar_musket'},
	{name = 'WEAPON_HEAVYSHOTGUN', 		category = 'shotgun', 	model = 'w_sg_heavyshotgun'},
	{name = 'WEAPON_DBSHOTGUN', 		category = 'shotgun', 	model = 'w_sg_doublebarrel'},
	{name = 'WEAPON_AUTOSHOTGUN', 		category = 'shotgun', 	model = 'w_sg_sweeper'},

	{name = 'WEAPON_SNIPERRIFLE', 		category = 'sniper', 	model = 'w_sr_sniperrifle'},
	{name = 'WEAPON_HEAVYSNIPER', 		category = 'sniper', 	model = 'w_sr_heavysniper'},
	{name = 'WEAPON_MARKSMANRIFLE', 	category = 'sniper', 	model = 'w_sr_marksmanrifle'},

	--{name = 'WEAPON_REMOTESNIPER', 		category = 'none', 		model = ''},
	--{name = 'WEAPON_STINGER', 			category = 'none', 		model = ''},

	--{name = 'WEAPON_GRENADELAUNCHER', 	category = 'heavy', 		model = 'w_lr_grenadelauncher'},
	--{name = 'WEAPON_RPG', 				category = 'heavy', 		model = 'w_lr_rpg'},
	--{name = 'WEAPON_MINIGUN', 			category = 'heavy', 		model = 'w_mg_minigun'},
	--{name = 'WEAPON_FIREWORK', 			category = 'heavy', 		model = 'w_lr_firework'},
	--{name = 'WEAPON_RAILGUN', 			category = 'heavy', 		model = 'w_ar_railgun'},
	--{name = 'WEAPON_HOMINGLAUNCHER', 	category = 'heavy', 		model = 'w_lr_homing'},
	--{name = 'WEAPON_COMPACTLAUNCHER', 	category = 'heavy', 		model = ''},

	--{name = 'WEAPON_STICKYBOMB', 		category = 'thrown', 	model = 'prop_bomb_01_s'},
	--{name = 'WEAPON_MOLOTOV', 			category = 'thrown', 	model = 'w_ex_molotov'},
	--{name = 'WEAPON_FIREEXTINGUISHER', 	category = 'thrown', 	model = 'w_am_fire_exting'},
	--{name = 'WEAPON_PETROLCAN', 		category = 'thrown', 	model = 'w_am_jerrycan'},
	--{name = 'WEAPON_PROXMINE', 			category = 'thrown', 	model = ''},
	--{name = 'WEAPON_SNOWBALL', 			category = 'thrown', 	model = 'w_ex_snowball'},
	--{name = 'WEAPON_BALL', 				category = 'thrown', 	model = 'w_am_baseball'},
	--{name = 'WEAPON_GRENADE', 			category = 'thrown', 	model = 'w_ex_grenadefrag'},
	--{name = 'WEAPON_SMOKEGRENADE', 		category = 'thrown', 	model = 'w_ex_grenadesmoke'},
	--{name = 'WEAPON_BZGAS', 			category = 'thrown', 	model = 'w_ex_grenadesmoke'},

	--{name = 'WEAPON_DIGISCANNER', 		category = 'others', 	model = 'w_am_digiscanner'},
	--{name = 'WEAPON_DAGGER', 			category = 'others', 	model = 'prop_w_me_dagger'},
	--{name = 'WEAPON_GARBAGEBAG', 		category = 'others', 	model = ''},
	--{name = 'WEAPON_HANDCUFFS', 		category = 'others', 	model = ''},
	--{name = 'WEAPON_BATTLEAXE', 		category = 'others', 	model = 'prop_tool_fireaxe'},
	--{name = 'WEAPON_PIPEBOMB', 			category = 'others', 	model = ''},
	--{name = 'WEAPON_POOLCUE', 			category = 'others', 	model = 'prop_pool_cue'},
	--{name = 'WEAPON_WRENCH', 			category = 'others', 	model = 'w_me_hammer'},
	--{name = 'GADGET_NIGHTVISION', 		category = 'others', 	model = ''},
	--{name = 'GADGET_PARACHUTE', 		bone = 24818, x = 0.05, y = -0.15, z = 0.02, xRot = 180.0, yRot = 90.0, zRot = 0.0, category = 'others', 	model = 'p_parachute_s'},

	{name = 'WEAPON_PISTOL_MK2', 		category = 'handguns', 		model = 'w_pi_pistolmk2'},
	{name = 'WEAPON_SNSPISTOL_MK2', 	category = 'handguns', 		model = 'w_pi_sns_pistolmk2'},
	{name = 'WEAPON_REVOLVER_MK2', 		category = 'handguns', 		model = 'w_pi_revolvermk2'},
	{name = 'WEAPON_SMG_MK2', 			category = 'machine', 		model = 'w_sb_smgmk2'},
	{name = 'WEAPON_PUMPSHOTGUN_MK2', 	category = 'shotgun', 		model = 'w_sg_pumpshotgunmk2'},
	{name = 'WEAPON_ASSAULTRIFLE_MK2', 	category = 'assault', 		model = 'w_ar_assaultriflemk2'},
	{name = 'WEAPON_CARBINERIFLE_MK2', 	category = 'assault', 		model = 'w_ar_carbineriflemk2'},
	{name = 'WEAPON_SPECIALCARBINE_MK2',category = 'assault', 		model = 'w_ar_specialcarbinemk2'},
	{name = 'WEAPON_BULLPUPRIFLE_MK2', 	category = 'assault', 		model = 'w_ar_bullpupriflemk2'},
	{name = 'WEAPON_COMBATMG_MK2', 		category = 'machine', 		model = 'w_mg_combatmgmk2'},
	{name = 'WEAPON_HEAVYSNIPER_MK2', 	category = 'sniper', 		model = 'w_sr_heavysnipermk2'},
	{name = 'WEAPON_MARKSMANRIFLE_MK2', category = 'sniper', 		model = 'w_sr_marksmanriflemk2'}
}


