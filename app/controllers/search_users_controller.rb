class SearchUsersController < ApplicationController
  include Followable

  before_action :set_q, only: %i[index create]

  def index
  end

  def create
    @social_user = @q.result.first

    if @social_user
      follow_user(social_user: @social_user, failed_path: search_users_path)
    else
      redirect_to search_users_path, alert: "User @#{params[:q][:username_eq]} not exist"
    end
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end
end
