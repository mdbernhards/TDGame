extends "res://Scenes/Turrets/Turrets.gd"

func _physics_process(delta):
	if enemy:
		$Turret/MuzzleFire.visible = true
	else:
		$Turret/MuzzleFire.visible = false
