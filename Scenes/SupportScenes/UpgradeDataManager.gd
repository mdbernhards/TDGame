extends Node

var rogue_currency = 0

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"rogue_currency" : rogue_currency
	}
	return save_dict
