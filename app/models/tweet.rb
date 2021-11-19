class Tweet < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  scope :user_feed,
        ->(user_ids) { Tweets::FeedsQuery.call(user_ids: user_ids) }

  validates :content, presence: true, length: { maximum: 280 }
end
