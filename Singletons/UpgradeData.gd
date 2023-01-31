extends Node

var upgrade_values = {"values": ["rogue_currency"]}

# values in %

var upgrades = {
	"General" : {
		"rof" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 10,
			"price_increase" : 15,
			"type": "subtract",
		},
		"discount" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 25,
			"price_increase" : 20,
			"type": "subtract",
		},
		"damage" : {
			"tiers" : 5,
			"value" : 3,
			"start_price": 30,
			"price_increase" : 25,
			"type": "add",
		},
		"turret_range" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 35,
			"price_increase" : 30,
			"type": "add",
		},
	},
	"Projectile" : { # Gun
		"rof" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 10,
			"price_increase" : 15,
			"type": "subtract",
		},
		"discount" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 25,
			"price_increase" : 20,
			"type": "subtract",
		},
		"damage" : {
			"tiers" : 5,
			"value" : 3,
			"start_price": 30,
			"price_increase" : 25,
			"type": "add",
		},
		"turret_range" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 35,
			"price_increase" : 30,
			"type": "add",
		},
	},
	"Missile" : {
		"rof" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 10,
			"price_increase" : 15,
			"type": "subtract",
		},
		"discount" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 25,
			"price_increase" : 20,
			"type": "subtract",
		},
		"damage" : {
			"tiers" : 5,
			"value" : 3,
			"start_price": 30,
			"price_increase" : 25,
			"type": "add",
		},
		"turret_range" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 35,
			"price_increase" : 30,
			"type": "add",
		},
	},
	"Laser" : {
		"rof" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 10,
			"price_increase" : 15,
			"type": "subtract",
		},
		"discount" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 25,
			"price_increase" : 20,
			"type": "subtract",
		},
		"damage" : {
			"tiers" : 5,
			"value" : 3,
			"start_price": 30,
			"price_increase" : 25,
			"type": "add",
		},
		"turret_range" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 35,
			"price_increase" : 30,
			"type": "add",
		},
	},
	"Flamethrower" : {
		"rof" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 10,
			"price_increase" : 15,
			"type": "subtract",
		},
		"discount" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 25,
			"price_increase" : 20,
			"type": "subtract",
		},
		"damage" : {
			"tiers" : 5,
			"value" : 3,
			"start_price": 30,
			"price_increase" : 25,
			"type": "add",
		},
		"turret_range" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 35,
			"price_increase" : 30,
			"type": "add",
		},
	},
	"AoE" : { #DeadZone
		"rof" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 10,
			"price_increase" : 15,
			"type": "subtract",
		},
		"discount" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 25,
			"price_increase" : 20,
			"type": "subtract",
		},
		"damage" : {
			"tiers" : 5,
			"value" : 3,
			"start_price": 30,
			"price_increase" : 25,
			"type": "add",
		},
		"turret_range" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 35,
			"price_increase" : 30,
			"type": "add",
		},
	},
	"MultiShot" : {
		"rof" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 10,
			"price_increase" : 15,
			"type": "subtract",
		},
		"discount" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 25,
			"price_increase" : 20,
			"type": "subtract",
		},
		"damage" : {
			"tiers" : 5,
			"value" : 3,
			"start_price": 30,
			"price_increase" : 25,
			"type": "add",
		},
		"turret_range" : {
			"tiers" : 5,
			"value" : 5,
			"start_price": 35,
			"price_increase" : 30,
			"type": "add",
		},
	},
	"Special" : {
		"Unlocks" : {
			"GunT1" : {"price": 0, "enabled": true}, "GunT2_1" : {"price": 0, "enabled": true}, "GunT2_2" : {"price": 0, "enabled": true},
			"MissileT1" : {"price": 0, "enabled": true}, "MissileT2_1" : {"price": 0, "enabled": true}, "MissileT2_2" : {"price": 0, "enabled": true},
			"LaserT1" : {"price": 0, "enabled": true},
			"FlamethrowerT1" : {"price": 0, "enabled": true},
			"DeadZoneT1" : {"price": 0, "enabled": true},
			"MultiShotT1" : {"price": 0, "enabled": true}, "MultiShotT2_1" : {"price": 0, "enabled": true}, "MultiShotT3_1" : {"price": 0, "enabled": true}, "MultiShotT3_2" : {"price": 0, "enabled": true}, "MultiShotT3_3" : {"price": 0, "enabled": true},
		},
	},
}
