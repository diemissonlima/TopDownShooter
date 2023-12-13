extends CanvasLayer
class_name Interface

onready var current_weapon: Label = get_node("CurrentWeapon")
onready var ammo: Label = get_node("Ammo")
onready var enemies: Label = get_node("Enemies")
onready var fire: Label = get_node("TirosDisparados")
onready var throw: Label = get_node("GranadasLancadas")

var inimigos_derrotados: int
var tiros_disparados: int
var granadas_lancadas: int

func set_weapon_text(weapon: String) -> void:
	current_weapon.text = "Arma Atual: " + weapon
	
	
func set_weapon_ammo(current_ammo: int, max_ammo: int) -> void:
	ammo.text = "Munição: " + str(current_ammo) + "/" + str(max_ammo)
	
	
func set_enemies_defeated(value: int) -> void:
	inimigos_derrotados += value
	enemies.text = "Inimigos Derrotados: " + str(inimigos_derrotados)
	

func shots_fired(value: int, type: String) -> void:
	match type:
		"fire":
			tiros_disparados = value
			fire.text = "Tiros Disparados: " + str(tiros_disparados)
	
		"throw":
			granadas_lancadas = value
			throw.text = "Granadas Lançadas: " + str(granadas_lancadas)
			

func reload_game() -> void:
	var _reload: bool = get_tree().change_scene("res://scenes/management/game_level.tscn")
	
