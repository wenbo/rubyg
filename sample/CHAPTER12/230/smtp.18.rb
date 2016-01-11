#!/usr/local/bin/ruby -Ke
# net/smtpライブラリにNet::SMTPが定義されているので読み込む
require 'net/smtp'
#　kconvライブラリにString#tojisが定義されているので読み込む
require 'kconv'
require 'rubygems'
require 'tmail'

$SENDER_MAIL = "foo@example.com"  # 送信者のメールアドレス
$SMTP_SERVER = "smtp.example.com" # メールサーバ

# 本文とヘッダを指定してメールを送る関数を定義する。
def sendmail(body, header)
# メールオブジェクトの作成。
  m = TMail::Mail.new
  {
# デフォルトのヘッダを表すハッシュ。
    "mime-version" => "1.0",
    "date" => Time.now,
    "from" => $SENDER_MAIL, 
# デフォルトのヘッダをheaderで指定したヘッダで上書きし、その各々のヘッダの名前と値について、
  }.merge(header).each_pair do |name, value|
# メールオブジェクトのヘッダを設定する。そのとき、日本語はJISコードに変換する。
    m[name] = value.to_s.tojis
  end
# 日本語メールを送るためのヘッダをつける。
  m.set_content_type("text", "plain", "charset" => "ISO-2022-JP")
  m.body = body.tojis

# ブロックが指定されているときはメールオブジェクトを引数としてブロックを評価する。
  yield m if block_given?
# SMTPサーバにアクセスし、メールを送る。
  Net::SMTP.start($SMTP_SERVER) do |smtp|
    smtp.sendmail m.encoded, $SENDER_MAIL, header["to"]
  end
end

sendmail "メールですよ\n",
         "to"       => "bar@example.com",
         "x-mailer" => "Ruby net/smtp",
         "subject"  => "テストメール"
