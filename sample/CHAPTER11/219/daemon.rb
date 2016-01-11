#!/usr/local/bin/ruby
# webrick/start�饤�֥���WEBrick::Daemon.start���������Ƥ���Τ��ɤ߹���
require 'webrick/server'
# logger�饤�֥���Logger���������Ƥ���Τ��ɤ߹���
require 'logger'
# ~/.daemontest.pid�ϥǡ����Υץ���ID����¸����ե����롣
PID_FILE = File.expand_path "~/.daemontest.pid"
# �ǡ�����ư�����ǥ��쥯�ȥ��daemontest.log�ϥ��ե����롣
LOG_FILE = File.expand_path "daemontest.log"
# ���ޥ�ɥ饤�󥪥ץ����ˡ�-k�פ����ꤷ�Ƥ���ʤ�С�
if ARGV.first == "-k"
# �ץ���ID���ɼ�äƥǡ����ץ����򻦤���
  Process.kill :SIGTERM, File.read(PID_FILE).to_i
  File.unlink PID_FILE, LOG_FILE
else
# �ǡ����ˤʤ롣Ruby 1.9�Ǥϡ�Process.daemon�פ��֤��������롣
  WEBrick::Daemon.start 
  logger = Logger.new(LOG_FILE)
# �ץ���ID��ե�����˵�Ͽ���롣
  open(PID_FILE, "w") {|f| f.print Process.pid }
# ���ե�����˽񤭹��ࡣ
  logger.info "pwd = #{Dir.pwd}"
  logger.info "pid = #{Process.pid}"
  1000.times do |i|
    logger.info "message by daemontest (#{i})."
    sleep 3
  end
end
