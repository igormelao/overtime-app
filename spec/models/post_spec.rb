require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @user = User.create(first_name: "Igor", last_name: "Melao", email: "igormelao@example.com", password: "password", password_confirmation: "password")
      @post = Post.create(date: Date.today, rationale: "Anything", user_id: @user.id)
    end
    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date and rationale" do 
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
