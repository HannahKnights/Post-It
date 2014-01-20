require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers


describe Post do

    let(:user) {create(:user)}
    
    before do
      @user = user
    end

  
  it 'a logged in user can make a post' do
    login_as @user, scope: :user
    add_post('Test','Fake test post')
    expect(page).to have_content 'Test'
  end

  it 'a logged out user cannot make a post' do
    visit '/posts/new'
    expect(page).to have_content 'Sign in'
  end

end
