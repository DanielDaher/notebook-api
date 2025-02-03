class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # CONTACT_JSON_ATTRIBUTES = [:name, :email].freeze // freeze é para tornar o array imutável

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts, only: [:name, :email] # only está selecionando apenas alguns campos para retornar.

    ## Também é possível utilizar expecpt: [:name, :email] para selecionar tudo exceto esses campos.

    ## Caso prefira, pode salvar numa variável, pro código ficar mais limpo, como no exemplo a seguir:

    ## render json: @contacts, only: CONTACT_JSON_ATTRIBUTES

    # caso quisesse um status específico, por exemplo, o no_content, bastaria passar ,status: :no_content (checar https://httpstatuses.io/)
  end

  # GET /contacts/1
  def show
    render json: @contact
    #Pode ser usada com map também, caso tenha array na resposta. Exemplo: @contact.map { |contact| contact.attributes.merge({ author: 'Daniel' }) }

    # Também é possível mergear chamando um método, definido na model contact.rb
    # render json: @contact, methods: :author
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.expect(contact: [ :name, :email, :birthdate ])
    end
end
