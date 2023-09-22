require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with text" do
    comment = Comment.new(text: "This is a comment.")
    expect(comment).to be_valid
  end

  it "is invalid without text" do
    comment = Comment.new(text: "")
    expect(comment).to_not be_valid
  end

  it "updates the comments counter for a post" do
    post = FactoryBot.create(:post)
    FactoryBot.create_list(:comment, 3, post: post)
    
    post.reload
    expect(post.comments_counter).to eq(3)
  end
end
