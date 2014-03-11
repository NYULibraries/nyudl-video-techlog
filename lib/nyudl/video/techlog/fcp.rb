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
          process_techlog
        end
        def valid?
          memo = true
          !@clips.empty? && (@clips.inject { |memo, clip| memo && clip.valid? })
        end

        private
        # flow:
        #   create XML document
        #   iterate over sequence
        #   if found QC then process qc return state to start
        #   if found beginning then process
        #   states:
        #     :start    - initial state
        #     :notes    - notes section detected
        #     :clip_in  - beginning of video clip detected
        #     :clip_out - end       of video clip detected
        #   valid transitions:
        #     :start    -> :notes
        #     :notes    -> :start
        #     :start    -> :clip_in
        #     :clip_in  -> :clip_out
        #     :clip_out -> :clip_in
        #   accept state:
        #     :clip_out

        def process_techlog
          current_clip = nil
          state = :start

          doc = Nokogiri::XML(File.open(@file_path))
          doc.xpath('/xmeml/sequence/marker').each do |m|
            marker = Marker.new(m)
            case
            when notes_marker?(marker)
              raise "invalid transition to :notes"   unless state == :start
              state = :notes
              @notes = marker.comment.sub(/\r <CHAPTER>\z/,'')

            when clip_in_marker?(marker)
              raise "invalid transition to :clip_in" unless [:start, :notes, :clip_out].include? state
              state = :clip_in
              current_clip = Clip.new()
              current_clip.process_params(marker.to_h)

            when clip_out_marker?(marker)
              raise "invalid transition to :clip_out" unless state == :clip_in
              state = :clip_out
              current_clip.process_params(marker.to_h)
              raise "processed clip_out marker, but clip still invalid" unless current_clip.valid?
              @clips << current_clip
            end
          end
          raise "ended in invalid state: #{state}" unless state == :clip_out
        end

        def notes_marker?(marker)
          /qa|qc/i.match(marker.name)
        end
        def clip_in_marker?(marker)
          /beginning of video|start of video/i.match(marker.name)
        end
        def clip_out_marker?(marker)
          /end of video/i.match(marker.name)
        end
      end
    end
  end
end
