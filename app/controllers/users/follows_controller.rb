module Users
  class FollowsController < Users::BaseController
    def index
      @pagy, @follows = pagy_array(social_user.get_follows(type: :followings))
    end
  
    def create
    end
  end
end
