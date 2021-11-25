class SearchUsersController < ApplicationController
  include Followable

  def new
    @q = User.ransack(params[:q])
  end

  def create
    @q = User.ransack(params[:q])
    @social_user = @q.result.first

    if @social_user
      follow_user(social_user: @social_user)
    else
      redirect_back fallback_location: root_path, alert: "User @#{params[:q][:username_eq]} not exist"
    end
  end
end
