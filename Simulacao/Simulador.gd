extends Node2D

onready var EntrarSairButton = get_node("Actions/EntrarSair")
onready var ClosetBg = get_node("Background/Closet")
onready var MallBg = get_node("Background/Mall")
onready var ScreenLocked = get_node("ScreenLocked")

onready var DevolverCabidesButton = get_node("Actions/DevolverCabides")
onready var InserirRemoverCartaoButton = get_node("Actions/InserirRemoverCartao")

onready var TelaLogin = get_node("../InterfaceUsuario/TelaLogin")
onready var TelaRodizio = get_node("../InterfaceUsuario/TelaRodizio")
onready var TelaPreferencias = get_node("../InterfaceUsuario/TelaPreferencias")
onready var TelaPagamento = get_node("../InterfaceUsuario/TelaPagamento")

onready var EmailExample = get_node("EmailsDisplay/VBoxContainer/ScrollContainer/VBoxContainer/EmailExample")

var camera: Classes.CameraInteligente = null
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
		camera.aoClienteSairDoProvador()
		
		TelaLogin.ativar()
		TelaPreferencias.desativar()
		TelaPagamento.desativar()
		TelaRodizio.desativar()
		
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
	totalSpawned = 0
	
	for cabide in get_node("Cabides").get_children():
		cabide.cabide.devolverCabide()
		
		cabide.isDisabled = true
		cabide.queue_free()
		if cabide.produto != null:
			cabide.produto.queue_free()
	
	for produto in get_node("Roupas").get_children():
		produto.get_node("CollisionShape2D").disabled = true
	
	TelaRodizio.devolverRoupas()

func _ready():
	EmailExample.visible = false
	set_process(true)

func _process(delta):
	DevolverCabidesButton.disabled = !dentroDoProvador || !TelaRodizio.aceitaDevolucaoDeRoupas

var oCabide = preload("res://Simulacao/Cabide/CabideSimulado.tscn")
var oRoupaSimulada = preload("res://Simulacao/Roupa/RoupaSimulada.tscn")
var totalSpawned = 0
func aoReceberCabide(cabide: Classes.Cabide):
	var nCabide = oCabide.instance()
	nCabide.cabide = cabide
	nCabide.position.x = 70.0 * (totalSpawned % 5)
	nCabide.position.y = 110.0 * (int(floor(totalSpawned/5.0)) % 3)
	
	var nRoupa = oRoupaSimulada.instance()
	nRoupa.produto = cabide.produto
	nRoupa.get_node("Sprite").texture = load(cabide.produto.url)
	nRoupa.position.x = 70.0 * (totalSpawned % 5)
	nRoupa.position.y = 110.0 * (int(floor(totalSpawned/5.0)) % 3)
	
	get_node("Roupas").add_child(nRoupa)
	get_node("Cabides").add_child(nCabide)
	
	totalSpawned += 1

func aoReceberEmail(content: String):
	var email = EmailExample.duplicate()
	
	email.visible = true
	var time = OS.get_time()
	email.get_node("Timestamp").text = "%02d:%02d" % [time.hour, time.minute]
	email.get_node("Content/Label").text = content
	
	EmailExample.get_parent().add_child(email)
