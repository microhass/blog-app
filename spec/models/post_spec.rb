require 'rails_helper'

RSpec.describe Post, type: :Model do
  # let(:user) { User.new(name: 'Cosmas', photo: 'www.newpics.com/jpg', bio: 'First son', posts_counter: 4) }
  let(:user) { User.new(name: 'John Doe', photo: 'photo.jpg', bio: 'I am John Doe', posts_counter: 4) }
  before { user.save }

  let(:post) do
    Post.new(title: 'My first post', text: 'This is my first post', comments_counter: 1, likes_counter: 3,
             author_id: user.id)
  end
  before { post.save }

  it 'validates presence of title' do
    post = Post.new(title: '')
    expect(post).not_to be_valid
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'validates title length not to exceed 250 characters' do
    title = 'H' * 251
    post = Post.new(title:)
    expect(post).not_to be_valid
    expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
  end

  it 'validates comments_counter to be greater than or equal to zero' do
    post = Post.new(comments_counter: -1)
    expect(post).not_to be_valid
    expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
  end

  it 'validates likes_counter to be greater than or equal to zero' do
    post = Post.new(likes_counter: -1)
    expect(post).not_to be_valid
    expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
  end

  it 'validates comments_counter to be an integer' do
    post = Post.new(comments_counter: 2.5)
    expect(post).not_to be_valid
    expect(post.errors[:comments_counter]).to include('must be an integer')
  end

  it 'validates likes_counter to be an integer' do
    post = Post.new(likes_counter: 2.5)
    expect(post).not_to be_valid
    expect(post.errors[:likes_counter]).to include('must be an integer')
  end


  describe '#update_posts_counter' do
    it 'should record the posts counter' do
      counter = post.update_posts_counter
      expect(counter).to eq(1)
    end
  end
  describe '#recent_comments' do
    it 'it should return 5 recent comments' do
      Comment.create(text: 'comment 1', user_id: user.id, post_id: post.id)
      Comment.create(text: 'comment 2', user_id: user.id, post_id: post.id)
      Comment.create(text: 'comment 3', user_id: user.id, post_id: post.id)
      Comment.create(text: 'comment 4', user_id: user.id, post_id: post.id)
      Comment.create(text: 'comment 5', user_id: user.id, post_id: post.id)
      Comment.create(text: 'comment 6', user_id: user.id, post_id: post.id)

      my_comments = post.recent_comments
      expect(my_comments.first.text).to eq('comment 6')
    end
  end
end
