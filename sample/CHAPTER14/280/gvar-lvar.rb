# 組み込み変数のリスト + プログラムで定義されているグローバル変数のリスト
$gvars = global_variables  # => [:$;, ...(length=58)]
# $gvars, $lvars, $gvar2 も含まれている
$gvars.grep(/var/)         # => [:$gvars, :$lvars, :$gvar2]
$lvars = local_variables
$lvars.reject! {|x| x =~ /xmp/} # nodisp
$lvars       # => [:lvar, :lvar2]
lvar = 0
if false     # 到達し得ないコード
  $gvar2 = 0
  lvar2 = 0
end
