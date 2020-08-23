class Post < ApplicationRecord
  validates :tittle, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
    
  belongs_to :user
  
  has_many :reads, dependent: :destroy
  has_many :readings, through: :reads, source: :user 
  has_many :reverses_of_reads, class_name: 'Reads'
  has_many :read, through: :reverses_of_reads, source: :user
end
