require 'rubygems'
require 'active_support'
# �̾�Υե�����񤭹��ߡ�
open("nonatomic.txt", "w") {|f| f.puts "Not atomically" }
# ���ȥߥå��ʥե�����񤭹��ߡ�����ǥ��쥯�ȥ�ϥ����ȥǥ��쥯�ȥꡣ
File.atomic_write("atomic.txt", Dir.pwd) {|f| f.puts "Atomically" }
