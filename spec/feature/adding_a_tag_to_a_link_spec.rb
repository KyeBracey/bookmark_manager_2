feature 'Adding a tag to a link' do
  scenario 'User can add a tag to a link' do
    visit('/links/new')
    fill_in 'title', with: 'Bleep'
    fill_in 'url', with: 'http://www.Bleep.com'
    fill_in 'tag', with: 'fun'
    click_button 'submit'
    expect(page).to have_content 'fun'
  end

end
