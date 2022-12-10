extends Node2D

signal game_finished(result)

var map_node
var build_mode = false
var build_valid = false
var build_location
var build_type
var build_tile

var current_wave = 0
var enemies_in_wave = 0
var base_health = 100
var money = 100
var enemies_left = 0

var waves = GameData.wave_data["Waves"]

###
### Basic railsnakes
###
func _ready():
	map_node = get_node("Map1")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])
	for i in get_tree().get_nodes_in_group("upgrade_buttons"):
		i.connect("pressed", self, "initiate_upgrade", [i.get_name()])

func _process(delta):
	if build_mode:
		update_tower_preview()
	if enemies_left <= 0:
		start_next_wave()

func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()

###
### Wave Functions
###
func start_next_wave():
	var wave_data = retrieve_wave_data()
	if current_wave == 1:
		yield(get_tree().create_timer(0.2), "timeout")
	else:
		yield(get_tree().create_timer(6), "timeout")
	spawn_enemies(wave_data)

func retrieve_wave_data():
	current_wave += 1
	var wave_data = create_wave()
	enemies_in_wave = wave_data.size()
	return wave_data
	
func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Scenes/Enemies/" + i[0] + ".tscn").instance()
		new_enemy.connect("base_damage", self, 'on_base_damage')
		new_enemy.connect("money_droped", self, 'on_money_droped')
		map_node.get_node("Path").add_child(new_enemy, true)
		yield(get_tree().create_timer(i[1]),"timeout")

###
### Building func
###
func initiate_build_mode(tower_type):
	if build_mode:
		cancel_build_mode()
	get_node("UI/HUD/TurretInfoBar").visible = false
	build_type = tower_type
	build_mode = true
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())

func initiate_upgrade(tower_type):
	build_type = tower_type
	build_valid = true
	build_tile = map_node.get_node("TowerExclusion").world_to_map(build_location)
	if can_buy_turret():
		for i in get_tree().get_nodes_in_group("turrets"):
			if i.position == build_location:
				i.free()
		verify_and_build()

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tile = map_node.get_node("TowerExclusion").world_to_map(mouse_position)
	var tile_position = map_node.get_node("TowerExclusion").map_to_world(current_tile)

	if map_node.get_node("TowerExclusion").get_cellv(current_tile) == -1:
		get_node("UI").update_tower_preview(tile_position, "ad54ff3c")
		build_valid = true
		build_location = tile_position
		build_tile = current_tile
	else:
		get_node("UI").update_tower_preview(tile_position, "adff4545")
		build_valid = false

func cancel_build_mode():
	build_mode = false
	build_valid = false
	get_node("UI/TowerPreview").free()

func verify_and_build():
	if build_valid and buy_turret():
		var new_tower = load("res://Scenes/Turrets/" + build_type + ".tscn").instance()
		new_tower.position = build_location
		new_tower.built = true
		new_tower.type = build_type
		new_tower.category = GameData.tower_data[build_type]["category"]
		map_node.get_node("Turrets").add_child(new_tower, true)
		map_node.get_node("TowerExclusion").set_cellv(build_tile, 5)

func can_buy_turret():
	var price = GameData.tower_data[build_type]["price"]
	if price <= money:
		return true
	else:
		return false

func buy_turret():
	var price = GameData.tower_data[build_type]["price"]
	if price <= money:
		money -= price
		get_node("UI").update_money_count(money)
		return true
	else:
		return false

func on_base_damage(damage):
	base_health -= damage
	enemies_left -= 1
	if base_health <= 0:
		emit_signal("game_finished", false)
	else:
		get_node("UI").update_health_bar(base_health)

func on_money_droped(money_droped):
	money += money_droped
	enemies_left -= 1
	get_node("UI").update_money_count(money)
	
func create_wave():
	var wave_data = GameData.wave_data
	var complete_wave = []
	if (current_wave <= wave_data.Waves):
		var wave = GameData.wave_data["Wave" + String(current_wave)]
		enemies_left = wave.EnemyCount
		for i in wave.Orders:
			var order = wave["Order"][String(i + 1)]
			complete_wave.append_array(get_order(order))
	else:
		enemies_left = 1
		complete_wave.append_array([["BlueTank", 0.7]])
	return complete_wave
	
func get_order(order):
	var wave = []
	var enemies = GameData.enemies["Enemies"]
	
	for enemy in enemies:
		if order[enemy] != null:
			for i in order[enemy]:
				wave.append_array([[enemy, order.Offset]])
	return wave
