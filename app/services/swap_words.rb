# frozen_string_literal: true

# Service for swap words def
class SwapWords
  def initialize(post)
    @post = post
  end

  def execute
    all_keys = Keyword.all.pluck(:key, :link).to_h.transform_keys(&:downcase)
    new_content = @post.content.to_s
    new_content.gsub!(/\w+/) do |word|
      url = all_keys[word.downcase]
      url ? "<a href='#{url}'>#{word}</a>" : word
    end
    @post.content = new_content
    @post.save!
  end
end
