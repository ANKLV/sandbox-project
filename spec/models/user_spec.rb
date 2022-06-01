require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe '#full_name' do
    it 'concatenates first and last name' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
