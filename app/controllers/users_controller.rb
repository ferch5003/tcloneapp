class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show]

  def show
    @pagy, @tweets = pagy(@user.tweets.order('created_at DESC'))
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
