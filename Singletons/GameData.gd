extends Node

var tower_data = {
	"GunT1": {
		"damage": 34,
		"rof": 0.9,
		"range": 250,
		"category": "Projectile",
		"price": 40},
	"GunT2_1": {
		"damage": 45,
		"rof": 0.45,
		"range": 400,
		"category": "Projectile",
		"price": 100},
	"GunT2_2": {
		"damage": 20,
		"rof": 1,
		"range": 500,
		"category": "Projectile",
		"price": 120,
		"freeze_power": 0.7,
		"freeze_time": 5},
	"MissileT1": {
		"damage": 75,
		"rof": 2,
		"range": 4500,
		"category": "Missile",
		"price": 10,
		"missile_speed": 300,
		"steer_force": 10.0},
	"MissileT2_1": {
		"damage": 95,
		"rof": 1,
		"range": 550,
		"category": "Missile",
		"price": 150,
		"missile_speed": 400,
		"steer_force": 3.0},
	"MissileT2_2": {
		"damage": 200,
		"rof": 2.5,
		"range": 600,
		"category": "Missile",
		"price": 200,
		"missile_speed": 450,
		"steer_force": 8.0},
	"LaserT1": {
		"damage": 0.7,
		"rof": 0,
		"range": 700,
		"category": "Laser",
		"price": 400},
	"FlamethrowerT1": {
		"damage": 20,
		"rof": 0.23,
		"range": 850,
		"category": "Flamethrower",
		"price": 560,
		"flame_speed": 400,
		"burning_damage": 5,
		"burning_time": 10,
		"burn_cooldown": 1},
	"DeadZoneT1": {
		"damage": 20,
		"rof": 1.3,
		"range": 400,
		"category": "AoE",
		"price": 450},
	"MultiShotT1": {
		"damage": 50,
		"rof": 0.3,
		"range": 350,
		"category": "MultiShot",
		"shot_speed": 3,
		"price": 0},
	"MultiShotT2_1": {
		"damage": 65,
		"rof": 0.35,
		"range": 350,
		"category": "MultiShot",
		"shot_speed": 3,
		"steer_force": 0,
		"price": 0},
	"MultiShotT3_1": {
		"damage": 75,
		"rof": 0.5,
		"range": 450,
		"category": "MultiShot",
		"shot_speed": 2.5,
		"steer_force": 10.0,
		"price": 0},
	"MultiShotT3_2": {
		"damage": 75,
		"rof": 0.5,
		"range": 450,
		"category": "MultiShot",
		"shot_speed": 2.5,
		"steer_force": 10.0,
		"price": 0},
	"MultiShotT3_3": {
		"damage": 75,
		"rof": 0.5,
		"range": 450,
		"category": "MultiShot",
		"shot_speed": 2.5,
		"steer_force": 10.0,
		"price": 0},
}

var enemy_data = {
	"BlueTank": {
		"health": 100,
		"speed": 150,
		"money_droped": 10,
		"base_damage": 21,
	},
	"SandTank": {
		"health": 130,
		"speed": 160,
		"money_droped": 20,
		"base_damage": 24,
	},
	"GreenTank": {
		"health": 60,
		"speed": 300,
		"money_droped": 5,
		"base_damage": 17,
	},
	"RedTank": {
		"health": 300,
		"speed": 120,
		"money_droped": 15,
		"base_damage": 26,
	},
	"BlackTank": {
		"health": 800,
		"speed": 80,
		"money_droped": 18,
		"base_damage": 34,
	},
	"BigRedTank": {
		"health": 1500,
		"speed": 65,
		"money_droped": 25,
		"base_damage": 34,
	},
	"HugeRedTank": {
		"health": 4000,
		"speed": 60,
		"money_droped": 35,
		"base_damage": 34,
	},
}

var turretsT1 = {"Turrets": ["GunT1", "MissileT1", "LaserT1", "FlamethrowerT1", "DeadZoneT1", "MultiShotT1"]}
var turretUpgrades = {"Turrets": ["GunT2_1", "GunT2_2", "MissileT2_1", "MissileT2_2", "MultiShotT2_1", "MultiShotT3_1", "MultiShotT3_2", "MultiShotT3_3"]}

var enemies = {"Enemies": ["BlueTank", "GreenTank", "RedTank", "BlackTank", "SandTank", "BigRedTank", "HugeRedTank"]}

var wave_data = {
	"Waves": 10,
	"Wave1": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlueTank": 5,
				"Offset": 0.5,
				"Path": "Path1",
			},}},
	"Wave2": {
		"Orders": 2,
		"Order": {
			"1": {
				"BlueTank": 5,
				"Offset": 0.45,
				"Path": "Path2",
			},
			"2": {
				"BlueTank": 5,
				"SandTank": 2,
				"Offset": 0.4,
				"Path": "Path2",
			},}},
	"Wave3": {
		"Orders": 2,
		"Order": {
			"1": {
				"BlueTank": 6,
				"Offset": 0.38,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 8,
				"Offset": 0.28,
				"Path": "Path2",
			},}},
	"Wave4": {
		"Orders": 3,
		"Order": {
			"1": {
				"BlueTank": 5,
				"GreenTank": 4,
				"Offset": 0.45,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 6,
				"GreenTank": 4,
				"Offset": 0.4,
				"Path": "Path2",
			},
			"3": {
				"BlueTank": 7,
				"GreenTank": 5,
				"Offset": 0.32,
				"Path": "Path2",
			},}},
	"Wave5": {
		"Orders": 4,
		"Order": {
			"1": {
				"BlueTank": 7,
				"GreenTank": 6,
				"Offset": 0.45,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 17,
				"Offset": 0.25,
				"Path": "Path1",
			},
			"3": {
				"BlueTank": 4,
				"GreenTank": 12,
				"Offset": 0.25,
				"Path": "Path2",
			},
			"4": {
				"BlueTank": 6,
				"GreenTank": 3,
				"RedTank": 7,
				"Offset": 0.15,
				"Path": "Path2",
			},}},
	"Wave6": {
		"Orders": 4,
		"Order": {
			"1": {
				"BlueTank": 12,
				"GreenTank": 8,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 0,
				"GreenTank": 12,
				"RedTank": 8,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"3": {
				"BlueTank": 0,
				"GreenTank": 14,
				"RedTank": 10,
				"Offset": 0.2,
				"Path": "Path1",
			},
			"4": {
				"BlackTank": 15,
				"Offset": 0.5,
				"Path": "Path1",
			},}},
	"Wave7": {
		"Orders": 4,
		"Order": {
			"1": {
				"GreenTank": 24,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"2": {
				"RedTank": 24,
				"BlackTank": 5,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"3": {
				"GreenTank": 12,
				"RedTank": 10,
				"BlackTank": 10,
				"Offset": 0.25,
				"Path": "Path1",
			},
			"4": {
				"BlackTank": 25,
				"BigRedTank": 4,
				"HugeRedTank": 3,
				"Offset": 0.5,
				"Path": "Path2",
			},}},
	"Wave8": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 25,
				"BigRedTank": 5,
				"HugeRedTank": 5,
				"Offset": 0.4,
				"Path": "Path1",
			},}},
	"Wave9": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 30,
				"BigRedTank": 8,
				"HugeRedTank": 6,
				"Offset": 0.3,
				"Path": "Path2",
			},}},
	"Wave10": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 35,
				"BigRedTank": 10,
				"HugeRedTank": 15,
				"Offset": 0.2,
				"Path": "Path1",
			},}},
	"Wave11": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 33,
				"BigRedTank": 9,
				"HugeRedTank": 17,
				"Offset": 0.19,
				"Path": "Path1",
			},}},
	"Wave12": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 30,
				"BigRedTank": 8,
				"HugeRedTank": 20,
				"Offset": 0.175,
				"Path": "Path1",
			},}},
	"Wave13": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 29,
				"BigRedTank": 12,
				"HugeRedTank": 22,
				"Offset": 0.17,
				"Path": "Path1",
			},}},
	"Wave14": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 20,
				"BigRedTank": 5,
				"HugeRedTank": 30,
				"Offset": 0.16,
				"Path": "Path1",
			},}},
	"Wave15": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlackTank": 10,
				"BigRedTank": 10,
				"HugeRedTank": 35,
				"Offset": 0.15,
				"Path": "Path1",
			},}},
	"Wave16": {
		"Orders": 1,
		"Order": {
			"1": {
				"BigRedTank": 15,
				"HugeRedTank": 45,
				"Offset": 0.14,
				"Path": "Path1",
			},}},
	"Wave17": {
		"Orders": 1,
		"Order": {
			"1": {
				"BigRedTank": 20,
				"HugeRedTank": 50,
				"Offset": 0.13,
				"Path": "Path1",
			},}},
	"Wave18": {
		"Orders": 1,
		"Order": {
			"1": {
				"HugeRedTank": 70,
				"Offset": 0.12,
				"Path": "Path1",
			},}},
	"Wave19": {
		"Orders": 1,
		"Order": {
			"1": {
				"HugeRedTank": 100,
				"Offset": 0.11,
				"Path": "Path1",
			},}},
	"Wave20": {
		"Orders": 1,
		"Order": {
			"1": {
				"BlueTank": 50,
				"GreenTank": 50,
				"RedTank": 50,
				"BlackTank": 50,
				"SandTank": 50,
				"BigRedTank": 50,
				"HugeRedTank": 50,
				"Offset": 0.1,
				"Path": "Path2",
			},}},}

var Maps = {
	"Stages": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
	"1": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
	"2": ["1", "2", "3", "4", "5", "6", "7"],
	"3": ["1"],
	"4": [],
	"5": [],
	"6": [],
	"7": [],
	"8": [],
	"9": [],
	"10": [],
	"11": [],
	"12": []}
