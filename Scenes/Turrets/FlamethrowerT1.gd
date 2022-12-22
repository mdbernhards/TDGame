extends "res://Scenes/Turrets/Turrets.gd"
	
var flame = preload("res://Scenes/SupportScenes/Flame.tscn")

func _physics_process(delta):
	if enemy:
		$Turret/MuzzleFire.visible = true
	else:
		$Turret/MuzzleFire.visible = false

func fire_flamethrower():
	var new_flame = flame.instance()
	add_child(new_flame)
	
	new_flame.speed = GameData.tower_data[type]["flame_speed"]
	new_flame.damage = GameData.tower_data[type]["damage"]

	new_flame.start(Transform2D(get_node("Turret").global_rotation, $Turret/Muzzle.global_position), enemy)
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]/ 1.5), "timeout")
