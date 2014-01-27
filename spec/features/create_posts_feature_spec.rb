require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers


describe Post do

  let(:user) {create(:user)}
  
  before do
    @user = user
  end

  context 'user must be logged in' do
    
    it 'can make a post' do
      login_as @user, scope: :user
      add_post('Test','Fake test post')
      expect(page).to have_content 'Test'
    end

    it 'cannot make a post if not' do
      visit new_post_path
      expect(page).to have_content 'Sign in'
    end
  end

  context 'adding tags' do

    it 'can have many tags' do
      login_as @user, scope: :user
      add_post('Test', 'post content #yolo Some more info #fml,#lolatron #    #fixthis')
      expect(page).to have_content 'Tags: #yolo #fml #lolatron #fixthis'
    end

  end

  describe 'uploading images' do
    
    before do
      login_as @user, scope: :user
      visit new_post_path
      add_post('Test','Fake test post')
    end

    it 'uploads the img with css selector instagram_upload' do
      expect(page).to have_css 'img.instagram_upload'
    end

  end

  describe 'editing images' do

    
    
  end

end





