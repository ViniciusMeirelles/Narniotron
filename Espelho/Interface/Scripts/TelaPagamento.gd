extends Control

onready var espelho = get_parent().get_parent()


func _ready():
	get_node("Resumo").show()
	get_node("Pagar").hide()
	get_node("PagamentoAprovado").hide()
	get_node("PagamentoRecusado").hide()


# Ativar resumo da compra
func ativar():
	get_node("AnimationPlayer").play("iniciar")
	adicionar_itens()


func adicionar_itens():
	var item_padrao = get_node("Resumo/VBoxContainer/Itens/Item01")
	var primeiro_item = true
	
	# Cria cada item
	for item in espelho.pedidoAtual.itens:
		var nodo_item
		if primeiro_item:
			nodo_item = item_padrao
			primeiro_item = false
		else:
			nodo_item = item_padrao.duplicate()
			nodo_item.owner = item_padrao.owner
			item_padrao.get_parent().add_child(nodo_item)
		
		var produto = item.produto
		# O nome do produto segue o modelo "tipo_marca_cor_tamanho"
		nodo_item.get_node("Nome").text = produto.tipo+"_"+produto.marca+"_"+\
		                                 produto.cor+"_"+String(produto.tamanho)
		nodo_item.get_node("Valor").text = String(produto.preco)
	
	# Cria valor total
	var nodo_item = item_padrao.duplicate()
	nodo_item.owner = item_padrao.owner
	item_padrao.get_parent().add_child(nodo_item)
	
	var valor_total = espelho.pedidoAtual.calculaValor()
	nodo_item.get_node("Nome").text = "Total"
	nodo_item.get_node("Valor").text = String(valor_total)
	


# Ir para tela de pagamento
func _on_BotaoFinalizar_button_up():
	get_node("AnimationPlayer").play("resumo_to_pagar")


# Realizar pagamento
func _on_BotaoPagar_button_up():
	pass # Replace with function body.
#	var pagamento_aprovado = espelho.realizarPagamento()
#	if pagamento_aprovado:
#		get_node("AnimationPlayer").play("pagar_to_aprovado")
#	else:
#		get_node("AnimationPlayer").play("pagar_to_recusado")


# Pagamento aprovado ou recusado, sair
func _on_BotaoSair_button_up():
	pass # Replace with function body.
#	espelho.logout()


# Pagamento recusado, tentar novamente
func _on_BotaoTentarNovamente_button_up():
	get_node("AnimationPlayer").play("recusado_to_pagar")
