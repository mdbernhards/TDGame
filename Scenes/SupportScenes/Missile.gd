extends Area2D

var speed = GameData.tower_data["MissileT1"]["missile_speed"]
var damage = GameData.tower_data["MissileT1"]["damage"]

var velocity = Vector2.ZERO

func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	
func _physics_process(delta):
	position += velocity * delta

func _on_Missile_body_entered(body):
	body.get_parent().on_hit(damage)
	queue_free()

func _on_LifeTime_timeout():
	queue_free()
