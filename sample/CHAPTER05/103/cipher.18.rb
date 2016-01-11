# openssl�饤�֥���OpenSSL::Cipher::Cipher���������Ƥ���Τ��ɤ߹��ࡣ
require 'openssl'
class String
# �Ź�Υ��르�ꥺ�ࡣ
  CIPHER_ALGORITHM = "aes-256-cbc"
  def encrypt(password)         # password�ǰŹ沽����
    enc = OpenSSL::Cipher::Cipher.new(CIPHER_ALGORITHM)
# �Ź沽�ν����򤹤롣
    enc.encrypt
# �Ź�ѥ���ɤ����ꤹ�롣
    enc.pkcs5_keyivgen(password)
# �ºݤ˰Ź沽���롣
    enc.update(self) + enc.final
  end
  
  def decrypt(password)         # password�����沽����
    dec = OpenSSL::Cipher::Cipher.new(CIPHER_ALGORITHM)
# ���沽�ν����򤹤롣
    dec.decrypt
    dec.pkcs5_keyivgen(password)
# �ºݤ����沽���롣
    dec.update(self) + dec.final
  end
end

s = "abracadabra"
enc = s.encrypt "passwd"  # => "\313\234c\\\375d\217\327_\353\360`\332\252\340\273"
enc.decrypt "passwd"      # => "abracadabra"
# �ѥ���ɤ��㤦��硣
enc.decrypt "wrong" rescue $!  # => #<OpenSSL::Cipher::CipherError: bad decrypt>
