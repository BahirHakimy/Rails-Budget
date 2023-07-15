require 'rails_helper'

RSpec.describe 'Deals', type: :request do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Test Group', icon: 'icon.png', user_id: user.id) }

  before do
    sign_in user
  end

  describe 'GET /deals' do
    it 'renders the index template' do
      get group_deals_path(group_id: group.id)
      expect(response).to render_template(:index)
      expect(response.body).to include('Transactions')
    end
  end

  describe 'GET /deals/new' do
    it 'renders the new template' do
      get new_deal_path
      expect(response).to render_template(:new)
      expect(response.body).to include('New Transaction')
    end
  end

  describe 'POST /deals' do
    it 'creates a new deal' do
      expect do
        post deals_path, params: { deal: { name: 'Test Deal', amount: 100, user_id: user.id, group: group.id } }
      end.to change(Deal, :count).by(1)
      expect(response).to redirect_to(group_deals_url(group_id: group.id))
      expect(flash[:notice]).to eq('Deal was successfully created.')
    end

    it 'renders the new template if deal creation fails' do
      post deals_path, params: { deal: { name: '', amount: 100, user_id: user.id, group: group.id } }
      expect(response).to render_template(:new)
      expect(response.body).to include('New Transaction')
    end
  end
end
