module Users
  class FollowersController < Users::BaseController
    include Followable

    def index
      @pagy, @followers = pagy_array(User.get_follows(social_user.follower_ids))
    end

    def create
      follow_user(social_user: social_user)
    end
  end
end
