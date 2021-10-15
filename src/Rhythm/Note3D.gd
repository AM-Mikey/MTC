extends Spatial


var width: float = 128
var height: float = 2
var depth: float = 32

var color = Color.white

func _ready():
#	var new_stylebox = $Panel.get_stylebox("panel").duplicate()
#	new_stylebox.bg_color = color
#	$CSGBox.add_stylebox_override("panel", new_stylebox)

	
	$MeshInstance.mesh.size.x = width
	$MeshInstance.mesh.size.y = height
	$MeshInstance.mesh.size.z = depth
