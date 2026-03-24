extends Area2D

@onready var bookClosed = $Bookclosed
@onready var bookOpen = $Book

var isOpen = false

func _on_book_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		isOpen = !isOpen

		if isOpen:
			bookClosed.hide()
			bookOpen.show()
		else:
			bookOpen.hide()
			bookClosed.show()


func _on_bookclosed_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		isOpen = !isOpen

		if isOpen:
			bookClosed.hide()
			bookOpen.show()
		else:
			bookOpen.hide()
			bookClosed.show()


func _on_book_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		isOpen = !isOpen

		if isOpen:
			bookClosed.hide()
			bookOpen.show()
		else:
			bookOpen.hide()
			bookClosed.show()
