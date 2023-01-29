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
	set_upgrade_buttons()
	tab_button_pressed("General")

func _on_Back_pressed():
	visible = false

func update_currency():
	$M/VB/RogueCurrency.text = "Rogue Currency: " + String(UpgradeDataManager.rogue_currency)

func set_upgrade_buttons():
	for upgrade_type_name in UpgradeData.upgrades:
		for upgrade_name in UpgradeData.upgrades[upgrade_type_name]:
			var upgrade = UpgradeData.upgrades[upgrade_type_name][upgrade_name]
			var new_button = load("res://Scenes/SupportScenes/UpgradeButtonExample.tscn").instance()
			
			new_button.get_node("Name").text = upgrade_name
			new_button.get_node("Price").text = String(upgrade.start_price)
			new_button.name = upgrade_name
			new_button.connect("pressed", self, "upgrade_button_pressed", [upgrade_name, upgrade_type_name])
			new_button.add_to_group(upgrade_type_name)
			$M/VB/HB/GridContainer.add_child(new_button)

func upgrade_button_pressed(upgrade_name, upgrade_type_name):
	if UpgradeDataManager[upgrade_type_name][upgrade_name]:
		UpgradeDataManager[upgrade_type_name][upgrade_name] = UpgradeDataManager[upgrade_type_name][upgrade_name] + 1
	else: 
		UpgradeDataManager[upgrade_type_name][upgrade_name] = 1
	FileManager.save_game()
	UpgradeDataManager.update_GameData_values()

func tab_button_pressed(name):
	hide_all_upgrade_buttons()
	for i in get_tree().get_nodes_in_group("rogueUpgradeTabButton"):
		if i.get_name() != name:
			i.pressed = false
		else:
			i.pressed = true
	for i in get_tree().get_nodes_in_group(name):
		i.visible = true

func hide_all_upgrade_buttons():
	for i in get_tree().get_nodes_in_group("rougeUpgradeButtons"):
		i.visible = false
