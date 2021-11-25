module Users
  class BaseController < ApplicationController
    before_action :authenticate_user!
    
    private

    def social_user
      User.friendly.find(params[:user_id])
    end
  end
end
