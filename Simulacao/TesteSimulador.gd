extends Node2D

onready var nSistema = get_node("Sistema")

var produtos = {
	"exampleShirt": Classes.Produto.new(["Estilo1"], 100.0, ["Cor1"], ["Marca1"], ["Tipo1"])
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
	
	for key in produtos.keys():
		var produto: Classes.Produto = produtos[key]
		var cabide = Classes.Cabide.new(produto, cabideira)
		cabideira.cabides.push_front(cabide)
	
	espelho = Classes.Espelho.new(cabideira, usuariosCadastrados)
	camera = Classes.CameraInteligente.new(espelho)
	
	TelaLogin.espelho = espelho
	TelaPreferencias.espelho = espelho
	TelaRodizio.espelho = espelho
	TelaPagamento.espelho = espelho
	
	TelaLogin.connect("finalizarTela", TelaPreferencias, "ativar")
	TelaPreferencias.connect("finalizarTela", TelaRodizio, "ativar")
	TelaRodizio.connect("finalizarTela", TelaPagamento, "ativar")
	TelaPagamento.connect("finalizarTela", TelaLogin, "ativar")
