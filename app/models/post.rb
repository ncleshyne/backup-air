class Post < ActiveRecord::Base
  belongs_to :user
  validates_length_of :about, :allow_blank => false
  validates :user_id, presence: true
  validates :image, presence: true
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :comments, dependent: :destroy
  geocoded_by :address   # can also be an IP address
  after_validation :geocode, :if => :address_changed?
end
