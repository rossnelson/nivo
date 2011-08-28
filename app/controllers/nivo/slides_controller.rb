module Nivo
  class SlidesController < ApplicationController

    filter_access_to :all

    unloadable

    layout 'cms'

    def index
      @slides = Nivo::Slide.page(params[:search], params[:page]) 
    end

    def show
      @slide = Nivo::Slide.find(params[:id])
    end

    def new
      @slide = Nivo::Slide.new
    end

    def create
      @slide = Nivo::Slide.new(params[:nivo_slide])
      if @slide.save
        flash[:notice] = "Successfully created slide."
        redirect_to @slide
      else
        render :action => 'new'
      end
    end

    def edit
      @slide = Nivo::Slide.find(params[:id])
    end

    def update
      @slide = Nivo::Slide.find(params[:id])
      if @slide.update_attributes(params[:nivo_slide])
        flash[:notice] = "Successfully updated slide."
        redirect_to @slide
      else
        render :action => 'edit'
      end
    end

    def destroy
      @slide = Nivo::Slide.find(params[:id])
      @slide.destroy
      flash[:notice] = "Successfully destroyed slide."
      redirect_to nivo_slides_url
    end

  end
end
