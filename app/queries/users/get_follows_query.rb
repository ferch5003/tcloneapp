class Users::GetFollowsQuery < BaseQuery
  def initialize(user_ids:, relation: nil)
    @relation = relation || User
    @user_ids = user_ids
  end

  def call
    @relation
      .where(id: @user_ids)
      .order('full_name ASC')
  end
end
