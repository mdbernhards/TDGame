extends PathFollow2D

signal base_damage(base_damage)
signal money_droped(money_droped)

var tank_data
var speed
var hp
var base_damage
var money_droped

var freeze_power = 1
var freeze_timer = Timer.new()
var is_frozen = false

onready var health_bar = get_node("HealthBar")
onready var impact_area = get_node("Impact")

var projectile_impact = preload("res://Scenes/SupportScenes/ProjectileImpact.tscn")

func _init(_tank_data):
	tank_data = _tank_data
	speed = tank_data.speed
	hp = tank_data.health
	base_damage = tank_data.base_damage
	money_droped = tank_data.money_droped
	
func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	health_bar.set_as_toplevel(true)

func _physics_process(delta):
	if unit_offset >= 1.0:
		emit_signal("base_damage", base_damage)
		queue_free()
	move(delta)
		
func move(delta):
	set_offset(get_offset() + speed * delta * freeze_power)
	health_bar.set_position(get_position() - Vector2(30, 30))
	
func on_hit(damage):
	impact()
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		on_destroy()

func impact():
	randomize()
	var x_pos = randi() % 31
	randomize()
	var y_pos = randi() % 31
	var impact_location = Vector2(x_pos, y_pos)
	var new_impact = projectile_impact.instance()
	new_impact.position = impact_location
	impact_area.add_child(new_impact)

func on_destroy():
	emit_signal("money_droped", money_droped)
	if get_node("KinematicBody2D"):
		get_node("KinematicBody2D").queue_free()
		yield(get_tree().create_timer(0.2), "timeout")
		self.queue_free()

func apply_freeze(_freeze_power, _freeze_time):
	freeze_power = _freeze_power
	freeze_timer.connect("timeout", self, "stop_freeze")
	freeze_timer.wait_time = _freeze_time
	freeze_timer.one_shot = true
	add_child(freeze_timer)
	freeze_timer.start()
	modulate = Color("00ffff")

func stop_freeze():
	freeze_power = 1
	modulate = Color("ffffff")
