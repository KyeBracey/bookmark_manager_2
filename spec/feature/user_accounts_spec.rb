feature ' user accounts' do
  scenario 'user signs up sent to links page' do
    signup
    expect(page).to have_current_path('/links')

  end

  scenario 'user signs up see welcome message with email' do
    signup
    expect(page).to have_content('Welcome, bob@gmail.com')
  end

  scenario ' user count increases by one' do
    expect(User.count).to eq(0)
    signup
    expect(User.count).to eq(1)
  end


end
