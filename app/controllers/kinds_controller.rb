class KindsController < ApplicationController
  before_action :authenticate
  before_action :set_kind, only: %i[ show update destroy ]

  include ActionController::HttpAuthentication::Token::ControllerMethods ## importante importar isso aqui para autenticação funcionar

  # GET /kinds
  def index
    @kinds = Kind.all

    render json: @kinds
  end

  # GET /kinds/1
  def show
    render json: @kind
  end

  # POST /kinds
  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kinds/1
  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kinds/1
  def destroy
    @kind.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      @kind = Kind.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      params.expect(kind: [ :description ])
    end

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        hmac_secret = 'my$ecretK3y'
        begin
          decoded_token = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
          # render json: { decoded: decoded_token[0] } ISSO AQUI RETORNA O PAYLOAD DO TOKEN
        rescue JWT::DecodeError
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
    end
end
