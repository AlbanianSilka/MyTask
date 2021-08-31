# frozen_string_literal: true

require 'rails_helper'

feature 'Check hyperlink words', '
In order to create show some references in text
System should be able to show users hyperlinks in content of the post
' do
  given!(:keyword) { create(:keyword) }
  before(:each) do
    create(:keyword, link: 'https://www.google.com', key: 'Arizona')
    create(:keyword, link: 'https://www.google.com', key: 'Utah')
    @post = create(:post, content: 'testing Arizona ARIZONA state and Utah UTah arizona', title: 'Arizona state')
  end

  scenario 'Words in the post swapped' do
    visit post_path(@post)
    expect(page).to have_link('Arizona')
    expect(page).to have_link('Utah')
  end

  scenario 'Click on "swap words as if it would save it to db" button' do
    visit post_path(@post)
    @post.content = SwapWords.new(@post).execute(@post.content)
    expect(@post.content.to_s.scan(/http/).size).to eq 4
  end
end
