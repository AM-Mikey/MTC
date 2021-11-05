extends Node2D


func _ready():
	get_node("aspMusic").stream = load('res://src/Audio/Janitor.wav')
	get_node("aspMusic").play()



func _on_aspMusic_finished():
	get_node("/root/sigGlobal").intScene = + 1
	get_tree().change_scene("res://src/VisualNovel/nodVisualNovel.tscn")
