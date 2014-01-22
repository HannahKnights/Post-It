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
      visit '/posts/new'
      expect(page).to have_content 'Sign in'
    end
  end

  context 'adding tags' do

    it 'can have many tags' do
      login_as @user, scope: :user
      visit '/posts/new'
      fill_in 'Title', with: 'post title'
      fill_in 'Content', with: 'post content #yolo Some more info #fml,#lolatron #    #fixthisshit'
      click_button 'Create Post'
      expect(page).to have_content 'Tags: #yolo #fml #lolatron #fixthisshit'
    end

  end

  describe 'uploading images' do
    
    before do
      login_as @user, scope: :user
      visit new_post_path
      fill_in :Title, with: 'Gary Oldman'
      fill_in :Content, with: 'A post about Gary Oldman'
      attach_file 'Image', Rails.root.join('spec/images/Gary_Oldman.jpg')
      click_button 'Create Post'
    end

    it 'uploads the img with css selector instagram_upload', slow: true do
      expect(page).to have_css 'img.instagram_upload'
    end

  end

  describe 'not uploading images' do

    before do
      login_as @user, scope: :user
      visit new_post_path
      fill_in :Title, with: 'Gary Oldman'
      fill_in :Content, with: 'A post about Gary Oldman'
      click_button 'Create Post'
    end

    it 'should not render a missing image tag' do
      expect(page).not_to have_css 'img.instagram_upload'
    end

  end

end





