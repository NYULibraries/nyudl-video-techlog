## TODO:
  * REFACTOR CLIP / FCP CLASSES
    * marker class should absorb significant portion of functionality
	  * type detection: notes / clip\_in / clip\_out
	  * clips should be simplified to match Vstruct API data model
	    * type, label, frame\_in, frame\_out

* pull notes detection out of clip
  * add tests for marker class
  * add tests for fcp class
  * add validity tests for fcp class: if last clip started, but never added to clips array then NOT valid
  * check formatting issues with digitization notes.  may want to detect and strip \r<CHAPTER> 
  * NEED TO TEST PARAMTER PROCESSING
  * POSSIBLY ADD WARNING IF PROCESS_PARAMETERS CALLED AND NOTHING PROCESSED


  * add to_time methods to clips
  
