extends Button

func _pressed():
	var transition = get_node("AnimationPlayer")
	transition.play("FadeBlack")



#get_tree().change_scene("res://src/VisualNovel/nodVisualNovel.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeBlack":
		$AnimationPlayer.play("FadeOut")
