extends Node2D

var enemy_array = []
var built = false

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * GameData.tower_data[self.get_name()]["range"]

func _physics_process(delta):
	turn()
	
func turn():
	var enemy_position = enemy_array[0].positon
	get_node("Turret").look_at(enemy_position)

func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())
	print(enemy_array)

func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
