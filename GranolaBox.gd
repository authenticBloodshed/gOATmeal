# GranolaBox.gd
extends Node2D

@export var granolaChunkScene: PackedScene
static var spawnedChunks = []
@onready var spawnContainer = $SpawnedGranola
@onready var boxArea = $Box

func _ready():
	boxArea.input_event.connect(_on_box_clicked)

func _on_box_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			spawn_granola()
			$PlaceSound.play()

func spawn_granola():
	var chunk = granolaChunkScene.instantiate()
	spawnContainer.add_child(chunk)
	spawnedChunks.append(chunk)
	chunk.global_position = get_global_mouse_position()
	
func undo_last():
	if spawnedChunks.size() > 0:
		var lastChunk = spawnedChunks.pop_back()
		lastChunk.queue_free()


func _on_undo_button_pressed():
	undo_last()
