require 'spec_helper'
require_relative 'helpers/sessions'
include SessionHelpers

describe 'Comments' do
  
  let(:user) { create(:user) }
  let(:invalid_comment) { "this is twenty chars" * 10 + "1"}
  subject { page }

  before do
      @user = user
  end

  context "posting a comment: " do
    
    describe "valid comment" do
      before do
        login_as @user, scope: :user
        add_post("Title of post", "Content of post")
        click_link "Add a Comment"
        fill_in "Content", with: "Some comment"
        click_button "Create Comment"
      end 

      it { should have_content "Some comment" }

    end

    describe "invalid comment" do
      before do
        login_as @user, scope: :user
        add_post("Title of post", "Content of post")
        click_link "Add a Comment"
        fill_in "Content", with: invalid_comment
        click_button "Create Comment"
        visit '/posts'
      end 

      it { should_not have_content invalid_comment }

    end

  end
end