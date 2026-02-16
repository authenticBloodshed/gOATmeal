extends Node2D

func _on_button_close_notes_pressed():
	$ButtonNotes.show()
	$NotebookLined.hide()
	$NotesEditText.hide()
	$ButtonCloseNotes.hide()

func _on_button_notes_pressed():
	$ButtonNotes.hide()
	$NotebookLined.show()
	$NotesEditText.show()
	$ButtonCloseNotes.show()
