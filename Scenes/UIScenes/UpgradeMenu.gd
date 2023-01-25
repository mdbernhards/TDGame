extends Control

var UpgradeDataManager
var FileManager

func _ready():
	for i in get_tree().get_nodes_in_group("UpgradeDataManager"):
		UpgradeDataManager = i
	for i in get_tree().get_nodes_in_group("FileManager"):
		FileManager = i
	set_upgrade_buttons()

func _on_Back_pressed():
	visible = false

func update_currency():
	$M/VB/RogueCurrency.text = "Rogue Currency: " + String(UpgradeDataManager.rogue_currency)

func set_upgrade_buttons():
	for upgrade_name in UpgradeData.upgrades["General"]:
		var upgrade = UpgradeData.upgrades["General"][upgrade_name]
		var new_button = load("res://Scenes/SupportScenes/UpgradeButtonExample.tscn").instance()
		
		new_button.visible = true
		new_button.get_node("Name").text = upgrade_name
		new_button.get_node("Price").text = String(upgrade.start_price)
		new_button.name = upgrade_name
		new_button.connect("pressed", self, "upgrade_button_pressed", [upgrade_name])
		$M/VB/HB/GridContainer.add_child(new_button)

func upgrade_button_pressed(type):
	if UpgradeDataManager[type]:
		UpgradeDataManager[type] = UpgradeDataManager[type] + 1
	else: 
		UpgradeDataManager[type] = 1
	FileManager.save_game()
	UpgradeDataManager.update_GameData_values()
