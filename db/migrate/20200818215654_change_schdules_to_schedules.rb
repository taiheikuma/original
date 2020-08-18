class ChangeSchdulesToSchedules < ActiveRecord::Migration[5.2]
  def change
    rename_table :schdules, :schedules
  end
end
