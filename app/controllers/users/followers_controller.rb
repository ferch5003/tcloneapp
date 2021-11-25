module Users
  class FollowersController < Users::BaseController
    include Followable

    def index
      @pagy, @followers = pagy_array(social_user.get_follows(type: :followers))
    end

    def create
      follow_user(social_user: social_user)
    end
  end
end
