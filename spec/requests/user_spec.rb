require 'rails_helper'

describe 'GET /show' do
  let(:user) { User.create! name: 'Jane Doe', photo: 'https://picsum.photos/200/300', bio: 'I am Jane Doe', posts_counter: 0 }

  it 'returns a successful user response' do
    get("/users/#{user.id}")
    expect(response).to be_successful
  end


  it 'renders the placeholder for a given user' do
    get("/users/#{user.id}")
    expect(response.body).to include('Here is the details for a given user.')
  end
end
