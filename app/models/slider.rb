class Slider < ActiveRecord::Base
  attr_accessible :caption, :url, :active, :lft, :rgt, :image

  has_attached_file :image, :styles => Nivo::Config.file['slide_dimensions'].symbolize_keys

  ##
  #
  # Save the image dimensions only when a new photo is uploaded
  #
  after_post_process :save_image_dimensions
  def save_image_dimensions
    geo = Paperclip::Geometry.from_file(image.queued_for_write[:slide])
    self.width = geo.width
    self.height = geo.height
  end


  ##
  #
  # Find for slideshow
  #
  def self.rotate
    where("active = ?", true).order("position")
  end

  ##
  #
  # Find for admin index
  #
  def self.page(search, page)
    with_permissions_to(:manage).search(search).order("position").paginate(:per_page => 12, :page => page)
  end

  ##
  #
  # currently used in self.page
  #
  def self.search(search)
    if search
      where("caption LIKE ?", "%#{search}%")
    else
      scoped
    end
  end
end

