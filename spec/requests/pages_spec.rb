require 'rails_helper'

RSpec.describe PagesController, type: :request do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    context 'when the user is signed in' do
      before do
        sign_in(user)
      end

      subject { get root_path }

      it { is_expected.to redirect_to(feeds_path) }
    end
  end
end
