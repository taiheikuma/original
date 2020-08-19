class ToppagesController < ApplicationController
  def index
    @articles = Article.order(id: :desc).first(3)
    @schedules_april = Schedule.where("month(day) = 4")
    @schedules_may = Schedule.where("month(day) = 5")
    @schedules_june = Schedule.where("month(day) = 6")
    @schedules_july = Schedule.where("month(day) = 7")
    @schedules_aug = Schedule.where("month(day) = 8")
    @schedules_sep = Schedule.where("month(day) = 9")
    @schedules_oct = Schedule.where("month(day) = 10")
    @schedules_nov = Schedule.where("month(day) = 11")
    @schedules_des = Schedule.where("month(day) = 12")
    @schedules_jun = Schedule.where("month(day) = 1")
    @schedules_feb = Schedule.where("month(day) = 2")
    @schedules_march = Schedule.where("month(day) = 3")
  end
end
