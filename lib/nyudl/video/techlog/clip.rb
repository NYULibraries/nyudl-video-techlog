require 'nokogiri'
module Nyudl
  module Video
    module Techlog
      class Clip
        attr_accessor :frame_in, :frame_out, :notes
        def initialize(params = {})
          @notes = nil
          @name  = nil
          @frame_in  = nil
          @frame_out = nil
          process_params(params)
        end

        def process_params(params)
          process_notes(params)
          process_frame_in(params)
          process_frame_out(params)
        end

        def valid?
          if ( @frame_in && @frame_out )
            @frame_out > @frame_in
          else
            false
          end
        end

        def time_in
          return nil if @frame_in.nil?
          TimeCode_29_97.frames_to_time_index(@frame_in)
        end

        def time_out
          return nil if @frame_out.nil?
          TimeCode_29_97.frames_to_time_index(@frame_out)
        end


        private
        def process_notes(params)
          case params[:name]
          when /QC|QA/i
            @notes = params[:comment] || ""
          end
        end
        def process_frame_in(params)
          case params[:name]
          when /beginning of video|start of video/i
            raise "frame_in: missing frame count" unless params[:in]
            @frame_in = params[:in]
          end
        end
        # N.B. the way clips are described by DLTS CCG, the FCP /xmeml/marker/in is used
        #      to communicate a frame count. /xmeml/marker/out is NOT used
        #      therefore, the params key is always :in
        def process_frame_out(params)
          case params[:name]
          when /end of video/i
            raise "frame_out: missing frame count" unless params[:in]
            @frame_out = params[:in]
          end
        end
      end
    end
  end
end
