module Nivo
  module Helper
    def slider(show_slider = true)
      @show_slider = show_slider
    end

    def show_slider?
      render "nivo/sliders" if @show_slider
    end
  end
end
