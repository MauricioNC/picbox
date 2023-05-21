module HomeHelper
  def getRandomImage()
    image = Image.limit(1).order("RANDOM()").first
    image.photo unless image.nil?
  end
end
