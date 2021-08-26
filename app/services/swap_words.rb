# frozen_string_literal: true

# Service for swap words def
class SwapWords
  include ActionController::Helpers
  include ActionController::Flash

  def initialize(post)
    @post = post
  end

  def execute
    if @post.swap_limit_counter < @post.swap_limit
      begin
        @post.swap_content = @post.swap_content.to_plain_text.delete!("\n").strip
      rescue NoMethodError
        nil
      end
      all_keys = Keyword.all.pluck(:key, :link).to_h.transform_keys(&:downcase)
      all_keys.each do |key, value|
        count_links = @post.swap_content.to_s.scan(/<a href='#{value}'>#{key}<\/a>/i).size
        next if count_links >= 2

        if count_links == 1
          if @post.swap_content.to_s.scan(/#{key}\s|\s#{key}|\s#{key}\s/i).size.positive?
            @post.swap_content = @post.swap_content.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) {"<a href='#{value}'>#{key.capitalize}</a>"}
          end
        else
          @post.swap_content = @post.swap_content.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) {" <a href='#{value}'>#{key.capitalize}</a> "}
          @post.swap_content = @post.swap_content.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) {" <a href='#{value}'>#{key.capitalize}</a> "}
        end
      end
      @post.swap_content
      @post.content = @post.swap_content.to_plain_text.delete!("\n").strip
      @post.swap_limit_counter = @post.swap_limit_counter + 1
      @post.save!
    end
  end
end
