extends Node2D

var produto: Classes.Produto = null
var cabide = null
var holding = false
var scaled = false

func _process(delta):
	if !scaled:
		if produto.tipos[0] == "Acessório":
			get_node("Sprite").z_index = 2
			scale = Vector2(0.85, 0.85)
		elif produto.tipos[0] == "Bermuda":
			scale = Vector2(0.6, 0.6)
		elif produto.tipos[0] == "Blusão":
			scale = Vector2(0.9, 0.9)
		elif produto.tipos[0] == "Bolsa":
			scale = Vector2(0.7, 0.7)
		elif produto.tipos[0] == "Calçado":
			scale = Vector2(0.6, 0.6)
		elif produto.tipos[0] == "Calça":
			scale = Vector2(0.75, 0.75)
		elif produto.tipos[0] == "Camiseta":
			scale = Vector2(0.75, 0.75)
		elif produto.tipos[0] == "Casaco":
			scale = Vector2(0.9, 0.9)
		elif produto.tipos[0] == "Saia":
			scale = Vector2(0.75, 0.75)
		elif produto.tipos[0] == "Vestido":
			scale = Vector2(1.0, 1.0)
	if holding:
		set_global_position(get_global_mouse_position())

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			holding = true
		else:
			holding = false
