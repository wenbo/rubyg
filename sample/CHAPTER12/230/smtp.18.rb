#!/usr/local/bin/ruby -Ke
# net/smtp�饤�֥���Net::SMTP���������Ƥ���Τ��ɤ߹���
require 'net/smtp'
#��kconv�饤�֥���String#tojis���������Ƥ���Τ��ɤ߹���
require 'kconv'
require 'rubygems'
require 'tmail'

$SENDER_MAIL = "foo@example.com"  # �����ԤΥ᡼�륢�ɥ쥹
$SMTP_SERVER = "smtp.example.com" # �᡼�륵����

# ��ʸ�ȥإå�����ꤷ�ƥ᡼�������ؿ���������롣
def sendmail(body, header)
# �᡼�륪�֥������Ȥκ�����
  m = TMail::Mail.new
  {
# �ǥե���ȤΥإå���ɽ���ϥå��塣
    "mime-version" => "1.0",
    "date" => Time.now,
    "from" => $SENDER_MAIL, 
# �ǥե���ȤΥإå���header�ǻ��ꤷ���إå��Ǿ�񤭤������γơ��Υإå���̾�����ͤˤĤ��ơ�
  }.merge(header).each_pair do |name, value|
# �᡼�륪�֥������ȤΥإå������ꤹ�롣���ΤȤ������ܸ��JIS�����ɤ��Ѵ����롣
    m[name] = value.to_s.tojis
  end
# ���ܸ�᡼������뤿��Υإå���Ĥ��롣
  m.set_content_type("text", "plain", "charset" => "ISO-2022-JP")
  m.body = body.tojis

# �֥�å������ꤵ��Ƥ���Ȥ��ϥ᡼�륪�֥������Ȥ�����Ȥ��ƥ֥�å���ɾ�����롣
  yield m if block_given?
# SMTP�����Ф˥������������᡼������롣
  Net::SMTP.start($SMTP_SERVER) do |smtp|
    smtp.sendmail m.encoded, $SENDER_MAIL, header["to"]
  end
end

sendmail "�᡼��Ǥ���\n",
         "to"       => "bar@example.com",
         "x-mailer" => "Ruby net/smtp",
         "subject"  => "�ƥ��ȥ᡼��"
