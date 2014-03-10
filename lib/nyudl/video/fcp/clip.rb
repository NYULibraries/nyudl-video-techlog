require 'nokogiri'
module Nyudl
  module Video
    module Fcp
      class Clip
        self.to_time(fps = 29.97)
        

        def initialize(params = {})
          @params     = params.dup
          @name       = params[:name]
          @comment    = params[:comment]
          @frames_in  = params[:in]
          @frames_out = params[:out]
          @type       = determine_type
        end

        def valid?
          # frames_in not nil
          # frames_out not nil
          # type not :unknown
        end

        private
        def determine_type
          
          
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
  the fcp video processor
  getting at a video object
  video
    digitization info
      digi note
      extracted structure


      fps
      
instantiate:
  fps is global
  path to fcp file
  extract digi note
  extract clips : framecount in / framecount out

  
  

=end
