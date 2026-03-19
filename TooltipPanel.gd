extends CanvasLayer

@onready var panel = $TooltipPanel
@onready var header = $TooltipPanel/Header
@onready var description = $TooltipPanel/Description

func show_tooltip(title: String, text: String):
	header.text = title
	description.text = text
	panel.visible = true

func hide_tooltip():
	panel.visible = false

func _process(delta):
	panel.global_position = get_viewport().get_mouse_position() + Vector2(-160, 16)

