extends Area2D

var speed
var damage
var velocity = Vector2.ZERO
var direction

func start():
	velocity = get_direction() * speed
	
func _physics_process(delta):
	position += velocity * delta

func _on_Missile_body_entered(body):
	body.get_parent().on_hit(damage)
	queue_free()

func _on_LifeTime_timeout():
	queue_free()

func get_direction():
	if direction == 1:
		return Vector2(0, -100)
	elif direction == 2:
		return Vector2(100, 0)
	elif direction == 3:
		return Vector2(0, 100)
	elif direction == 4:
		return Vector2(-100, 0)
