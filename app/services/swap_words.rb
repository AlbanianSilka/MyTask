# frozen_string_literal: true

# Service for swap words def
class SwapWords
  include ActionController::Helpers
  include ActionController::Flash

  def initialize(post)
    @post = post
  end

  def execute(string)
    if @post.swap_limit_counter < @post.swap_limit
      begin
        string = string.to_plain_text.delete!("\n").strip
      rescue NoMethodError
        nil
      end
      all_keys = Keyword.all.pluck(:key, :link).to_h.transform_keys(&:downcase)
      all_keys.each do |key, value|
        count_links = string.to_s.scan(%r{<a href='#{value}'>#{key}</a>}i).size
        next if count_links >= 2

        if count_links == 1
          if string.to_s.scan(/#{key}\s|\s#{key}|\s#{key}\s/i).size.positive?
            string = string.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) do
              "<a href='#{value}'>#{key.capitalize}</a>"
            end
          end
        else
          string = string.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) do
            " <a href='#{value}'>#{key.capitalize}</a>"
          end
          string = string.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) do
            " <a href='#{value}'>#{key.capitalize}</a>"
          end
        end
      end
      string
      # @post.swap_limit_counter = @post.swap_limit_counter + 1
    end
  end
end
