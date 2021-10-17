extends Spatial

signal health_updated(health)

const HIT = preload("res://src/Rhythm/Effects/Hit.tscn")
const MISS = preload("res://src/Rhythm/Effects/Miss.tscn")

var started = false
var health: float = 100

func _ready():
	connect("health_updated", $UILayer/Health, "on_health_updated")
	yield(get_tree().create_timer(1.6), "timeout")
	started = true


func _physics_process(delta):
	if started:
		if health > 100:
			health = 100
		if health < 0:
			health = 0
		
		health -= 0.05
		
		
		emit_signal("health_updated", health)
		

func on_hit(lane, score, timing):
	health += 5
	emit_signal("health_updated", health)
	
	print("adding hit effect")
	var hit = HIT.instance()
	
	match lane:
		"a": $PosA.add_child(hit)
		"b": $PosB.add_child(hit)
		"c": $PosC.add_child(hit)
		"d": $PosD.add_child(hit)

func on_miss(lane):
	health -= 10
	emit_signal("health_updated", health)
	
	print("adding miss effect")
	var miss = MISS.instance()

	match lane:
		"a": $PosA.add_child(miss)
		"b": $PosB.add_child(miss)
		"c": $PosC.add_child(miss)
		"d": $PosD.add_child(miss)