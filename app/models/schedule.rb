class Schedule < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  validates :place, presence: true, length: { maximum: 50 }
end
