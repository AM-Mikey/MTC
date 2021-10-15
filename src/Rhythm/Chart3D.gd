extends Spatial

var chart_path = "res://src/Rhythm/Charts/test.json"
var data

var note_pos_y = -16
var chart_pos_y = 0

export var color_a = Color.orangered
export var color_b = Color.gold
export var color_c = Color.springgreen
export var color_d = Color.dodgerblue

var line_width = 5
var line_color = Color.dimgray
var line_count = 5
var line_distance = 32

var measure_width = 10
var measure_color = Color.dimgray
var measure_count = 99
var measure_distance = 128

#var staff_width = 99999
#var staff_height = 1080

var beats_per_measure = 4.0
var beat_value = 0.25

var tempo: float = 60

var velocity: Vector3

func _ready():
	setup_lane_lines()
	setup_measures()
	
#	spawn_note()
	
	
	load_data()
	

func setup_lane_lines():
	var lines_left = line_count
	var line_pos = Vector3(line_distance * (line_count -1) * -0.5, 0, 0)
	
	while lines_left > 0:
		print("added lane line")
		var line = ImmediateGeometry.new()
		add_child(line)
		
		line.add_vertex(line_pos)
		line.add_vertex(Vector3(line_pos.x, 0, -9999))
		
		#line.width = line_width
		line.set_color(line_color)
		
		
		lines_left -=1
		line_pos.x += line_distance



func setup_measures():
	var measures_left = measure_count
	var measure_pos = Vector3(line_distance * (line_count -1) * -0.5, 0, 0)
	
	while measures_left > 0:
		print("added measure")
		var measure = ImmediateGeometry.new()
		add_child(measure)
		
		measure.add_vertex(measure_pos)
		measure.add_vertex(Vector3(measure_pos.x * -1, 0, measure_pos.z))
		
		#measure.width = measure_width
		measure.set_color(measure_color)
		
		
		measures_left -=1
		measure_pos.z -= measure_distance

func _physics_process(delta):
	var beats_per_minute = tempo
	var measures_per_minute = beats_per_minute / beats_per_measure
	var seconds_per_measure = 60 / measures_per_minute
	var distance_per_second = measure_distance / seconds_per_measure

	velocity = Vector3(0, 0, distance_per_second)

	translate(velocity * delta)


func load_data():
	var file = File.new()
	if file.file_exists(chart_path):
		file.open(chart_path, File.READ)
		var text = file.get_as_text()
		data = JSON.parse(text).result
		#data = file.get_string()
		file.close()

	print(data)
	
	for n in data["notes"]:
		spawn_note(n[0], n[1], n[2])


func spawn_note(note_lane, note_start_time, note_value):
	var note = load("res://src/Rhythm/Note3D.tscn").instance()
	
	note.width = line_distance
	
	### note pitch
	
	note_lane = int(note_lane)
	
	if note_lane >=1 and note_lane <=4:
			match note_lane:
				1: #A
					note.color = color_a
					note.translation.x -= 1.5 * line_distance
				2: #B
					note.color = color_b
					note.translation.x -= 0.5 * line_distance
				3: #C
					note.color = color_c
					note.translation.x += 0.5 * line_distance
				4: #D
					note.color = color_d
					note.translation.x += 1.5 * line_distance
	else:
		printerr("ERROR: chart has note outside of pitch range")
	
	


	### note start time
	
	if note_start_time[1] > beats_per_measure:
		printerr("ERROR: chart has note with beat number higher than beats per measure")
	note.translation.z = ((note_start_time[0] - 1) * measure_distance * -1) + ((note_start_time[1] - 1) * (measure_distance/beats_per_measure) * -1)
	
	
	### note value
	
	if note_value != 0:
		note.depth = (note_value / (beats_per_measure * beat_value)) * measure_distance
	
	add_child(note)
