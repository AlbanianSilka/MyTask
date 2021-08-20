# frozen_string_literal: true

# Service for swap words def
class SwapWords
  def initialize(post)
    @post = post
  end

  def execute
    all_keys = Keyword.all.pluck(:key, :link).to_h.transform_keys(&:downcase)
    @post.swap_content = @post.swap_content.to_s.gsub!(/\w+/) do |word|
      url = all_keys[word.downcase]
      url ? "<a href='#{url}'>#{word}</a>" : word
    end
    @post.content = @post.swap_content.to_plain_text.delete!("\n").strip
    @post.save!
  end
end
