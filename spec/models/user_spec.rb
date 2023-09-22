require 'rails_helper'

RSpec.describe User, type: :model do
  it 'checks for a valid name' do
    user = User.new(name: '')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'validates posts_counter to be an integer' do
    user = User.new(posts_counter: 2.5)
    expect(user).not_to be_valid
    expect(user.errors[:posts_counter]).to include('must be an integer')
  end

  it 'validates posts_counter to be greater than or equal to zero' do
    user = User.new(posts_counter: -1)
    expect(user).not_to be_valid
    expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
  end

  describe '#recent_posts' do
    let(:user) { User.new(name: 'Jane', photo: '', bio: '', posts_counter: 4) }
    before { user.save }

    it 'gets correct recent posts' do
      Post.create(title: 'Hello', text: 'World', comments_counter: 0, likes_counter: 0, author_id: user.id)
      Post.create(title: 'Good', text: 'morning', comments_counter: 0, likes_counter: 0, author_id: user.id)
      user_posts = user.recent_posts
      expect(user_posts.length).to eq(2)
    end
  end
end
