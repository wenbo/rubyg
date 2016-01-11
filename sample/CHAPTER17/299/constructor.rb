class HTTPServer
# �֥�å���Object#instance_eval�˴��ꤲ���롣
  def initialize(&block)  instance_eval(&block)  end
# protected�ˤ��뤳�Ȥǳ����饢�������Ǥ��ʤ��褦�ˤ��롣
  protected
# initialize�ǻ��Ѥ��륢��������������롣
  attr_accessor :rootdir, :port, :http_version, :bind_address
end

s = HTTPServer.new do
# ��self.�פ��Ĥ��Ƥ����Τ�����ե�����Τ褦�ˤ⸫���롣
  self.rootdir      = "/var/www"
  self.port         = 8331
  self.http_version = "1.1"
  self.bind_address = "127.0.0.1"
end
# �ͤϳΤ������ꤵ��Ƥ��롣
s # => #<HTTPServer:0x999277c @rootdir="/var/www", @port=8331, @http_version="1.1", @bind_address="127.0.0.1">
# protected�ʤΤǳ�������ϥ��������Ǥ��ʤ���
s.port rescue $! # => #<NoMethodError: protected method `port' called for #<HTTPServer:0x999277c>>
