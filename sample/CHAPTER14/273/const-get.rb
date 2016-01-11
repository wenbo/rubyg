# IOクラスに定数SEEK_CURが定義されている。
IO::SEEK_CUR               # => 1
# IOを継承したFileクラスからもアクセスできる。
File::SEEK_CUR             # => 1
# const_getで名前を指定して定数の値を得る。
IO.const_get(:SEEK_CUR)    # => 1
File.const_get(:SEEK_CUR)  # => 1
# Ruby 1.9ではconst_getの第2引数にfalseを指定すると、そのクラスで定義された定数にしかアクセスできない。
File.const_get(:SEEK_CUR,false) rescue $!   # => #<NameError: uninitialized constant File::SEEK_CUR>

# const_getの欠点を克服する
# 「::」を使った定数指定はできない。
Object.const_get("IO::SEEK_CUR") rescue $!  # => #<NameError: wrong constant name IO::SEEK_CUR>
# evalは手っ取り早いが、効率面でもセキュリティ面でもよくない。
eval "IO::SEEK_CUR"                   # => 1
def toplevel_const_get(name)   # ネストした定数名に対応させたconst_get
# 「::」で区切り、Objectから順に定数を参照し続ければ、nameが表す定数にアクセスできる。
  name.split(/::/).inject(Object){|o,c| o.const_get(c) }
end
# toplevel_const_get関数を定義して使うのが良い。
toplevel_const_get("IO::SEEK_CUR")    # => 1
toplevel_const_get("File::SEEK_CUR")  # => 1
# 名前で指定した定数を使ってオブジェクトを作成する。
Object.const_get("Range").new(1,3)    # => 1..3
stat = toplevel_const_get("File::Stat").new("const-get.rb")
stat.class                            # => File::Stat
