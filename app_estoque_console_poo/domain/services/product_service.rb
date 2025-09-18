class ProductService #Unit of work

  def initialize(repo, file)
    @repo = repo
    @file = file
  end
  # @file = "db/products.json"
  @file = "db/products.csv"
  def get_all
    dados = @repo.read(@file)
    products = []
    dados.each do |dado|
      products << Product.new(dado)            
    end
    products
  end

  def add(product)
    product_hash = self.transform_to_hash(product)
    @repo.add(@file, product_hash)
 
  end

  def update(product)
    dados = self.read(@file)
    product_hash = dados.find{|dado| dado["id"] == product.id}
    product_hash["name"] = product.name 
    product_hash["description"] = product.description 
    product_hash["price"] = product.price 
    product_hash["quantity"] = product.quantity 

    @repo.save(@file, dados) 
  end

  private 
  def transform_to_hash(product)
    product.instance_variables.each_with_object({}) do |var, hash|
      hash[var.to_s.delete("@")] = product.instance_variable_get(var)
    end
    
  end

end