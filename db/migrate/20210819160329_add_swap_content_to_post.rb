class AddSwapContentToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :swap_content, :text
  end
end
