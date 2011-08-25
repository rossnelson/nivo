module Nivo
  class SlidersController < ApplicationController

    filter_resource_access

    layout 'cms'

    def index
      @sliders = Nivo::Slider.page(params[:search], params[:page]) 
    end

    def show
      @slider = Nivo::Slider.find(params[:id])
    end

    def new
      @slider = Nivo::Slider.new
    end

    def create
      @slider = Nivo::Slider.new(params[:slider])
      if @slider.save
        flash[:notice] = "Successfully created slider."
        redirect_to @slider
      else
        render :action => 'new'
      end
    end

    def edit
      @slider = Nivo::Slider.find(params[:id])
    end

    def update
      @slider = Nivo::Slider.find(params[:id])
      if @slider.update_attributes(params[:slider])
        flash[:notice] = "Successfully updated slider."
        redirect_to @slider
      else
        render :action => 'edit'
      end
    end

    def destroy
      @slider = Nivo::Slider.find(params[:id])
      @slider.destroy
      flash[:notice] = "Successfully destroyed slider."
      redirect_to sliders_url
    end

  end
end
