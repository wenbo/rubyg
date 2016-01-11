GroupEntry = Struct.new(:name, :gid, :users)
entry = "audio:x:29:rubikitch,root"
# インデックス1以外の要素が必要
audio = GroupEntry.new(*entry.split(":").values_at(0,2,3))
# => #<struct GroupEntry name="audio", gid="29", users="rubikitch,root">
