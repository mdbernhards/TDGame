extends Area2D

var speed = 1
var damage = 20

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO

func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	
func _physics_process(delta):
	position += velocity * delta

func _on_Missile_body_entered(body):
	queue_free()

func _on_LifeTime_timeout():
	queue_free()
