extends KinematicBody2D
class_name Soldier

onready var move_state: Node = get_node("States/Move")
onready var attack_state: Node = get_node("States/Attack")

onready var texture: Sprite = get_node("Texture")

var is_crawling: bool = false
var is_attacking: bool = false

func _physics_process(_delta: float) -> void:
	move_state.move()
	texture.animate(move_state.velocity)
	attack_state.attack()
	
