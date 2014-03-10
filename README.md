# Nyudl::Video::Techlog

#### A gem for working with techlog files generated during the NYU DLTS video production workflow.

## Current Status

### *UNDER DEVELOPMENT*


## Installation

Add this line to your application's Gemfile:

	gem 'nyudl-video-techlog'

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install nyudl-video-techlog

## Context
  Currently, techlog files are created during the video digitization/capture process,
  e.g., Apple Final Cut Pro XML (FCP), SAMMA migration files.

  The gem will initially support FCP files, extracting the digitization quality control
  data as well as the time-in/time-out points of the various content clips.
  
### FCP files: 
  The XPath expression for these elements:
  /xmeml/sequence/marker
  
  Digitization Quality Control data:

    /xmeml/sequence/marker/name.text      'QC|QA'
    /xmeml/sequence/marker/comment.text   description of video condition
    /xmeml/sequence/marker/in             0
	/xmeml/sequence/marker/out            -1
	
  Video Markers:

    time in:
	
    /xmeml/sequence/marker/name.text      'Beginning of video|beginning of video|start of video'
    /xmeml/sequence/marker/comment.text   '<CHAPTER>'
    /xmeml/sequence/marker/in             time index in frames, e.g., 1350
	/xmeml/sequence/marker/out            -1
	
    time out:
	
    /xmeml/sequence/marker/name.text      'end of video'
    /xmeml/sequence/marker/comment.text   '<CHAPTER>'
    /xmeml/sequence/marker/in             time index in frames, e.g., 1350
	/xmeml/sequence/marker/out            -1
	
	

## Usage

	require 'nyudl/video/techlog'

    techlog = Nyudl::Video::Techlog::Fcp.new(File.open('path/to/techlog.xml',options)
	techlog.valid?
	techlog.clips 
	clip.time_in.smpte_29_97
	clip.time_out.smpte_29_97
	clip.time_in.frames
	clip.time_out.frames
	clip.message

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
