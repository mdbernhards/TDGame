extends Node

var FileManager

var rogue_currency

# overall Upgrades
var rof
var discount
var damage
var turret_range

#Gun Upgrades
var gun_speed
var gun_price
var gun_dmg
# etc.

func _ready():
	FileManager = get_parent().get_node("FileManager")
	FileManager.load_game()
	update_GameData_values()

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"rogue_currency" : rogue_currency,
		"rof" : rof,
		"discount" : discount,
		"damage" : damage,
		"turret_range" : turret_range
	}
	return save_dict

func add_currency(money):
	if rogue_currency:
		rogue_currency = int(rogue_currency) + int(money)
	
func buy_upgrade(upgrade_name):
	pass
	
func get_upgrade():
	pass

func set_upgrades():
	pass
	
func set_upgraded_value():
	pass

func update_GameData_values():
	update_turret_values()
	update_enemy_values()

func update_turret_values():
	var upgrade_data = UpgradeData.upgrades["General"]
	var turret_data = GameData.tower_data
	for turret_name in turret_data:
		for value_name in turret_data[turret_name]:
			for upgrade_name in upgrade_data:
				var upgrade = null
				if value_name == upgrade_name:
					upgrade = upgrade_data[upgrade_name]
				elif value_name == "range" && upgrade_name == "turret_range":
					upgrade = upgrade_data["turret_range"]
				elif value_name == "price" && upgrade_name == "discount":
					upgrade = upgrade_data["discount"]
				
				if upgrade:
					turret_data[turret_name][value_name] = set_new_value(upgrade_name, upgrade, turret_data[turret_name][value_name])
	
func update_enemy_values():
	var enemy_data = GameData.enemy_data

func set_new_value(upgrade_name, upgrade, turret_value):
	if self[upgrade_name] && self[upgrade_name] > 0:
		if upgrade.type == "subtract":
			return subtracting_upgrade(self[upgrade_name], upgrade.value, turret_value)
		elif upgrade.type == "add":
			return additive_ugprade(self[upgrade_name], upgrade.value, turret_value)
	else:
		return turret_value

func additive_ugprade(tier, upgrade_value, turret_value):
	return turret_value + (tier * upgrade_value * turret_value / 100.0)
	
func subtracting_upgrade(tier, upgrade_value, turret_value):
	return turret_value - (tier * upgrade_value * turret_value / 100.0)
