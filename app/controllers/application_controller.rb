class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # we could put methods we want across all controllers
end
