extends Node2D

var produtos = {
	"ArgyleVestBlue": Classes.Produto.new("Argyle Vest Blue", 100.0, "res://Imagens/ArgyleVestBlue.png", ["estilo_01"], ["cor_01"], ["marca_01"], ["tipo_01"])
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
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
		produtos.ArgyleVestBlue,
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
