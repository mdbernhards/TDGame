extends Node

var rogue_currency = 0

# overall Upgrades
var speed
var price
var dmg

#Gun Upgrades
var gun_speed
var gun_price
var gun_dmg
# etc.

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"rogue_currency" : rogue_currency
	}
	return save_dict

func add_currency(money):
	if rogue_currency:
		rogue_currency = int(rogue_currency) + int(money)

func get_enemy_data():
	pass
	
func get_turret_data():
	pass
	
func buy_upgrade(upgrade_name):
	pass
	
func get_upgrade():
	pass

func set_upgrades():
	pass
