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
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(280) }
  end

  describe 'scopes' do
    describe 'user_feed' do
      let!(:first_user) { create(:user) }
      let!(:second_user) { create(:user) }
      let!(:tweets_from_first_user) { create_list(:tweet, 3, user: first_user) }
      let!(:tweets_from_second_user) { create_list(:tweet, 3, user: second_user) }

      context 'without following any user' do
        subject { described_class.user_feed(user: first_user) }

        it { should match_array(tweets_from_first_user) }
      end

      context 'following one user' do
        before do
          first_user.follow(second_user)
        end

        subject { described_class.user_feed(user: first_user) }

        it { should match_array(tweets_from_first_user + tweets_from_second_user) }
      end
    end
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
