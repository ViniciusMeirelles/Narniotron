extends Node2D

var produto: Classes.Produto = null
var cabide = null
var holding = false

func _process(delta):
	if holding:
		set_global_position(get_global_mouse_position())

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			holding = true
		else:
			holding = false
