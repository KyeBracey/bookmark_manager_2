feature 'Adding multiple tags to a link' do
  scenario 'User adds multiple tags to a link and sees them all displayed' do
    create_link_with_multiple_tags
    link = Link.first(title: 'Facebook')
    within 'ul#links' do
      expect(link.tags.map(&:name)).to include('time-consuming' && 'blue' && 'social')
    end
  end
end
