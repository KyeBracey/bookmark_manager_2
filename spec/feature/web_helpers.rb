def create_bubbles_link
  visit('/links/new')
  fill_in 'title', with: 'bubble tea'
  fill_in 'url', with: 'http://en.wikipedia.org/wiki/Bubble_tea'
  fill_in 'tag', with: 'bubbles'
  click_button 'submit'
end

def create_bleep_link
  visit('/links/new')
  fill_in 'title', with: 'Bleep'
  fill_in 'url', with: 'http://www.Bleep.com'
  fill_in 'tag', with: 'fun'
  click_button 'submit'
end
