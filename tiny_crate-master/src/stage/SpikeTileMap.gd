extends TileMap

var scene_spike = preload("res://src/actor/Spike.tscn")
var scene_spike_long = preload("res://src/actor/SpikeLong.tscn")
export var tag := "spike"
func _ready():
	pass
#func _ready():
#	if !Shared.is_level_select:
#		for pos in get_used_cells():
#			var cell = cell_size.x
#			var inst = null
#			if get_cell(pos.x,pos.y) == 0:
#				inst = scene_spike.instance()
#				inst.position = Vector2(pos.x * cell, pos.y * cell + 5)
#			else:
#				inst = scene_spike_long.instance()
#				inst.position = Vector2(pos.x * cell, pos.y * cell)
#			add_child(inst)
#		clear()
