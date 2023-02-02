extends CanvasLayer

onready var hp_bar = get_node("HUD/InfoBar/H/HP")
onready var hp_bar_tween = get_node("HUD/InfoBar/H/HP/Tween")
onready var money_count = get_node("HUD/InfoBar/H/Money")
onready var timer = get_node("HUD/CountDown/Timer")

func _ready():
	load_pause_menu()
	set_turret_prices()
	start_count_down()
	set_turret_buy_button_visibility()

func start_count_down():
	if get_parent().current_wave == 0:
		timer.start(150)
	else:
		timer.start(20)

func set_count_down_time():
	get_node("HUD/CountDown").text = String(round(timer.time_left))
	if timer.is_stopped() or timer.time_left > 120:
		get_node("HUD/CountDown").visible = false
	else:
		get_node("HUD/CountDown").visible = true

func _process(delta):
	if Input.is_action_just_pressed("ui_pause_menu"):
		_on_PausePlay_pressed()
	set_count_down_time()
	set_if_can_afford_turret()

func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Scenes/Turrets/" + tower_type + ".tscn").instance()
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("ad54ff3c")

	var range_texture = Sprite.new()
	range_texture.position = Vector2(32,32)
	var scaling = GameData.tower_data[tower_type]["range"] / 600.0
	range_texture.scale = Vector2(scaling, scaling)
	var texture = load("res://Assets/UI/range_overlay.png")
	range_texture.texture = texture
	range_texture.modulate = Color("ad54ff3c")

	var control = Control.new()
	control.add_child(drag_tower, true)
	control.add_child(range_texture, true)
	control.rect_position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child(get_node("TowerPreview"), 0)

func update_tower_preview(new_position, color):
	get_node("TowerPreview").rect_position = new_position
	if get_node("TowerPreview/DragTower").modulate != Color(color):
		get_node("TowerPreview/DragTower").modulate = Color(color)
		get_node("TowerPreview/Sprite").modulate = Color(color)

func _on_PausePlay_pressed():
	var pause_menu = get_node("PauseMenu")
	var hud = get_node("HUD")
	
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
	if get_tree().is_paused():
		get_tree().paused = false
		pause_menu.visible = false
		hud.visible = true
	else:
		get_tree().paused = true
		pause_menu.visible = true
		hud.visible = false

func _on_SpeedUp_pressed():
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
	if Engine.get_time_scale() == 1.0:
		Engine.set_time_scale(2.0)
		get_node("HUD/GameControls/SpeedUp/Speed").text = "x2"
	elif Engine.get_time_scale() == 2.0:
		Engine.set_time_scale(4.0)
		get_node("HUD/GameControls/SpeedUp/Speed").text = "x4"
	elif Engine.get_time_scale() == 4.0:
		Engine.set_time_scale(1.0)
		get_node("HUD/GameControls/SpeedUp/Speed").text = "x1"

func _on_Skip_pressed():
	if timer.is_stopped():
		get_parent().start_next_wave()
	timer.stop()

func update_health_bar(base_health):
	hp_bar_tween.interpolate_property(hp_bar, 'value', hp_bar.value, base_health, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	hp_bar_tween.start()
	if base_health >= 60:
		hp_bar.set_tint_progress("00ff04")
	elif base_health < 60 and base_health >= 25:
		hp_bar.set_tint_progress("e1be32")
	else:
		hp_bar.set_tint_progress("e11e1e")

func update_money_count(money):
	money_count.text = String(money)

func load_pause_menu():
	get_node("PauseMenu/M/VB/Continue").connect("pressed", self, "on_continue_pressed")
	get_node("PauseMenu/M/VB/Restart").connect("pressed", self, "on_restart_pressed")
	get_node("EndScreen/VB/Restart").connect("pressed", self, "on_restart_pressed")
	get_node("PauseMenu/M/VB/Settings").connect("pressed", self, "on_settings_pressed")
	get_node("PauseMenu/M/VB/MainMenu").connect("pressed", self, "on_main_menu_pressed")
	get_node("EndScreen/VB/MainMenu").connect("pressed", self, "on_main_menu_pressed")
	get_node("PauseMenu/M/VB/Quit").connect("pressed", self, "on_quit_pressed")

func on_continue_pressed():
	get_tree().paused = false
	get_node("PauseMenu").visible = false
	get_node("HUD").visible = true

func on_restart_pressed():
	get_tree().paused = false
	get_node("PauseMenu").visible = false
	get_node("EndScreen").visible = false
	get_parent().get_parent().on_new_game_pressed()
	get_parent().queue_free()

func on_settings_pressed():
	pass

func on_main_menu_pressed():
	get_tree().paused = false
	get_node("PauseMenu").visible = false
	get_parent().emit_signal("game_finished", false)

func on_quit_pressed():
	get_tree().quit()

func set_if_can_afford_turret():
	for turret in GameData.turretsT1["Turrets"]:
		if int(money_count.text) < GameData.tower_data[turret]["price"]:
			get_node("HUD/BuildBar/" + turret).disabled = true
			get_node("HUD/BuildBar/" + turret + "/DisabledSprite").visible = true
		else:
			get_node("HUD/BuildBar/" + turret).disabled = false
			get_node("HUD/BuildBar/" + turret + "/DisabledSprite").visible = false
	for turret in GameData.turretUpgrades["Turrets"]:
		if int(money_count.text) < GameData.tower_data[turret]["price"]:
			get_node("HUD/TurretInfoBar/H/" + turret).disabled = true
			get_node("HUD/TurretInfoBar/H/" + turret + "/DisabledSprite").visible = true
		else:
			get_node("HUD/TurretInfoBar/H/" + turret).disabled = false
			get_node("HUD/TurretInfoBar/H/" + turret + "/DisabledSprite").visible = false

func set_turret_prices():
	for turret in GameData.turretsT1["Turrets"]:
		get_node("HUD/BuildBar/" + turret + "/Label").text = String(GameData.tower_data[turret]["price"])
	for turret in GameData.turretUpgrades["Turrets"]:
		get_node("HUD/TurretInfoBar/H/" + turret + "/Label").text = String(GameData.tower_data[turret]["price"])

func set_turret_buy_button_visibility():
	for i in get_tree().get_nodes_in_group("build_buttons"):
		if GameData.tower_data[i.get_name()].unlocked == false:
			i.visible = false
