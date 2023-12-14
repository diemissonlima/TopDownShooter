extends Control
class_name ScreenGameover

onready var enemies: Label = get_node("InimigosMortos/Label")
onready var tiros_disparados: Label = get_node("TirosDisparados/Label")
onready var granadas_lancadas: Label = get_node("Granadas Lancadas/Label")
onready var pontuacao: Label = get_node("Pontuacao/Label")

func _process(_delta: float) -> void:
	set_statistics()
	

func set_statistics() -> void:
	enemies.text = str(statistics.inimigos_derrotados)
	tiros_disparados.text = str(statistics.tiros_disprados)
	granadas_lancadas.text = str(statistics.granadas_lancadas)
	pontuacao.text = str(statistics.pontuacao)


func on_NewGame_pressed():
	var _new_game: bool = get_tree().change_scene("res://scenes/management/game_level.tscn")
	
	reset()


func on_Sair_pressed():
	get_tree().quit()


func reset() -> void:
	statistics.inimigos_derrotados = 0
	statistics.tiros_disprados = 0
	statistics.granadas_lancadas = 0
	statistics.pontuacao = 0
