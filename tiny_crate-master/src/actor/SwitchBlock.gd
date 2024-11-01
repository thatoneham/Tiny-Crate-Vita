tool
extends Actor
class_name SwitchBlock

export var color := "red"
export var frame_on := 10
export var frame_off := 8
export (bool) var inverted := false
onready var node_sprite : Sprite = $Sprite

var is_switch = false

func _ready():
	if Engine.editor_hint: return
	
	for i in get_tree().get_nodes_in_group("switch_" + color):
		if not inverted:
			i.connect("press", self, "switch_on")
			i.connect("release", self, "switch_off")
		else:
			i.connect("release", self, "switch_on")
			i.connect("press", self, "switch_off")
			switch_on()
		break

func _physics_process(delta):
	if Engine.editor_hint: return
	
	if is_switch and !is_solid and !is_area_solid_actor(position.x, position.y):
		is_solid = true
		node_sprite.frame = frame_on

func switch_on():
	is_switch = true

func switch_off():
	is_switch = false
	is_solid = false
	node_sprite.frame = frame_off


