extends Control

var espelho: Classes.Espelho = null
signal finalizarTela

func _ready():
	get_node("Rodizio").show()
	get_node("Devolver").hide()

var ativado = false
func ativar():
	ativado = true
	aceitaDevolucaoDeRoupas = false
	espelho.iniciarRodizio()
	get_node("AnimationPlayer").play("iniciar")

var aceitaDevolucaoDeRoupas = false
func _on_BotaoTerminar_button_up():
	espelho.encerrarRodizio()
	get_node("AnimationPlayer").play("rodizio_to_devolver")
	aceitaDevolucaoDeRoupas = true

# Vai para tela de pagamento
func devolverRoupas():
	aceitaDevolucaoDeRoupas = false
	get_node("AnimationPlayer").play("finalizar")
	emit_signal("finalizarTela")
	ativado = false

func desativar():
	if ativado:
		ativado = false
		get_node("AnimationPlayer").play("finalizar")
