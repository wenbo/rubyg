def result(bind)  eval %q!"����ˤ��ϡ�#{name}����"!, bind  end
name = "��Ӥ���"
result(binding)  # => "����ˤ��ϡ���Ӥ�������"
