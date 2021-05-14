extends Node2D

var cabide: Classes.Cabide = null
var produto = null
var isDisabled = false

func _on_Area2D_body_entered(body):
	if isDisabled:
		return
	
	var cabideVazio = produto == null
	if !cabideVazio:
		return
	
	var produtoSolto = produto == null
	if !produtoSolto:
		return
	
	print("Pendurou a roupa")
	produto = body
	cabide.produto = body.produto
	produto.cabide = self

func _on_Area2D_body_exited(body):
	if isDisabled:
		return
	
	print("Removeu a roupa")
	if produto != null:
		produto.cabide = null
	produto = null
	cabide.produto = null
