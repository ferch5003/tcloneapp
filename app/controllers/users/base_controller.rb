module Users
  class BaseController < ApplicationController
    private

    def social_user
      User.friendly.find(params[:user_id])
    end
  end
end
