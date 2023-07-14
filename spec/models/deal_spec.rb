require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      deal = Deal.new(amount: 100)
      expect(deal).to_not be_valid
      expect(deal.errors[:name]).to include("can't be blank")
    end

    it 'validates length of name' do
      deal = Deal.new(name: 'Test', amount: 100)
      expect(deal).to_not be_valid
      expect(deal.errors[:name]).to include('is too short (minimum is 5 characters)')
    end

    it 'validates presence of amount' do
      deal = Deal.new(name: 'Test')
      expect(deal).to_not be_valid
      expect(deal.errors[:amount]).to include("can't be blank")
    end

    it 'validates numericality of amount' do
      deal = Deal.new(name: 'Test', amount: 'invalid')
      expect(deal).to_not be_valid
      expect(deal.errors[:amount]).to include('is not a number')
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many groups' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many groups through groups_deals' do
      association = described_class.reflect_on_association(:groups)
      expect(association.options[:through]).to eq(:groups_deals)
    end
  end
end
