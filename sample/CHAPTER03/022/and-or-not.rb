# ��Ｐ�η�̤�var���������졢���ʬ������롣and��or��ͥ���̤����㡣
var = 1 < 10 and "ok"           # => "ok"
var                             # => true
var = 20 < 10 and "ok"          # => false
var                             # => false
var = 1 < 10 or "NG"            # => true
var                             # => true
var = 20 < 10 or "NG"           # => "NG"
var                             # => false
# ��Ｐ���Τη�̤�var����������롣<������ͥ���̤��⤤��
var = 1 < 10 && "ok"            # => "ok"
var                             # => "ok"
var = 20 < 10 && "ok"           # => false
var                             # => false
var = 1 < 10 || "NG"            # => true
var                             # => true
var = 20 < 10 || "NG"           # => "NG"
var                             # => "NG"
