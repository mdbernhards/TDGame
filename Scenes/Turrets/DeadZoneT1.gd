extends "res://Scenes/Turrets/Turrets.gd"
	
func fire_aoe():
	for array_enemy in enemy_array:
		array_enemy.on_hit(GameData.tower_data[type]["damage"])
