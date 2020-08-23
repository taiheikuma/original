class Schedule < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 100 }
  validates :place, presence: true, length: { maximum: 30 }
end
