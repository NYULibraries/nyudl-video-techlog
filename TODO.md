## TODO:
  * REFACTOR CLIP / FCP CLASSES
    * marker class should absorb significant portion of functionality
	  * type detection: notes / clip\_in / clip\_out
	  * clips should be simplified to match Vstruct API data model
	    * type, label, frame\_in, frame\_out
  * Process incoming QC comments field to strip <CHAPTER> strings and replace \r with newlines


## DONE:
  * add to_time methods to clips
  * add tests for fcp class
  * add validity tests for fcp class: if last clip started, but never added to clips array then NOT valid
    * handled with exceptions during fcp file processing
  * check formatting issues with digitization notes.  may want to detect and strip \r<CHAPTER> 
  
