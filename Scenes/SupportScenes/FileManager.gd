extends Node

var upgradeDataManager
var loadGameMenu

func _ready():
	for i in get_tree().get_nodes_in_group("UpgradeDataManager"):
		upgradeDataManager = i 
	for i in get_tree().get_nodes_in_group("LoadGameMenu"):
		loadGameMenu = i 

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	if !upgradeDataManager.has_method("save"):
		print("persistent node '%s' is missing a save() function, skipped" % upgradeDataManager.name)
		return
	var node_data = upgradeDataManager.call("save")
	save_game.store_line(to_json(node_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return

	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		for j in node_data.keys():
			if j == "filename" or j == "parent":
				continue
			upgradeDataManager.set(j, node_data[j])
	save_game.close()

func save_all_save_data():
	var all_save_info = File.new()
	all_save_info.open("user://save.info", File.WRITE)
	if !loadGameMenu.has_method("save"):
		print("persistent node '%s' is missing a save() function, skipped" % loadGameMenu.name)
		return
	var node_data = loadGameMenu.call("save")
	all_save_info.store_line(to_json(node_data))
	all_save_info.close()

func load_all_save_data():
	var all_save_info = File.new()
	if not all_save_info.file_exists("user://save.info"):
		return

	all_save_info.open("user://save.info", File.READ)
	while all_save_info.get_position() < all_save_info.get_len():
		var node_data = parse_json(all_save_info.get_line())
		for j in node_data.keys():
			if j == "filename" or j == "parent":
				continue
			loadGameMenu.set(j, node_data[j])
	all_save_info.close()

func check_if_save_data_exists():
	pass
