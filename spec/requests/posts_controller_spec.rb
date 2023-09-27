require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:posts_path) { '/users/1/posts' }

    it 'renders the correct template' do
      get posts_path
      expect(response).to render_template(:index)
    end

    it 'returns a successful posts response' do
      get posts_path
      expect(response).to be_successful
    end

    it 'renders the placeholder for all posts' do
      get posts_path
      expect(response.body).to include('Here is a list of all posts for a given user.')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create! name: 'Jane Doe', photo: 'https://picsum.photos/200/300', bio: 'I am Jane Doe', posts_counter: 0 }
    let(:post) do
      Post.create! title: 'Post Title', text: 'Post Text', comments_counter: 0, likes_counter: 0, author_id: user.id
    end
    let(:post_path) { "/users/#{user.id}/posts/#{post.id}" }

    it 'rerutns a successful post response' do
      get post_path
      expect(response).to be_successful
    end

    it 'renders the correct post template' do
      get post_path
      expect(response).to render_template(:show)
    end

    it 'renders the placeholder for a given post' do
      get post_path
      expect(response.body).to include('Here is a single post for a given user.')
    end
  end
end
