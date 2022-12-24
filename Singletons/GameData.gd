extends Node

var tower_data = {
	"GunT1": {
		"damage": 25,
		"rof": 1,
		"range": 250,
		"category": "Projectile",
		"price": 25},
	"GunT2": {
		"damage": 35,
		"rof": 0.5,
		"range": 350,
		"category": "Projectile",
		"price": 65},
	"MissileT1": {
		"damage": 50,
		"rof": 2,
		"range": 450,
		"category": "Missile",
		"price": 40,
		"missile_speed": 300,
		"steer_force": 0.0,
		"smart": false},
	"MissileT2_1": {
		"damage": 55,
		"rof": 1,
		"range": 700,
		"category": "Missile",
		"price": 100,
		"missile_speed": 400,
		"steer_force": 3.0,
		"smart": true},
	"MissileT2_2": {
		"damage": 150,
		"rof": 2,
		"range": 500,
		"category": "Missile",
		"price": 120,
		"missile_speed": 350,
		"steer_force": 5.0,
		"smart": true},
	"LaserT1": {
		"damage": 0.3,
		"rof": 0,
		"range": 700,
		"category": "Laser",
		"price": 200},
	"FlamethrowerT1": {
		"damage": 10,
		"rof": 0.23,
		"range": 850,
		"category": "Flamethrower",
		"price": 0,
		"flame_speed": 400},
}

var enemy_data = {
	"BlueTank": {
		"health": 100,
		"speed": 150,
		"money_droped": 20,
		"base_damage": 21,
	},
	"GreenTank": {
		"health": 60,
		"speed": 300,
		"money_droped": 15,
		"base_damage": 17,
	},
	"RedTank": {
		"health": 300,
		"speed": 120,
		"money_droped": 30,
		"base_damage": 26,
	},
	"BlackTank": {
		"health": 600,
		"speed": 70,
		"money_droped": 50,
		"base_damage": 34,
	},
}

var turretsT1 = {"Turrets": ["GunT1", "MissileT1", "LaserT1", "FlamethrowerT1"]}
var turretUpgrades = {"Turrets": ["GunT2", "MissileT2_1", "MissileT2_2"]}

var enemies = {"Enemies": ["BlueTank", "GreenTank", "RedTank", "BlackTank"]}

var wave_data = {
	"Waves": 7,
	"Wave1": {
		"EnemyCount": 2,
		"Orders": 1,
		"Order": {
			"1": {
				"BlueTank": 2,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.4,
				"Path": "Path1",
			},}},
	"Wave2": { 
		"EnemyCount": 5,
		"Orders": 2,
		"Order": {
			"1": {
				"BlueTank": 2,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.4,
				"Path": "Path2",
			},
			"2": {
				"BlueTank": 3,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.3,
				"Path": "Path2",
			},}},
	"Wave3": { 
		"EnemyCount": 10,
		"Orders": 2,
		"Order": {
			"1": {
				"BlueTank": 4,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.38,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 6,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.28,
				"Path": "Path2",
			},}},
	"Wave4": { 
		"EnemyCount": 18,
		"Orders": 3,
		"Order": {
			"1": {
				"BlueTank": 4,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.45,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 4,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.4,
				"Path": "Path2",
			},
			"3": {
				"BlueTank": 4,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.32,
				"Path": "Path2",
			},}},
	"Wave5": { 
		"EnemyCount": 29,
		"Orders": 4,
		"Order": {
			"1": {
				"BlueTank": 3,
				"GreenTank": 5,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.45,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 7,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.2,
				"Path": "Path1",
			},
			"3": {
				"BlueTank": 2,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.17,
				"Path": "Path2",
			},
			"4": {
				"BlueTank": 4,
				"GreenTank": 3,
				"RedTank": 3,
				"BlackTank": 0,
				"Offset": 0.15,
				"Path": "Path2",
			},}},
	"Wave6": { 
		"EnemyCount": 54,
		"Orders": 4,
		"Order": {
			"1": {
				"BlueTank": 10,
				"GreenTank": 6,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 0,
				"GreenTank": 8,
				"RedTank": 4,
				"BlackTank": 0,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"3": {
				"BlueTank": 0,
				"GreenTank": 10,
				"RedTank": 6,
				"BlackTank": 0,
				"Offset": 0.2,
				"Path": "Path1",
			},
			"4": {
				"BlueTank": 0,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 10,
				"Offset": 0.5,
				"Path": "Path1",
			},}},
	"Wave7": { 
		"EnemyCount": 80,
		"Orders": 4,
		"Order": {
			"1": {
				"BlueTank": 0,
				"GreenTank": 20,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"2": {
				"BlueTank": 0,
				"GreenTank": 0,
				"RedTank": 20,
				"BlackTank": 1,
				"Offset": 0.32,
				"Path": "Path1",
			},
			"3": {
				"BlueTank": 0,
				"GreenTank": 10,
				"RedTank": 6,
				"BlackTank": 3,
				"Offset": 0.2,
				"Path": "Path1",
			},
			"4": {
				"BlueTank": 0,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 20,
				"Offset": 0.4,
				"Path": "Path1",
			},}},}

var Maps = {
	"Stages": ["1", "2", "3", "4"],
	"1": ["1", "2"],
	"2": [],
	"3": [],
	"4": []}
