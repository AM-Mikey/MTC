extends Node2D

func _ready():
	get_node("aspBGM").play()

func _on_aspBGM_finished():
	get_node("aspBGM").play()
