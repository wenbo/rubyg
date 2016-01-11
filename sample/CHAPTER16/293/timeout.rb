# timeout�饤�֥��ˡ�Timeout.timeout�פ��������Ƥ���Τ��ɤ߹���
require 'timeout'
# �������ߥåȤ�0.3�á�
Timeout.timeout(0.3) {|lim|  "Time limit = #{lim}" } # => "Time limit = 0.3"
# �⥸�塼��ؿ��ʤΤǥ��󥯥롼�ɤ��Ƥ���Ѳġ�
include Timeout
# �����ॢ���Ȥ�������Timeout::Error�㳰��ȯ�����롣
begin
  timeout(0.2) do
    # ���������»��֤Ĥ��ν�����񤯡�
    sleep 0.3
  end
rescue Timeout::Error
  # �����˥����ॢ���Ȼ��ν�����񤯡�
  puts "Too late."
  $!  # => #<Timeout::Error: execution expired>
end
# >> Too late.
