# frozen_string_literal: true

# class for a posts controller
class PostsController < ApplicationController
  before_action :find_post, only: %i[show update edit destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render new
    end
  end

  def show; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  def swap_words
    # TODO: fix hyperlink format for views
    all_keys = Keyword.all.collect(&:key)
    all_links = Keyword.all.collect(&:link)
    my_hash = Hash[all_keys.zip(all_links.map { |i| i.split })]
    my_hash.default_proc = Proc.new {|hash, key| key}
    @post = Post.find(params[:post_id])
    @post.content = 'Utah is the best country in the world'
    @post.content = @post.content.to_s.gsub(/[[:word:]]+/).each(&my_hash)
    @post.content = @post.content.to_s.gsub(/"|\[|\]/, '')
    @post.content = @post.content.to_s.gsub(URI.regexp, '<a href="\0">\0</a>').html_safe
    @post.content.save!
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
