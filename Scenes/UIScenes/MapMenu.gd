extends Control

var stage
var map

func _ready():
	for i in get_tree().get_nodes_in_group("stageButton"):
		i.connect("pressed", self, "select_stage", [i.get_name()])
	for i in get_tree().get_nodes_in_group("MapButton"):
		i.connect("pressed", self, "select_map", [i.get_name()])
	select_stage("1")
	
func select_stage(_stage):
	stage = _stage
	hide_all_maps()
	
	var stage_list = GameData.Maps[stage]
	if stage_list:
		for i in stage_list:
			get_node("M/VB2/Maps/" + String(i)).visible = true 

func select_map(_map):
	map = _map

func hide_all_maps():
	for i in get_tree().get_nodes_in_group("MapButton"):
		get_node("M/VB2/Maps/" + String(i.get_node("Label").text)).visible = false 
