extends "res://Scenes/Turrets/Turrets.gd"

var shot = preload("res://Scenes/SupportScenes/Shot.tscn")

func fire_multishot():
	for i in 4:
		var new_shot = shot.instance()
		add_child(new_shot)
		new_shot.global_position = get_node("Turret/Muzzle" + String(i+1)).global_position
		new_shot.direction = i + 1
		setup_shot(new_shot)
	

func setup_shot(new_shot):
	new_shot.speed = GameData.tower_data[type]["shot_speed"]
	new_shot.damage = GameData.tower_data[type]["damage"]

	new_shot.start()
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]/ 1.5), "timeout")

func _physics_process(delta):
	pass