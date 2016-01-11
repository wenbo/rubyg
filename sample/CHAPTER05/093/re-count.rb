header = <<EOH
From: rubikitch@ruby-lang.org
To: ruby-list@ruby-lang.org
Reply-To: ruby-list@ruby-lang.org
Subject: I love Ruby!
EOH

header.scan(/^(\S+): (.+)$/).length  # => 4
header.scan(/:/).length              # => 4
