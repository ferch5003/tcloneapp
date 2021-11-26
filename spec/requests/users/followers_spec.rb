require 'rails_helper'

RSpec.describe Users::FollowersController, type: :request do
  let!(:first_user) { create(:user) }
  let!(:second_user) { create(:user) }

  describe 'GET #index' do
    context 'when the user is not signed in' do
      subject { get user_followers_path(first_user) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(first_user)
      end

      subject { get user_followers_path(first_user) }

      context 'without being followed by any user' do
        before { subject }

        it { expect(assigns(:followers)).to match_array([]) }
      end

      context 'followed by one user' do
        before do
          second_user.follow(first_user)
          subject
        end

        it { expect(assigns(:followers)).to match_array([second_user]) }
      end
    end
  end

  describe 'POST #create' do
    context 'when the user is not signed in' do
      subject { post user_followers_path(second_user.id) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(first_user)
      end

      context 'if user to follow is the current user' do
        subject { post user_followers_path(first_user.id) }

        it { is_expected.to redirect_to(user_followers_path(first_user.username)) }
      end

      context 'if user to follow is already followed' do
        subject { post user_followers_path(second_user.id) }

        before do
          first_user.follow(second_user)
          subject
        end

        it { is_expected.to redirect_to(user_followers_path(second_user.username)) }
      end

      context 'if user to follow is not followed' do
        subject { post user_followers_path(second_user.id) }

        it { expect { subject }.to change(Follow, :count).by(1) }
        it { is_expected.to redirect_to(user_path(second_user.username)) }
      end
    end
  end
end
