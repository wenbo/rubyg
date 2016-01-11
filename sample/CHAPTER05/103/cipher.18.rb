# opensslライブラリにOpenSSL::Cipher::Cipherが定義されているので読み込む。
require 'openssl'
class String
# 暗号のアルゴリズム。
  CIPHER_ALGORITHM = "aes-256-cbc"
  def encrypt(password)         # passwordで暗号化する
    enc = OpenSSL::Cipher::Cipher.new(CIPHER_ALGORITHM)
# 暗号化の準備をする。
    enc.encrypt
# 暗号パスワードを設定する。
    enc.pkcs5_keyivgen(password)
# 実際に暗号化する。
    enc.update(self) + enc.final
  end
  
  def decrypt(password)         # passwordで復号化する
    dec = OpenSSL::Cipher::Cipher.new(CIPHER_ALGORITHM)
# 復号化の準備をする。
    dec.decrypt
    dec.pkcs5_keyivgen(password)
# 実際に復号化する。
    dec.update(self) + dec.final
  end
end

s = "abracadabra"
enc = s.encrypt "passwd"  # => "\313\234c\\\375d\217\327_\353\360`\332\252\340\273"
enc.decrypt "passwd"      # => "abracadabra"
# パスワードが違う場合。
enc.decrypt "wrong" rescue $!  # => #<OpenSSL::Cipher::CipherError: bad decrypt>
