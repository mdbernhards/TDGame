extends "res://Scenes/Turrets/Turrets.gd"

var beam_duration = 0.03
var cooldown = 0.2
var can_shoot = true
var hit = null

func _ready():
	$Turret/Missile/Line2D.remove_point(1)

func fire_laser():
	can_shoot = false
	hit = cast_beam()
	yield(get_tree().create_timer(beam_duration), "timeout")
	$Turret/Missile/Line2D.remove_point(1)
	
func cast_beam():
	var space_state = get_world_2d().direct_space_state
	var turret_transform = Transform2D(get_node("Turret").global_rotation, to_global($Turret/Missile/Muzzle.position))
	var result = space_state.intersect_ray($Turret/Missile/Muzzle.global_position, $Turret/Missile/Muzzle.global_position + turret_transform.x * 5000)
	if result:
		var x = turret_transform.xform_inv(enemy.position).x
		if x < 100:
			x = 100
		$Turret/Missile/Line2D.add_point(Vector2(x, 25))
	return result

func _physics_process(delta):
	yield(get_tree().create_timer(cooldown), "timeout")
	var target_ref = weakref(enemy)
	if hit and target_ref.get_ref():
		enemy.on_hit(GameData.tower_data[type]["damage"])
	hit = null
