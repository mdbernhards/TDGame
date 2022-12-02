extends Node

var tower_data = {
	"GunT1": {
		"damage": 25,
		"rof": 0.5,
		"range": 250,
		"category": "Projectile",
		"price": 25},
	"GunT2": {
		"damage": 25,
		"rof": 0.8,
		"range": 350,
		"category": "Projectile",
		"price": 50},
	"MissileT1": {
		"damage": 45,
		"rof": 6,
		"range": 550,
		"category": "Missile",
		"price": 40
	}
}

var enemy_data = {
	"BlueTank": {
		"health": 100,
		"speed": 150,
		"money_droped" : 20,
		"base_damage" : 21
	}
}

var wave_data = {
	"Waves": 3,
	"Wave1": {
		"BlueTanks" : 2,
		"Order": {
			"1": {
				"BlueTanks": 2,
				"Offset": 0.2,
			}
		}
	},
	"Wave2": { "BlueTanks" : 5},
	"Wave3": { "BlueTanks" : 10}
}
