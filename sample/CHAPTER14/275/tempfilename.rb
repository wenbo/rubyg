require 'tmpdir'      # ����ǥ��쥯�ȥ���֤�Dir.tmpdir��������Ƥ���
tmp_script = File.join(Dir.tmpdir, "foo.rb") # => "/tmp/foo.rb"
open( tmp_script, "w") do |f|
# ������ץȽ�λľ���˰���ե������ä���
  at_exit { File.unlink tmp_script }
  f.puts "puts 'hoge'"
end
# ����ե�����������ޥ�ɡ�ruby�ˤ����Ѥ��롣
system "ruby", tmp_script
# >> hoge
