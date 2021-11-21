extends Node2D

func _ready():
	if sigGlobal.intScene == 1:
		$lblTextStuff.text = "END OF DEMO!"
		$btnContinue.visible = false
