extends Area2D
class_name Ammo

export(int) var amount
export(String) var type

func _ready() -> void:
	randomize()
	if type == "throw":
		return
		
	amount = randi() % 15 + 1


func on_body_entered(body) -> void:
	if body is Soldier:
		body.attack_state.update_ammo(type, "increase", amount)
		queue_free()
