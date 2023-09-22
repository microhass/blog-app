require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.new(name: 'John Doe', photo: 'photo.jpg', bio: 'I am John Doe', posts_counter: 0)
  end

  before { user.save }

  let(:post) do
    Post.new(
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 0,
      author_id: user.id
    )
  end

  before { post.save }

  it 'belongs to a user' do
    like = Like.new(user:, post:)
    expect(like.user).to eq(user)
  end

  it 'belongs to a post' do
    like = Like.new(user:, post:)
    expect(like.post).to eq(post)
  end

  it 'updates post likes_counter after creation' do
    Like.create(user:, post:)
    expect(post.likes_counter).to eq(1)
  end

  it 'updates post likes_counter after destruction' do
    Like.create(user:, post:)
    Like.create(user:, post:)
    like = Like.create(user:, post:)
    like.destroy
    expect(post.likes_counter).to eq(2)
  end
end
