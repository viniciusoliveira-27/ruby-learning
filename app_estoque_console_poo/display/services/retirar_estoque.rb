require 'terminal-table'

def retirar_estoque
  limpar_tela

  mensagem_amarelo("======= Escolha um dos produtos abaixo =======", false, false)

  table = Terminal::Table.new do |t|
    t.headings = ["ID", "Nome", "Quantidade"]
    # ProductService.new(JsonRepository, "db/products.json").get_all.each do |product|
    ProductService.new(CsvRepository, "db/products.csv").get_all.each do |product|
      t.add_row [product.id, product.name, product.quantity]
    end      
  end  
  puts table 

  mensagem_azul("Digite o ID do produto", false, false)
  id = gets.to_i

  # product = ProductService.new(JsonRepository, "db/products.json").get_all.find{|p| p.id == id}
  product = ProductService.new(CsvRepository, "db/products.csv").get_all.find{|p| p.id == id}
  unless product
    limpar_tela
    mensagem_vermelho("Produto do ID (#{id}) não encontrado na lista", false, false)
    mensagem_amarelo("Deseja digitar o numero novamente? (s/n)", false, false)
    opcao = gets.chomp.downcase
    if(opcao == "s" || opcao == "sim")
      retirar_estoque
    end

    limpar_tela
    return

  end

  limpar_tela
  mensagem_azul("Digite a quantidade que deseja retirar do estoque do produto #{amarelo(product.name)} ", false, false)
  mensagem_verde("Quantidade atual (#{amarelo(product.quantity)}): ", false, false)
  
  quantity = gets.to_i
  if (quantity < product.quantity)
    product.quantity = product.quantity- quantity
    mensagem_verde("Retirada realizada com sucesso ", true, true, 3)

    # ProductService.new(JsonRepository, "db/products.json").update(product)
    ProductService.new(CsvRepository, "db/products.csv").update(product)
  else
    mensagem_vermelho("Quantidade de retirada maior que o estoque disponivel", true, true, 3)
  end

  
  listar_produtos
end