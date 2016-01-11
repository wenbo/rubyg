#!/usr/local/bin/ruby
class Character
# ��ʸ���������뿦�Ȥ�priest����η�ˤ�wizard����ˡ�Ȥ��ˡ�
  CAST_SPELL_JOBS = [:priest, :wizard]
# Character���饹�ν������ʬ��
  def initialize(job)  @job = job  end
# ��ʸ���������뤫�ɤ���Ƚ�ꤹ��᥽�åɡ���@job == :priest or @job == :wizard�פȽ񤫤ʤ��ƺѤࡣ
  def can_cast_spell?  CAST_SPELL_JOBS.include? @job  end
end
Character.new(:priest).can_cast_spell?   # => true
Character.new(:fighter).can_cast_spell?  # => false
