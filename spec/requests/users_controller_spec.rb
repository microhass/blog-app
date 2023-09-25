require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'renders the correct template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'returns a successful users response' do
      get users_path
      expect(response).to be_successful
    end

    it 'renders the placeholder for all users' do
      get users_path
      expect(response.body).to include('Here is a list of all the users.')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create! name: 'Jane Doe', photo: 'https://picsum.photos/200/300', bio: 'I am Jane Doe', posts_counter: 0 }

    it 'rerutns a successful user response' do
      get("/users/#{user.id}")
      expect(response).to be_successful
    end

    it 'renders the correct user template' do
      get("/users/#{user.id}")
      expect(response).to render_template(:show)
    end

    it 'renders the placeholder for a given user' do
      get("/users/#{user.id}")
      expect(response.body).to include('Here is the details for a given user.')
    end
  end
end
