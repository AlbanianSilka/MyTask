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

  def edit
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  def swap_words
    @post = Post.find(params[:post_id])
    SwapWords.new(@post).execute
    redirect_to post_path(@post), alert: 'Post has been successfully updated'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :swap_content, :swap_limit, :swap_limit_counter)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
