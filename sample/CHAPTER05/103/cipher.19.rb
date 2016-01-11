require 'openssl'
class String
  CIPHER_ALGORITHM = "aes-256-cbc"
  def encrypt(password)
    enc = OpenSSL::Cipher::Cipher.new(CIPHER_ALGORITHM)
    enc.encrypt
    enc.pkcs5_keyivgen(password)
    enc.update(self) + enc.final
  end

  def decrypt(password, encoding="ASCII-8BIT")
    dec = OpenSSL::Cipher::Cipher.new(CIPHER_ALGORITHM)
    dec.decrypt
    dec.pkcs5_keyivgen(password)
# ����ʸ����˥��󥳡��ǥ��󥰤����ꤹ�롣
    (dec.update(self) + dec.final).force_encoding encoding
  end
end

s = "����ˤ���"
s.encoding                            # => #<Encoding:EUC-JP>
enc = s.encrypt "passwd"              # => "K\x98\x17\xC61\x8AZ\f~\xECk\xC4_K\xFA%"
enc.encoding                          # => #<Encoding:ASCII-8BIT>
dec = enc.decrypt "passwd", "EUC-JP"  # => "����ˤ���"
dec.encoding                          # => #<Encoding:EUC-JP>
