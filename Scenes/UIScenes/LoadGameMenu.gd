extends Control
var saves = []

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"saves" : saves,
	}
	return save_dict

func _ready():
	pass
	
func load_saves():
	pass

func create_new_save(name, time_played, rouge_currency):
	saves = saves + [{"name": name, "time_played": time_played, "rouge_currency": rouge_currency}]

func _on_Back_pressed():
	visible = false
