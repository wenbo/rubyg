#!/usr/local/bin/ruby -Ke
require 'rubygems'
# tmailライブラリにTMailが定義されているので読み込む
require 'tmail'
require 'nkf'
require 'kconv'
# メールを解析する。日本語メールはJISコードで与える。そのときヘッダはMIMEデコードされる。
m = TMail::Mail.parse <<EOM.tojis
Date: Wed, 04 Jun 2008 19:03:54 +0900 (JST)
Message-Id: <20080604.190354.105664181.rubikitch@ruby-lang.org>
To: rubikitch@ruby-lang.org, test@example.com
Subject: =?iso-2022-jp?B?GyRCJDMkcyRLJEEkTxsoQg==?=
From: rubikitch@ruby-lang.org
X-Mailer: Mew version 5.2.52 on Emacs 22.1 / Mule 5.0 (SAKAKI)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit

メールは複雑で難しい…
EOM

# Subjectを得る。
m.subject.toeuc   # => "こんにちは"
# FromとToは複数指定できるので配列で返る。
m.from    # => ["rubikitch@ruby-lang.org"]
m.to      # => ["rubikitch@ruby-lang.org", "test@example.com"]
# ハッシュ形式でアクセスするとTMail::HeaderFieldオブジェクトを得る。
m["to"]   # => #<TMail::AddressHeader "rubikitch@ruby-lang.org, test@example.com\n">
# 本文。
m.body.toeuc      # => "メールは複雑で難しい…\n"
# DateをTimeオブジェクトで得る。
m.date      # => Wed Jun 04 19:03:54 +0900 2008
m["Date"]   # => #<TMail::DateTimeHeader "Wed, 04 Jun 2008 19:03:54 +0900 (JST)\n">

# 内容の書き換え。日本語はJISコードで与える。
m.from    = "foo@example.com"
m.to      = "bar@example.com"
m.subject = "おはようございます".tojis
m.body    = "ありがとう、TMail".tojis
# 書き換えたメールを表示する。
puts NKF::nkf("-m0 -e", m.encoded)
# >> Date: Wed, 4 Jun 2008 19:03:54 +0900
# >> From: foo@example.com
# >> To: bar@example.com
# >> Message-Id: <20080604.190354.105664181.rubikitch@ruby-lang.org>
# >> Subject: =?iso-2022-jp?B?GyRCJCokTyRoJCYkNCQ2JCQkXiQ5GyhC?=
# >> Mime-Version: 1.0
# >> Content-Type: text/plain; charset=iso-2022-jp
# >> Content-Transfer-Encoding: 7bit
# >> X-Mailer: Mew version 5.2.52 on Emacs 22.1 / Mule 5.0 (SAKAKI)
# >> 
# >> ありがとう、TMail
