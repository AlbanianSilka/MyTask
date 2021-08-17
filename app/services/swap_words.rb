# frozen_string_literal: true

# Service for swap words def
class SwapWords
  def initialize(post)
    @post = post
  end

  def execute
    all_keys = Keyword.all.pluck(:key, :link)
    new_content = @post.content.to_s
    all_keys.map { |key, link| new_content.gsub!(key, "<a href='#{link}'>#{key}</a>") }
    @post.content = new_content
    @post.save!
  end
end
