# ���󥳡��ǥ��󥰤���ꤹ����
# Shift_JIS�ǽ񤫤줿�ե���������Ƥ�Ԥ��Ȥ�ʬ�䤹�롣
sjis_txt = open("sjis.txt", "r:Shift_JIS") {|f| f.readlines }
sjis_txt.map(&:encoding)  # => [#<Encoding:Shift_JIS>, #<Encoding:Shift_JIS>]
sjis_txt = File.readlines("sjis.txt", :encoding => "Shift_JIS")
sjis_txt.map(&:encoding)  # => [#<Encoding:Shift_JIS>, #<Encoding:Shift_JIS>]
# EUC-JP�ǽ񤫤줿�ե������UTF-8���Ѵ����롣
euc_txt_utf8 = File.read("euc.txt", :encoding => "EUC-JP:UTF-8")
euc_txt_utf8.encoding     # => #<Encoding:UTF-8>
# �������󥳡��ǥ��󥰤�����ɤ߹��ߡ����((:String#encode:))�ˤ�륨�󥳡��ǥ����Ѵ��򤷤Ƥ�褤��
euc_txt_euc = File.read("euc.txt", :encoding => "EUC-JP")
euc_txt_euc.encode("UTF-8") == euc_txt_utf8  # => true
# ���󥳡��ǥ��󥰤���ꤷ�ʤ����Υ��󥳡��ǥ��󥰤�default_internal��default_external�ˤʤ롣
File.read("euc.txt").encoding  # => #<Encoding:EUC-JP>
Encoding.default_external = "EUC-JP" # !> setting Encoding.default_external
Encoding.default_internal = "Shift_JIS" # !> setting Encoding.default_internal
File.read("euc.txt").encoding  # => #<Encoding:Shift_JIS>
