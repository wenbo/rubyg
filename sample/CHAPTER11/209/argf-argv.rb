ARGV.replace %w[ab.txt cd.txt] # ARGV�򶯰��� ["ab.txt", "cd.txt"] �� �񤭴�����
ARGF.gets                      # ab.txt���ɤ�
[ARGF.filename, ARGV]          # => ["ab.txt", ["cd.txt"]]
ARGF.skip                      # ((:ARGF.skip:))�ϸ��ߤΥե�������Ĥ������Υե�����򳫤�
ARGF.gets                      # cd.txt���ɤ�
[ARGF.filename, ARGV]          # => ["cd.txt", []]
