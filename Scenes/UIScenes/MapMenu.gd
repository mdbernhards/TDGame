extends Control

var stage
var map

var stage_button_list
var map_button_list

func _ready():
	stage_button_list = get_tree().get_nodes_in_group("stageButton")
	map_button_list = get_tree().get_nodes_in_group("MapButton")
	for i in stage_button_list:
		i.connect("pressed", self, "select_stage", [i.get_name()])
	for i in map_button_list:
		i.connect("pressed", self, "select_map", [i.get_name()])
	show_available_stages()
	select_stage("1")
	$M/VB3/Play.visible = false

func select_stage(_stage):
	map = null
	stage = _stage
	hide_all_maps()
	set_stage_pressed_button()
	
	var map_list = GameData.Maps[stage]
	if map_list:
		for i in map_list:
			for j in map_button_list:
				if i == j.get_node("Label").text:
					j.visible = true 

func _physics_process(delta):
	if stage and map:
		$M/VB3/Play.visible = true
	else:
		$M/VB3/Play.visible = false

func select_map(_map):
	map = _map
	set_map_pressed_button()

func hide_all_maps():
	for i in map_button_list:
		i.visible = false

func set_stage_pressed_button():
	for i in stage_button_list:
		i.pressed = false
	if stage:
		for i in stage_button_list:
			if i.get_node("Label").text == stage:
				i.pressed = true
	set_map_pressed_button()

func set_map_pressed_button():
	for i in map_button_list:
		i.pressed = false
	if map:
		for i in map_button_list:
			if i.get_node("Label").text == map:
				i.pressed = true

func show_available_stages():
	for i in stage_button_list:
		if GameData.Maps[i.get_node("Label").text]:
			i.visible = true
		else:
			i.visible = false

func _on_Upgrades_pressed():
	$UpgradeMenu.update_currency()
	$UpgradeMenu.visible = true

func _on_Back_pressed():
	visible = false
	get_parent().unload_game(true)
