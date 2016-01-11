class Module
# 特異クラスを得るメソッドを定義する。
  def eigenclass()  class << self; self; end  end
# クラスのオプションを定義するメソッド。selfはクラスオブジェクト。
  def define_option_switch(option, flag)
# クラスのインスタンス変数の遅延初期化。未定義ならば空ハッシュを作成する。オプション名とフラグを対応づける。
    (@__option_switch__ ||= {})[option] = flag
# 特異クラスの文脈で評価する。
    eigenclass.module_eval do
# 特異クラス内なので、クラスのインスタンス変数へのアクセサになる。
      attr_reader :__option_switch__ # !> method redefined; discarding old __option_switch__
# クラスメソッド「option=」、「option?」を定義する。ローカル変数optionが見えるのが重要。
      define_method("#{option}=") {|bool| __option_switch__[option] = bool }
      define_method("#{option}?") { __option_switch__[option] }
    end
# インスタンスメソッド「option?」を定義する。中でクラスメソッドを呼んでいる。
    define_method("#{option}?") { self.class.__option_switch__[option] }
  end
end

class FooService
# 「FooService.verbose_mode=」、「FooService.verbose_mode?」、「FooService#verbose_mode?」が定義される。
  define_option_switch :verbose_mode, false
  define_option_switch :compatibility_mode, true
end
foo = FooService.new
# クラスメソッド、インスタンスメソッドの両方で呼べる。
FooService.verbose_mode?   # => false
foo.verbose_mode?          # => false
foo.compatibility_mode?    # => true
FooService.__option_switch__
# => {:verbose_mode=>false, :compatibility_mode=>true}
FooService.verbose_mode = true
foo.verbose_mode?          # => true
FooService.compatibility_mode = false
foo.compatibility_mode?    # => false
FooService.__option_switch__
# => {:verbose_mode=>true, :compatibility_mode=>false}
