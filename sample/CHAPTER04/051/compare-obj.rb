1 <=> 2                      # => -1
1 <=> 1                      # => 0
2 <=> 1                      # => 1
3.between?(1,3)              # => true
# ���ͤȤ������
2 < 10                       # => true
# ʸ����Ȥ������
"2" < "10"                   # => false
"abc" < "def"                # => true
"def".between?("abc","ghi")  # => true
# ���饹���⥸�塼����ò����������־�������
Array <=> Object             # => -1
Array < Object               # => true
Object < Array               # => false
Array < Enumerable           # => true
# ľ�ܴط��Τʤ����饹���⥸�塼�����Ӥ�����nil�ˤʤ�
Hash <=> Array               # => nil
Hash < Array                 # => nil
