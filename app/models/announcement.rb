class Announcement < ApplicationRecord

  is_impressionable
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body, :image_link
end
