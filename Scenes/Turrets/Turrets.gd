extends Node2D

var category
var type
var enemy
var turret_info_bar
var GameScene

var enemy_array = []
var built = false
var ready = true

var missile = preload("res://Scenes/SupportScenes/Missile.tscn")

signal turret_menu(type)

func _ready():
	set_turret_range()

func _physics_process(delta):
	if !enemy_array.empty() and built:
		select_enemy()
		var animationPlayer = get_node_or_null("AnimationPlayer")
		if animationPlayer == null or not get_node_or_null("AnimationPlayer").is_playing():
			turn()
		if ready:
			fire()
	else:
		enemy = null

func turn():
	if category != "AoE" and category != "MultiShot":
		get_node("Turret").look_at(enemy.position)

func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]

func fire():
	ready = false
	if category == "Projectile":
		fire_gun()
	elif category == "Missile":
		fire_missile()
	elif category == "Laser":
		fire_laser()
	elif category == "Flamethrower":
		fire_flamethrower()
	elif category == "AoE":
		fire_aoe()
	elif category == "MultiShot":
		fire_multishot()
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]), "timeout")
	ready = true

func fire_gun():
	pass # check GunTurretLogic.gd

func fire_missile():
	pass #check MissileTurretLogic.gd

func fire_laser():
	pass #check LaserT1.gd

func fire_flamethrower():
	pass #check FlamethrowerT1.gd
	
func fire_aoe():
	pass #check DeadZoneT1.gd

func fire_multishot():
	pass #check MultiShotT1.gd

func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())

func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())

func _on_TurretsArea_mouse_entered():
	if built:
		hide_all_ranges()
		show_range()

func _on_TurretsArea_mouse_exited():
	if built and (!turret_info_bar or !turret_info_bar.visible):
		self.z_index = 0
		hide_all_ranges()

func show_range():
	var range_texture = Sprite.new()
	range_texture.position = Vector2(32,32)
	var scaling = GameData.tower_data[type]["range"] / 600.0
	range_texture.scale = Vector2(scaling, scaling)
	var texture = load("res://Assets/UI/range_overlay.png")
	range_texture.texture = texture
	range_texture.add_to_group("range_sprites")
	add_child(range_texture, true)
	self.z_index = 1000
	move_child(get_node("Sprite"), 0)

func _on_TurretsArea_input_event(viewport, event, shape_idx):
	if built and event.is_pressed():
		setup_game_scene()
		set_turret_upgrades()
		set_turret_stats()

func set_turret_upgrades():

	hide_all_ranges()
	show_range()
	hide_all_upgrades()

	for i in get_tree().get_nodes_in_group(String(type) + "_upgrade"):
		i.visible = true

	if GameScene.build_location == position:
		turret_info_bar.visible = !turret_info_bar.visible
	else:
		turret_info_bar.visible = true
	GameScene.build_location = position

func set_turret_stats():
	turret_info_bar.get_node("H/StatsLabel").text = "Range: " + String(GameData.tower_data[type].range) + "\n Damage: " + String(GameData.tower_data[type].damage) + "\n RoF: " + String(GameData.tower_data[type].rof)

func setup_game_scene():
	GameScene = get_parent().get_parent().get_parent()
	turret_info_bar = GameScene.get_node("UI/HUD/TurretInfoBar")
	GameScene.turretOpen = self
	for i in get_tree().get_nodes_in_group("map"):
		GameScene.build_tile = i.get_node("TowerExclusion").world_to_map(get_global_mouse_position())

func hide_all_upgrades():
	for i in get_tree().get_nodes_in_group("upgrade_buttons"):
		i.visible = false

func hide_all_ranges():
	for i in get_tree().get_nodes_in_group("range_sprites"):
		if i:
			i.free()

func set_turret_range():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * GameData.tower_data[type]["range"]
