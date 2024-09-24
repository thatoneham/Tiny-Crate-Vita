tool
extends TouchScreenButton

export var radius := 60.0 setget set_radius
export var points := 5 setget set_points
export var angle := 0.0 setget set_angle
export var deadzone := 3.0 setget set_deadzone

export var poly_path : NodePath = ""
onready var poly : Polygon2D = get_node_or_null(poly_path)
export var inner_radius := 50.0 setget set_inner_radius
export var inner_offset := 5.0 setget set_inner_offset

func set_radius(arg := radius):
	radius = arg
	act()

func set_points(arg := points):
	points = arg
	act()

func set_angle(arg := angle):
	angle = arg
	act()

func set_deadzone(arg := deadzone):
	deadzone = arg
	act()

func set_inner_radius(arg := inner_radius):
	inner_radius = arg
	inner_act()

func set_inner_offset(arg := inner_offset):
	inner_offset = arg
	inner_act()

func act():
	shape = ConvexPolygonShape2D.new()
	shape.points = make_shape()

func inner_act():
	if is_instance_valid(poly):
		poly.polygon = make_shape(inner_radius)
		poly.position = Vector2(inner_offset, 0).rotated(deg2rad(angle))

func make_shape(_radius := radius, _points := points, _angle := angle, _deadzone := deadzone):
	var r = Vector2(_radius, 0)
	var vec = PoolVector2Array()
	
	for i in [1, 0, -1]:
		vec.append(Vector2(_deadzone, 0).rotated(deg2rad(_angle + (i * 45))))
	
	for i in _points:
		var f = i / float(_points - 1)
		vec.append(r.rotated(deg2rad(_angle + lerp(-45, 45, f))))
	
	return vec
