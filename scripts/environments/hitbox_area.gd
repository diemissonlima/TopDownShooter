extends Area2D
class_name HitboxArea

var max_health_value: int

export(int) var health

export(NodePath) onready var texture = get_node(texture) as Sprite
export(NodePath) onready var health_bar = get_node(health_bar) as TextureProgress

func _ready() -> void:
	max_health_value = health
	health_bar.init_bar(health)
	

func on_hitbox_area_entered(_area) -> void:
	return


func on_hitbox_area_body_entered(body) -> void:
	if body is Enemy:
		update_health(body.damage, "decrease")
		body.set_collision()
	

func update_health(value: int, type: String) -> void:
	if type == "decrease":
		health -= value
		
	if type == "increase":
		health = clamp(health + value, 0, max_health_value)
		health_bar.update_value(health)
		return
		
	health_bar.update_value(health)
	if health <= 0:
		texture.action_behavior("death")
		return
	
	texture.action_behavior("hit")
	
