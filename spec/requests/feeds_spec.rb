require 'rails_helper'

RSpec.describe FeedsController, type: :request do
  let!(:first_user) { create(:user) }
  let!(:second_user) { create(:user) }

  describe 'GET #index' do
    context 'when the user is not signed in' do
      subject { get feeds_path }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      let!(:tweets_from_first_user) { create_list(:tweet, 3, user: first_user) }
      let!(:tweets_from_second_user) { create_list(:tweet, 3, user: second_user) }

      before do
        sign_in(first_user)
      end

      subject { get feeds_path }

      context 'without following any user' do
        before { subject }

        it { expect(assigns(:tweets)).to match_array(tweets_from_first_user) }
      end

      context 'following one user' do
        let!(:tweets_feed) { tweets_from_first_user + tweets_from_second_user }

        before do
          first_user.follow(second_user)
          subject
        end

        it { expect(assigns(:tweets)).to match_array(tweets_feed) }
      end
    end
  end
end
