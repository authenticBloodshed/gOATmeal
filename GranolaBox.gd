# GranolaBox.gd
extends Node2D

@export var granolaChunkScene: PackedScene

@onready var spawnContainer = $SpawnedGranola
@onready var boxArea = $Box

func _ready():
	boxArea.input_event.connect(_on_box_clicked)

func _on_box_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			spawn_granola()

func spawn_granola():
	var chunk = granolaChunkScene.instantiate()
	spawnContainer.add_child(chunk)
	chunk.global_position = get_global_mouse_position()
