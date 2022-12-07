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
		"damage": 45,
		"rof": 1.5,
		"range": 550,
		"category": "Missile",
		"price": 40,
		"missile_speed": 300,
		"smart": false},
	"MissileT2": {
		"damage": 65,
		"rof": 1.1,
		"range": 660,
		"category": "Missile",
		"price": 200,
		"missile_speed": 400,
		"smart": true},
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

var wave_data = {
	"Waves": 3,
	"Wave1": {
		"EnemyCount": 2,
		"BlueTanks": 2,
		"Order": {
			"1": {
				"BlueTanks": 2,
				"Offset": 0.2,
			}
		}
	},
	"Wave2": { "EnemyCount": 5, "BlueTanks": 5, "GreenTanks": 0, "RedTanks": 0, "BlackTanks": 0},
	"Wave3": { "EnemyCount": 10, "BlueTanks": 10, "GreenTanks": 0, "RedTanks": 0, "BlackTanks": 0},
	"Wave4": { "EnemyCount": 18, "BlueTanks": 12, "GreenTanks": 6, "RedTanks": 0, "BlackTanks": 0},
	"Wave5": { "EnemyCount": 27, "BlueTanks": 13, "GreenTanks": 10, "RedTanks": 3, "BlackTanks": 1},
	"Wave6": { "EnemyCount": 33, "BlueTanks": 14, "GreenTanks": 11, "RedTanks": 5, "BlackTanks": 3},
}
