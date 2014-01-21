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

  describe 'uploading images' do
    before do
      login_as @user, scope: :user
      visit new_post_path
      fill_in :Title, with: 'Gary Oldman'
      fill_in :Content, with: 'Gazza'
      attach_file 'Image', Rails.root.join('spec/images/Gary_Oldman.jpg')
      click_button 'Create Post'
    end

    it 'uploads the img with css selector instagram_upload' do
      expect(page).to have_css 'img.instagram_upload'
    end

  end

end





