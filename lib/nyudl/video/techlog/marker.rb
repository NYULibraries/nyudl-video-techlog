require 'nokogiri'
module Nyudl
  module Video
    module Techlog
      class Marker
        attr_accessor :name, :comment, :in, :out
        def initialize(m)
          raise "must be 'marker' element" unless m.name == 'marker'
          @marker  = m
          @name    = m.xpath('name').text
          @comment = m.xpath('comment').text
          @in      = m.xpath('in').text
          @out     = m.xpath('out').text
        end

        def to_h
          {
            name:    @name,
            comment: @comment,
            in:      @in,
            out:     @out
          }
        end
      end
    end
  end
end
