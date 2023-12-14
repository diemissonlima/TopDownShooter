extends KinematicBody2D
class_name Enemy

onready var animation: AnimationPlayer = get_node("Animation")

onready var texture: Sprite = get_node("Texture")
onready var collision_shape: CollisionShape2D = get_node("Collision")
onready var monitoring_timer: Timer = get_node("MonitoringTimer")

var distance: float

var itens_dict: Dictionary = {
	"MW Ammo": [
		[1, 50],
		preload("res://scenes/player/ammo/main_weapon_ammo.tscn")
	],
	
	"Grenade Ammo": [
		[51, 80],
		preload("res://scenes/player/ammo/grenade_ammo.tscn")
	],
	
	"Health": [
		[41, 60],
		preload("res://scenes/combat/health.tscn")
	]
}

var inimigo_derrotado: int = 1

var path: Array = []
var velocity: Vector2

export(float) var attack_cooldown

export(int) var xp
export(int) var points
export(int) var damage
export(int) var move_speed
export(int) var distance_treshold

func get_player(player_reference, navigation: Navigation2D) -> void:
	path = navigation.get_simple_path(global_position, player_reference.global_position, false)
	if path.size() == 0:
		return
		
	distance = global_position.distance_to(player_reference.global_position)
	velocity = global_position.direction_to(path[1]) * move_speed
	
	if global_position == path[0]:
		path.pop_front()
		
		
func _physics_process(_delta: float) -> void:
	if distance < distance_treshold:
		animation.stop()
		return
	else:
		animation.play("walk")
		
	velocity = move_and_slide(velocity)
	verify_direction()
	

func verify_direction() -> void:
	if velocity.x > 0:
		texture.flip_h = false
		
	if velocity.x < 0:
		texture.flip_h = true
	
	
func set_collision() -> void:
	change_monitoring_state(true)
	monitoring_timer.start(attack_cooldown)
	

func on_monitoring_timer_timeout():
	change_monitoring_state(false)


func change_monitoring_state(state: bool) -> void:
	collision_shape.set_deferred("disabled", state)
	
	
func on_screen_entered() -> void:
	visible = true


func on_screen_exited() -> void:
	visible = false


func kill() -> void:
	send_enemy_defeated(inimigo_derrotado)
	get_tree().call_group("player", "update_exp", xp)
	statistics.pontuacao += points
	roll_dice()
	queue_free()
	

func roll_dice() -> void:
	for item in itens_dict.keys():
		get_item(item)
		
		
func get_item(item_key: String) -> void:
	var random_number: int = randi() % 100 + 1
	var drop_probability_list: Array = itens_dict[item_key][0]
	
	var min_number: int = drop_probability_list[0]
	var max_number: int = drop_probability_list[1]
	if random_number >= min_number and random_number <= max_number:
		spawn_item(itens_dict[item_key][1])
		
		
func spawn_item(item_to_spawn) -> void:
	var item = item_to_spawn.instance()
	get_tree().root.call_deferred("add_child", item)
	item.global_position = global_position


func send_enemy_defeated(enemy: int) -> void:
	get_tree().call_group("interface", "set_enemies_defeated", enemy)
	
