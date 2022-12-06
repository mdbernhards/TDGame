extends Node2D

var category
var type
var enemy_array = []
var built = false
var enemy
var ready = true

var left_missile = true

var missile = preload("res://Scenes/SupportScenes/Missile.tscn")

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * GameData.tower_data[type]["range"]

func _physics_process(delta):
	if !enemy_array.empty() and built:
		select_enemy()
		var animationPlayer = get_node_or_null("AnimationPlayer")
		if animationPlayer == null or not get_node_or_null("AnimationPlayer").is_playing():
			turn()
		if ready:
			fire()
	else:
		enemy = null
	
func turn():
	get_node("Turret").look_at(enemy.position)

func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]

func fire():
	ready = false
	if category == "Projectile":
		fire_gun()
		enemy.on_hit(GameData.tower_data[type]["damage"])
	elif category == "Missile":
		fire_missile()
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]), "timeout")
	ready = true
	
func fire_gun():
	get_node("AnimationPlayer").play("Fire")
	
func fire_missile():
	var new_missile = missile.instance()
	add_child(new_missile)
	
	var sprite = get_node("Missile/Sprite")
	var collisonShape = get_node("Missile/CollisionShape2D")
	var missile_on_turret
	
	if left_missile:
		missile_on_turret = get_node("Turret/Missile1")
		left_missile = false
		sprite.position.y -= 11
		collisonShape.position.y -= 11
	else:
		missile_on_turret = get_node("Turret/Missile2")
		left_missile = true
		sprite.position.y += 11
		collisonShape.position.y += 11
		
	sprite.position.x += 3
	collisonShape.position.x += 3
	
	missile_on_turret.hide()
	new_missile.start(get_node("Turret").position, Vector2(1,0).rotated(get_node("Turret").global_rotation))
	yield(get_tree().create_timer(GameData.tower_data["MissileT1"]["rof"]/ 1.5), "timeout")
	missile_on_turret.show()
	
func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())
	print(enemy_array)

func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
