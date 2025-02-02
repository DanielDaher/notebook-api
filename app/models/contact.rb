class Contact < ApplicationRecord
  belongs_to :kind

  def author
    'Daniel' # method para retornar o campo author, usado em contacts_controller.rb
  end

  def as_json(options={})
    super(methods: :author, root: true) 
    ## essa função está fazendo duas coisas: adicionando o método author em todas as reqs do contacts_controller.rb, e adicionando a chave root (que no caso será contact);
  end
end
