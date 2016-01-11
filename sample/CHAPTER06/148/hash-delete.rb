hash = { 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five" }
# 5=>"five"������������������ͤ��֤롣
hash.delete(5)  # => "five"
hash            # => {1=>"one", 2=>"two", 3=>"three", 4=>"four"}
# ������������¸�ߤ��ʤ�����nil���֤롣
hash.delete(5)  # => nil
# ������������¸�ߤ��ʤ����ϥ֥�å���ɾ����̤��֤롣
hash.delete(5) {|key| "key(#{key}) is not found" } # => "key(5) is not found"
# �֥�å����Ĥ��Ƥ��Ƥ⡢������������¸�ߤ���Ф����ͤ��֤롣
hash.delete(4) {|key| "key(#{key}) is not found" } # => "four"
hash  # => {1=>"one", 2=>"two", 3=>"three"}
# �֥�å��ǻ��ꤷ���������������Ǥ��������졢���self���֤롣
hash.delete_if {|key,value| key == 3 and value == "three" } # => {1=>"one", 2=>"two"}
hash  # => {1=>"one", 2=>"two"}
# ��Hash#reject!�פϡ�Hash#delete_if�פ�Ʊ�����������������Ǥ���������뤬�����������Ǥ�¸�ߤ��ʤ�����nil���֤롣�����Ǥʤ����self���֤롣
hash.reject! {|key,value| key == 3 and value == "three" } # => nil
hash                                                      # => {1=>"one", 2=>"two"}
# ��Hash#reject�פ����˲�Ū�᥽�åɡ�
hash.reject {|key,value| key == 2 }  # => {1=>"one"}
hash                                 # => {1=>"one", 2=>"two"}
