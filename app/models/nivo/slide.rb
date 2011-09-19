module Nivo
  class Slide < ActiveRecord::Base
    include Nivo::ManageSlides

    attr_accessible :caption, :url, :active, :lft, :rgt, :image

    OPTIONS = Nivo::Config.file['paperclip_options'].symbolize_keys
    has_attached_file :image, OPTIONS


    ##
    # Save the image dimensions only when a new photo is uploaded
    #
    # after_post_process :save_image_dimensions
    #
    def save_image_dimensions
      geo = Paperclip::Geometry.from_file(image.url(:slide))
      self.width = geo.width
      self.height = geo.height
      self.save
    end

    ##
    # html options for the slide image_tag
    #
    def image_options
      if height.blank?
        save_image_dimensions
      end
      image_options = {
        :height => height,
        :width => width,
        :class => "slide",
        :title => (caption if Nivo::Config.file['caption'] == true)
      }
    end

    ##
    # Find for slideshow
    #
    def self.rotate
      where("active = ?", true).order("position")
    end

    ##
    # Find for admin index
    #
    def self.page(search)
      if defined?(Dust::Application)
        with_permissions_to(:manage).search(search).order("position")
      else
        search(search).order("position")
      end
    end

    ##
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
end
