extends Node

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("upgrade_data")
	for node in save_nodes:
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
		var node_data = node.call("save")
		save_game.store_line(to_json(node_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return

	save_game.open("user://savegame.save", File.READ)
	
	var save_nodes = get_tree().get_nodes_in_group("upgrade_data")
	for i in save_nodes:
		while save_game.get_position() < save_game.get_len():
			var node_data = parse_json(save_game.get_line())

			for j in node_data.keys():
				if j == "filename" or j == "parent":
					continue
				i.set(j, node_data[j])
	save_game.close()
