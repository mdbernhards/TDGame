extends "res://Scenes/Turrets/MissileTurretLogic.gd"
		
func shoot_missileT1():
	var sprite = get_node("Missile/Sprite")
	var collisonShape = get_node("Missile/CollisionShape2D")
	var missile_on_turret = get_node("Turret/Missile")
	shoot_missile(sprite, collisonShape, missile_on_turret, new_missile)
