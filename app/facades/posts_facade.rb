# TODO `<main>': uninitialized constant PostsFacade (NameError) - fix this error

class PostsFacade
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def title
    @post.title
  end

  def big_title
    @post.title.capitalize
  end

  def description_with_link
    @post.content = SwapWords.new(@post).execute(@post.content)
  end

end
