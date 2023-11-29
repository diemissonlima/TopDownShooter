extends BaseProjectile
class_name Grenade

onready var timer: Timer = get_node("Timer")
onready var collision: CollisionShape2D = get_node("Collision")

func on_body_entered(_body) -> void:
	return


func on_animation_finished(_anim_name) -> void:
	collision.disabled = false
	timer.start(0.1)
	

func on_timer_timeout() -> void:
	kill()
