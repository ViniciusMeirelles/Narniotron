extends Node2D

onready var EntrarSairButton = get_node("Actions/EntrarSair")
onready var ClosetBg = get_node("Background/Closet")
onready var MallBg = get_node("Background/Mall")
onready var ScreenLocked = get_node("ScreenLocked")

onready var DevolverCabidesButton = get_node("Actions/DevolverCabides")
onready var InserirRemoverCartaoButton = get_node("Actions/InserirRemoverCartao")

onready var TelaRodizio = get_node("../InterfaceUsuario/TelaRodizio")
onready var TelaPagamento = get_node("../InterfaceUsuario/TelaPagamento")

var dentroDoProvador = false
func _on_EntrarSair_pressed():
	dentroDoProvador = !dentroDoProvador
	
	if dentroDoProvador:
		EntrarSairButton.text = "Sair do provador"
		ClosetBg.visible = true
		MallBg.visible = false
		ScreenLocked.visible = false
		InserirRemoverCartaoButton.disabled = false
	else:
		EntrarSairButton.text = "Entrar no provador"
		ClosetBg.visible = false
		MallBg.visible = true
		ScreenLocked.visible = true
		InserirRemoverCartaoButton.disabled = true

var cartaoInserido = false
func _on_InserirRemoverCartao_pressed():
	TelaPagamento.cartaoInserido = !TelaPagamento.cartaoInserido
	
	if TelaPagamento.cartaoInserido:
		InserirRemoverCartaoButton.text = "Remover cartão"
	else:
		InserirRemoverCartaoButton.text = "Inserir cartão"

func _on_DevolverCabides_pressed():
	TelaRodizio.devolverRoupas()

func _ready():
	set_process(true)

func _process(delta):
	DevolverCabidesButton.disabled = !dentroDoProvador || !TelaRodizio.aceitaDevolucaoDeRoupas
