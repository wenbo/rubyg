# �ǥ��쥯�ȥ�̾�����롣
# �ǥ��쥯�ȥ�̾�����롣
File.dirname "/tmp/arbitrary.txt"          # => "/tmp"
# ��/�פ�ޤޤʤ����ϥ����ȥǥ��쥯�ȥ���֤���
File.dirname "arbitrary.txt"               # => "."
# �����Ρ�/�פ�̵�뤵��롣
File.dirname "/tmp/dir/"                   # => "/tmp"
File.dirname "/tmp//dir/"                  # => "/tmp"
# �ǥ��쥯�ȥ��������ե�����̾�����롣
# �ե�����̾�����롣
File.basename "/tmp/arbitrary.txt"         # => "arbitrary.txt"
# �����Ρ�/�פ�̵�뤵��롣
File.basename "/tmp/dir/"                  # => "dir"
File.basename "/tmp//dir/"                 # => "dir"
# ��ĥ�Ҥ����פ��Ƥ�����ϳ�ĥ�Ҥ���������ե�����̾�����롣
File.basename "/tmp/arbitrary.txt", ".txt" # => "arbitrary"
# ��ĥ�Ҥ���������ե�����̾�����롣
File.basename "/tmp/arbitrary.txt", ".*"   # => "arbitrary"
# ��ĥ�Ҥ����פ��ʤ����ϳ�ĥ�Ҥ�������ʤ���
File.basename "/tmp/arbitrary.txt", ".rb"  # => "arbitrary.txt"
#5 ��ĥ�Ҥ����롣
# ��ĥ�Ҥ����롣
File.extname "/tmp/arbitrary.txt"          # => ".txt"
# �����ϳ�ĥ�ҤȤϤߤʤ��ʤ���
File.extname ".emacs"                      # => ""
File.extname ".."                          # => ""
# �ǥ��쥯�ȥ�̾���ե�����̾�Υڥ������롣
File.split "/tmp/arbitrary.txt"            # => ["/tmp", "arbitrary.txt"]
# ���Хѥ��ʥե�ѥ��ˤ����롣
# ~ ��ۡ���ǥ��쥯�ȥ���֤������롣
File.expand_path "~/.emacs"                # => "/m/home/rubikitch/.emacs"
# ~USER �� USER �Υۡ���ǥ��쥯�ȥ���֤������롣
File.expand_path "~root/.bashrc"           # => "/root/.bashrc"
# ��ά��ǽ����2������Ĥ������Ϥ�������ˤ������Хѥ������롣
File.expand_path "vmlinuz", "/"            # => "/vmlinuz"
# ���Ǥ����Хѥ��Ǥ���Ф��Τޤޡ�
File.expand_path "/bin/sh", "/boot"        # => "/bin/sh"
# ������ѥ����ڤ�ʸ����/�ˤǤĤʤ��롣
File.join "/path", "to", "ruby"            # => "/path/to/ruby"
