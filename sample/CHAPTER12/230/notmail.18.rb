require 'net/smtp'
require 'nkf'

$SENDER_MAIL = "foo@example.com"
$SMTP_SERVER = "smtp.example.com"

def sendmail(body, header)
  Net::SMTP.start($SMTP_SERVER) do |smtp|
    smtp.sendmail <<"EOM", $SENDER_MAIL, header["to"]
From: #$SENDER_MAIL
To: #{header["to"]}
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Date: #{Time.now.strftime '%a, %d %b %Y %H:%M:%S %z'}
Subject: #{NKF.nkf("-j --mime", header["subject"])}

#{NKF.nkf("-j", body)}
EOM
  end
end
sendmail "NKFでMIMEエンコード\n",
         "to"       => "bar@example.com",
         "subject"  => "テストメール"
