class Tweet < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user

  validates :content, presence: true, length: { maximum: 280 }
end
