extends Control

var stage
var map

var stage_button_list
var map_button_list

var UpgradeDataManager

func _ready():
	for i in get_tree().get_nodes_in_group("UpgradeDataManager"):
		UpgradeDataManager = i
	stage_button_list = get_tree().get_nodes_in_group("stageButton")
	map_button_list = get_tree().get_nodes_in_group("MapButton")
	for i in stage_button_list:
		i.connect("pressed", self, "select_stage", [i.get_name()])
	for i in map_button_list:
		i.connect("pressed", self, "select_map", [i.get_name()])
	$M/VB3/Play.visible = false

func select_stage(_stage):
	stage = _stage
	hide_all_maps()
	set_stage_pressed_button()
	for i in GameData.Maps[stage]:
		for j in map_button_list:
			if i == j.get_node("Label").text:
				j.visible = true
				if UpgradeDataManager.MapUnlocks[stage][i] == false:
					j.disabled = true
					j.get_node("DisabledSprite").visible = true
				else:
					j.disabled = false
					j.get_node("DisabledSprite").visible = false

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

# paņem save data, no
func show_available_stages():
	for stage_button in stage_button_list:
		if UpgradeDataManager.MapUnlocks[stage_button.get_node("Label").text]:
			stage_button.visible = true
			stage_button.disabled = true
			stage_button.get_node("DisabledSprite").visible = true
			for map in UpgradeDataManager.MapUnlocks[stage_button.get_node("Label").text]:
				if UpgradeDataManager.MapUnlocks[stage_button.get_name()][map] == true:
					stage_button.disabled = false
					stage_button.get_node("DisabledSprite").visible = false
		else:
			stage_button.visible = false

func _on_Upgrades_pressed():
	$UpgradeMenu.update_currency()
	$UpgradeMenu.visible = true
	$UpgradeMenu.set_upgrade_buttons()
	$UpgradeMenu.tab_button_pressed("General")

func _on_Back_pressed():
	visible = false
	get_parent().unload_game(true)
