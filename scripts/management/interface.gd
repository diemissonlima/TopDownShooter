extends CanvasLayer
class_name Interface

onready var current_weapon: Label = get_node("CurrentWeapon")
onready var ammo: Label = get_node("Ammo")
onready var score: Label = get_node("Score")
onready var level: Label = get_node("Level")
onready var experience: Label = get_node("Experience")
onready var experience_amount: Label = get_node("ExpAmount")
onready var tween: Tween = get_node("ExpBar/Tween")

var inimigos_derrotados: int
var tiros_disparados: int
var granadas_lancadas: int

func _ready() -> void:
	score.text = str("Pontuação: " + str(0))
	level.text = str("Nível: " + str(1))
	experience.text = str("Experiência: " + str(0) + "/")
	

func set_weapon_text(weapon: String) -> void:
	current_weapon.text = "Arma Atual: " + weapon
	
	
func set_weapon_ammo(current_ammo: int, max_ammo: int) -> void:
	ammo.text = "Munição: " + str(current_ammo) + "/" + str(max_ammo)
	
	
func set_enemies_defeated(value: int) -> void:
	inimigos_derrotados += value
	statistics.inimigos_derrotados = inimigos_derrotados
	score.text = "Pontuação: " + str(statistics.pontuacao)
	#enemies.text = "Inimigos Derrotados: " + str(inimigos_derrotados)


func set_experience(value: int, type: String) -> void:
	match type:
		"level":
			level.text = "Nível: " + str(value)
			
		"xp":
			experience.text = "Experiência: " + str(value)
	
		"xp_amount":
			experience_amount.text = "/ " + str(value)

func shots_fired(value: int, type: String) -> void:
	match type:
		"fire":
			tiros_disparados = value
			statistics.tiros_disprados = tiros_disparados
	
		"throw":
			granadas_lancadas = value
			statistics.granadas_lancadas = granadas_lancadas
			
			
func reload_game() -> void:
	var _reload: bool = get_tree().change_scene("res://scenes/management/game_over.tscn")
	
