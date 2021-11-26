require 'rails_helper'

RSpec.describe SearchUsersController, type: :request do
  let!(:first_user) { create(:user) }
  let!(:second_user) { create(:user) }

  describe 'GET #index' do
    context 'when the user is not signed in' do
      before { get search_users_path }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe 'POST #create' do
    let(:params) { { q: query_params } }

    context 'when the user is not signed in' do
      let(:query_params) { '' }

      subject { post search_users_path, params: params }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(first_user)
      end

      context 'with valid parameters' do
        context 'if the searched user is the current user' do
          let(:query_params) { { username_eq: first_user.username } }

          subject { post search_users_path, params: params }

          it { is_expected.to redirect_to(search_users_path) }
        end

        context 'if the searched user is already followed' do
          let(:query_params) { { username_eq: second_user.username } }

          before { first_user.follow(second_user) }

          subject { post search_users_path, params: params }

          it { is_expected.to redirect_to(search_users_path) }
        end

        context 'if the searched user is not followed' do
          let(:query_params) { { username_eq: second_user.username } }

          subject { post search_users_path, params: params }

          it { expect { subject }.to change(Follow, :count).by(1) }
          it { is_expected.to redirect_to(user_path(second_user.username)) }
        end
      end

      context 'with invalid parameters' do
        context "if the user doesn't exist" do
          let(:query_params) { { username_eq: "#{second_user.username}_fake" } }

          subject { post search_users_path, params: params }

          it { is_expected.to redirect_to(search_users_path) }
        end
      end
    end
  end
end
