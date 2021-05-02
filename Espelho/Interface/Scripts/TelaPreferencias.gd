extends Control

export var ativar_teste = false

func _ready():
	if ativar_teste:
		# Simula o espelho ativando a tela de preferencias com cores, marcas e
		#estilos ja definidos como preferencias
		ativar(["cor_01"], ["marca_01", "marca_02"], ["estilo_02"])


# Esta funcao recebe um array das cores, das marcas e dos estilos que o usuario
#prefere. Ela ativa as checkboxes de acordo com as preferencias recebidas
func ativar(cores:Array, marcas:Array, estilos:Array):
	$AnimationPlayer.play("iniciar")
	
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
