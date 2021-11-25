module Users
  class FollowersController < Users::BaseController
    def index
      @pagy, @followers = pagy_array(User.get_follows(social_user.follower_ids))
    end

    def create
      if current_user.following?(social_user)
        redirect_back fallback_location: root_path, alert: 'You already follow this user!'
      else
        current_user.follow(social_user)
        redirect_to user_path(social_user.username), notice: "Great! Now you are following @#{social_user.username}"
      end
    end
  end
end
