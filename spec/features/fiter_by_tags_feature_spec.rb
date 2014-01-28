require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

describe 'Tagging' do

  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
    add_post('First post', '#anothertag')
    add_post('Gary Oldman', '#gary')
  end

  context 'clicking on tags' do

    it 'should filter the posts by tag' do
      visit '/'
      expect(page).to have_content '#anothertag'
      within(:css, '#tag-sidebar') { click_link '#gary' }
      within(:css, '.container') { expect(page).not_to have_content '#anothertag' }
    end

  end

end
