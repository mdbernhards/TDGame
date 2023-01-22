extends Control

var UpgradeDataManager

func _ready():
	for i in get_tree().get_nodes_in_group("UpgradeDataManager"):
		UpgradeDataManager = i

func _on_Back_pressed():
	visible = false

func update_currency():
	$M/VB/RogueCurrency.text = "Rogue Currency: " + String(UpgradeDataManager.rogue_currency)
