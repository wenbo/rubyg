require 'tempfile'
# open�ؿ���File.open�Τ褦�˥֥�å����뤳�Ȥ��Ǥ��롣
Tempfile.open("foo") do |f|
# �ե�����̾�ϰ���ե������ѥǥ��쥯�ȥ�˺���롣
  path = f.path     # => "/tmp/foo20090426-1171-1rip98o-0"
# ����ե�����˽񤭹��ࡣ
  f.puts "abcdef"
# ��öclose���롣
  f.close
  File.exist? path  # => true
# ����ե������Ƥӳ��������ΤȤ��ե�����ݥ��󥿤���Ƭ�ˤʤäƤ��롣
  f.open
# ���Τ��ᡢ�����񤭽Ф������Ƥ��ɤळ�Ȥ��Ǥ��롣
  f.read            # => "abcdef\n"
# ��f.close!�פ���f.close true�פǥե�������Ĥ����塢������롣
  f.close!
  File.exist? path  # => false
# ���λ�����f.path�ؤϥ��������Ǥ��ʤ��ʤäƤ��롣
  f.path            # => nil
end
# Ruby 1.8.7�ʹߤǤϰ������������ꤹ�뤳�Ȥǳ�ĥ�Ҥ����Ǥ��롣
Tempfile.open(["hoge", ".rb"]) do |f|
  f.path            # => "/tmp/hoge20090426-1171-1jy8rkz-0.rb"
end
