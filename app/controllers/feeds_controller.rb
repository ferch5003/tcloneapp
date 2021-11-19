class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @tweets = pagy(Tweet.user_feed(current_user.feed_user_ids))
  end
end
