def cadastrar_produto
  mensagem("Iniciando cadastro de produto ...", true, true, 1.5)
  mensagem_azul("Digite o nome do produto", false, false)
  name = gets.chomp
  limpar_tela
  
  mensagem_azul("Digite a descrição do produto (#{verde(name)})", false, false)
  description = gets.chomp
  limpar_tela

  mensagem_azul("Digite o preço do produto (#{verde(name)})", false, false)
  price = gets.to_f
  limpar_tela

  mensagem_azul("Digite a quantidade em estoque do produto (#{verde(name)})", false, false)
  quantity = gets.to_i
  limpar_tela

  p = Product.new ({
    "id" => Time.now.to_i,
    "name" => name,
    "description" => description,
    "price" => price,
    "quantity" => quantity
  })
  
  # ProductService.new(JsonRepository, "db/products.json").add(p)
  ProductService.new(CsvRepository, "db/products.csv").add(p)

    mensagem("O #{amarelo(name)} foi cadastrado com sucesso!", true, true, 3)

end