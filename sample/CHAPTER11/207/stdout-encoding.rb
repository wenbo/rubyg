# Ruby 1.9�ʤĤޤ�IO#set_encoding���������Ƥ���ˤʤ�С�
if $stdout.respond_to? :set_encoding
# ɸ����Ϥγ������󥳡��ǥ��󥰤�����륨�󥳡��ǥ��󥰤ˤ��롣
  $stdout.set_encoding "locale"
# Ruby 1.8�ʤ�С�
else
# nkf�饤�֥���NKF.nkf���������Ƥ���Τ��ɤ߹���
  require 'nkf'
# OUTPUT_KCODE��NKF�ν��Ϥ���ʸ�������ɻ��ꡣmswin�Ķ��ʤ��Shift_JIS�ˤ��롣
  if RUBY_PLATFORM =~ /mswin/
    OUTPUT_KCODE = 's'
# �Ķ��ѿ�LANG��ja_JP.eucJP�ʤɤȻ��ꤵ��Ƥ���ˤ���ʸ�������ɤ��ɤ߼�롣
  elsif ENV['LANG'].to_s =~ /ja_JP\.(.)/
    k = $1.downcase
# NKF��UTF-8���Ѵ�����Τϡ�u�פǤϤʤ��ơ�w�ס�
    OUTPUT_KCODE = k == 'u' ? 'w' : k
  else
# ��mswin�Ķ��ǴĶ��ѿ�LANG�����ꤵ��Ƥ��ʤ��ȥ��顼�ˤ��롣
    raise "Set environment variable LANG."
  end
# $stdout���ðۥ᥽�åɤ�������뤳�Ȥǽ��ϴؿ��ε�ư���ѹ��Ǥ��롣
  def $stdout.write(str)
# $KCODE�ξ��󤫤�NKF������ʸ�������ɤ���ꤹ�롣
    k = $KCODE[0,1].upcase
    kcode = k == 'U' ? 'W' : k
# NKF��ʸ���������Ѵ�����ʸ�����IO#write��Ƥ֡�
    super NKF.nkf("-#{kcode}#{OUTPUT_KCODE}", str)
  end
end
