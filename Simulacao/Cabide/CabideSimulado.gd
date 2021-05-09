extends Node2D

signal roupa_devolvida(roupa)

func _on_Area2D_area_entered(area):
	emit_signal("roupa_devolvida", area.get_parent())
	print("ROUPA DEVOLVIDA!!")
