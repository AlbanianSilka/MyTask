# frozen_string_literal: true

require 'rails_helper'

feature 'Create post', '
In order to share an opinion
User should be able to create some posts
' do
  scenario 'Post created' do

    visit posts_path
    click_on 'Create new post'
    fill_in 'Title', with: 'Rspec post title'
    fill_in 'Swap limit', with: 3
    find('trix-editor').click.set('New text')
    click_on 'submit'

    expect(page).to have_field('Title', with: 'Rspec post title')
  end

end
