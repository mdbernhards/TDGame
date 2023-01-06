extends "res://Scenes/Turrets/FlamethrowerTurretLogic.gd"

func _physics_process(delta):
	if enemy:
		$Turret/MuzzleFire.visible = true
	else:
		$Turret/MuzzleFire.visible = false
