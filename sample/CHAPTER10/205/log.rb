# logger�饤�֥���Logger���������Ƥ���Τ��ɤ߹���
require 'logger'
# fileutils�饤�֥���FileUtils.rm_f���������Ƥ���Τ��ɤ߹���
require 'fileutils'
LOG_FILE = "logtest.log"
# ���ե����뤬¸�ߤ���ʤ�к�����롣
FileUtils.rm_f LOG_FILE

# logtest.log�˥���񤭽Ф�Logger���֥������ȡ�
log = Logger.new LOG_FILE
# �����٤�info�ʾ�Τߥ��˵�Ͽ����ʾ�ά��ǽ�ˡ�
log.level = Logger::INFO
# ���˵��ܤ����ץ����̾�����ꤹ��ʾ�ά��ǽ�ˡ�
log.progname = "logtest"
# ����񤭽Ф���
log.debug "debug info"                # ����ͥ���� debug
log.info { "normal message" }         # ������ info
log.warn "warning!"                   # ������ warn
log.error "ERROR!"                    # ������ error
log.fatal("log.rb") { "!!!FATAL!!!" } # �ǹ�ͥ���� fatal
begin
  raise "err"
rescue
# Exception�⤽�Τޤޥ��˽񤭽Ф��롣
  log.error($!)
end
Time.now                        # => 2008-05-22 19:27:20 +0900
Process.pid                     # => 20007
# ������ȥ�ϡ������٤�Ƭʸ�������߻���ץ���ID�������١��ץ����̾����å������ν硣
puts File.read LOG_FILE
# >> # Logfile created on 2008-05-22 19:27:20 +0900 by /
# >> I, [2008-05-22T19:27:20.229504 #20007]  INFO -- logtest: normal message
# >> W, [2008-05-22T19:27:20.229627 #20007]  WARN -- logtest: warning!
# >> E, [2008-05-22T19:27:20.229677 #20007] ERROR -- logtest: ERROR!
# >> F, [2008-05-22T19:27:20.229724 #20007] FATAL -- log.rb: !!!FATAL!!!
# >> E, [2008-05-22T19:27:20.229798 #20007] ERROR -- logtest: err (RuntimeError)
# >> -:25:in `<main>'
