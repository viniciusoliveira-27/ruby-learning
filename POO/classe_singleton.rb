class Email
    attr_accessor :to, :from, :subject, :body

    def send
        # TODA A IMPLEMTAÇÃO DA GEM DE ENVIO DE EMAIL
        puts "Estou enviando o email para #{to} ... "
    end
    #para ter uma classe singleton é preciso usar o metodo private
    private_class_method :new

      #quando usa o self, vira metodo de classe
    def self.instancia
        # @@instancia = self.new if @@instancia == nil
        @@instancia ||= self.new
        @@instancia
    end
end

Email.instancia.to = "teste@teste.com"
Email.instancia.send
puts Email.instancia

Email.instancia.to = "testes@teste.com"
Email.instancia.send
puts Email.instancia