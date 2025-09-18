require 'csv'

class CsvRepository
  # Lê CSV e retorna um array de hashes
  def self.read(file)
    return [] unless File.exist?(file)

    data = []
    CSV.foreach(file, headers: true) do |row|
      data << row.to_h
    end
    data
  end

  # Salva um array de hashes em CSV
  def self.save(file, array)
    return if array.nil? || array.empty?

    headers = array.first.keys

    CSV.open(file, "w", write_headers: true, headers: headers) do |csv|
      array.each do |row|
        csv << row.values
      end
    end
  end

  # Adiciona um novo objeto (hash) ao CSV
  def self.add(file, obj)
    data = read(file)
    data << obj
    save(file, data)
  end
end
