require_relative "display/menu"
require_relative "display/operacoes_de_tela"
require_relative "core/cadastrar_produto"
require_relative "core/listar_produtos"
require_relative "core/retirar_estoque"


produtos = [
    {
        id: 1,
        nome: "Maça",
        descricao: "Maça Fugi",
        preco: 2.5,
        quantidade: 20  
    },
    {
        id: 2,
        nome: "Banana",
        descricao: "Banana Nanica",
        preco: 2.5,
        quantidade: 20  
    }
]
iniciar_menu(produtos)