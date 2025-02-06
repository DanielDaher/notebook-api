class ApplicationController < ActionController::API
  require_dependency 'error_serializer' ## isso disponibiliza o arquivo error_serializer.rb para todos os controllers
end
