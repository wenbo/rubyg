describe '"Object"は' do
  before do
    @s = "Object"
  end

  it "長さが6である" do
    @s.length.should == 6
    @s.should have(6).items
  end

  it "大文字にしたら\"OBJECT\"になる" do
    @s.upcase.should == "OBJECT"
  end

  it "Stringのインスタンスである" do
    @s.kind_of?(String).should == true
# 英語っぽくこんな記法もある。上と等価。
    @s.should be_a_kind_of(String)
  end
end
