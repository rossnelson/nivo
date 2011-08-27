class Slider < ActiveRecord::Base
  # attr_accessible :caption, :url, :active, :lft, :rgt, :image

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def self.page(search, page)
    with_permissions_to(:manage).search(search).order("position").paginate(:per_page => 12, :page => page)
  end

  def self.rotate
    where("active = ?", true).order("position")
  end

  def self.search(search)
    if search
      where("caption LIKE ?", "%#{search}%")
    else
      scoped
    end
  end
end

