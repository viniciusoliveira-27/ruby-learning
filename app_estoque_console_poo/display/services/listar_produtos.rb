require 'terminal-table'

def listar_produtos
  limpar_tela

  mensagem("======= Lista de produtos =======", false, false)

  table = Terminal::Table.new do |t|
    t.headings = ["ID", "Nome", "Descrição", "Preço", "Quantidade"]
    # ProductService.new(JsonRepository, "db/products.json").get_all.each do |product|
    ProductService.new(CsvRepository, "db/products.csv").get_all.each do |product|
      t.add_row [product.id, product.name, product.description, product.price, product.quantity]
    end      
  end  
  puts table 
  mensagem_amarelo("Digite enter para continuar ...", false, false)
  gets
  limpar_tela
end