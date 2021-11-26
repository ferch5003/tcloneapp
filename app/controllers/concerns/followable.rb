module Followable
  extend ActiveSupport::Concern

  private

  def follow_user(social_user:, failed_path:)
    if social_user == current_user
      redirect_back fallback_location: failed_path, alert: 'Hey this is you. You can not follow yourself!'
    else
      if current_user.following?(social_user)
        redirect_back fallback_location: failed_path, alert: 'You already follow this user!'
      else
        current_user.follow(social_user)
        redirect_to user_path(social_user.username), notice: "Great! Now you are following @#{social_user.username}"
      end
    end
  end
end
