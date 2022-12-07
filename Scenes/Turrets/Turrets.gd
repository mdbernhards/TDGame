extends Node2D

var category
var type
var enemy_array = []
var built = false
var enemy
var ready = true
var left_missile = true
var missile = preload("res://Scenes/SupportScenes/Missile.tscn")

signal turret_menu(type)

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
	var animation_player = get_node("AnimationPlayer")
	if animation_player != null:
		animation_player.play("Fire")
	
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

func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
	
func _on_TurretsArea_mouse_entered():
	if built:
		show_range()
	
func _on_TurretsArea_mouse_exited():
	if built:
		self.z_index = 0
		get_node("Sprite").free()
	
func show_range():
	var range_texture = Sprite.new()
	range_texture.position = Vector2(32,32)
	var scaling = GameData.tower_data[type]["range"] / 600.0
	range_texture.scale = Vector2(scaling, scaling)
	var texture = load("res://Assets/UI/range_overlay.png")
	range_texture.texture = texture
	add_child(range_texture, true)
	self.z_index = 1000
	move_child(get_node("Sprite"), 0)
	
func _on_TurretsArea_input_event(viewport, event, shape_idx):
	if built and event.is_pressed() == true:
		pass
		var GameScene = get_parent().get_parent().get_parent()
		GameScene.get_node("UI/HUD/TurretInfoBar").visible = !GameScene.get_node("UI/HUD/TurretInfoBar").visible
