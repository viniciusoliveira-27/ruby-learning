# testes_passados = gets.to_f
# total_testes = gets.to_f

# # TODO: Calcule a taxa de sucesso e armazene-a na variável taxa_sucesso
# taxa_sucesso = (testes_passados/total_testes) * 100

# puts taxa_sucesso

# # Exibe a taxa de sucesso com 2 casas decimais
# puts "Taxa de sucesso: #{'%.2f' % taxa_sucesso}%"
# 

# Lê as entradas
# capacidade_atual, aumento_percentual = gets.chomp.split.map(&:to_f)


# nova_capacidade = capacidade_atual+(aumento_percentual/100*capacidade_atual)

# puts "nova capacidade do disco de mytrill é de #{nova_capacidade.to_i}"

# TODO: Calcule a nova capacidade do disco de Mithril

# TODO: Imprima a nova capacidade
# 

valor_inicial = gets.to_f
taxa_juros = gets.to_f
periodo = gets.to_i

def calcular_valor_final(valor_inicial, taxa_juros, periodo)
  valor_final = valor_inicial
  
  montante = valor_inicial*(1+taxa_juros)**periodo

  valor_final = montante

  # TODO: Itera, com base no período em anos, para calcular o valor final com os juros.

  # Retorna o valor final do investimento, arredondado para duas casas decimais
  return valor_final.round(2)
end

# Calcula o valor final do investimento
valor_final = calcular_valor_final(valor_inicial, taxa_juros, periodo)

# Exibe o valor final do investimento
puts "Valor final do investimento: R$ #{valor_final}"