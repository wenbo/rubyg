#!/usr/local/bin/ruby -Ke
require 'rubygems'
# tmail�饤�֥���TMail���������Ƥ���Τ��ɤ߹���
require 'tmail'
require 'nkf'
require 'kconv'
# �᡼�����Ϥ��롣���ܸ�᡼���JIS�����ɤ�Ϳ���롣���ΤȤ��إå���MIME�ǥ����ɤ���롣
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

�᡼���ʣ�����񤷤���
EOM

# Subject�����롣
m.subject.toeuc   # => "����ˤ���"
# From��To��ʣ������Ǥ���Τ�������֤롣
m.from    # => ["rubikitch@ruby-lang.org"]
m.to      # => ["rubikitch@ruby-lang.org", "test@example.com"]
# �ϥå�������ǥ������������TMail::HeaderField���֥������Ȥ����롣
m["to"]   # => #<TMail::AddressHeader "rubikitch@ruby-lang.org, test@example.com\n">
# ��ʸ��
m.body.toeuc      # => "�᡼���ʣ�����񤷤���\n"
# Date��Time���֥������Ȥ����롣
m.date      # => Wed Jun 04 19:03:54 +0900 2008
m["Date"]   # => #<TMail::DateTimeHeader "Wed, 04 Jun 2008 19:03:54 +0900 (JST)\n">

# ���Ƥν񤭴��������ܸ��JIS�����ɤ�Ϳ���롣
m.from    = "foo@example.com"
m.to      = "bar@example.com"
m.subject = "���Ϥ褦�������ޤ�".tojis
m.body    = "���꤬�Ȥ���TMail".tojis
# �񤭴������᡼���ɽ�����롣
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
# >> ���꤬�Ȥ���TMail
