# frozen_string_literal: true

# class to describe the actual posts model
class Post < ApplicationRecord
  has_rich_text :content
end
