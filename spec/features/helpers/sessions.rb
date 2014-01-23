module SessionHelpers

  def add_post(post_title, post_content)
    visit '/posts/new'
    fill_in 'Title', with: post_title
    fill_in 'Content', with: post_content
    attach_file 'Image', Rails.root.join('spec/images/Gary_Oldman.jpg')
    click_button 'Create Post'
  end

end