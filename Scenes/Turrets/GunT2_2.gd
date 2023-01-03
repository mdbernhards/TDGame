extends "res://Scenes/Turrets/GunTurretLogic.gd"

var freeze_power
var freeze_time

func _ready():
	get_node("Turret/MuzzleFlash").visible = false
	freeze_power = GameData.tower_data[type]["freeze_power"]
	freeze_time = GameData.tower_data[type]["freeze_time"]
	
func fire_freeze():
	enemy.apply_freeze(freeze_power, freeze_time)
