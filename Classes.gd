extends Node

onready var tree = get_tree()

class Produto:
	var nome: String
	var preco: float
	var url: String
	var estilos: Array #Array de strings
	var cores: Array
	var marcas: Array
	var tipos: Array
	
	func _init(_nome: String, _preco: float, _url: String, _estilos: Array, \
			_cores: Array, _marcas: Array, _tipos: Array):
		nome = _nome
		preco = _preco
		url = _url
		estilos = _estilos
		cores = _cores
		marcas = _marcas
		tipos = _tipos

class Item:
	var produto: Produto
	var quantidade: int
	
	func _init(_produto: Produto, _quantidade: int):
		produto = _produto
		quantidade = _quantidade

class Pedido:
	var items: Array = []
	var pedidoPago: bool = false
	
	func _init(_items: Array):
		items = _items
	
	func adicionarProduto(produto: Produto):
		for i in range(items.size()):
			var item: Item = items[i]
			
			if item.produto == produto:
				item.quantidade += 1
				return
		
		items.push_front(Item.new(produto, 1))
	
	func removerProduto(produto: Produto):
		for i in range(items.size()):
			var item: Item = items[i]
			
			if item.produto == produto:
				item.quantidade -= 1
				
				if item.quantidade == 0:
					items.remove(items.find(item))
				
				return
	
	func calcularValor() -> float:
		var precoTotal = 0
		
		# Estou usando isso ao invés do "for item in items:" para poder tipar o item
		for i in range(items.size()):
			var item: Item = items[i] 
			precoTotal += item.produto.preco * item.quantidade
		
		return precoTotal

class Preferencia:
	var cores: Array #Array de strings
	var marcas: Array #Array de strings
	var estilos: Array #Array de strings
	var tipos: Array #Array de strings
	
	func _init(_cor: Array, _marca: Array, _estilos: Array, _tipos: Array):
		cores = _cor
		marcas = _marca
		estilos = _estilos
		tipos = _tipos

class Usuario:
	var nome: String
	var email: String
	var senha: String
	var historicoDePedidos: Array #Array do tipo Pedido
	var preferencia: Preferencia #nullable
	signal notificarFurto(content)
	
	func _init(_nome: String, _email: String, _senha: String, _pedidos: Array, _preferencia: Preferencia):
		nome = _nome
		email = _email
		senha = _senha
		historicoDePedidos = _pedidos
		preferencia = _preferencia
	
	func notificarFurto():
		print("Você saiu de nossa loja sem pagar!")
		emit_signal("notificarFurto", \
		"Você foi flagrado saindo do provador NarnioTron sem pagar.\n" + \
		"Entre em contato com nossa administração para realizar a devolução ou pagamento dos produtos.")

class Cabide:
	var produto: Produto #nullable
	var cabideira: Cabideira
	signal aoEnviarCabide
	
	func _init(_produto: Produto, _cabideira: Cabideira):
		produto = _produto
		cabideira = _cabideira
	
	func irProProvador():
		emit_signal("aoEnviarCabide", self)
	
	func devolverCabide():
		cabideira.aoReceberCabide(self)

class Cabideira:
	var cabides: Array #Array de cabides
	var espelho: Espelho
	
	func _init(_cabides: Array, _espelho: Espelho):
		cabides = _cabides
		espelho = _espelho
	
	func pegarEstoque() -> Array:
		var produtos: Array = []
		
		for i in range(cabides.size()):
			var cabide: Cabide = cabides[i]
			if cabide.produto != null:
				produtos.push_front(cabide.produto)
		
		return produtos
	
	func solicitarProdutos(produtos: Array):
		for i in range(produtos.size()):
			var produto: Produto = produtos[i]
			var cabide = encontraCabideDoProduto(produto)
			
			if cabide != null:
				cabides.remove(cabides.find(cabide))
				cabide.irProProvador()
	
	func encontraCabideDoProduto(produto: Produto) -> Cabide:
		for i in range(cabides.size()):
			var cabide: Cabide = cabides[i]
			
			if cabide.produto == produto:
				return cabide
		
		return null
	
	func aoReceberCabide(cabide: Cabide):
		cabides.push_back(cabide)
		if cabide.produto != null:
			espelho.pedidoAtual.removerProduto(cabide.produto)

class Espelho:
	var cabideira: Cabideira
	var usuariosCadastrados: Array #Array 
	var usuarioLogado: Usuario = null
	var pedidoAtual: Pedido
	var rodizioAtivo: bool = false
	signal aoCadastrarUsuario(usuario)
	
	func _init(_cabideira: Cabideira, _usuariosCadastrados: Array):
		cabideira = _cabideira
		usuariosCadastrados = _usuariosCadastrados
	
	func aoRealizarPagamento():
		pedidoAtual.pedidoPago = true
		usuarioLogado.historicoDePedidos.push_front(pedidoAtual)
		pedidoAtual = Pedido.new([])
	
	func tentativaDeLogin(email: String, senha: String) -> bool:
		for i in range(usuariosCadastrados.size()):
			var usuarioCadastrado: Usuario = usuariosCadastrados[i]
			
			if usuarioCadastrado.email == email and usuarioCadastrado.senha == senha:
				usuarioLogado = usuarioCadastrado
				pedidoAtual = Pedido.new([])
				return true
		
		return false
	
	func logout():
		usuarioLogado = null
	
	func cadastrarUsuario(email: String, nome: String, senha: String):
		var novoUsuario = Usuario.new(nome, email, senha, [], Preferencia.new([], [], [], []))
		usuariosCadastrados.push_front(novoUsuario)
		emit_signal("aoCadastrarUsuario", novoUsuario)
	
	func aoClienteSairDoProvador():
		if usuarioLogado == null: return
		
		if pedidoAtual.items.size() == 0: 
			logout()
			return
		
		if pedidoAtual.pedidoPago:
			logout()
			return
		
		usuarioLogado.historicoDePedidos.push_front(pedidoAtual)
		usuarioLogado.notificarFurto()
		logout()
	
	func pesquisarEEnviarRoupas():
		var preferencia: Preferencia = usuarioLogado.preferencia
		
		var produtos = cabideira.pegarEstoque()
		for i in range(produtos.size()):
			var produto: Produto = produtos[i]
			
			var corAceita = false
			for corPreferencial in preferencia.cores:
				for corDoProduto in produto.cores:
					if corPreferencial == corDoProduto:
						corAceita = true
			if !corAceita: continue
			
			var tipoAceito = false
			for tipoPreferencial in preferencia.tipos:
				for tipoDoProduto in produto.tipos:
					if tipoPreferencial == tipoDoProduto:
						tipoAceito = true
			if !tipoAceito: continue
			
			var estiloAceito = false
			for estiloPreferencial in preferencia.estilos:
				for estiloDoProduto in produto.estilos:
					if estiloPreferencial == estiloDoProduto:
						estiloAceito = true
			if !estiloAceito: continue
			
			var marcaAceita = false
			for marcaPreferencial in preferencia.marcas:
				for marcaDoProduto in produto.marcas:
					if marcaPreferencial == marcaDoProduto:
						marcaAceita = true
			if !marcaAceita: continue
			
			pedidoAtual.adicionarProduto(produto)
			cabideira.solicitarProdutos([produto])
			return true
		
		return false
	
	func iniciarRodizio():
		rodizioAtivo = true
		
		while rodizioAtivo:
			if usuarioLogado == null:
				return
			
			var roupaEncontrada = pesquisarEEnviarRoupas()
			if !roupaEncontrada: break
			yield(Classes.tree.create_timer(5.0), "timeout")
		
		print("Não temos mais nenhuma roupa que corresponda a essas preferências")
		#TODO: Implementar integração com o simulador
	
	func encerrarRodizio():
		rodizioAtivo = false

class CameraInteligente:
	var espelho: Espelho
	
	func _init(_espelho: Espelho):
		espelho = _espelho
	
	func aoClienteSairDoProvador():
		espelho.aoClienteSairDoProvador()
