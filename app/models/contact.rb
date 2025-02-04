class Contact < ApplicationRecord
  belongs_to :kind, optional: true #optional: true faz com que kind_id não seja obrigatório no método POST de contacts
  has_many :phones

  def author
    'Daniel' # method para retornar o campo author, usado em contacts_controller.rb
  end

  def kind_description
    self.kind.description unless self.kind.blank?
  end

  def as_json(options={})
    super(
      root: true,
      methods: [:kind_description, :author],
      include: [:kind, :phones],
      # include: { kind: { only: :description }} ## CASO QUEIRA TRAZER APENAS CAMPOS ESPECÍFICOS
    ) 
    ## essa função está fazendo três coisas:
    #1 - adicionando o método author em todas as reqs do contacts_controller.rb;
    #2 - adicionando a chave root (que no caso será contact);
    #3 - incluindo os dados da tabela KIND, associados aos contatos
  end
end
