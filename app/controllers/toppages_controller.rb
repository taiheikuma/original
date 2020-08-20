class ToppagesController < ApplicationController
  def index
    @articles = Article.order(id: :desc).first(3)
    @schedules = Schedule.order(:day)
  end
end
