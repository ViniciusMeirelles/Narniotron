extends Node2D

var produto

func _on_Area2D_area_entered(area):
	produto = area.get_parent().get_node("Produto")
	print("ROUPA RECONHECIDA!!")
