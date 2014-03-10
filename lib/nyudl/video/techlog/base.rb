require 'nokogiri'
module Nyudl
  module Video
    module Techlog
      class Base
        attr_reader   :digi_notes, :clips

        def initialize(f)
          @file_path = f.dup
          @digi_notes = ''
          @clips = []

          process_techlog_file
        end

        private
        def process_techlog_file
          f = File.open(@file_path)
        end

      end
    end
  end
end
