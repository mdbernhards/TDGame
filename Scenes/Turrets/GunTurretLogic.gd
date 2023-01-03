extends "res://Scenes/Turrets/Turrets.gd"

func fire_gun():
	var animation_player = get_node("AnimationPlayer")
	enemy.on_hit(GameData.tower_data[type]["damage"])
	if animation_player != null:
		animation_player.play("Fire")
	if type == "GunT2_2":
		fire_freeze()

func fire_freeze():
	pass #check GunT2_2.gd
