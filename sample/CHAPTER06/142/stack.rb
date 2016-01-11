# ��̤��б������Ƥ��뤫�ɤ�����Ƚ�ꤹ��ؿ�
def paren_match?(expr)
  stack = []
# �ĳ�̤��б����볫��̤�ɽ���ϥå���
  open_parens = {')'=>'(', '}'=>'{'}
# ��������������̤��о줹�뤿�Ӥ˳��ʸ�����paren�ץ֥�å��ѥ�᡼�����������롣
  expr.scan(/[\(\{\)\}]/) do |paren|
# ��̤Ǿ��ʬ�������ĳ�̤�¿�������ꡢ�Ǹ�γ�̤��б������ΤǤʤ��ä�����false���֤���
    case paren
    when '(','{'
      stack.push paren
    when ')','}'
      if stack.empty? or stack.last != open_parens[paren]
        return false
      else
        stack.pop
      end
    end
  end
# �ĳ�̤����ʤ�������ϥ����å��϶��ˤϤʤ�ʤ��Τ�false�ˤʤ롣
  stack.empty?
end
paren_match? "1+(2*3)"      # => true
paren_match? "(1+(2*3)"     # => false
paren_match? "1+(2*3))"     # => false
paren_match? "1+{2*(3+3)}"  # => true
paren_match? "1+{2*(3+3})"  # => false

