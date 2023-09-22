require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'updates the likes counter for a post when created' do
    post = FactoryBot.create(:post)
    user = FactoryBot.create(:user)

    expect do
      FactoryBot.create(:like, post:, user:)
      post.reload
    end.to change(post, :likes_counter).by(1)
  end

  it 'updates the likes counter for a post when destroyed' do
    post = FactoryBot.create(:post)
    user = FactoryBot.create(:user)
    like = FactoryBot.create(:like, post:, user:)

    expect do
      like.destroy
      post.reload
    end.to change(post, :likes_counter).by(-1)
  end
end
