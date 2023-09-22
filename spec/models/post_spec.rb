require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates presence of title' do
    post = Post.new(title: '')
    expect(post).not_to be_valid
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'validates title length not to exceed 250 characters' do
    title = 'H' * 251
    post = Post.new(title: title)
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
end
