require 'nokogiri'
module Nyudl
  module Video
    module Fcp
      class Base
        attr_reader   :digi_notes, :clips
        attr_accessor :frame_rate

        def initialize(f)
          @file_path = f.dup
          @digi_notes = ''
          @clips = []
          @frame_rate = 29.97

          process_fcp_file
        end

        private
        def process_fcp_file
          f = File.open(@file_path)
        end

      end
    end
  end
end
