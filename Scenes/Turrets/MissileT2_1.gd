extends "res://Scenes/Turrets/Turrets.gd"

var left_missile = true

func shoot_missileT2_1():
	var sprite = get_node("Missile/Sprite")
	var collisonShape = get_node("Missile/CollisionShape2D")
	var missile_on_turret
	
	if left_missile:
		missile_on_turret = get_node("Turret/Missile1")
		left_missile = false
		sprite.position.y -= 11
		collisonShape.position.y -= 11
	else:
		missile_on_turret = get_node("Turret/Missile2")
		left_missile = true
		sprite.position.y += 11
		collisonShape.position.y += 11
	shoot_missile(sprite, collisonShape, missile_on_turret, new_missile)
