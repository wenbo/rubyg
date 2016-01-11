ary = ["one", "two", "three"]
# �����ǤˤĤ��ƥ֥�å���ɾ�����롣
ary.each do |s|
  "{#{s}}"                      # => "{one}", "{two}", "{three}"
end
# �ս�˷����֤��ˤϡ�Array#reverse_each�פ�Ȥ���
ary.reverse_each do |s|
  "(#{s})"                      # => "(three)", "(two)", "(one)"
end
# ���湽¤��for�������ǡ�Array#each�פ�Ƥ�Ǥ��롣
for s in ary
  "<#{s}>"                      # => "<one>", "<two>", "<three>"
end
# for���Υ롼���ѿ��ϥ������פ���ʤ��Τ���ա�
s                               # => "three"
# �ͥ��Ȥ��������ʣ���Υ֥�å��ѥ�᡼���Ǽ����롣
nested1 = [[1, "one"], [2, "two"], [3, "three"]]
nested1.each do |int, english|
  "#{int} = #{english}"         # => "1 = one", "2 = two", "3 = three"
end
# �֥�å��ѥ�᡼����¿�������˻����롼��Ǽ�����Τǡ�ʣ���˥ͥ��Ȥ���������ñ�˰����롣
nested2 = [[1, [1.0, "one"]], [2, [2.0, "two"]], [3, [3.0, "three"]]]
nested2.each do |int, (float, english)|
  "#{int}/#{float}/#{english}"  # => "1/1.0/one", "2/2.0/two", "3/3.0/three"
end
