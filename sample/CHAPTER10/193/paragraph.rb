require 'stringio'
text = StringIO.new <<EOT
StringIO��
IO�򿿻�����ʸ���󥯥饹��

�����餳�ξ���
IO���Τ�ΤȻפäƤ��졣

����Ϥդ��Ĥβ��Ԥ���ڤ�ˤ��������
EOT
text.gets("\n\n")               # => "StringIO��\nIO�򿿻�����ʸ���󥯥饹��\n\n"
text.gets("\n\n").chomp("\n\n") # => "�����餳�ξ���\nIO���Τ�ΤȻפäƤ��졣"
text.gets("\n\n")               # => "����Ϥդ��Ĥβ��Ԥ���ڤ�ˤ��������\n"
text.rewind                     # �ե�����ݥ��󥿤�ǽ���᤹��
text.readlines("\n\n")
# => ["StringIO��\nIO�򿿻�����ʸ���󥯥饹��\n\n",
#     "�����餳�ξ���\nIO���Τ�ΤȻפäƤ��졣\n\n",
#     "����Ϥդ��Ĥβ��Ԥ���ڤ�ˤ��������\n"]
