#!/usr/local/bin/ruby
# webrick/startライブラリにWEBrick::Daemon.startが定義されているので読み込む
require 'webrick/server'
# loggerライブラリにLoggerが定義されているので読み込む
require 'logger'
# ~/.daemontest.pidはデーモンのプロセスIDを保存するファイル。
PID_FILE = File.expand_path "~/.daemontest.pid"
# デーモンを起動したディレクトリのdaemontest.logはログファイル。
LOG_FILE = File.expand_path "daemontest.log"
# コマンドラインオプションに「-k」が指定してあるならば、
if ARGV.first == "-k"
# プロセスIDを読取ってデーモンプロセスを殺す。
  Process.kill :SIGTERM, File.read(PID_FILE).to_i
  File.unlink PID_FILE, LOG_FILE
else
# デーモンになる。Ruby 1.9では「Process.daemon」に置き換えられる。
  WEBrick::Daemon.start 
  logger = Logger.new(LOG_FILE)
# プロセスIDをファイルに記録する。
  open(PID_FILE, "w") {|f| f.print Process.pid }
# ログファイルに書き込む。
  logger.info "pwd = #{Dir.pwd}"
  logger.info "pid = #{Process.pid}"
  1000.times do |i|
    logger.info "message by daemontest (#{i})."
    sleep 3
  end
end
