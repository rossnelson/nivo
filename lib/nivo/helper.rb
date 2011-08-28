module Nivo
  module Helper
    def slider(show_slider = true)
      @show_slider = show_slider
    end

    def show_slider?
      @slides = Nivo::Slide.rotate
      render "nivo/slideshow", :slides => @slides if @show_slider
    end
  end
end
