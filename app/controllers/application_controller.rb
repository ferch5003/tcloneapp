class ApplicationController < ActionController::Base
  include Authenticable
  include ErrorHandleable
end
