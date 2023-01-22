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
	
func get_data_by_type(type):
	var node_data
	
	FileManager.load_game()
	if GameData.tower_data[type]:
		node_data = get_turret_data(GameData.tower_data[type])
	elif GameData.enemy_data[type]:
		node_data = get_enemy_data(GameData.tower_data[type])
	return node_data

func get_turret_data(turret):
	turret.rof = turret.rof * rof
	return turret

func get_enemy_data(enemy):
	return enemy

func buy_upgrade(upgrade_name):
	pass
	
func get_upgrade():
	pass

func set_upgrades():
	pass
	
func set_upgraded_value():
	pass
