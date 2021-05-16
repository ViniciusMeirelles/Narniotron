extends Node2D

var produtos = {
	"AcidWashedJeans": Classes.Produto.new("Acid Washed Jeans", 330.0, "res://Imagens/Calças/Acid-Washed_Jeans_(Blue)_NH_Storage_Icon.png", ["Simples", "Dia a dia"], ["Azul"], ["Label"], ["Calça"]),
	"AthleticShorts": Classes.Produto.new("Athletic Shorts", 140.0, "res://Imagens/Bermudas/Athletic_Shorts_(Red)_NH_Storage_Icon.png", ["Confortável", "Esportes"], ["Vermelho"], ["Able Sisters"], ["Bermuda"]),
	"BotanicalShorts": Classes.Produto.new("Botanical Shorts", 175.0, "res://Imagens/Bermudas/Botanical_Shorts_(Black)_NH_Storage_Icon.png", ["Confortável", "Dia a dia"], ["Verde", "Rosa"], ["Able Sisters"], ["Bermuda"]),
	"ChainPants": Classes.Produto.new("Chain Pants", 325.0, "res://Imagens/Calças/Chain_Pants_(Red)_NH_Storage_Icon.png", ["Festas", "Dia a dia"], ["Rosa"], ["Able Sisters"], ["Calça"]),
	"ComediansPants": Classes.Produto.new("Comedian's Pants", 525.0, "res://Imagens/Calças/Comedian's_Pants_(Orange)_NH_Storage_Icon.png", ["Festas"], ["Amarelo"], ["Label"], ["Calça"]),
	"DreamyPants": Classes.Produto.new("Dreamy Pants", 360.0, "res://Imagens/Calças/Dreamy_Pants_(Pink)_NH_Storage_Icon.png", ["Confortável"], ["Rosa"], ["Mabel"], ["Calça"]),
	"EmbroideredSkirt": Classes.Produto.new("Embroidered Skirt", 275.0, "res://Imagens/Saias/Embroidered-Pattern_Skirt_(Blue)_NH_Storage_Icon.png", ["Simples", "Dia a dia"], ["Azul"], ["Able Sisters"], ["Saia"]),
	"BasketballShoes": Classes.Produto.new("Basketball Shoes", 375.0, "res://Imagens/Calçados/Basketball_Shoes_(Red)_NH_Storage_Icon.png", ["Esportes"], ["Vermelho"], ["Kicks"], ["Calçado"]),
	"CuteSneakers": Classes.Produto.new("Cute Sneakers", 315.0, "res://Imagens/Calçados/Cute_Sneakers_(Light_Blue)_NH_Storage_Icon.png", ["Dia a dia"], ["Azul", "Rosa"], ["Mabel"], ["Calçado"]),
	"KerokerokeroppiBoots": Classes.Produto.new("Kerokerokeroppi Boots", 350.0, "res://Imagens/Calçados/Kerokerokeroppi_Boots_NH_Storage_Icon.png", ["Dia a dia"], ["Verde"], ["Mabel"], ["Calçado"]),
	"LabelleSneakers": Classes.Produto.new("Labelle Sneakers", 350.0, "res://Imagens/Calçados/Labelle_Sneakers_(Twilight)_NH_Storage_Icon.png", ["Dia a dia", "Esportes"], ["Rosa"], ["Label"], ["Calçado"]),
	"VisualPunkBoots": Classes.Produto.new("Visual-Punk Boots", 550.0, "res://Imagens/Calçados/Visual-Punk_Boots_NH_Storage_Icon.png", ["Dia a dia", "Festas"], ["Preto"], ["Kicks"], ["Calçado"]),
	"AdventureDress": Classes.Produto.new("Adventure Dress", 700.0, "res://Imagens/Vestidos/Adventure_Dress_NH_Storage_Icon.png", ["Festas"], ["Azul"], ["Able Sisters"], ["Vestido"]),
	"ChicTuxedoDress": Classes.Produto.new("Chic Tuxedo Dress", 560.0, "res://Imagens/Vestidos/Chic_Tuxedo_Dress_(Black)_NH_Storage_Icon.png", ["Festas"], ["Preto"], ["Label"], ["Vestido"]),
	"PineappleDress": Classes.Produto.new("Pineapple Dress", 375.0, "res://Imagens/Vestidos/Pineapple_Dress_NH_Storage_Icon.png", ["Dia a dia", "Festas"], ["Amarelo"], ["Mabel"], ["Vestido"]),
	"PrincessPeachDress": Classes.Produto.new("Princess Peach Dress", 1500.0, "res://Imagens/Vestidos/Princess_Peach_Dress_NH_Storage_Icon.png", ["Festas"], ["Rosa"], ["Able Sisters"], ["Vestido"]),
	"SailorCollarDress": Classes.Produto.new("Sailor-Collar Dress", 480.0, "res://Imagens/Vestidos/Sailor-Collar_Dress_(White)_NH_Storage_Icon.png", ["Dia a dia", "Simples"], ["Branco"], ["Able Sisters"], ["Vestido"]),
	"SunflowerDress": Classes.Produto.new("Sunflower Dress", 375.0, "res://Imagens/Vestidos/Sunflower_Dress_(White)_NH_Storage_Icon.png", ["Dia a dia", "Simples"], ["Branco", "Amarelo"], ["Mabel"], ["Vestido"]),
	"GumdropShoulderBag": Classes.Produto.new("Gumdrop Shoulder Bag", 500.0, "res://Imagens/Bolsas/Gumdrop_Shoulder_Bag_(Pop)_NH_Storage_Icon.png", ["Dia a dia", "Simples", "Confortável"], ["Branco", "Verde", "Rosa"], ["Mabel"], ["Bolsa"]),
	"NookKnapsack": Classes.Produto.new("Nook Knapsack", 400.0, "res://Imagens/Bolsas/Nook_Inc._Knapsack_NH_Storage_Icon.png", ["Dia a dia", "Simples", "Confortável"], ["Amarelo"], ["Nook"], ["Bolsa"]),
	"TownBackpack": Classes.Produto.new("Town Backpack", 260.0, "res://Imagens/Bolsas/Town_Backpack_(Green)_NH_Storage_Icon.png", ["Dia a dia", "Simples", "Confortável", "Esportes"], ["Verde"], ["Able Sisters"], ["Bolsa"]),
	"ThreeDGlasses": Classes.Produto.new("3D Glasses", 122.0, "res://Imagens/Acessórios/3D_Glasses_(White)_NH_Storage_Icon.png", ["Festas"], ["Branco", "Vermelho", "Azul"], ["Able Sisters"], ["Acessório"]),
	"Beak": Classes.Produto.new("Beak", 122.0, "res://Imagens/Acessórios/Beak_NH_Storage_Icon.png", ["Festas"], ["Amarelo"], ["Mabel"], ["Acessório"]),
	"BrowlineGlasses": Classes.Produto.new("Browline Glasses", 260.0, "res://Imagens/Acessórios/Browline_Glasses_(Black)_NH_Storage_Icon.png", ["Dia a dia", "Festas"], ["Amarelo", "Preto"], ["Label"], ["Acessório"]),
	"NookEyeMask": Classes.Produto.new("Nook Eye Mask", 200.0, "res://Imagens/Acessórios/Nook_Inc._Eye_Mask_NH_Storage_Icon.png", ["Simples", "Confortável"], ["Verde"], ["Nook"], ["Acessório"]),
	"WarioStache": Classes.Produto.new("Wario 'Stache", 300.0, "res://Imagens/Acessórios/Wario_'Stache_NH_Storage_Icon.png", ["Simples", "Festas"], ["Rosa", "Preto"], ["Mabel"], ["Acessório"]),
	"AranKnitSweater": Classes.Produto.new("Aran-Knit Sweater", 300.0, "res://Imagens/Blusões/Aran-Knit_Sweater_(Red)_NH_Storage_Icon.png", ["Simples", "Dia a dia", "Confortável"], ["Vermelho"], ["Able Sisters"], ["Blusão"]),
	"BearTee": Classes.Produto.new("Bear Tee", 200.0, "res://Imagens/Camisetas/Bear_Tee_NH_Storage_Icon.png", ["Simples", "Dia a dia", "Confortável"], ["Verde"], ["Mabel"], ["Camiseta"]),
	"CheckeredChesterfieldCoat": Classes.Produto.new("Checkered Chesterfield Coat", 595.0, "res://Imagens/Casacos/Checkered_Chesterfield_Coat_(Brown)_NH_Storage_Icon.png", ["Dia a dia"], ["Vermelho", "Branco"], ["Label"], ["Casaco"]),
	"ChickTee": Classes.Produto.new("Chick Tee", 200.0, "res://Imagens/Camisetas/Chick_Tee_NH_Storage_Icon.png", ["Simples", "Dia a dia", "Confortável"], ["Branco"], ["Able Sisters"], ["Camiseta"]),
	"PilotJacket": Classes.Produto.new("Pilot Jacket", 500.0, "res://Imagens/Casacos/DAL_Pilot_Jacket_NH_Storage_Icon.png", ["Dia a dia"], ["Verde"], ["Able Sisters"], ["Casaco"]),
	"NookAlohaShirt": Classes.Produto.new("Nook Aloha Shirt", 100.0, "res://Imagens/Camisetas/Green_Nook_Inc._Aloha_Shirt_NH_Storage_Icon.png", ["Dia a dia"], ["Verde"], ["Nook"], ["Camiseta"]),
	"MemeShirt": Classes.Produto.new("Meme Shirt", 240.0, "res://Imagens/Camisetas/Meme_Shirt_(Purple)_NH_Storage_Icon.png", ["Dia a dia", "Confortável"], ["Rosa"], ["Able Sisters"], ["Camiseta"]),
	"RainbowSweater": Classes.Produto.new("Rainbow Sweater", 300.0, "res://Imagens/Blusões/Rainbow_Sweater_(Black)_NH_Storage_Icon.png", ["Dia a dia", "Confortável"], ["Preto"], ["Able Sisters"], ["Blusão"]),
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
		produtos.AcidWashedJeans,
		produtos.AthleticShorts,
		produtos.BotanicalShorts,
		produtos.ChainPants,
		produtos.ComediansPants,
		produtos.DreamyPants,
		produtos.EmbroideredSkirt,
		produtos.BasketballShoes,
		produtos.CuteSneakers,
		produtos.KerokerokeroppiBoots,
		produtos.LabelleSneakers,
		produtos.VisualPunkBoots,
		produtos.AdventureDress,
		produtos.ChicTuxedoDress,
		produtos.PineappleDress,
		produtos.PrincessPeachDress,
		produtos.SailorCollarDress,
		produtos.SunflowerDress,
		produtos.GumdropShoulderBag,
		produtos.NookKnapsack,
		produtos.TownBackpack,
		produtos.ThreeDGlasses,
		produtos.Beak,
		produtos.BrowlineGlasses,
		produtos.NookEyeMask,
		produtos.WarioStache,
		produtos.AranKnitSweater,
		produtos.BearTee,
		produtos.CheckeredChesterfieldCoat,
		produtos.ChickTee,
		produtos.PilotJacket,
		produtos.NookAlohaShirt,
		produtos.MemeShirt,
		produtos.RainbowSweater,
	]
	
	for i in range(usuariosCadastrados.size()):
		var usuario: Classes.Usuario = usuariosCadastrados[i]
		usuario.connect("notificarFurto", get_node("Simulador"), "aoReceberEmail")
	
	cabideira = Classes.Cabideira.new([], null)
	
	for i in range(produtosEmEstoque.size()):
		var produto: Classes.Produto = produtosEmEstoque[i]
		var cabide = Classes.Cabide.new(produto, cabideira)
		cabideira.cabides.push_front(cabide)
		cabide.connect("aoEnviarCabide", get_node("Simulador"), "aoReceberCabide")
	
	espelho = Classes.Espelho.new(cabideira, usuariosCadastrados)
	cabideira.espelho = espelho
	
	camera = Classes.CameraInteligente.new(espelho)
	get_node("Simulador").camera = camera
	
	TelaLogin.espelho = espelho
	TelaPreferencias.espelho = espelho
	TelaRodizio.espelho = espelho
	TelaPagamento.espelho = espelho
	
	TelaLogin.connect("finalizarTela", TelaPreferencias, "ativar")
	TelaPreferencias.connect("finalizarTela", TelaRodizio, "ativar")
	TelaRodizio.connect("finalizarTela", TelaPagamento, "ativar")
	TelaPagamento.connect("finalizarTela", TelaLogin, "ativar")
