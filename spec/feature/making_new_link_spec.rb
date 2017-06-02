require_relative '../../app/models/link'

feature 'Adding new links' do
  scenario'User can add new links' do
    visit('/links/new')
    fill_in 'title', with: 'Bleep'
    fill_in 'url', with: 'http://www.Bleep.com'
    click_button 'submit'
    expect(page).to have_content 'Bleep'
  end

end
