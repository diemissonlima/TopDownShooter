extends Node2D
class_name GameLevel

const CELL_SIZE: int = 16

onready var assault: KinematicBody2D = get_node("LayeredObjects/Assault")
onready var navigation: Navigation2D = get_node("Terrain")
onready var base_terrain: TileMap = get_node("Terrain/BaseTerrain")

func _ready() -> void:
	define_camera_limit()
	
	
func define_camera_limit() -> void:
	var soldier_camera: Camera2D = assault.get_node("Camera")
	var used_rect_tile: Rect2 = base_terrain.get_used_rect()
	
	soldier_camera.limit_left = int(used_rect_tile.position.x)
	soldier_camera.limit_top = int(used_rect_tile.position.y)
	
	soldier_camera.limit_right = int(used_rect_tile.size.x * CELL_SIZE)
	soldier_camera.limit_bottom = int(used_rect_tile.size.y * CELL_SIZE)
	
func _process(_delta: float) -> void:
	if assault == null:
		return
		
	send_player()
	

func send_player() -> void:
	get_tree().call_group("enemy", "get_player", assault, navigation)
	
