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
  end
end
