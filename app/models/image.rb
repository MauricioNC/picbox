class Image < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :images_tags
  has_many :tags, through: :images_tags

  def self.search(search)
    unless search == ""
      tag = Tag.where("tag_name ILIKE ?", "%#{search[0..3]}%")
      self.joins(:images_tags).where("images_tags.tag_id": tag.ids).distinct
    end
  end
end
