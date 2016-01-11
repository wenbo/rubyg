PasswdEntry = Struct.new(:user, :pass, :uid, :gid, :group, :home, :shell)
entry = "root:x:0:0:root:/root:/bin/sh"
root = PasswdEntry.new(*entry.split(":"))
root        # => #<struct PasswdEntry user="root", pass="x", uid="0", gid="0", group="root", home="/root", shell="/bin/sh">
root.home   # => "/root"
root.shell  # => "/bin/sh"
