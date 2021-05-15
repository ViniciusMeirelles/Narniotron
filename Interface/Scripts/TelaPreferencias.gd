extends Control

var espelho: Classes.Espelho = null
signal finalizarTela

var ativado = false
func ativar():
	var preferencias = espelho.usuarioLogado.preferencia
	
	ativado = true
	get_node("AnimationPlayer").play("iniciar")
	
	# Estabelece preferencias
	# CORES
	for cor in get_node("Preferencias/VBoxContainer/HBoxContainer/Cores").\
																 get_children():
		if cor.name=="Label": # Ignora o titulo da sessao
			continue
		var nome_cor = cor.get_node("Label").text
		var check_box = cor.get_node("CheckBox")
		
		# Procura cada cor no array de cores que o usuário prefere
		check_box.pressed = false
		if preferencias.cores.find(nome_cor) != -1:
			check_box.pressed = true
	
	# MARCAS
	for marca in get_node("Preferencias/VBoxContainer/HBoxContainer/Marcas").\
																 get_children():
		if marca.name=="Label": # Ignora o titulo da sessao
			continue
		var nome_marca = marca.get_node("Label").text
		var check_box = marca.get_node("CheckBox")
		
		# Procura cada marca no array de marcas que o usuário prefere
		check_box.pressed = false
		if preferencias.marcas.find(nome_marca) != -1:
			check_box.pressed = true
	
	# ESTILOS
	for estilo in get_node("Preferencias/VBoxContainer/HBoxContainer/Estilos").\
																 get_children():
		if estilo.name=="Label": # Ignora o titulo da sessao
			continue
		var nome_estilo = estilo.get_node("Label").text
		var check_box = estilo.get_node("CheckBox")
		
		# Procura cada estilo no array de estilos que o usuário prefere
		check_box.pressed = false
		if preferencias.estilos.find(nome_estilo) != -1:
			check_box.pressed = true
	
	# TIPOS
	for tipo in get_node("Preferencias/VBoxContainer/HBoxContainer/Tipos").\
																 get_children():
		if tipo.name=="Label": # Ignora o titulo da sessao
			continue
		var nome_tipo = tipo.get_node("Label").text
		var check_box = tipo.get_node("CheckBox")
		
		# Procura cada estilo no array de estilos que o usuário prefere
		check_box.pressed = false
		if preferencias.tipos.find(nome_tipo) != -1:
			check_box.pressed = true

func _on_BotaoEscolher_button_up():
	var preferencias = espelho.usuarioLogado.preferencia
	
	# CORES
	for cor in get_node("Preferencias/VBoxContainer/HBoxContainer/Cores").\
																 get_children():
		if cor.name == "Label":
			# Ignora o titulo da sessao
			continue
		
		var text = cor.get_node("Label").text
		if cor.get_node("CheckBox").pressed:
			if !preferencias.cores.has(text): 
				preferencias.cores.push_back(text)
		else:
			preferencias.cores.erase(text)
	
	# MARCAS
	for marca in get_node("Preferencias/VBoxContainer/HBoxContainer/Marcas").\
																 get_children():
		if marca.name == "Label":
			# Ignora o titulo da sessao
			continue
		
		var text = marca.get_node("Label").text
		if marca.get_node("CheckBox").pressed:
			if !preferencias.marcas.has(text): 
				preferencias.marcas.push_back(text)
		else:
			preferencias.marcas.erase(text)
	
	# ESTILOS
	for estilo in get_node("Preferencias/VBoxContainer/HBoxContainer/Estilos").\
																 get_children():
		if estilo.name == "Label":
			# Ignora o titulo da sessao
			continue
		
		var text = estilo.get_node("Label").text
		if estilo.get_node("CheckBox").pressed:
			if !preferencias.estilos.has(text): 
				preferencias.estilos.push_back(text)
		else:
			preferencias.estilos.erase(text)
	
	# TIPOS
	for tipo in get_node("Preferencias/VBoxContainer/HBoxContainer/Tipos").\
																 get_children():
		if tipo.name == "Label":
			# Ignora o titulo da sessao
			continue
		
		var text = tipo.get_node("Label").text
		if tipo.get_node("CheckBox").pressed:
			if !preferencias.tipos.has(text): 
				preferencias.tipos.push_back(text)
		else:
			preferencias.tipos.erase(text)
	
	get_node("AnimationPlayer").play("finalizar")
	emit_signal("finalizarTela")
	ativado = false

func desativar():
	if ativado:
		ativado = false
		get_node("AnimationPlayer").play("finalizar")
