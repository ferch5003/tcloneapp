module UsersHelper
  def current_user?(social_user:)
    current_user == social_user
  end

  def user_followed?(social_user:)
    current_user.following?(social_user) || current_user == social_user
  end
end
