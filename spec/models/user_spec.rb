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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:tweets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:username) }
  end

  describe 'scopes' do
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
    let!(:first_user) { create(:user) }
    let!(:second_user) { create(:user) }

    describe '#get_follows' do
      context 'followings type' do
        context 'without following any user' do
          subject { first_user.get_follows(type: :followings) }

          it { should match_array([]) }
        end

        context 'following one user' do
          before do
            first_user.follow(second_user)
          end

          subject { first_user.get_follows(type: :followings) }

          it { should match_array([second_user]) }
        end
      end

      context 'followers type' do
        context 'without being followed by any user' do
          subject { first_user.get_follows(type: :followers) }
  
          it { should match_array([]) }
        end
  
        context 'followed by one user' do
          before do
            second_user.follow(first_user)
          end
  
          subject { first_user.get_follows(type: :followers) }
  
          it { should match_array([second_user]) }
        end
      end
    end

    describe '#followable_ids' do
      context 'without following any user' do
        subject { first_user.followable_ids }

        it { should match_array([]) }
      end

      context 'following one user' do
        before do
          first_user.follow(second_user)
        end

        subject { first_user.followable_ids }

        it { should match_array([second_user.id]) }
      end
    end

    describe '#follower_ids' do
      context 'without being followed by any user' do
        subject { first_user.follower_ids }

        it { should match_array([]) }
      end

      context 'followed by one user' do
        before do
          second_user.follow(first_user)
        end

        subject { first_user.follower_ids }

        it { should match_array([second_user.id]) }
      end
    end

    describe '#feed_user_ids' do
      context 'without following any user' do
        subject { first_user.feed_user_ids }

        it { should match_array([first_user.id]) }
      end

      context 'following one user' do
        before do
          first_user.follow(second_user)
        end

        subject { first_user.feed_user_ids }

        it { should match_array([first_user.id, second_user.id]) }
      end
    end
  end
end
