extends Control


func _on_Back_pressed():
	visible = false

func update_currency():
	$M/VB/RogueCurrency.text = "Rogue Currency: " + String(get_parent().get_parent().get_node("UpgradeDataManager").rogue_currency)
