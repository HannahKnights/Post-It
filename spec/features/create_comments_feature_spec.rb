require 'spec_helper'
require_relative 'helpers/sessions'
include SessionHelpers

describe 'Posting a comment' do
  
  let(:user) { create(:user) }
  let(:invalid_comment) { 'this is twenty chars' * 10 + "1"}

  before do
      @user = user
      login_as @user, scope: :user
      add_post('Title of post', 'Content of post')
      visit posts_path
  end

  context 'validation' do
  
    it 'should allow a valid comment' do
      click_link 'Add a Comment'
      within(:css, '.add-comment-form') { fill_in 'Content', with: 'Some comment' }
      click_button 'Create Comment'
      expect(page).to have_content 'Some comment'
    end 

    it 'should not allow a valid comment' do
      click_link 'Add a Comment'
      within(:css, '.add-comment-form') { fill_in 'Content', with: invalid_comment }
      click_button "Create Comment"
      visit '/posts'
      expect(page).to_not have_content invalid_comment
    end 

  end

end