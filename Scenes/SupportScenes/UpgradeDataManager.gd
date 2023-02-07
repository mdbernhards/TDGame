extends Node

var FileManager
var Upgrades
var MapUnlocks

var rogue_currency = 0

var original_game_data = GameData.duplicate()
var all_turret_data = GameData.tower_data

func _ready():
	FileManager = get_parent().get_node("FileManager")
	FileManager.load_game()
	if !Upgrades:
		create_new_save()
	if !MapUnlocks:
		create_new_map_unlocks()
	update_GameData_values()

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"rogue_currency" : rogue_currency,
		"Upgrades" : Upgrades,
		"MapUnlocks" : MapUnlocks,
	}
	return save_dict

func add_currency(money):
	if rogue_currency:
		rogue_currency = int(rogue_currency) + int(money)

func update_GameData_values():
	update_turret_values()
	update_enemy_values()

func update_turret_values():
	for turret_name in all_turret_data:
		for value_name in all_turret_data[turret_name]:
			if value_name != "unlocked":
				update_specific_turret_value(UpgradeData.upgrades["General"], value_name, turret_name, true)
				update_specific_turret_value(UpgradeData.upgrades[all_turret_data[turret_name]["category"]], value_name, turret_name, false)
		set_turret_unlocks(turret_name)

func set_turret_unlocks(turret_name):
	all_turret_data[turret_name]["unlocked"] = Upgrades["Special"]["Unlocks"][turret_name]

func update_specific_turret_value(upgrade_data, value_name, turret_name, is_general_upgrade):
	for upgrade_name in upgrade_data:
		var upgrade = null
		if value_name == upgrade_name:
			upgrade = upgrade_data[upgrade_name]
		elif value_name == "range" && upgrade_name == "turret_range":
			upgrade = upgrade_data["turret_range"]
		elif value_name == "price" && upgrade_name == "discount":
			upgrade = upgrade_data["discount"]
		if upgrade:
			var upgrade_type
			var turret_value
			if is_general_upgrade:
				turret_value = original_game_data.tower_data[turret_name][value_name]
				upgrade_type = "General"
			else:
				turret_value = all_turret_data[turret_name][value_name]
				upgrade_type = all_turret_data[turret_name]["category"]
			all_turret_data[turret_name][value_name] = set_new_value(upgrade_type, upgrade_name, upgrade, turret_value)

func update_enemy_values():
	var enemy_data = GameData.enemy_data

func set_new_value(upgrade_type, upgrade_name, upgrade, turret_value):
	if Upgrades[upgrade_type][upgrade_name] && Upgrades[upgrade_type][upgrade_name] > 0:
		if upgrade.type == "subtract":
			return subtracting_upgrade(Upgrades[upgrade_type][upgrade_name], upgrade.value, turret_value)
		elif upgrade.type == "add":
			return additive_ugprade(Upgrades[upgrade_type][upgrade_name], upgrade.value, turret_value)
	else:
		return turret_value

func additive_ugprade(tier, upgrade_value, turret_value):
	return turret_value + (tier * upgrade_value * turret_value / 100.0)

func subtracting_upgrade(tier, upgrade_value, turret_value):
	return turret_value - (tier * upgrade_value * turret_value / 100.0)

func create_new_save():
	var all_data = UpgradeData.duplicate()
	Upgrades = all_data.upgrades
	for upgrade_type in Upgrades:
		if upgrade_type != "Special":
			for upgrade_name in Upgrades[upgrade_type]:
				Upgrades[upgrade_type][upgrade_name] = 0
		else:
			for upgrade_name in Upgrades[upgrade_type]["Unlocks"]:
				if upgrade_name == "GunT1":
					Upgrades[upgrade_type]["Unlocks"][upgrade_name] = true
				else:
					Upgrades[upgrade_type]["Unlocks"][upgrade_name] = false

func create_new_map_unlocks():
	MapUnlocks = {}
	for stage in original_game_data.Maps:
		for map in original_game_data.Maps[stage]:
			if stage == "Stages":
				MapUnlocks[String(MapUnlocks.size() + 1)] = {}	
			else:
				if stage == "1" or map == "1":
					MapUnlocks[String(stage)][map] = true
				else:
					MapUnlocks[String(stage)][map] = false
