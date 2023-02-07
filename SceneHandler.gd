extends Node

var FileManager

func _ready():
	load_main_menu()
	load_map_menu()
	FileManager = get_node("FileManager")

func on_new_game_pressed():
	FileManager.load_game()
	Engine.set_time_scale(1)
	if get_node("MainMenu") != null:
		get_node("MainMenu").queue_free()
	$MapMenu.visible = true

func on_play_pressed():
	var game_scene = load("res://Scenes/MainScenes/GameScene.tscn").instance()
	game_scene.connect("game_finished", self, 'unload_game')
	add_child(game_scene)
	$MapMenu.visible = false

func on_load_game_pressed():
	$MapMenu.visible = false
	$LoadGameMenu.visible = true

func on_settings_pressed():
	$MapMenu.visible = false
	$SettingsMenu.visible = true

func on_quit_pressed():
	FileManager.save_game()
	get_tree().quit()

func unload_game(result):
	if get_node("GameScene"):
		get_node("GameScene").queue_free()
	var main_menu = load("res://Scenes/UIScenes/MainMenu.tscn").instance()
	add_child(main_menu)
	load_main_menu()

func load_main_menu():
	get_node("MainMenu/M/VB/NewGame").connect("pressed", self, "on_new_game_pressed")
	get_node("MainMenu/M/VB/Quit").connect("pressed", self, "on_quit_pressed")
	get_node("MainMenu/M/VB/LoadGame").connect("pressed", self, "on_load_game_pressed")
	get_node("MainMenu/M/VB/Settings").connect("pressed", self, "on_settings_pressed")

func load_map_menu():
	get_node("MapMenu/M/VB3/Play").connect("pressed", self, "on_play_pressed")
	$MapMenu.visible = false
	$MapMenu.select_stage("1")
	$MapMenu.show_available_stages()
