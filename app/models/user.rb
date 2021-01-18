class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  validates_presence_of :name, :contact_number
  has_many :announcements
  has_many :comments
end
