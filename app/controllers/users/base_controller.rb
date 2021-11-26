module Users
  class BaseController < ApplicationController
    attr_reader :social_user

    before_action :check_social_user

    private

    def check_social_user
      @social_user = User.friendly.find(params[:user_id])
    end
  end
end
