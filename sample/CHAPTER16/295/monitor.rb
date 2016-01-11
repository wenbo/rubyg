# threadライブラリにMutexが定義されているので読み込む
require 'thread'
# monitorライブラリにMonitorが定義されているので読み込む
require 'monitor'
class TinyLogger                # Loggerの縮小版
  def initialize(filename)
    @io = open(filename, "a")
# IO#putsの結果をすぐにディスクに反映する。
    @io.sync = true
# 排他制御オブジェクトを作成する。この場合はどちらでもよい。
    @mutex = Monitor.new
    # @mutex = Mutex.new
  end

  def log(message)
    @mutex.synchronize do
# この間がクリティカルセクション。ログメッセージを書き込む。
      if @io.closed?
        raise Error, "Log file #{@io.path} is closed."
      else
        @io.puts "#{Time.now}:#{message}"
      end
    end
  end
  def close
# ログファイルを閉じるのもクリティカルセクション。
    @mutex.synchronize { @io.close }
  end
end

log_file = "test.log"
File.unlink log_file          # nodisp
logger = TinyLogger.new log_file
# 各スレッドでログメッセージを書き込む。
Thread.start { logger.log "In thread 1."}
Thread.start { sleep 0.1; logger.log "In thread 2."}
logger.log "In main thread."
sleep 0.5
logger.close
puts File.read(log_file)
# >> 2008-11-23 09:27:55 +0900:In thread 1.
# >> 2008-11-23 09:27:55 +0900:In main thread.
# >> 2008-11-23 09:27:55 +0900:In thread 2.
