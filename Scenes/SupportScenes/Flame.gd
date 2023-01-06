extends Area2D


var speed
var damage
var burning_damage
var burning_time
var burn_cooldown

var target = null

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var current_velocity = Vector2.ZERO

func start(_transform, _target):
	global_transform = _transform
	velocity = transform.x * speed
	current_velocity = velocity
	target = _target
	burning_damage = GameData.tower_data[get_parent().type]["burning_damage"]
	burning_time = GameData.tower_data[get_parent().type]["burning_time"]
	burn_cooldown = GameData.tower_data[get_parent().type]["burn_cooldown"]

func seek():
	var steer = Vector2.ZERO
	var target_ref = weakref(target)
	if target_ref.get_ref():
		var desired = (target.position - global_position).normalized() * speed
		steer = (desired - velocity).normalized()
	return steer

func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration * delta
	if current_velocity == Vector2.ZERO:
		current_velocity = velocity.limit_length(speed)
	else:
		current_velocity = current_velocity / 1.015
	rotation = current_velocity.angle()
	position += current_velocity * delta

func _on_LifeTime_timeout():
	queue_free()

func _on_Flame_body_entered(body):
	body.get_parent().on_hit(damage)
	body.get_parent().apply_fire(burning_damage, burning_time, burn_cooldown)
	queue_free()
