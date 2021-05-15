extends Control

var espelho: Classes.Espelho = null
signal finalizarTela

func _ready():
	get_node("Login").show()
	get_node("Login/VBoxContainer/Erro").hide()
	get_node("Cadastro").hide()

var ativado = false
func ativar():
	if !ativado:
		ativado = true
		get_node("AnimationPlayer").play("iniciar")

func _on_ButtonLogar_button_up():
	var email = get_node("Login/VBoxContainer/Email/email").text
	var senha = get_node("Login/VBoxContainer/Senha/senha").text
	if espelho.tentativaDeLogin(email, senha):
		get_node("Login/VBoxContainer/Erro").hide()
		get_node("AnimationPlayer").play("login_fim")
		emit_signal("finalizarTela")
		ativado = false
	else:
		get_node("Login/VBoxContainer/Erro").show()

# Vai para cadastro
func _on_ButtonRegistrar_button_up():
	get_node("AnimationPlayer").play("login_to_cadastro")

func _on_BotaoFinalizarCadastro_button_up():
	var nome = get_node("Cadastro/VBoxContainer/Nome/nome").text
	var email = get_node("Cadastro/VBoxContainer/Email/email").text
	var senha = get_node("Cadastro/VBoxContainer/Senha/senha").text
	espelho.cadastrarUsuario(email, nome, senha)
	get_node("Login/VBoxContainer/Erro").hide()
	get_node("AnimationPlayer").play("cadastro_fim")
