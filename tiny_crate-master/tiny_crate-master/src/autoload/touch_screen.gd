extends CanvasLayer

onready var left := $Control/HBoxRight
onready var top := $Control/HBoxTop

onready var keys := [$Control/HBoxRight/C, $Control/HBoxRight/X]
onready var buttons := [$Control/HBoxRight/C/Control/Button, $Control/HBoxRight/X/Control/Button]
onready var joystick := $Control/Joystick

onready var btns := $Control/Joystick/Buttons.get_children()

func _ready():
	connect("visibility_changed", self, "vis")
	
	yield(get_tree(), "idle_frame")
	visible = (OS.has_touchscreen_ui_hint() and OS.get_name() == "HTML5") or OS.get_name() == "Android"
	vis()

func vis():
	if is_instance_valid(UI.keys_node):
		UI.keys_node.visible = !visible

func show_keys(arg_arrows := true, arg_c := true, arg_x := true, arg_pause := false, arg_passby := false):
	left.visible = arg_arrows
	keys[0].visible = arg_c
	keys[1].visible = arg_x
	top.visible = arg_pause

func set_game(arg := false):
	var i = "" if arg else "ui_"
	set_actions(i + "up", i + "down", i + "left", i + "right")
	buttons[0].action = "action" if arg else "ui_no"
	buttons[1].action = "jump" if arg else "ui_yes"
	for f in buttons:
		f.passby_press = arg

func set_actions(_up, _down, _left, _right):
	for i in 4:
		btns[i].action = [_right, _down, _left, _up][i]
		btns[i].passby_press = !("ui_" in _up)
