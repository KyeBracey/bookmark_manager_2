feature 'Adding a tag to a link' do
  scenario 'User can add a tag to a link' do
    visit('/links/new')
    fill_in 'title', with: 'Bleep'
    fill_in 'url', with: 'http://www.Bleep.com'
    fill_in 'tag', with: 'fun'
    click_button 'submit'
    link = Link.first
    within 'ul#links' do
      expect(link.tags.map(&:name)).to include('fun')
    end
  end

end
