class ApplicationController < ActionController::Base
  include Authenticable
  include ErrorHandleable
  include Paginable
end
