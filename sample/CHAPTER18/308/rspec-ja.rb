describe '"Object"��' do
  before do
    @s = "Object"
  end

  it "Ĺ����6�Ǥ���" do
    @s.length.should == 6
    @s.should have(6).items
  end

  it "��ʸ���ˤ�����\"OBJECT\"�ˤʤ�" do
    @s.upcase.should == "OBJECT"
  end

  it "String�Υ��󥹥��󥹤Ǥ���" do
    @s.kind_of?(String).should == true
# �Ѹ�äݤ�����ʵ�ˡ�⤢�롣���������
    @s.should be_a_kind_of(String)
  end
end
