require 'rubygems'
require 'tmail'

m = TMail::Mail.new
m.mime_version = "1.0"          # おまじない
m.from         = "foo@example.com"
m.to           = "bar@example.com"
m.subject      = "multipart     test"
m.parts << TMail::Mail.new.tap do |mm|
  mm.set_content_type( "text", "plain", {"charset" => "ISO-2022-JP"})
  mm.body = "body!"
end
m.parts << TMail::Mail.new.tap do |mm|
  mm.set_content_type( "text", "plain", {"charset" => "ISO-2022-JP"})
  mm.body = "attachment!"
end
puts m.encoded
# >> From: foo@example.com
# >> To: bar@example.com
# >> Subject: multipart     test
# >> Mime-Version: 1.0
# >> Content-Type: multipart/mixed;
# >> 	boundary="mimepart_494955e7cee08_35c6..fdbed90b218d"
# >> 
# >> 
# >> --mimepart_494955e7cee08_35c6..fdbed90b218d
# >> Content-Type: text/plain; charset=ISO-2022-JP
# >> 
# >> body!
# >> --mimepart_494955e7cee08_35c6..fdbed90b218d
# >> Content-Type: text/plain; charset=ISO-2022-JP
# >> 
# >> attachment!
# >> --mimepart_494955e7cee08_35c6..fdbed90b218d--
