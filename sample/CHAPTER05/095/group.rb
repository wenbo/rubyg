GroupEntry = Struct.new(:name, :gid, :users)
entry = "audio:x:29:rubikitch,root"
# ����ǥå���1�ʳ������Ǥ�ɬ��
audio = GroupEntry.new(*entry.split(":").values_at(0,2,3))
# => #<struct GroupEntry name="audio", gid="29", users="rubikitch,root">
