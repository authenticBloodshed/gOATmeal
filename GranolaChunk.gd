extends Node2D
static var top_z := 0
@export var texture: Texture2D
@onready var sprite: Sprite2D = $Sprite2D
var dragging := true

func _ready():
	top_z += 1
	z_index = top_z

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position()

func _input(event):
	if dragging and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			dragging = false
