hash = {1=>"one", 2=>"two", 3=>"three"}
# �ͤ��饭���ؤΥϥå����������롣
hash.invert                     # => {"one"=>1, "two"=>2, "three"=>3}
class Hash
# �ͤ����֤äƤ��ޤäƤ������������ˤϡ���ʬ�ǡ�Hash#safe_invert�פ�������롣��||=�פϺ��դ����ΤȤ��˽���ͤ����ꤹ�뼫���������ǥ����ࡣ
  def safe_invert()  inject({}) {|h,(k,v)| (h[v]||=[]) << k; h}  end
end
# ��safe_invert�פϽ�ʣ�������뤿�ᡢ�ͤ�����ˤʤ롣
{"a"=>false, "b"=>false, "c"=>nil}.safe_invert  # => {false=>["a", "b"], nil=>["c"]}
hash.safe_invert           # => {"one"=>[1], "two"=>[2], "three"=>[3]}
