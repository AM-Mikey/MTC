extends Area2D


var is_in_a = false
var is_in_b = false
var is_in_c = false
var is_in_d = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	if Input.is_action_just_pressed("note_a"):
		if is_in_a:
			hit("a")
	if Input.is_action_just_pressed("note_b"):
		if is_in_b:
			hit("b")
	if Input.is_action_just_pressed("note_c"):
		if is_in_c:
			hit("c")
	if Input.is_action_just_pressed("note_d"):
		if is_in_d:
			hit("d")

func hit(lane):
	$HitSound.play()


func _on_Cursor_area_entered(area):
	if area.get_collision_layer_bit(10):
		is_in_a = true
	if area.get_collision_layer_bit(11):
		is_in_b = true
	if area.get_collision_layer_bit(12):
		is_in_c = true
	if area.get_collision_layer_bit(13):
		is_in_d = true

func _on_Cursor_area_exited(area):
	if area.get_collision_layer_bit(10):
		is_in_a = false
	if area.get_collision_layer_bit(11):
		is_in_b = false
	if area.get_collision_layer_bit(12):
		is_in_c = false
	if area.get_collision_layer_bit(13):
		is_in_d = false
