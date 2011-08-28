module Nivo
  class ManageSlidesController < ApplicationController

    filter_access_to :all

    unloadable

    layout 'cms'

    def index
      @slides = Nivo::Slide.sort(params[:slides])

      flash[:notice] = "Successfully updated slide."
      redirect_to nivo_slides_path
    end

  end
end
