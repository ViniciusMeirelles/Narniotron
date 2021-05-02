extends Control

onready var espelho = get_parent().get_parent()

export var ativar_teste = false


func _ready():
	if ativar_teste:
		# Simula o espelho ativando a tela de preferencias com cores, marcas e
		#estilos ja definidos como preferencias
		ativar(["cor_01"], ["marca_01", "marca_02"], ["estilo_02"])


# Esta funcao recebe um array das cores, das marcas e dos estilos que o usuario
#prefere. Ela ativa as checkboxes de acordo com as preferencias recebidas
func ativar(cores:Array, marcas:Array, estilos:Array):
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
		if cores.find(nome_cor) != -1:
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
		if marcas.find(nome_marca) != -1:
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
		if estilos.find(nome_estilo) != -1:
			check_box.pressed = true


func _on_BotaoEscolher_button_up():
	var cores = []
	var marcas = []
	var estilos = []
	
	# CORES
	for cor in get_node("Preferencias/VBoxContainer/HBoxContainer/Cores").\
																 get_children():
		if cor.name!="Label": # Ignora o titulo da sessao
			if cor.get_node("CheckBox").pressed:
				cores.push_back(cor.get_node("Label").text)
	
	# MARCAS
	for marca in get_node("Preferencias/VBoxContainer/HBoxContainer/Marcas").\
																 get_children():
		if marca.name!="Label": # Ignora o titulo da sessao
			if marca.get_node("CheckBox").pressed:
				marcas.push_back(marca.get_node("Label").text)
	
	# ESTILOS
	for estilo in get_node("Preferencias/VBoxContainer/HBoxContainer/Estilos").\
																 get_children():
		if estilo.name!="Label": # Ignora o titulo da sessao
			if estilo.get_node("CheckBox").pressed:
				estilos.push_back(estilo.get_node("Label").text)
	
#	espelho.usuarioLogado.set_cores(cores)
#	espelho.usuarioLogado.set_marcas(marcas)
#	espelho.usuarioLogado.set_estilos(estilos)
