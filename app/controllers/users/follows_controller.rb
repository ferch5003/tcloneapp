module Users
  class FollowsController < Users::BaseController
    def index
      @pagy, @follows = pagy_array(User.get_follows(social_user.followable_ids))
    end
  
    def create
    end
  end
end
