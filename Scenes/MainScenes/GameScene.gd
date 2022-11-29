extends Node2D

var map_node

var build_mode = false
var build_valid = false
var build_location
var build_type
var build_tile

var current_wave = 0
var enemies_in_wave = 0

###
### Basic railsnakes
###

func _ready():
	map_node = get_node("Map1")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])
	
func _process(delta):
	if build_mode:
		update_tower_preview()

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
	yield(get_tree().create_timer(2), "timeout")
	spawn_enemies(wave_data)

func retrieve_wave_data():
	var wave_data = [["BlueTank", 0.7], ["BlueTank", 0.1]]
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data
	
func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Scenes/Enemies/" + i[0] + ".tscn").instance()
		map_node.get_node("Path").add_child(new_enemy, true)
		yield(get_tree().create_timer(i[1]),"timeout")

###
### Building func
###
func initiate_build_mode(tower_type):
	if build_mode:
		cancel_build_mode()
	build_type = tower_type + "T1"
	build_mode = true
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())
	
func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_title = map_node.get_node("TowerExclusion").world_to_map(mouse_position)
	var title_position = map_node.get_node("TowerExclusion").map_to_world(current_title)

	if map_node.get_node("TowerExclusion").get_cellv(current_title) == -1:
		get_node("UI").update_tower_preview(title_position, "ad54ff3c")
		build_valid = true
		build_location = title_position
		build_tile = current_title
	else:
		get_node("UI").update_tower_preview(title_position, "adff4545")
		build_valid = false

func cancel_build_mode():
	build_mode = false
	build_valid = false
	get_node("UI/TowerPreview").free()

func verify_and_build():
	if build_valid:
		var new_tower = load("res://Scenes/Turrets/" + build_type + ".tscn").instance()
		new_tower.position = build_location
		new_tower.built = true
		map_node.get_node("Turrets").add_child(new_tower, true)
		map_node.get_node("TowerExclusion").set_cellv(build_tile, 5)
