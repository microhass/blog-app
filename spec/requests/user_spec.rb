require 'rails_helper'

describe "GET /show" do
  it "renders a successful user response" do
    user = User.create! name: "Jane Doe", photo: "https://picsum.photos/200/300", bio: "I am Jane Doe", posts_counter: 0
    get('/users/' + user.id.to_s)
    expect(response).to be_successful
    expect(response.body).to include("Here is the details for a given user.")
  end
end
