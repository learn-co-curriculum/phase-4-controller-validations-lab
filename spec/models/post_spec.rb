require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_inclusion_of(:category).in_array(['Fiction', 'Non-Fiction']) }
    it { is_expected.to validate_length_of(:content).is_at_least(100) }
  end
end
