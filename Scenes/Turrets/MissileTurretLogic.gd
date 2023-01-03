extends "res://Scenes/Turrets/Turrets.gd"

var new_missile

func fire_missile():
	new_missile = missile.instance()
	add_child(new_missile)
	
	if type == "MissileT1":
		shoot_missileT1()
	elif type == "MissileT2_1":
		shoot_missileT2_1()
	elif type == "MissileT2_2":
		shoot_missileT2_2()

func shoot_missile(sprite, collisonShape, missile_on_turret, new_missile):
	sprite.position.x += 3
	collisonShape.position.x += 3
	
	new_missile.speed = GameData.tower_data[type]["missile_speed"]
	new_missile.damage = GameData.tower_data[type]["damage"]
	new_missile.steer_force = GameData.tower_data[type]["steer_force"]

	missile_on_turret.hide()
	
	new_missile.start(Transform2D(get_node("Turret").global_rotation, to_global(get_node("Turret").position)), enemy)
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]/ 1.5), "timeout")
	missile_on_turret.show()

func shoot_missileT1():
	pass #check MissileT1.gd

func shoot_missileT2_1():
	pass #check MissileT2_1.gd

func shoot_missileT2_2():
	pass #check MissileT2_2.gd
