class User < ApplicationRecord
  extend FriendlyId
  include Gravtastic
  

  acts_as_followable
  acts_as_follower
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  friendly_id :username, use: :slugged
  gravtastic

  has_many :tweets

  validates :email, uniqueness: { case_sensitive: false }
  validates :full_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def feed_user_ids
    [id] + followable_ids
  end

  def followable_ids
    follows.pluck(:followable_id)
  end
end
