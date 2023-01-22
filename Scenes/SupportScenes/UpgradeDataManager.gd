extends Node

var FileManager

var rogue_currency = 0

# overall Upgrades
var rof = 0.9
var price
var dmg

#Gun Upgrades
var gun_speed
var gun_price
var gun_dmg
# etc.

func _ready():
	update_GameData_values_for_startup()
	FileManager = get_parent().get_node("FileManager")

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"rogue_currency" : rogue_currency,
		"rof" : rof
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

func update_GameData_values_for_startup():
	update_turret_values_for_startup()
	update_enemy_values_for_startup()

func update_turret_values_for_startup():
	var turret_data = GameData.tower_data
	for turret in turret_data:
		turret_data[turret].rof = turret_data[turret].rof * rof
	
func update_enemy_values_for_startup():
	pass
