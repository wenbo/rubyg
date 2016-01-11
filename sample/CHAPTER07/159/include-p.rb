#!/usr/local/bin/ruby
class Character
# 呪文が唱えられる職業はpriest（僧侶）とwizard（魔法使い）。
  CAST_SPELL_JOBS = [:priest, :wizard]
# Characterクラスの初期化部分。
  def initialize(job)  @job = job  end
# 呪文が唱えられるかどうか判定するメソッド。「@job == :priest or @job == :wizard」と書かなくて済む。
  def can_cast_spell?  CAST_SPELL_JOBS.include? @job  end
end
Character.new(:priest).can_cast_spell?   # => true
Character.new(:fighter).can_cast_spell?  # => false
