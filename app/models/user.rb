class User < ApplicationRecord
  include Gravtastic

  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: { case_sensitive: false }
  validates :full_name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
