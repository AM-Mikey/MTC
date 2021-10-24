extends TextureButton

onready var dialog = get_node("Dialog")
onready var f = File.new()
onready var scenes = ['res://src/Dialog/Intro.txt']
onready var imgBackGround = File.new()
onready var strPlayerName = "Troll face So original"

func _ready():
	f.open(scenes[nodGlobal.intScene], File.READ)
	var line = f.get_line()
	dialog.text = nextScript(line)
	get_node("Dialog/Sprite").self_modulate.a = 0.5

func nextScript(line):
	
	var script = ""
	
	if line == "[RHYTHM]":
		get_tree().change_scene("res://src/Rhythm/RhythmScene.tscn")
		
	
	if line == '[SCHOOL]':
		line = f.get_line()
		self.set_normal_texture(load('res://assets/Images/Troll.jpg'))
		line = f.get_line()
	
	if line == "[PLAYER]":
		script = "[" + strPlayerName + "]"
		line = f.get_line()
	else:
		script = str(line)
		line = f.get_line()
	
	while not line == "":
		script = str(script) + "\n" + str(line)
		line = f.get_line()
		
	return script

func _pressed():
	
	var line = f.get_line()
	if not line == "":
		dialog.text = nextScript(line)
