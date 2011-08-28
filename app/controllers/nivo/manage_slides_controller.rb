module Nivo
  class ManageSlidesController < ApplicationController

    filter_access_to :all

    unloadable

    layout 'cms'

    def create
      Nivo::Slide.sort(params[:slides])

      flash[:notice] = "Successfully sorted slides."
      redirect_to nivo_slides_url
    end

  end
end
