class ImagesDownload < ApplicationRecord
  belongs_to :image
  belongs_to :user
end
