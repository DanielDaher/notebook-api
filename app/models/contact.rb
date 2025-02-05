class Contact < ApplicationRecord
  belongs_to :kind, optional: true #optional: true faz com que kind_id não seja obrigatório no método POST de contacts
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :address #address no singular pois é has_one. Se fosse has_many, como é phones, seria no plural.
  accepts_nested_attributes_for :phones, allow_destroy: true # aceita atributos de phones durante cadastro de contatos. (também permite deletar o elemento, passando _destroy no parametro)
  # Por padrão, o atributo seria phones_attributes: [{ number: '1234' }], por exemplo.

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
