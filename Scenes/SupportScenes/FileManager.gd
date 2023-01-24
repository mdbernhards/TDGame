extends Node

var upgradeDataManager

func _ready():
	for i in get_tree().get_nodes_in_group("UpgradeDataManager"):
		upgradeDataManager = i

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
		create_new_save()
		return

	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		for j in node_data.keys():
			if j == "filename" or j == "parent":
				continue
			upgradeDataManager.set(j, node_data[j])
	save_game.close()

func create_new_save():
	pass
