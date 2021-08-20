# frozen_string_literal: true

# Migration class for post swap limit
class AddSwapLimitToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :swap_limit, :integer, default: 0
    add_column :posts, :swap_limit_counter, :integer, default: 0
  end
end
