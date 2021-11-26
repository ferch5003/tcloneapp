require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let!(:user) { create(:user) }

  describe 'GET #show' do
    context 'when the user is not signed in' do
      subject { get user_path(user.id) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(user)
      end

      subject { get user_path(user.id) }

      context 'with tweets' do
        let!(:tweets) { create_list(:tweet, 3, user: user) }

        before { subject }

        it { expect(assigns(:tweets)).to match_array(tweets) }
      end

      context 'without tweets' do
        before { subject }

        it { expect(assigns(:tweets)).to match_array([]) }
      end
    end
  end
end
