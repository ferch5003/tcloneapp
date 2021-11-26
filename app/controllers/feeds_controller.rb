class FeedsController < ApplicationController
  def index
    @pagy, @tweets = pagy(Tweet.user_feed(user: current_user).includes(%i[user]))
  end
end
