require 'logger'
require 'fileutils'

def write_log(msg)
  log = Logger.new "weekly.log", "weekly"
  log.info msg
  log.close
end
FileUtils.rm_f Dir["weekly.log*"]
write_log "first"
File.utime Time.now, Time.now-7*24*60*60, "weekly.log" # 1週間前にする
write_log "second"
Dir["weekly.log*"].sort
# => ["weekly.log", "weekly.log.20080517"]
File.readlines "weekly.log"
# => ["# Logfile created on 2008-05-22 23:20:13 +0900 by /\n",
#     "I, [2008-05-22T23:20:13.844568 #22721]  INFO -- : second\n"]
