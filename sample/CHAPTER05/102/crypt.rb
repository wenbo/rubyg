# "3E" ��salt�ˤ��� "hoge!" ��Ź沽���롣
"hoge!".crypt "3E"         # => "3EnBF171JYHDI"
# �ѥ����ǧ��
CRYPTED_PASSWORD = "3EnBF171JYHDI"
# ���Ǥ���¸���Ƥ���Ź�ѥ���ɤ�ǧ�ڤ���ؿ���
def correct_password?(input) input.crypt(CRYPTED_PASSWORD) == CRYPTED_PASSWORD end
correct_password? "hoge!"  # => true
correct_password? "wrong"  # => false
# �桼���������Ϥ��줿�ѥ���ɤ�Ź沽������
def crypt_password(password)
# salt�ϥ������ʸ�������֡��ºݤ˻Ȥ���Τ�2ʸ���Τߡ�
  salt = [[rand(4096)].pack("v")].pack("m").tr("+", ".") # => "mQM=\n"
  password.crypt salt
end
crypted = crypt_password "abracadabra"   # => "mQhdkaLKkc5jA"
"abracadabra".crypt(crypted) == crypted  # => true
