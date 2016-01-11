puts File.readlines("logtest.log").grep(/^E/)
# >> E, [2008-05-22T19:27:20.229677 #20007] ERROR -- logtest: ERROR!
# >> E, [2008-05-22T19:27:20.229798 #20007] ERROR -- logtest: err (RuntimeError)
