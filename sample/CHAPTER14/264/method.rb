animals = %w[dog cat rabbit]
# animals.fetch�򥪥֥������ȤȤ��Ƽ��Ф���
fetch = animals.method(:fetch)  # => #<Method: Array#fetch>
# Method���֥������Ȥ�Ƥ֡�
fetch.call(0)                   # => "dog"
fetch[2]                        # => "rabbit"
# Ruby 1.8.7�ʹߤǥ쥷���С��᥽�å�̾�����饹̾�����롣�᥽�å�̾��Ruby 1.8�Ǥ�ʸ����Ruby 1.9�Ǥϥ���ܥ�ˤʤ롣
fetch.receiver                  # => ["dog", "cat", "rabbit"]
fetch.name                      # => :fetch
fetch.owner                     # => Array
# �֥�å��դ��᥽�åɤ�Ƥ֤Ȥ���call��Ȥ�ɬ�פ����롣��map[] {��}�פ�SyntaxError�ˤʤ롣
map = animals.method(:map)      # => #<Method: Array#map>
map.call {|x| x.upcase}         # => ["DOG", "CAT", "RABBIT"]
# Ruby 1.9�Ǥ�[]�˥֥�å��������Ϥ��롣
map[&:upcase]                   # => ["DOG", "CAT", "RABBIT"]
# �ðۥ᥽�åɡʥ��饹�᥽�åɡˤξ�硢Method#owner���ðۥ��饹���֤���
IO.method(:read).owner          # => #<Class:IO>
class << IO; self; end          # => #<Class:IO>

# ʬ������
def write_to_stdout() :stdout end
def send_to_printer() :printer end
def doit(command)  # command�᥽�åɤ�Ƥִؿ���������롣��Method�ǡ�
  m = method(command)           # => #<Method: Object#write_to_stdout>
  m.call
end
# write_to_stdout�ؿ����ƤФ�롣
doit(:write_to_stdout)          # => :stdout
def doit2(command) # command�᥽�åɤ�Ƥִؿ���������롣��__send__�ǡ�
  __send__ command
end
# send_to_printer�ؿ����ƤФ�롣
doit2(:send_to_printer)         # => :printer
