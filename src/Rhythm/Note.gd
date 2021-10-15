extends Node2D

var lane: String

var length: float = 32
var width: float = 128
var color = Color.white

func _ready():
	match lane:
		"a": $PerfectDetector.set_collision_layer_bit(10, true)
		"b": $PerfectDetector.set_collision_layer_bit(11, true)
		"c": $PerfectDetector.set_collision_layer_bit(12, true)
		"d": $PerfectDetector.set_collision_layer_bit(13, true)
	
	
	var new_stylebox = $Panel.get_stylebox("panel").duplicate()
	new_stylebox.bg_color = color
	$Panel.add_stylebox_override("panel", new_stylebox)

	$Panel.margin_top = length * -1
	$Panel.margin_left = width * -0.5
	$Panel.margin_right = width * 0.5
