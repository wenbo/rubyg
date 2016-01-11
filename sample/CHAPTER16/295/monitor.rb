# thread�饤�֥���Mutex���������Ƥ���Τ��ɤ߹���
require 'thread'
# monitor�饤�֥���Monitor���������Ƥ���Τ��ɤ߹���
require 'monitor'
class TinyLogger                # Logger�ν̾���
  def initialize(filename)
    @io = open(filename, "a")
# IO#puts�η�̤򤹤��˥ǥ�������ȿ�Ǥ��롣
    @io.sync = true
# ��¾���楪�֥������Ȥ�������롣���ξ��Ϥɤ���Ǥ�褤��
    @mutex = Monitor.new
    # @mutex = Mutex.new
  end

  def log(message)
    @mutex.synchronize do
# ���δ֤�����ƥ����륻������󡣥���å�������񤭹��ࡣ
      if @io.closed?
        raise Error, "Log file #{@io.path} is closed."
      else
        @io.puts "#{Time.now}:#{message}"
      end
    end
  end
  def close
# ���ե�������Ĥ���Τ⥯��ƥ����륻�������
    @mutex.synchronize { @io.close }
  end
end

log_file = "test.log"
File.unlink log_file          # nodisp
logger = TinyLogger.new log_file
# �ƥ���åɤǥ���å�������񤭹��ࡣ
Thread.start { logger.log "In thread 1."}
Thread.start { sleep 0.1; logger.log "In thread 2."}
logger.log "In main thread."
sleep 0.5
logger.close
puts File.read(log_file)
# >> 2008-11-23 09:27:55 +0900:In thread 1.
# >> 2008-11-23 09:27:55 +0900:In main thread.
# >> 2008-11-23 09:27:55 +0900:In thread 2.
