require 'json'
class JsonRepository
  def self.read(file)
    unless File.exist?(file)
      puts "O arquivo #{file} não existe"
      return nil
    end

    begin
      json_data = File.read(file)
      data = JSON.parse(json_data)
      return data    
    rescue JSON::ParserError => e
      puts "Erro ao analisar o arquivo SON: #{e}"
      return nil
    end
  end

  def self.save(file, array)
    File.open(file, 'w') do |file|
      file.puts JSON.pretty_generate(array)
    end
    
  end

  def self.add(file, obj)
    data = read(file) || []

    data << obj

    self.save(file, data)
    
  end
end