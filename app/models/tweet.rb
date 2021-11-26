# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  content    :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tweets_on_deleted_at  (deleted_at)
#  index_tweets_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Tweet < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  scope :user_feed,
        ->(user:) { Tweets::FeedsQuery.call(user_ids: user.feed_user_ids) }

  validates :content, presence: true, length: { maximum: 280 }
end
