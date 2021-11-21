extends TextureButton

onready var dialog = get_node("Dialog")
onready var f = File.new()
onready var scenes = ['res://src/Dialog/Intro.txt', 'res://src/Dialog/Teacher.txt']
onready var imgBackGround = File.new()
onready var currentSprite = ""

func _ready():
	f.open(scenes[sigGlobal.gamedata["intScene"]], File.READ)
	var line = f.get_line()
	dialog.text = nextScript(line)
	get_node("Dialog/Sprite").self_modulate.a = 0.5

func nextScript(line):
	
	var script = ""
	
	if line == "[BROCHURES]":
		self.set_normal_texture(load('res://assets/Images/Background/map.jpg'))
		line = f.get_line()
	
	if line == "[POSTER]":
		self.set_normal_texture(load('res://assets/Images/Background/poster.jpg'))
		line = f.get_line()
	
	if line == "[JANITOR]":
		
		if currentSprite == "[JANITOR]":
			currentSprite = ""
			get_node("sprCharacter").texture = StreamTexture.new()
		
		else:
			currentSprite = "[JANITOR]"
			get_node("sprCharacter").texture = load('res://assets/Images/Janitor.png')
			get_node("sprCharacter").scale = Vector2(0.743, 0.702)
			get_node("sprCharacter").position = Vector2(920, 584)
		
		line = f.get_line()
	
	if line == "[OUTSIDE]":
		self.set_normal_texture(load('res://assets/Images/Background/outside final.PNG'))
		line = f.get_line()
	
	if line == "[ELEVATORDOOR]":
		self.set_normal_texture(load('res://assets/Images/Background/ElevatorDoor.jpg'))
		line = f.get_line()
	
	if line == "[ELEVATOR]":
		self.set_normal_texture(load('res://assets/Images/Background/elevator.jpg'))
		line = f.get_line()
	
	if line == "[STAIRS]":
		self.set_normal_texture(load('res://assets/Images/Background/stairs final.PNG'))
		line = f.get_line()
	
	if line == "[LECTURE]":
		self.set_normal_texture(load('res://assets/Images/Background/lecturehall final.jpg'))
		line = f.get_line()
	
	if line == "[PATH4]":
		self.set_normal_texture(load('res://assets/Images/Background/path4.jpg'))
		line = f.get_line()
	
	if line == "[PEPBENCH]":
		self.set_normal_texture(load('res://assets/Images/Background/pplonbench.jpg'))
		line = f.get_line()
	
	if line == "[RHYTHM]":
		get_tree().change_scene("res://src/Rhythm/World3D.tscn")
	
	if line == '[SCHOOL]':
		line = f.get_line()
		self.set_normal_texture(load('res://assets/Images/Troll.jpg'))
		line = f.get_line()
	
	if line == "[PLAYER]":
		get_node("CurrentCharacter").text = "[" + sigGlobal.gamedata.strProtagName + "]"
		line = f.get_line()
	
	if line == "[ENVIRONMENT]":
		get_node("CurrentCharacter").text = "[ENVIRONMENT]"
		line = f.get_line()
	
	if line == "[???]":
		get_node("CurrentCharacter").text = "[???]"
		line = f.get_line()
	
	if line == "Oh cool, so you are a JANITOR here at GCC, that has to be fun. Oh yeah I should probably introduce myself. My name is":
		script = str(script) + "\n" + str(line)
		self.disabled = true
		get_node("liePlayerInput").visible = true
		line = f.get_line()
	
	while not line == "":
		script = str(script) + "\n" + str(line)
		line = f.get_line()
		
	return script

func _pressed():
	
	var line = f.get_line()
	if not line == "":
		dialog.text = nextScript(line)

func _on_liePlayerInput_text_entered(new_text):
	self.disabled = false
	sigGlobal.gamedata.strProtagName = new_text
	get_node("liePlayerInput").visible = false
