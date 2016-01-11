# loggerライブラリにLoggerが定義されているので読み込む
require 'logger'
# fileutilsライブラリにFileUtils.rm_fが定義されているので読み込む
require 'fileutils'
LOG_FILE = "logtest.log"
# ログファイルが存在するならば削除する。
FileUtils.rm_f LOG_FILE

# logtest.logにログを書き出すLoggerオブジェクト。
log = Logger.new LOG_FILE
# 重要度がinfo以上のみログに記録する（省略可能）。
log.level = Logger::INFO
# ログに記載されるプログラム名を設定する（省略可能）。
log.progname = "logtest"
# ログを書き出す。
log.debug "debug info"                # 最低優先度 debug
log.info { "normal message" }         # 重要度 info
log.warn "warning!"                   # 重要度 warn
log.error "ERROR!"                    # 重要度 error
log.fatal("log.rb") { "!!!FATAL!!!" } # 最高優先度 fatal
begin
  raise "err"
rescue
# Exceptionもそのままログに書き出せる。
  log.error($!)
end
Time.now                        # => 2008-05-22 19:27:20 +0900
Process.pid                     # => 20007
# ログエントリは、重要度の頭文字・現在時刻・プロセスID・重要度・プログラム名・メッセージの順。
puts File.read LOG_FILE
# >> # Logfile created on 2008-05-22 19:27:20 +0900 by /
# >> I, [2008-05-22T19:27:20.229504 #20007]  INFO -- logtest: normal message
# >> W, [2008-05-22T19:27:20.229627 #20007]  WARN -- logtest: warning!
# >> E, [2008-05-22T19:27:20.229677 #20007] ERROR -- logtest: ERROR!
# >> F, [2008-05-22T19:27:20.229724 #20007] FATAL -- log.rb: !!!FATAL!!!
# >> E, [2008-05-22T19:27:20.229798 #20007] ERROR -- logtest: err (RuntimeError)
# >> -:25:in `<main>'
