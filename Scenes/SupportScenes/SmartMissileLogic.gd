extends Area2D

var speed
var damage
export var steer_force = 20.0

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null
var hit = false

func start(_transform, _target):
	global_transform = _transform
	rotation += rand_range(-0.09, 0.09)
	velocity = transform.x * speed
	target = _target

func seek():
	var steer = Vector2.ZERO
	var target_ref = weakref(target)
	if target_ref.get_ref():
		var desired = (target.position - global_position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer

func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration * delta
	velocity = velocity.limit_length(speed)
	rotation = velocity.angle()
	position += velocity * delta

func _on_Missile_body_entered(body):
	hit = true
	body.get_parent().on_hit(damage)
	queue_free()
	

func _on_LifeTime_timeout():
	queue_free()
