require 'pathname'
# ���Хѥ�������
usr = Pathname "/usr"
ubin = Pathname "/usr/bin"
ubin.relative_path_from usr                 # => #<Pathname:bin>
# �ѥ��򤭤줤�ˤ���
Pathname("/path//to/foo/../bar").cleanpath  # => #<Pathname:/path/to/bar>
