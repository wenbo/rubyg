# ��describe�פΰ����˿��񤤤�̾���ʥƥ���̾�ˤ���ꤹ�롣ʣ�����ꤷ������to_s������Τ򥹥ڡ����ǤĤʤ�����Τ�̾���ˤʤ롣
describe String, '"Object"' do
  before :all do   # ���񤤡ʥƥ��ȥ��饹�˼¹�����ɾ���ʾ�ά��ǽ��
  end
  before do        # ����ץ�ʥƥ��ȥ᥽�åɡ˼¹�����ɾ���ʾ�ά��ǽ��
    @s = "Object"
  end

# ����ץ��it�᥽�åɤǡ�����ץ�̾�ϡ�should�פ���Ϥ��ޤ��ʸ�ǽ񤯤ȤĤʤ��꤬�褤��
  it "should be 6 length" do
# ��ӱ黻�Ҥ����ˡ�.should�פ�Ϥ���Τ����ܡ�
    @s.length.should == 6
# �Ѹ�äݤ����Τ褦�ʵ�ˡ�⤢�롣���������
    @s.should have(6).items
  end
  it "upcase should be \"OBJECT\"" do
    @s.upcase.should == "OBJECT"
  end
  it "should be a kind of String" do
    @s.kind_of?(String).should == true
# �Ѹ�äݤ����Τ褦�ʵ�ˡ�⤢�롣���������
    @s.should be_a_kind_of(String)
  end

  after do         # ����ץ�ʥƥ��ȥ᥽�åɡ˼¹Ը��ɾ���ʾ�ά��ǽ��
  end
  after :all do    # ���񤤼¹Ը��ɾ���ʾ�ά��ǽ��
  end
end
