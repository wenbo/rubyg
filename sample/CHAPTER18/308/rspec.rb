# 「describe」の引数に振舞いの名前（テスト名）を指定する。複数指定した場合はto_sしたものをスペースでつなげたものが名前になる。
describe String, '"Object"' do
  before :all do   # 振舞い（テストクラス）実行前に評価（省略可能）
  end
  before do        # サンプル（テストメソッド）実行前に評価（省略可能）
    @s = "Object"
  end

# サンプルはitメソッドで、サンプル名は「should」からはじまる英文で書くとつながりがよい。
  it "should be 6 length" do
# 比較演算子の前に「.should」をはさむのが基本。
    @s.length.should == 6
# 英語っぽくこのような記法もある。上と等価。
    @s.should have(6).items
  end
  it "upcase should be \"OBJECT\"" do
    @s.upcase.should == "OBJECT"
  end
  it "should be a kind of String" do
    @s.kind_of?(String).should == true
# 英語っぽくこのような記法もある。上と等価。
    @s.should be_a_kind_of(String)
  end

  after do         # サンプル（テストメソッド）実行後に評価（省略可能）
  end
  after :all do    # 振舞い実行後に評価（省略可能）
  end
end
