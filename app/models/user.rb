# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  full_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  slug                   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
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

  def get_follows(type: :followings)
    case type
    when :followings then Users::GetFollowsQuery.call(user_ids: followable_ids)
    when :followers then Users::GetFollowsQuery.call(user_ids: follower_ids)
    end
  end

  def feed_user_ids
    [id] + followable_ids
  end

  def followable_ids
    follows.pluck(:followable_id)
  end

  def follower_ids
    followers.pluck(:id)
  end
end
