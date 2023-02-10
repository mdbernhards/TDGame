extends Control

var UpgradeDataManager
var FileManager

func _ready():
	for i in get_tree().get_nodes_in_group("UpgradeDataManager"):
		UpgradeDataManager = i
	for i in get_tree().get_nodes_in_group("FileManager"):
		FileManager = i
	for i in get_tree().get_nodes_in_group("rogueUpgradeTabButton"):
		i.connect("pressed", self, "tab_button_pressed", [i.get_name()])

func _on_Back_pressed():
	visible = false
	for i in get_tree().get_nodes_in_group("rougeUpgradeButtons"):
		i.queue_free()

func update_currency():
	$M/VB/RogueCurrency.text = "Rogue Currency: " + String(UpgradeDataManager.rogue_currency)

func set_upgrade_buttons():
	for upgrade_type_name in UpgradeData.upgrades:
		if upgrade_type_name != "Special":
			for upgrade_name in UpgradeData.upgrades[upgrade_type_name]:
				add_new_button(upgrade_type_name, upgrade_name)
				set_button_visibility(upgrade_name, upgrade_type_name, check_button_visibility(upgrade_name, upgrade_type_name))
		else:
			set_special_upgrade_buttons()

func set_special_upgrade_buttons():
	var special_upgrades =  UpgradeData.upgrades["Special"]["Unlocks"]
	for upgrade_name in special_upgrades:
		if UpgradeDataManager.Upgrades["Special"]["Unlocks"][upgrade_name] == false:
			add_new_button("Special", upgrade_name)

func add_new_button(upgrade_type_name, upgrade_name):
	var new_button = load("res://Scenes/SupportScenes/UpgradeButtonExample.tscn").instance()
	new_button.get_node("Name").text = upgrade_name
	new_button.get_node("Price").text = String(get_price(upgrade_name, upgrade_type_name))
	new_button.get_node("upgrade_name").text = String(upgrade_name)
	new_button.name = upgrade_name
	new_button.connect("pressed", self, "upgrade_button_pressed", [upgrade_name, upgrade_type_name])
	new_button.add_to_group(upgrade_type_name)
	$M/VB/HB/GridContainer.add_child(new_button)

func update_button_upgrade_price(upgrade_name, upgrade_type_name):
	for i in get_tree().get_nodes_in_group(upgrade_type_name):
		if i.get_node("upgrade_name").text == upgrade_name:
			i.get_node("Price").text = String(get_price(upgrade_name, upgrade_type_name))

func upgrade_button_pressed(upgrade_name, upgrade_type_name):
	if UpgradeDataManager.rogue_currency >= get_price(upgrade_name, upgrade_type_name):
		UpgradeDataManager.rogue_currency = UpgradeDataManager.rogue_currency - get_price(upgrade_name, upgrade_type_name)
		if upgrade_type_name != "Special":
			if UpgradeDataManager.Upgrades[upgrade_type_name][upgrade_name]:
				UpgradeDataManager.Upgrades[upgrade_type_name][upgrade_name] += 1
			else: 
				UpgradeDataManager.Upgrades[upgrade_type_name][upgrade_name] = 1
			set_button_visibility(upgrade_name, upgrade_type_name, check_button_visibility(upgrade_name, upgrade_type_name))
		else:
			UpgradeDataManager.Upgrades[upgrade_type_name]["Unlocks"][upgrade_name] = true
			set_button_visibility(upgrade_name, upgrade_type_name, false)
		update_currency()
		update_button_upgrade_price(upgrade_name, upgrade_type_name)
		FileManager.save_game()
		UpgradeDataManager.update_GameData_values()
		
func get_price(upgrade_name, upgrade_type_name):
	if upgrade_type_name == "Special":
		return UpgradeData.upgrades["Special"]["Unlocks"][upgrade_name].price
	else:
		var upgrade_data = UpgradeData.upgrades[upgrade_type_name][upgrade_name]
		return (upgrade_data.start_price + (UpgradeDataManager.Upgrades[upgrade_type_name][upgrade_name] * upgrade_data.price_increase))

func check_button_visibility(upgrade_name, upgrade_type_name): # Not for special type
	var upgrade_data = UpgradeData.upgrades[upgrade_type_name][upgrade_name]
	if upgrade_data.tiers <= UpgradeDataManager.Upgrades[upgrade_type_name][upgrade_name]:
		return false
	else:
		return true
		
func set_button_visibility(upgrade_name, upgrade_type_name, visible):
	for button in get_tree().get_nodes_in_group(upgrade_type_name):
		if button.get_node("upgrade_name").text == upgrade_name:
			button.visible = visible

func tab_button_pressed(type_name):
	hide_all_upgrade_buttons()
	for type_button in get_tree().get_nodes_in_group("rogueUpgradeTabButton"):
		if type_button.get_name() != type_name:
			type_button.pressed = false
		else:
			type_button.pressed = true
	if type_name != "Special":
		for upgrade_button in get_tree().get_nodes_in_group(type_name):
			upgrade_button.visible = check_button_visibility(upgrade_button.get_node("upgrade_name").text, type_name)

func hide_all_upgrade_buttons():
	for i in get_tree().get_nodes_in_group("rougeUpgradeButtons"):
		i.visible = false
