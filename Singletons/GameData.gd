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

var enemies = {"Enemies": ["BlueTank", "GreenTank", "RedTank", "BlackTank"]}

var wave_data = {
	"Waves": 6,
	"Wave1": {
		"EnemyCount": 2,
		"BlueTank": 2,
		"Orders": 1,
		"Order": {
			"1": {
				"BlueTank": 2,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.4,
			},}},
	"Wave2": { 
		"EnemyCount": 5, 
		"BlueTank": 5,
		"GreenTank": 0, 
		"RedTank": 0, 
		"BlackTank": 0,
		"Orders": 2,
		"Order": {
			"1": {
				"BlueTank": 2,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.4,
			},
			"2": {
				"BlueTank": 3,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.3,
			},}},
	"Wave3": { 
		"EnemyCount": 10, 
		"BlueTank": 10, 
		"GreenTank": 0, 
		"RedTank": 0, 
		"BlackTank": 0,
		"Orders": 2,
		"Order": {
			"1": {
				"BlueTank": 4,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.38,
			},
			"2": {
				"BlueTank": 6,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.28,
			},}},
	"Wave4": { 
		"EnemyCount": 18, 
		"BlueTank": 12, 
		"GreenTank": 6, 
		"RedTank": 0, 
		"BlackTank": 0,
		"Orders": 3,
		"Order": {
			"1": {
				"BlueTank": 4,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.45,
			},
			"2": {
				"BlueTank": 4,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.4,
			},
			"3": {
				"BlueTank": 4,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.32,
			},}},
	"Wave5": { 
		"EnemyCount": 29, 
		"BlueTank": 16, 
		"GreenTank": 10, 
		"RedTank": 3, 
		"BlackTank": 0,
		"Orders": 4,
		"Order": {
			"1": {
				"BlueTank": 3,
				"GreenTank": 5,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.45,
			},
			"2": {
				"BlueTank": 7,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.2,
			},
			"3": {
				"BlueTank": 2,
				"GreenTank": 2,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.17,
			},
			"4": {
				"BlueTank": 4,
				"GreenTank": 3,
				"RedTank": 3,
				"BlackTank": 0,
				"Offset": 0.15,
			},}},
	"Wave6": { 
		"EnemyCount": 54, 
		"BlueTank": 10, 
		"GreenTank": 24, 
		"RedTank": 10, 
		"BlackTank": 10,
		"Orders": 4,
		"Order": {
			"1": {
				"BlueTank": 10,
				"GreenTank": 6,
				"RedTank": 0,
				"BlackTank": 0,
				"Offset": 0.32,
			},
			"2": {
				"BlueTank": 0,
				"GreenTank": 8,
				"RedTank": 4,
				"BlackTank": 0,
				"Offset": 0.32,
			},
			"3": {
				"BlueTank": 0,
				"GreenTank": 10,
				"RedTank": 6,
				"BlackTank": 0,
				"Offset": 0.2,
			},
			"4": {
				"BlueTank": 0,
				"GreenTank": 0,
				"RedTank": 0,
				"BlackTank": 10,
				"Offset": 0.5,
			},}},}
