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

  scenario 'it displays name and message back' do
    visit '/'
    fill_in 'message', with: 'what a great day'
    click_button 'Post'
    expect(page).to have_content('what a great day')
  end

  scenario 'displays a box for comments on the view page' do 
    visit '/view'
    expect(page).to have_selector("input[type=submit][value='Comment']")
  end 
end
