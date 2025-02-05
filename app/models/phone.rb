class Phone < ApplicationRecord
  belongs_to :contact, optional: true # para tornar os atributos de phone opcionais durante o POST cadastro de contacts
end
