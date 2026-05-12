extends CanvasLayer

@onready var panel = $TooltipPanel
@onready var header = $TooltipPanel/Header
@onready var description = $TooltipPanel/Description

var tooltipOffset := Vector2(-160, 16)

func show_tooltip(title: String, text: String):
	header.text = title
	description.text = text
	panel.visible = true

func hide_tooltip():
	panel.visible = false

func _process(delta):
	if !panel.visible:
		return

	var mouse_pos = get_viewport().get_mouse_position()
	var viewport_size = get_viewport().get_visible_rect().size
	var panel_size = panel.size

	var target_pos = mouse_pos + tooltipOffset

	# Prevent tooltip from leaving screen horizontally
	target_pos.x = clamp(
		target_pos.x,
		0,
		viewport_size.x - panel_size.x
	)

	# Prevent tooltip from leaving screen vertically
	target_pos.y = clamp(
		target_pos.y,
		0,
		viewport_size.y - panel_size.y
	)

	panel.global_position = target_pos

