# キー「:c」がだぶっている一組のハッシュ。
hash1 = { :a=>1, :b=>2, :c=>3 }
hash2 = { :c=>4, :d=>5 }
# そのまま混ぜるとhash2の値をキー「:c」の値に採用する。
hash1.merge hash2               # => {:a=>1, :b=>2, :c=>4, :d=>5}
# ブロックは「:c」、「3」、「4」を引数に取り、評価結果をキー「:c」の値に採用する。
hash1.merge(hash2) {|k,v1,v2| "#{k}:#{v1}:#{v2}" } # => {:a=>1, :b=>2, :c=>"c:3:4", :d=>5}
# 2つのキーがだぶっているハッシュ。
hash3 = { :b=>6, :c=>7 }
# hash1を破壊的に混ぜる。だぶったキーはキーに対応する値を足す。
hash1.update(hash3) {|k,v1,v2| v1+v2 } # => {:a=>1, :b=>8, :c=>10}
hash1                                  # => {:a=>1, :b=>8, :c=>10}

# 設定の例
CONFIG_DEFAULTS = { :verbose_level => :verbose, :format => :HTML }
# デフォルトの設定をユーザ設定で上書きする。
def config(user_config)  CONFIG_DEFAULTS.merge(user_config)  end
conf = config(:format => :XML)  # => {:verbose_level=>:verbose, :format=>:XML}
