extends KinematicBody2D
class_name Soldier

onready var move_state: Node = get_node("States/Move")
onready var attack_state: Node = get_node("States/Attack")

onready var texture: Sprite = get_node("Texture")

var is_crawling: bool = false
var is_attacking: bool = false

var current_exp: int = 0

var level: int = 1
var level_dict: Dictionary = {
	"1": 25, "2": 33, "3": 49, "4": 66, "5": 93,
	"6": 135, "7": 186, "8": 251, "9": 356
}


func _physics_process(_delta: float) -> void:
	move_state.move()
	texture.animate(move_state.velocity)
	attack_state.attack()
	
	
func update_exp(value: int) -> void:
	current_exp += value
	
	if current_exp >= level_dict[str(level)] and level < 9:
		var leftover = current_exp - level_dict[str(level)]
		current_exp = leftover
		#on_level_up()
		level += 1
		
	elif current_exp >= level_dict[str(level)] and level == 9:
		current_exp = level_dict[str(level)]
		
	get_tree().call_group("interface", "set_experience", level, "level")
	get_tree().call_group("interface", "set_experience", current_exp, "xp")
	get_tree().call_group("interface", "set_experience", level_dict[str(level)], "xp_amount")
	
	
func on_level_up() -> void:
	pass
	
