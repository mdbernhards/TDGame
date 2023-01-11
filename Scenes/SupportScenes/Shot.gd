extends Area2D

var speed
var damage
var velocity = Vector2.ZERO
var direction
var turret_range
var steer_force
var acceleration = Vector2.ZERO

func start():
	velocity = get_direction() * speed
	turret_range = GameData.tower_data[get_parent().type].range / 2
	
func _physics_process(delta):
	position += velocity * delta
	check_bullet_range()

func _on_Missile_body_entered(body):
	body.get_parent().on_hit(damage)
	queue_free()

func _on_LifeTime_timeout():
	queue_free()

func get_direction():
	if direction == 1:
		return Vector2(0, -100)
	elif direction == 5:
		return Vector2(50, -50)
	elif direction == 2:
		return Vector2(100, 0)
	elif direction == 6:
		return Vector2(50, 50)
	elif direction == 3:
		return Vector2(0, 100)
	elif direction == 7:
		return Vector2(-50, 50)
	elif direction == 4:
		return Vector2(-100, 0)
	elif direction == 8:
		return Vector2(-50, -50)

func check_bullet_range():
	var check_against
	if direction == 1 or direction == 3:
		check_against = position.y
	elif direction == 2 or direction == 4:
		check_against = position.x
	elif direction == 6:
		check_against = position.x + 48
	elif direction == 7:
		check_against = position.x * 2 + 24
	elif direction == 5 or direction == 8:
		check_against = position.y * 2 + 24
		
	if (check_against > 0 and check_against > turret_range + 32) or (check_against < 0 and check_against < -turret_range + 32):
		queue_free()
