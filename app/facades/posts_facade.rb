# frozen_string_literal: true

# Facade class for posts controller
class PostsFacade
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def title
    @post.title
  end

  def description_with_link
    @post.content = SwapWords.new(@post).execute(@post.content)
  end
end
