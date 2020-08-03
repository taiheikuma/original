class Post < ApplicationRecord
  validates :tittle, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
    
  belongs_to :user
  
  has_many :reads
  has_many :readings, through: :reads, source: :user 
end
