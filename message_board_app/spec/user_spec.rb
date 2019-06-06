require 'user'

describe User do
  it 'adds a user with name, email and password ' do 
    User.add('Lauren', 'lauren.omara22@gmail.com', 'Password1')
    users = User.all
    expect(users['name']).to eq('Lauren')
    expect(users['email']).to eq('lauren.omara22@gmail.com')
  end 
end 