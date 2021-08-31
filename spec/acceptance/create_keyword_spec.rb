# frozen_string_literal: true

require 'rails_helper'

feature 'Create keyword', '
In order to create hyperlinks in posts
Admin should be able to create keywords
' do
  scenario 'Keyword created' do

    visit keywords_path
    click_on 'Create new keyword'
    fill_in 'Key', with: 'Arizona'
    fill_in 'Link', with: 'https://www.google.com'
    click_on 'submit'

    expect(page).to have_link('Arizona')
  end

end
