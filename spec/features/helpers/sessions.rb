module SessionHelpers

  def add_post(post_title, post_content)
    visit '/posts/new'
    fill_in 'Title', with: post_title
    fill_in 'Content', with: post_content
    click_button 'Create Post'
  end

end