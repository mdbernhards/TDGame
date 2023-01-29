extends Node

var FileManager

var rogue_currency = 0

var General = { "rof": 0, "discount": 0, "damage": 0, "turret_range": 0}
var Projectile = { "rof": 0, "discount": 0, "damage": 0, "turret_range": 0} #Gun
var Missile = { "rof": 0, "discount": 0, "damage": 0, "turret_range": 0}
var Laser = { "rof": 0, "discount": 0, "damage": 0, "turret_range": 0}
var Flamethrower = { "rof": 0, "discount": 0, "damage": 0, "turret_range": 0}
var AoE = { "rof": 0, "discount": 0, "damage": 0, "turret_range": 0} #DeadZone
var MultiShot = { "rof": 0, "discount": 0, "damage": 0, "turret_range": 0}

var original_game_data
var all_turret_data

func _ready():
	all_turret_data = GameData.tower_data
	FileManager = get_parent().get_node("FileManager")
	FileManager.load_game()
	save_original_values()
	update_GameData_values()

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"rogue_currency" : rogue_currency,
		"General" : General,
		"Projectile" : Projectile,
		"Missile" : Missile,
		"Laser" : Laser,
		"Flamethrower" : Flamethrower,
		"AoE" : AoE,
		"MultiShot" : MultiShot,
	}
	return save_dict

func add_currency(money):
	if rogue_currency:
		rogue_currency = int(rogue_currency) + int(money)
	
func buy_upgrade(upgrade_name):
	pass

func update_GameData_values():
	update_turret_values()
	update_enemy_values()

func update_turret_values():
	for turret_name in all_turret_data:
		for value_name in all_turret_data[turret_name]:
			update_specific_turret_value(UpgradeData.upgrades["General"], value_name, turret_name, true)
			update_specific_turret_value(UpgradeData.upgrades[all_turret_data[turret_name]["category"]], value_name, turret_name, false)

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
	if self[upgrade_type][upgrade_name] && self[upgrade_type][upgrade_name] > 0:
		if upgrade.type == "subtract":
			return subtracting_upgrade(self[upgrade_type][upgrade_name], upgrade.value, turret_value)
		elif upgrade.type == "add":
			return additive_ugprade(self[upgrade_type][upgrade_name], upgrade.value, turret_value)
	else:
		return turret_value

func additive_ugprade(tier, upgrade_value, turret_value):
	return turret_value + (tier * upgrade_value * turret_value / 100.0)
	
func subtracting_upgrade(tier, upgrade_value, turret_value):
	return turret_value - (tier * upgrade_value * turret_value / 100.0)
	
func save_original_values():
	original_game_data = GameData.duplicate()
