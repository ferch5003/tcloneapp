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
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
