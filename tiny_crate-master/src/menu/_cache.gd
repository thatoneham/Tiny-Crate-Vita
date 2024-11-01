extends Node2D


signal load_select_images
var cache_ := []
var load_array := [
		"res://media/image/Screens/1-1.png",
		"res://media/image/Screens/1-2.png",
		"res://media/image/Screens/1-3.png",
		"res://media/image/Screens/1-4.png",
		"res://media/image/Screens/1-5.png",
		"res://media/image/Screens/1-6.png",
		"res://media/image/Screens/1-7.png",
		"res://media/image/Screens/1-8.png",
		"res://media/image/Screens/2-1.png",
		"res://media/image/Screens/2-2.png",
		"res://media/image/Screens/2-3.png",
		"res://media/image/Screens/2-4.png",
		"res://media/image/Screens/2-5.png",
		"res://media/image/Screens/2-6.png",
		"res://media/image/Screens/2-7.png",
		"res://media/image/Screens/2-8.png",
		"res://media/image/Screens/3-1.png",
		"res://media/image/Screens/3-2.png",
		"res://media/image/Screens/3-3.png",
		"res://media/image/Screens/3-4.png",
		"res://media/image/Screens/3-5.png",
		"res://media/image/Screens/3-6.png",
		"res://media/image/Screens/3-7.png",
		"res://media/image/Screens/3-8.png",
		"res://media/image/Screens/4-1.png",
		"res://media/image/Screens/4-2.png",
		"res://media/image/Screens/4-3.png",
		"res://media/image/Screens/4-4.png",
		"res://media/image/Screens/4-5.png",
		"res://media/image/Screens/4-6.png",
		"res://media/image/Screens/4-7.png",
		"res://media/image/Screens/4-8.png",
		"res://media/image/Screens/5-1.png",
		"res://media/image/Screens/5-2.png",
		"res://media/image/Screens/5-3.png",
		"res://media/image/Screens/5-4.png",
		"res://media/image/Screens/6-1.png"
	]
var thread := Thread.new()

func _ready():
	if GlobalCache.loaded_cache == false:
		thread.start(self,"load_images",null)
func load_images() -> void:
	GlobalCache.loaded_cache = true
	for i in load_array.size():
		cache_.push_back(load(load_array[i]))
	call_deferred("emit_signal","load_select_images")
func _exit_tree():
	if thread.is_active():
		thread.wait_to_finish()
	thread = null
