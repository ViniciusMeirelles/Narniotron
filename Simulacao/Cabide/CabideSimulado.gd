extends Node2D

var cabide: Classes.Cabide = null
var produto = null
var isDisabled = false

func _on_Area2D_body_entered(body):
	if isDisabled:
		return
	
	print("Pendurou a roupa")
	produto = body
	cabide.produto = body.produto

func _on_Area2D_body_exited(body):
	if isDisabled:
		return
	
	print("Removeu a roupa")
	produto = null
	cabide.produto = null
