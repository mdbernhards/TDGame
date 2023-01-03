extends "res://Scenes/Turrets/MissileTurretLogic.gd"

func shoot_missileT2_2():
	var sprite = get_node("Missile/Sprite")
	var collisonShape = get_node("Missile/CollisionShape2D")
	var missile_on_turret = get_node("Turret/Missile")
	
	sprite.scale = Vector2(1.2, 1.6)
	collisonShape.scale = Vector2(1.2, 1.6)
	shoot_missile(sprite, collisonShape, missile_on_turret, new_missile)
