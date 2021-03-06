require_relative 'base'

module Rubyplot
  module Artist
    class XAxis < Axis::Base
      def initialize axes
        super
      end

      def draw
        configure_title
        Rubyplot.backend.draw_x_axis(
          origin: @axes.origin[0],
          major_ticks: @major_ticks,
          minor_ticks: @minor_ticks,
          major_ticks_count: @major_ticks_count,
          minor_ticks_count: @minor_ticks_count
        )
        @texts.each(&:draw)
      end

      private

      def configure_title
        @title = 'X axis' if @title == ''
        @texts << Rubyplot::Artist::Text.new(
          @title,
          self,
          size: @title_font_size,
          abs_y: @axes.abs_y,
          abs_x: @axes.abs_x + @axes.width/2
        )
      end
    end # class XAxis
  end # class Artist
end # module Rubyplot
