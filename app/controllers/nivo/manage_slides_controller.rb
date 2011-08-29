module Nivo
  class ManageSlidesController < ApplicationController
    
    if defined?(Dust::Application)
      filter_access_to :all
      layout 'cms'
    end

    unloadable

    def create
      Nivo::Slide.sort(params[:slides])

      flash[:notice] = "Successfully sorted slides."
      redirect_to nivo_slides_url
    end

  end
end
