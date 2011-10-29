module Nivo
  module ManageSlides
    extend ActiveSupport::Concern

    module ClassMethods
      def sort(new_order={})
        new_order.to_a
        new_order.each do |order|
          slide = self.find(order[1])
          slide.position = order[0]
          slide.save
        end
      end
    end

  end
end
