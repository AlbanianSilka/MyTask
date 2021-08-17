# frozen_string_literal: true

# class for a keywords controller
class KeywordsController < ApplicationController
  before_action :find_keyword, only: %i[show update edit destroy]

  def index
    @keywords = Keyword.all
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(keyword_params)
    if @keyword.save
      redirect_to @keyword
    else
      render new
    end
  end

  def show; end

  def update
    if @keyword.update(keyword_params)
      redirect_to @keyword
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    @keyword.destroy

    redirect_to keywords_path
  end

  private

  def keyword_params
    params.require(:keyword).permit(:key, :link)
  end

  def find_keyword
    @keyword = Keyword.find(params[:id])
  end
end
