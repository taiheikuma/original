class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
    has_secure_password
    
    belongs_to :part, optional: true
    
    has_many :posts
    has_many :articles
    has_many :schdules
    has_many :reads
    has_many :readings, through: :reads, source: :post
    
    def read(other_post)
        unless self == other_post
          self.reads.find_or_create_by(post_id: other_post.id)
        end
    end
    
    def unread(other_post)
        read = self.reads.find_by(post_id: other_post.id)
        read.destroy if read
    end
    
    def reading?(other_post)
        self.readings.include?(other_post)
    end
    
    mount_uploader :image, ImageUploader
end
