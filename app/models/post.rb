# frozen_string_literal: true

# class to describe the actual posts model
class Post < ApplicationRecord
  has_rich_text :swap_content

  # def swapped_content
  #   swap_content.to_s
  # end
end
