require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  let!(:user) { create(:user) }

  describe 'GET #new' do
    context 'when the user is not signed in' do
      before { get new_tweet_path }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      subject { get new_tweet_path }

      before do
        sign_in(user)
        subject
      end

      it { expect(assigns(:tweet)).to be_a_new(Tweet) }
    end
  end

  describe 'POST #create' do
    let(:params) { { tweet: tweet_params } }

    context 'when the user is not signed in' do
      let(:tweet_params) { { content: '' } }

      subject { post tweets_path, params: params }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(user)
      end

      subject { get user_path(user.username) }

      context 'with valid parameters' do
        let(:tweet_params) { { content: 'Valid Tweet' } }

        subject { post tweets_path, params: params }

        it { expect { subject }.to change(Tweet, :count).by(1) }
        it { is_expected.to redirect_to(user_path(user.username)) }
      end

      context 'with invalid parameters' do
        context 'when the tweet is blank' do
          let(:tweet_params) { { content: '' } }

          subject { post tweets_path, params: params }

          it { is_expected.to render_template(:new) }
        end

        context 'when the tweet exceed 280 characters' do
          let(:tweet_params) do
            {
              content: Faker::Lorem.paragraph_by_chars(number: 281, supplemental: false)
            }
          end

          subject { post tweets_path, params: params }

          it { is_expected.to render_template(:new) }
        end
      end
    end
  end
end
