# "3E" をsaltにして "hoge!" を暗号化する。
"hoge!".crypt "3E"         # => "3EnBF171JYHDI"
# パスワード認証
CRYPTED_PASSWORD = "3EnBF171JYHDI"
# すでに保存してある暗号パスワードで認証する関数。
def correct_password?(input) input.crypt(CRYPTED_PASSWORD) == CRYPTED_PASSWORD end
correct_password? "hoge!"  # => true
correct_password? "wrong"  # => false
# ユーザから入力されたパスワードを暗号化する場合
def crypt_password(password)
# saltはランダムな文字を選ぶ。実際に使われるのは2文字のみ。
  salt = [[rand(4096)].pack("v")].pack("m").tr("+", ".") # => "mQM=\n"
  password.crypt salt
end
crypted = crypt_password "abracadabra"   # => "mQhdkaLKkc5jA"
"abracadabra".crypt(crypted) == crypted  # => true
