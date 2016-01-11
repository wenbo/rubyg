# zlib�饤�֥���Zlib���������Ƥ���Τ��ɤ߹���
require 'zlib'
# ̵���̡����̥ե�������ɤ߽񤭤����
open("uncompressed.txt", "w") {|f| f.puts "uncompressed" }
# �񤭹��߸��gzip���̤��롣
Zlib::GzipWriter.open("compressed.txt.gz") {|gz| gz.puts "compressed"}
open("uncompressed.txt") {|f| f.read }                     # => "uncompressed\n"
# gzip���̤Υե�������ɤ߹��ࡣ
Zlib::GzipReader.open("compressed.txt.gz") {|gz| gz.read } # => "compressed\n"

# gzipƩ��Υե������ɤ߹��ߥ᥽�å�File.zread��������롣
Zlib::GZIP_MAGIC = "\x1F\x8B"   # gzip�ե��������Ƭ2�Х���
# Ruby 1.9���ȥ��󥳡��ǥ��󥰤���ꤷ�ʤ���ư��ʤ���
Zlib::GZIP_MAGIC.force_encoding("ASCII-8BIT") if RUBY_VERSION >= "1.9"
def File.zread(file)
# File.open����open���������������⤤�ΤǸ�Ԥ�Ȥ����������λ�����self��File�ʤΤ�open�ؿ���Ƥ֤ˤ�Object���饹��ʸ̮�ˤ���ɬ�פ����롣
  Object.module_eval do
    open(file) do |f|           # Kernel#open���ƤФ��
# �ե��������Ƭ2�Х��Ȥ��ɤ߹��ߡ��ե�����ݥ��󥿤���Ƭ���᤹��
      magic = f.read(2)
      f.rewind
      if magic == Zlib::GZIP_MAGIC # gzip�ե�����Ǥ��뤳�Ȥ�Ƚ��
# f��Zlib::GzipReader�Ǥ���ߡ����व�줿���Ƥ��ɤ߹��ࡣ
        Zlib::GzipReader.wrap(f) {|gz| gz.read }
      else
# gzip�ե�����ǤϤʤ����Ϥ��Τޤޥե�������ɤ߹��ࡣ
        f.read
      end
    end
  end    
end
# ���Τ褦�˰��̥ե������̵���̥ե������Ʊ���褦�˰����롣
File.zread "uncompressed.txt"  # => "uncompressed\n"
File.zread "compressed.txt.gz" # => "compressed\n"
# ������open�ؿ���ȤäƤ���Τ�open-uri��Ȥ���URL���ɤ߹��ळ�Ȥ�Ǥ��롣
require 'open-uri'
File.zread("http://www.ruby-lang.org/en/")[0,20] # => "<!DOCTYPE html PUBLI"
