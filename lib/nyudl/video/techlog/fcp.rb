require 'nokogiri'
module Nyudl
  module Video
    module Techlog
      class Fcp
        attr_reader   :notes, :clips

        def initialize(f)
          @file_path = f.dup
          @notes = nil
          @clips = []
          process_techlog_file
        end
        def valid?
          memo = true
          @clips.inject { |memo, clip| memo && clip.valid? }
        end

        private
        def process_techlog_file
          doc = Nokogiri::XML(File.open(@file_path))
          current_clip = Clip.new()
          doc.xpath('/xmeml/sequence/marker').each do |m|
            marker = Marker.new(m)
            if /qa|qc/i.match(marker.name)
              @notes = marker.comment
            else
              current_clip.process_params(marker.to_h)
              if current_clip.valid?
                @clips << current_clip
                current_clip = Clip.new()
              end
            end
          end
        end
      end
    end
  end
end
