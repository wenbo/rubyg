#!/usr/local/bin/ruby -Ke
# nkf�饤�֥���NKF.nkf���������Ƥ���Τ��ɤ߹��ࡣ
require 'nkf'
euc = "��Ӥ�����"
# Ʊ�쥪�֥������Ȥʤ������==��Ʊ�͡ˤˤʤ롣
euc == euc          # => true
# Ruby 1.8�Ǥ�Ʊ���Х�����ʤ��==�ˤʤ롣
euc == "��Ӥ�����" # => true
# �̤�ʸ�������ɤˤ����������Х�����ϰۤʤ�Τ�==�ˤϤʤ�ʤ���
sjis = NKF.nkf("-Es", euc)
euc == sjis         # => false

# HTTP < IMAP < SMTP < http < imap < smtp
# ʸ������Ӥ�ʸ�������ɽ硣
"HTTP" < "IMAP" && "IMAP" < "SMTP" && "SMTP" < "http" # => true
# ==����ʸ����ʸ������̤��롣
"SMTP" == "smtp"                                      # => false
# ��<=>�ױ黻�Ҥ�����������0����������������-1�������礭������1���֤���
"SMTP" <=> "SMTP"                                     # => 0
"HTTP" <=> "IMAP"                                     # => -1
"SMTP" <=> "IMAP"                                     # => 1
# ��String#casecmp�פϡ�<=>�ױ黻�ҤȰ�ä���ʸ����ʸ������̤��ʤ���
[ "SMTP" <=> "smtp",  "SMTP".casecmp("smtp")]         # => [-1, 0]
[ "HTTP" <=> "imap",  "HTTP".casecmp("imap")]         # => [-1, -1]
[ "SMTP" <=> "imap",  "SMTP".casecmp("imap")]         # => [-1, 1]
# ��ʸ����ʸ����̵�뤷��������ʸ����ʤ�С�OK�פ�ɽ�����롣
if "SMTP".casecmp("SMTP") == 0
  puts "OK"
end
# >> OK
