require 'rails_helper'

RSpec.describe Users::FollowsController, type: :request do
  let!(:first_user) { create(:user) }
  let!(:second_user) { create(:user) }

  describe 'GET #index' do
    context 'when the user is not signed in' do
      subject { get user_follows_path(first_user.username) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(first_user)
      end

      subject { get user_follows_path(first_user.username) }

      context 'without following any user' do
        before { subject }

        it { expect(assigns(:follows)).to match_array([]) }
      end

      context 'following one user' do
        before do
          first_user.follow(second_user)
          subject
        end

        it { expect(assigns(:follows)).to match_array([second_user]) }
      end
    end
  end
end
