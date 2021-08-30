# frozen_string_literal: true

# class to describe the actual posts model
class Post < ApplicationRecord
  validate :non_zero
  has_rich_text :content

  def non_zero
    errors.add(:swap_limit, 'Swap limit cannot be negative or equal to zero') if swap_limit <= 0
  end
end
