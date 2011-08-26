module Nivo
  module Helper
    def slider(show_slider = true)
      @show_slider = show_slider
    end

    def show_slider?
      @sliders = Slider.rotate
      render "nivo/sliders", :sliders => @sliders if @show_slider
    end
  end
end
