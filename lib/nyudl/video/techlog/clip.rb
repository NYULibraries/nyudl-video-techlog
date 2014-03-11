require 'nokogiri'
module Nyudl
  module Video
    module Techlog
      class Clip
        attr_accessor :frame_count_in, :frame_count_out, :notes
        def initialize(params = {})
          @notes = nil
          @name  = nil
          @frame_count_in  = nil
          @frame_count_out = nil
          process_params(params)
        end

        def process_params(params)
          process_notes(params)
          process_frame_count_in(params)
          process_frame_count_out(params)
        end

        def valid?
          if ( @frame_count_in && @frame_count_out )
            @frame_count_out > @frame_count_in
          else
            false
          end
        end

        private
        def process_notes(params)
          case params[:name]
          when /QC|QA/i
            @notes = params[:comment] || ""
          end
        end
        def process_frame_count_in(params)
          case params[:name]
          when /beginning of video|start of video/i
            raise "frame_count_in: missing frame count" unless params[:in]
            @frame_count_in = params[:in]
          end
        end
        # N.B. the way clips are described by DLTS CCG, the FCP /xmeml/marker/in is used
        #      to communicate a frame count. /xmeml/marker/out is NOT used
        #      therefore, the params key is always :in
        def process_frame_count_out(params)
          case params[:name]
          when /end of video/i
            raise "frame_count_out: missing frame count" unless params[:in]
            @frame_count_out = params[:in]
          end
        end
      end
    end
  end
end

=begin
                  @params     = params.dup
                  @name       = params[:name]
                  @comment    = params[:comment]
                  @frames_in  = params[:in]
                  @frames_out = params[:out]
                  @type       = determine_type



flow:
- given a params hash:
  {:comment, :name, :in, :out}
  process hash

  what does pattern look like?


  need to concatenate
  clips = [ ]
  current_clip = clip.new
  for each marker
        current_clip.process(marker_to_params)
        if current_clip.valid?
          # we're done with this one
          clips << current_clip
          current_clip = clip.new
        end
  end
  # map function here accumulate a
  clips.each do |clip

caller:
  the techlog video processor
  getting at a video object
  video
        digitization info
          digi note
          extracted structure


          fps

instantiate:
  fps is global
  path to techlog file
  extract digi note
  extract clips : framecount in / framecount out




=end
