extends Control

var stage
var map

func _ready():
	for i in get_tree().get_nodes_in_group("stageButton"):
		i.connect("pressed", self, "select_stage", [i.get_name()])
	for i in get_tree().get_nodes_in_group("MapButton"):
		i.connect("pressed", self, "select_map", [i.get_name()])
	select_stage("1")
	$M/VB3/Play.visible = false
	
func select_stage(_stage):
	map = null
	stage = _stage
	hide_all_maps()
	set_stage_pressed_button()
	
	var stage_list = GameData.Maps[stage]
	if stage_list:
		for i in stage_list:
			get_node("M/VB2/Maps/" + String(i)).visible = true 

func _physics_process(delta):
	if stage and map:
		$M/VB3/Play.visible = true
	else:
		$M/VB3/Play.visible = false
		
func select_map(_map):
	map = _map
	set_map_pressed_button()

func hide_all_maps():
	for i in get_tree().get_nodes_in_group("MapButton"):
		get_node("M/VB2/Maps/" + String(i.get_node("Label").text)).visible = false
		
func set_stage_pressed_button():
	for i in get_tree().get_nodes_in_group("stageButton"):
		get_node("M/VB/Stages/" + String(i.get_node("Label").text)).pressed = false
	if stage:
		get_node("M/VB/Stages/" + String(stage)).pressed = true
	set_map_pressed_button()

func set_map_pressed_button():
	for i in get_tree().get_nodes_in_group("MapButton"):
		get_node("M/VB2/Maps/" + String(i.get_node("Label").text)).pressed = false
	if map:
		get_node("M/VB2/Maps/" + String(map)).pressed = true
