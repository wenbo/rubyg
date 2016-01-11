require 'logger'
require 'fileutils'
FileUtils.rm_f Dir["rotate.log*"]
log = Logger.new "rotate.log", 5, 20
("a".."z").each {|c| log.info c*19 }
Dir["rotate.log*"].sort
# => ["rotate.log", "rotate.log.0", "rotate.log.1", "rotate.log.2", "rotate.log.3"]
File.readlines "rotate.log"
# => ["# Logfile created on 2008-05-22 19:50:37 +0900 by /\n",
#     "I, [2008-05-22T19:50:37.430819 #20420]  INFO -- : zzzzzzzzzzzzzzzzzzz\n"]
File.readlines "rotate.log.3"
# => ["# Logfile created on 2008-05-22 19:50:37 +0900 by /\n",
#     "I, [2008-05-22T19:50:37.429723 #20420]  INFO -- : vvvvvvvvvvvvvvvvvvv\n"]
