unless defined? BasicObject     # for Ruby 1.8
  class BasicObject       # 基本的なメソッドしか定義されていないクラス
# これらのメソッドのみしか持たない。
    METHODS = ["==", "__send__", "equal?", "__id__", "instance_eval"]
# Objectクラスが持っている各々のインスタンスメソッドにおいて、METHODSに含まれているもの以外のメソッド定義をなかったものにする。
    (instance_methods - METHODS).each {|meth| undef_method meth }
  end
end
class Recorder < BasicObject    # 呼ばれたメソッドを記録していくクラス
  def initialize(str)  @buf = [str]  end
  def method_missing(name, *args)
# メソッド名と引数を破壊的に記録する。
    @buf.push(name).concat(args)
# メソッドチェーンできるようにselfを返す。
    self
  end
# 記録したものを再生する。@bufをスペースでつなげる。
  def __play__()  @buf.join(' ')  end
end

# 初期文字列を与え、Recorderを作成する。
i = Recorder.new("I")
# 英文のスペースを「.」に置き換えると、そのままRubyスクリプトになる。
i.am.a.boy.and.I.play.baseball
# 再生する。
i.__play__   # => "I am a boy and I play baseball"
my = Recorder.new("My")
# object_idはObjectのインスタンスメソッドだが、undefされているのでmethod_missingを通るようになる。数字はメソッドになれないので引数でごまかす。
my.object_id.is(123456)
my.__play__  # => "My object_id is 123456"
