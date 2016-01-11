$truncate_length = 4            # ���ǿ���������¿���Ⱦ�άɽ�������
class Array
  # ���� Array#inspect ����¸����
  # �⤷����¸�Ѥߤξ�����¸���������Ȥ�
  @@old ||= instance_method(:inspect) 
  undef inspect                 # �ٹ�ä�
  def inspect()
    if length > $truncate_length then # ���ǿ���¿���Ȥ���
      # �ǽ�����ǰʳ����ά�������ǿ���񤭽Ф�
      "[#{self[0,1].map{|x|x.inspect}.join ', '}, ...(length=#{length})]"
    else
      # ���ǿ������ʤ��Ȥ��ϸ��� Array#inspect ��ƤӽФ�
      @@old.bind(self).call
    end
  end
end
