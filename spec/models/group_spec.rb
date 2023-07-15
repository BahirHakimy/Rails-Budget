require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      group = Group.new(icon: 'icon')
      expect(group).to_not be_valid
      expect(group.errors[:name]).to include("can't be blank")
    end

    it 'validates length of name' do
      group = Group.new(name: 'Test', icon: 'icon')
      expect(group).to_not be_valid
      expect(group.errors[:name]).to include('is too short (minimum is 5 characters)')
    end

    it 'validates presence of icon' do
      group = Group.new(name: 'Test')
      expect(group).to_not be_valid
      expect(group.errors[:icon]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many deals' do
      association = described_class.reflect_on_association(:deals)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many deals through groups_deals' do
      association = described_class.reflect_on_association(:deals)
      expect(association.options[:through]).to eq(:groups_deals)
    end
  end
end
