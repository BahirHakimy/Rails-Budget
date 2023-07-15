require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  before do
    sign_in user
  end

  describe 'GET /groups' do
    it 'renders the index template' do
      get groups_path
      expect(response).to render_template(:index)
      expect(response.body).to include('Groups')
    end
  end

  describe 'GET /groups/new' do
    it 'renders the new template' do
      get new_group_path
      expect(response).to render_template(:new)
      expect(response.body).to include('New Group')
    end
  end

  describe 'POST /groups' do
    it 'creates a new group' do
      expect do
        post groups_path, params: { group: { name: 'Test Group', icon: 'icon.png', user_id: user.id } }
      end.to change(Group, :count).by(1)
      expect(response).to redirect_to(groups_url)
      expect(flash[:notice]).to eq('Group was successfully created.')
    end

    it 'renders the new template if group creation fails' do
      post groups_path, params: { group: { name: 'Test', icon: '', user_id: user.id } }
      expect(response).to render_template(:new)
      expect(response.body).to include('New Group')
    end
  end
end
