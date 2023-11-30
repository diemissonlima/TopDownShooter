extends CanvasLayer
class_name Interface

onready var current_weapon: Label = get_node("CurrentWeapon")
onready var ammo: Label = get_node("Ammo")

func set_weapon_text(weapon: String) -> void:
	current_weapon.text = "Current Weapon: " + weapon
	
	
func set_weapon_ammo(current_ammo: int, max_ammo: int) -> void:
	ammo.text = "Ammo: " + str(current_ammo) + "/" + str(max_ammo)
