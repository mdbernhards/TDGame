extends "res://Scenes/Turrets/Turrets.gd"

func _physics_process(delta):
	$Turret.rotate(0.005)
	if enemy:
	 $Turret/Sprite.visible = true
	else:
	 $Turret/Sprite.visible = false

func fire_aoe():
	for array_enemy in enemy_array:
		array_enemy.on_hit(GameData.tower_data[type]["damage"])
