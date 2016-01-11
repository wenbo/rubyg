#!/usr/local/bin/ruby -Ke
$SAFE=1        # CGI������ץȤǤϥ����ե�٥��1�ˤ��Ƥ����Ȥ褤
require 'cgi'  # cgi�饤�֥���CGI���������Ƥ���Τ��ɤ߹���
# CGI���֥������Ȥ��������
cgi = CGI.new
# EUC-JP��HTML����Ϥ���
cgi.out("type"=>"text/html", "charset"=>"EUC-JP") {
  # ����ȥ���̾���б������ͤ�����
  number = cgi['number']
  name = cgi['name']
  "<html><head><title>���</title></head><body>\n" +
    # number�����Ϥ��줿�ͤ������ΤߤǤ���ʤ��(����������)��
    if number =~ /\A\d+\z/
      # ���Ϥ���HTML
      "̾��:#{CGI.escapeHTML(name)}<br>" +
        "���� = #{number}<br>" +
        "REQUEST_METHOD = #{ENV['REQUEST_METHOD']}"
    # �����Ǥʤ��ʤ�Х��顼��å������ˤ���
    else
      "�����������Ǥ���"
    end +
  "\n</body></html>"
}