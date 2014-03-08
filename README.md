# Nyudl::Video::Fcp

#### A gem for working with Apple Final Cut Pro XML files generated during the NYU DLTS video production workflow.

## Current Status

### *UNDER DEVELOPMENT*


## Installation

Add this line to your application's Gemfile:

	gem 'nyudl-video-fcp'

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install nyudl-video-fcp

## Context
  Currently, fcp.xml files are used during the video digitization/capture process
  to indicate content begin/end points and source video condition data.
  All three of these types of data are stored using chapter markers in the
  fcp file.
  
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

	require 'nyudl/video/fcp'

    fcp = Nyudl::Video::Fcp.new(File.open('path/to/fcp.xml',options)
	fcp.valid?
	fcp.clips 
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
