module Nyudl
  module Video
    module Techlog
      # Guidance from: http://www.andrewduncan.ws/Timecodes/Timecodes.html
      class TimeCode_29_97
        FRAMES_PER_SEC_29_97 = 29.97

        # This converts an arbitrary 29.97 frame count to a time in seconds (hh:mm:ss.msec)
        def self.frames_to_time_index(frame_count)
          raise "incorrect format. frame count must contain only digits" unless /\A\d+\z/.match(frame_count.to_s)
          seconds = frame_count / FRAMES_PER_SEC_29_97

          hh, rem = seconds.divmod(60 * 60)
          mm, ss  = rem.divmod(60)
          mmm     = ((ss - ss.floor) * 1000).round

          sprintf("%02d:%02d:%02d.%03d", hh, mm, ss, mmm)
        end


        # This converts an arbitrary time (hh:mm:ss.msec) to a 29.97 dropcode framecount
        def self.time_index_to_frames(time_index)
          raise "incorrect format. time index must be hh:mm:ss.msec" unless /\A\d+:\d{2}:\d{2}(\.\d*)?\z/.match(time_index)

          # parse incoming time
          hh_s, mm_s, ss_s = time_index.split ':'

          hh = hh_s.to_i
          mm = mm_s.to_i
          ss = ss_s.to_f

          total_seconds = (((60 * hh) + mm) * 60) + ss

          (total_seconds * FRAMES_PER_SEC_29_97).round
        end
      end
    end
  end
end
