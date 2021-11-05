extends Button

func _on_btnExit_pressed():
	get_tree().change_scene("res://src/Main Menu/nodMainMenu.tscn")


func _on_btnContinue_pressed():
	get_tree().change_scene("res://src/Rhythm/World3D.tscn")
