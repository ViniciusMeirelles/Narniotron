extends Control

onready var espelho = get_parent().get_parent()


func _on_ButtonLogar_button_up():
	var email = get_node("Login/VBoxContainer/Email/email").text
	var senha = get_node("Login/VBoxContainer/Senha/senha").text
#	if espelho.tentativaDeLogin(email, senha):
	get_node("AnimationPlayer").play("login_fim")


# Vai para cadastro
func _on_ButtonRegistrar_button_up():
	get_node("AnimationPlayer").play("login_to_cadastro")


func _on_BotaoFinalizarCadastro_button_up():
	var nome = get_node("Cadastro/VBoxContainer/Nome/nome")
	var email = get_node("Cadastro/VBoxContainer/Email/email")
	var senha = get_node("Cadastro/VBoxContainer/Senha/senha")
#	espelho.cadastro(email, nome, senha)
