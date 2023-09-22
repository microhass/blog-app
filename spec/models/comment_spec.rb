require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(name: 'John Doe', photo: 'photo.jpg', bio: 'I am John Doe', posts_counter: 0)
  end

  let(:post) do
    Post.create(
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0,
      author_id: user.id
    )
  end

  it 'belongs to a user' do
    comment = Comment.new(user:, post:, text: 'This is a comment.')
    expect(comment.user).to eq(user)
  end

  it 'belongs to a post' do
    comment = Comment.new(user:, post:, text: 'This is a comment.')
    expect(comment.post).to eq(post)
  end

  it 'validates presence of text' do
    comment = Comment.new(user:, post:, text: '')
    expect(comment).not_to be_valid
    expect(comment.errors[:text]).to include("can't be blank")
  end

  it 'updates post comments_counter after creation' do
    Comment.create(user:, post:, text: 'This is a comment.')
    Comment.create(user:, post:, text: 'This is another comment.')
    expect(post.reload.comments_counter).to eq(2)
  end

  it 'updates post comments_counter after destruction' do
    Comment.create(user:, post:, text: 'This is a comment.')
    comment = Comment.create(user:, post:, text: 'This is another comment.')
    comment.destroy
    expect(post.reload.comments_counter).to eq(1)
  end
end
