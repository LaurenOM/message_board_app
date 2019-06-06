require 'comment' 

describe Comment do 
  it 'displays the comments with a specific foreign id' do 
    comments = Comment.all(1)
    expect(comments.first['comment']).to eq('What a great post')
  end 

  it 'adds a comment with message id' do 
    Comment.add_comment(2, 'Amazing!')
    comments = Comment.all(2)
    expect(comments).to include({"id"=>"3", "message_id"=>"2", "comment"=>"Amazing!", "user_id"=>nil})
  end 
end 