scheme = /(https?|ftp)/
host = /([^\/:]+)/
port = /(?::(\d+))?/
path = /([^?]+)?/
query = /(?:\?(.+))?/
# ��ʬ����ɽ����Ÿ���������ࡣ
url_re = %r!#{scheme}://#{host}#{port}/#{path}#{query}!
# => /(?-mix:(https?|ftp)):\/\/(?-mix:([^\/:]+))(?-mix:(?::(\d+))?)\/(?-mix:([^?]+)?)(?-mix:(?:\?(.+))?)/
"https://example.com:7654/foo.cgi?v=1".match(url_re).captures
# => ["https", "example.com", "7654", "foo.cgi", "v=1"]

# x���ץ�����Ĥ���ȡ�����ɽ���˥��ڡ����䥳���Ȥ�����뤳�Ȥ��Ǥ��롣
url_rex = %r!
 (https?|ftp)    # $1:scheme
 ://
 ([^\/:]+)       # $2:host
 (?::(\d+))?     # $3:port
 /
 ([^?]+)?        # $4:path
 (?:\?(.+))?     # $5:query
!x
"https://example.com:7654/foo.cgi?v=1".match(url_rex).captures
# => ["https", "example.com", "7654", "foo.cgi", "v=1"]

# ����ʸ������#�פϡ�\�פǥ��������פ��롣
" #" =~ /\A  \ \#  \z/x  # => 0
# ���뤤�ϡ���\s�פ����Ѥ�����ˡ�⤢�롣�����������֤���Ԥˤ�ޥå����롣
" " =~ /\A\s\z/x         # => 0
