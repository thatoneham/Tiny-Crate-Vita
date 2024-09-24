extends CanvasItem

onready var fill = $Box/Fill
var is_selected = false

func _ready():
	fill.visible = OS.window_fullscreen

func select():
	is_selected = true

func deselect():
	is_selected = false

# HTML5 fullscreen fix
func _input(event):
	if is_selected and event.is_action_pressed("ui_yes"):
		var is_full = OS.window_fullscreen
		Shared.set_fullscreen(!is_full)
		#OS.window_fullscreen = !is_full
		Shared.set_window_scale()
		Audio.play("menu_pause", 0.7, 1.3)
		fill.visible = !is_full
		if !is_full:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
