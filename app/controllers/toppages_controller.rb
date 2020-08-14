class ToppagesController < ApplicationController
  def index
    @articles = Article.order(id: :desc).first(3)
  end
end
