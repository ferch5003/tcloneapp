class TweetsController < ApplicationController
  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to user_path(current_user.username), notice: 'Tweet was successfully created'
    else
      render :new, status: :unprocessable_entity, alert: "Tweet couldn't be saved, please check the corrections and try again"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
