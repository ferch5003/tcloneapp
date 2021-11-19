class Tweets::FeedsQuery < BaseQuery
  def initialize(user_ids:, relation: nil)
    @relation = relation || Tweet
    @user_ids = user_ids
  end

  def call
    @relation.includes(%i[user])
             .joins(user: :follows)
             .where('follows.follower_id IN (?)', @user_ids)
             .order('created_at DESC')
  end
end
