extends Control

export(NodePath) var caminho_espelho
onready var espelho = get_node(caminho_espelho)


func _ready():
	get_node("Rodizio").show()
	get_node("Devolver").hide()


func _on_BotaoTerminar_button_up():
	get_node("AnimationPlayer").play("rodizio_to_devolver")
#	espelho.finalizarRodizio()


# Vai para tela de pagamento
func _on_BotaoDevolver_button_up():
	get_node("AnimationPlayer").play("finalizar")
