class Tweets::FeedsQuery < BaseQuery
  def initialize(user_ids:, relation: nil)
    @relation = relation || Tweet
    @user_ids = user_ids
  end

  def call
    @relation.where(user_id: @user_ids)
             .order('created_at DESC')
  end
end
