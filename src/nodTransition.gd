extends Node2D

onready var player = get_node("aniTransition")
var currentScene = ""

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)

func goto_scene():
	get_tree().get_root().add_child(currentScene)
	player.play("FadeBlack")

func _on_aniTransition_animation_finished(anim_name):
	if anim_name == "FadeBlack":
		get_tree().get_root().add_child(currentScene)
		get_tree().set_current_scene(currentScene)
		player.play("FadeOut")
