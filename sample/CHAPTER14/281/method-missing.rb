class Object
# �᥽�åɤ�¸�ߤ��ʤ��Ȥ��˸ƤФ��᥽�åɤ�������롣Object���饹�ʤΤǤ��٤ƤΥ��֥������Ȥ��оݡ�������Ǥϡ�XXXX?�׷����Υ᥽�åɤ��is_XXXX?�ס���is_a_XXXX?�ס���is_an_XXXX?�פȤ�Ƥ٤�褦�ˤ��롣
  def method_missing(name, *args, &block)
# �᥽�å�̾��is_��is_a��is_an�ǻϤޤ���ϡ���������������᥽�åɤ�Ƥ֡�
    if name.to_s =~ /^is_(an?_)?(.+)$/
      __send__ $2, *args, &block
    else
# �����ѡ����饹��method_missing��Ƥ֡�Object��Kernel�򥤥󥯥롼�ɤ��Ƥ���Τǡ�Kernel#method_missing���ƤФ�롣
      super
    end
  end
end
1.tainted?                  # => false
1.is_tainted?               # => false
1.kind_of? Fixnum           # => true
1.is_a_kind_of? Fixnum      # => true
1.instance_of? Fixnum       # => true
1.is_an_instance_of? Fixnum # => true
# ¸�ߤ��ʤ��᥽�åɤʤΤ�NoMethodError��
1.no_method rescue $!       # => #<NoMethodError: undefined method `no_method' for 1:Fixnum>
