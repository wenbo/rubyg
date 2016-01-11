# CamelCase���ѿ�̾��ñ���ʬ����
v = "javaCamelCaseVariable"
v.split(/(?=[A-Z])/)          # => ["java", "Camel", "Case", "Variable"]
v.scan(/(?:\A|[A-Z])[a-z]+/)  # => ["java", "Camel", "Case", "Variable"]
# �Ǹ��5ʸ���򶭤˶��ڤ�
"abcdefghi".split(/(?=.{5}\z)/) # => ["abcd", "efghi"]
# �ǽ��5ʸ���򶭤˶��ڤ��Ruby 1.9��
"abcdefghi".split(/(?<=\A.{5})/) # => ["abcde", "fghi"]
