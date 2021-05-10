extends Control

export(NodePath) var caminho_espelho
onready var espelho = get_node(caminho_espelho)


func _ready():
	get_node("Login").show()
	get_node("Login/VBoxContainer/Erro").hide()
	get_node("Cadastro").hide()


func _on_ButtonLogar_button_up():
	var email = get_node("Login/VBoxContainer/Email/email").text
	var senha = get_node("Login/VBoxContainer/Senha/senha").text
	if espelho.tentativaDeLogin(email, senha):
		get_node("AnimationPlayer").play("login_fim")
	else:
		get_node("Login/VBoxContainer/Erro").show()


# Vai para cadastro
func _on_ButtonRegistrar_button_up():
	get_node("AnimationPlayer").play("login_to_cadastro")


func _on_BotaoFinalizarCadastro_button_up():
	var nome = get_node("Cadastro/VBoxContainer/Nome/nome").text
	var email = get_node("Cadastro/VBoxContainer/Email/email").text
	var senha = get_node("Cadastro/VBoxContainer/Senha/senha").text
	espelho.cadastro(email, nome, senha)
	get_node("AnimationPlayer").play("cadastro_fim")
