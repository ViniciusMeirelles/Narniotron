extends Control

var espelho: Classes.Espelho = null
signal finalizarTela

func _ready():
	get_node("Rodizio").show()
	get_node("Devolver").hide()

func ativar():
	espelho.iniciarRodizio()
	get_node("AnimationPlayer").play("iniciar")

func _on_BotaoTerminar_button_up():
	get_node("AnimationPlayer").play("rodizio_to_devolver")
	espelho.encerrarRodizio()

# Vai para tela de pagamento
func _on_BotaoDevolver_button_up():
	get_node("AnimationPlayer").play("finalizar")
	emit_signal("finalizarTela")
