feature 'Filtering by tag' do
  before(:each) do
    create_bubbles_link
    create_bleep_link
  end
  scenario 'Only links with tag with bubbles present' do
    visit('/tags/bubbles')
    expect(page).to have_content('bubble tea')
    expect(page).not_to have_content('Bleep')
  end
end
