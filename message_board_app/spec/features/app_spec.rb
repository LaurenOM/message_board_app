feature MessageBoard do 

  scenario 'it displayes the name' do 
    visit '/view'
    expect(page).to have_content('Lauren')
  end 

  scenario 'it displayes the messages' do 
    visit '/view'
    expect(page).to have_content('Today is a good day')
  end 

  scenario 'presents a form asking for a message' do 
    visit '/'
    expect(page).to have_field("message")
  end 

  scenario 'it displays new message back' do
    visit '/'
    fill_in 'message', with: 'what a great day'
    click_button 'Post'
    expect(page).to have_content('what a great day')
  end

  scenario 'displays a box for comments on the view page' do 
    visit '/view'
    expect(page).to have_selector("input[type=submit][value='Comment']")
  end 

  scenario 'displays new comment after clicking comment' do 
    visit '/view'
    fill_in 'name_1', with: 'this is cool'
    click_button('1')
    expect(page).to have_content('this is cool')
  end

  scenario 'creates a new user' do 
  end 
end
