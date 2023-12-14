extends Control
class_name ScreenGameover

onready var enemies: Label = get_node("InimigosMortos/Label")
onready var tiros_disparados: Label = get_node("TirosDisparados/Label")
onready var granadas_lancadas: Label = get_node("Granadas Lancadas/Label")
onready var button_container: HBoxContainer = get_node("HBoxContainer")

func _process(_delta: float) -> void:
	set_text()

func set_text() -> void:
	enemies.text = str(statistics.inimigos_derrotados)
	tiros_disparados.text = str(statistics.tiros_disprados)
	granadas_lancadas.text = str(statistics.granadas_lancadas)
