class String
# String#external_filter��������롣prog�ϼ¹Ԥ��륳�ޥ�ɡ�
  def external_filter(prog)
# �ɤ߽�ξ�ѥ⡼�ɤǥѥ��פ�������롣
    IO.popen(prog, "wb+") do |pipe|
# prog��ɸ�����Ϥ˽񤭹��ࡣ
      pipe.write self
# ���Ϥ���λ�����餹�����Ĥ��롣����Ͻ񤭹��߽�λ���Τ餻�뤿���ɬ�ܡ�
      pipe.close_write
# prog��ɸ����Ϥ��ɤࡣ
      pipe.read
    end
  end
end
# ʸ�����ե��륿���ǲù����롣ξ�Ԥ�������
"hoge".external_filter("ruby -e 'puts ARGF.read.upcase'")  # => "HOGE\n"
`echo hoge | ruby -e 'puts ARGF.read.upcase'`              # => "HOGE\n"
