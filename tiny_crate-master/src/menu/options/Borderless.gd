extends CanvasItem

onready var fill = $Box/Fill
var is_selected = false

func _ready():
	fill.visible = OS.window_borderless

func select():
	is_selected = true

func deselect():
	is_selected = false

func _input(event):
	if is_selected and event.is_action_pressed("ui_yes"):
		var is_full = OS.window_borderless
		OS.window_borderless = !is_full
		Audio.play("menu_delete", 0.5, 1.5)
		fill.visible = !is_full
