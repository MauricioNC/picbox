class User < ApplicationRecord
  has_secure_password

  has_many :images
  has_many :boxes
  has_many :boxes_images
  has_many :images_downloads
  has_many :user_interests
  has_many :tags, through: :user_interests

  validates_presence_of :full_name, on: :create, message: "can't be blank"
  validates_presence_of :username, on: :create, message: "can't be blank"
  validates_presence_of :email, on: :create, message: "can't be blank"
  validates_confirmation_of :password, on: :create, message: "should match confirmation"
  validates_presence_of :location, on: :create, message: "can't be blank"
  validates_presence_of :phone_number, on: :create, message: "can't be blank"
end
