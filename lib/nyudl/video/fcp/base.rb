require 'nokogiri'
module Nyudl
  module Video
    module Fcp
      class Base
        def initialize(f)
          @file_path = f.dup

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
