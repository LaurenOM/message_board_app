feature MessageBoard do 
  scenario 'presents a form asking for a name' do 
    visit '/'
    expect(page).to have_field("name")
  end 

  scenario 'presents a form asking for a message' do 
    visit '/'
    expect(page).to have_field("message")
  end 

  scenario 'it displays name and message back' do
    visit '/'
    fill_in 'name', with: 'Lauren'
    fill_in 'message', with: 'what a great day'
    click_button 'Post'
    expect(page).to have_content('Lauren') 
    expect(page).to have_content('what a great day')
  end
end
