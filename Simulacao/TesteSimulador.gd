extends Node2D

var produtos = {
	"exampleShirt": Classes.Produto.new(["estilo_01"], 100.0, ["cor_01"], ["marca_01"], ["tipo_01"])
}

onready var node = {
	"Login": {
		"Buttons": {
			"Logar": get_node("InterfaceUsuario/TelaLogin/Login/VBoxContainer/Botoes/ButtonLogar"),
			"Registrar": get_node("InterfaceUsuario/TelaLogin/Login/VBoxContainer/Botoes/ButtonRegistrar"),
		},
		"Email": get_node("InterfaceUsuario/TelaLogin/Login/VBoxContainer/Email/email"),
		"Senha": get_node("InterfaceUsuario/TelaLogin/Login/VBoxContainer/Senha/senha"),
		"Erro": get_node("InterfaceUsuario/TelaLogin/Login/VBoxContainer/Erro"),
	},
}

onready var TelaLogin = get_node("InterfaceUsuario/TelaLogin")
onready var TelaPreferencias = get_node("InterfaceUsuario/TelaPreferencias")
onready var TelaRodizio = get_node("InterfaceUsuario/TelaRodizio")
onready var TelaPagamento = get_node("InterfaceUsuario/TelaPagamento")

var cabideira: Classes.Cabideira = null
var espelho: Classes.Espelho = null
var camera: Classes.CameraInteligente = null

func _ready():
	var usuariosCadastrados = [
		Classes.Usuario.new("a", "a", "a", [], Classes.Preferencia.new([], [], [], []))
	]
	var produtosEmEstoque = [
		produtos.exampleShirt
	]
	
	cabideira = Classes.Cabideira.new([], null)
	
	for i in range(produtosEmEstoque.size()):
		var produto: Classes.Produto = produtosEmEstoque[i]
		var cabide = Classes.Cabide.new(produto, cabideira)
		cabideira.cabides.push_front(cabide)
		cabide.connect("aoEnviarCabide", get_node("Simulador"), "aoReceberCabide")
	
	espelho = Classes.Espelho.new(cabideira, usuariosCadastrados)
	cabideira.espelho = espelho
	
	camera = Classes.CameraInteligente.new(espelho)
	
	TelaLogin.espelho = espelho
	TelaPreferencias.espelho = espelho
	TelaRodizio.espelho = espelho
	TelaPagamento.espelho = espelho
	
	TelaLogin.connect("finalizarTela", TelaPreferencias, "ativar")
	TelaPreferencias.connect("finalizarTela", TelaRodizio, "ativar")
	TelaRodizio.connect("finalizarTela", TelaPagamento, "ativar")
	TelaPagamento.connect("finalizarTela", TelaLogin, "ativar")
