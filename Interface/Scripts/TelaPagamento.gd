extends Control

var espelho: Classes.Espelho = null
signal finalizarTela

# Ativar resumo da compra
func ativar():
	get_node("AnimationPlayer").play("iniciar")
	adicionar_itens()

func adicionar_itens():
	var item_exemplo = get_node("Resumo/VBoxContainer/Itens/Item01")
	var primeiro_item = true
	
	for children in get_node("Resumo/VBoxContainer/Itens").get_children():
		if children.name == "Item01":
			continue
		
		children.queue_free()
	
	# Cria cada item
	for i in range(espelho.pedidoAtual.items.size()):
		var item: Classes.Item = espelho.pedidoAtual.items[i]
		
		var nodo_item
		nodo_item = item_exemplo.duplicate()
		nodo_item.visible = true
		nodo_item.owner = item_exemplo.owner
		item_exemplo.get_parent().add_child(nodo_item)
		
		var produto = item.produto
		# O nome do produto segue o modelo "tipo_marca_cor_tamanho"
		nodo_item.get_node("Nome").text = "%s (x%d)" % [produto.nome, item.quantidade]
		nodo_item.get_node("Valor").text = String(produto.preco)
	
	# Cria valor total
	var nodo_item = item_exemplo.duplicate()
	nodo_item.owner = item_exemplo.owner
	item_exemplo.get_parent().add_child(nodo_item)
	nodo_item.visible = true
	
	var valor_total = espelho.pedidoAtual.calcularValor()
	nodo_item.get_node("Nome").text = "Total"
	nodo_item.get_node("Valor").text = String(valor_total)

# Ir para tela de pagamento
var cartaoInserido = false
func _on_BotaoFinalizar_button_up():
	get_node("AnimationPlayer").play("resumo_to_pagar")
	yield(get_node("AnimationPlayer"), "animation_finished")
	
	while !cartaoInserido:
		yield(get_tree(), "idle_frame")
	
	realizarPagamento()

func realizarPagamento():
	espelho.aoRealizarPagamento()
	get_node("AnimationPlayer").play("pagar_to_aprovado")

# Pagamento aprovado ou recusado, sair
func _on_BotaoSair_button_up():
	espelho.logout()
	get_node("AnimationPlayer").play("finalizar")
	emit_signal("finalizarTela")
