module Nivo
  class Slide < ActiveRecord::Base
    include Nivo::ManageSlides

    scope :active_slides, where(:active => true)
    scope :inactive_slides, where(:active => false)
   

    # attr_accessible :caption, :url, :active, :lft, :rgt, :image

    OPTIONS = Nivo::Config.file['paperclip_options'].symbolize_keys
    has_attached_file :image, OPTIONS

    ##
    # html options for the slide image_tag
    #
    def image_options
      if height.blank?
        # save_image_dimensions
      end
      image_options = {
        :height => Nivo::Config.file['slideshow_dimensions']['height'],
        :width => Nivo::Config.file['slideshow_dimensions']['width'],
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
    def self.paginate_all(search)
      if defined?(Dust::Application)
        with_permissions_to(:manage).search(search).order("position")
      else
        search(search).order("position")
      end
    end

    ##
    # currently used in self.paginate_all
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
