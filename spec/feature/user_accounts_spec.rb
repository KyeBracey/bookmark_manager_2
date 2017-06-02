feature ' user accounts' do

  scenario ' user count increases by one' do
    signup
    expect{signup}.to change{User.count}.by(1)
  end

  scenario 'user signs up sent to links page' do
    signup
    expect(page).to have_current_path('/links')
  end

  scenario 'user signs up see welcome message with email' do
    signup
    expect(page).to have_content('Welcome, bob@gmail.com')
  end

end
