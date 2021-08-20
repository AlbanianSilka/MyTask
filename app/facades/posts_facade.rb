# TODO `<main>': uninitialized constant PostsFacade (NameError) - fix this error
class PostsFacade
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def new_post
    Post.new
  end

  def swap_content
    @post.swap_content.to_s
  end
end
