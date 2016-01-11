#!/usr/local/bin/ruby -Ke
require 'date'
# ������̾�Ρ������������ܸ�ˤ��뤿��Υ⥸�塼��
module JStrftime
  JAPANESE = {"Sunday"=>"��", "Monday"=>"��", "Tuesday"=>"��", "Wednesday"=>"��",
    "Thursday"=>"��", "Friday"=>"��", "Saturday"=>"��", "AM"=>"����", "PM"=>"���"}
# �ִ����٤��Ѹ�̾�Τɤ줫�˰��פ�������ɽ��
  JAPANESE_RE = Regexp.union(*JAPANESE.keys)
# �Ѹ�����ܸ���֤�������
  def jstrftime(fmt)  strftime(fmt).gsub(JAPANESE_RE){ JAPANESE[$&] }  end
end
# Time��Date��DateTime���饹�ǻȤ���褦��Mix-in����
class Time; include JStrftime end
class Date; include JStrftime end
# %A��%p�����ܸ�ˤʤ롣
Time.now.jstrftime("%Yǯ%m��%d�� (%A����) %p%I��%Mʬ")
# => "2008ǯ11��11�� (������) ���08��15ʬ"
Date.today.jstrftime("%Yǯ%m��%d�� (%A����)")  # => "2008ǯ11��11�� (������)"
