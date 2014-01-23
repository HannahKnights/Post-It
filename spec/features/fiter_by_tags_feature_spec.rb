require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

describe 'Tagging' do

  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
    add_post('Gary Oldman', '#gary')
    add_post('Second post', '#anothertag')
  end

  context 'clicking on tags' do

    it 'should filter the posts by tag' do
      expect(page).to have_content '#anothertag'
      click_link '#gary'
      expect(page).not_to have_content '#anothertag'
    end

  end

end
