class UsersController < ApplicationController
  before_action :set_user

  def show
    @pagy, @tweets = pagy(@user.tweets.order('created_at DESC'))
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
