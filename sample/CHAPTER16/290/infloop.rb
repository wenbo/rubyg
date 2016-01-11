i = 0
v = loop do
  i  # => 0, 1
# break��̵�¥롼�פ���ȴ���롣
  break i if i >= 1
  i += 1
end
# Kernel#loop���֤��ͤ�break�ΰ����ʤɤǺǸ��ɾ�������͡�
v    # => 1

v = catch :exit do
  loop do 
# catch/throw�ǥͥ��Ȥ��줿̵�¥롼�פ���ȴ���롣
    loop { throw :exit, :ok }
  end
end
v    # => :ok

# a, b, a, ...��0.1�ä��Ȥ˸�ߤ�ɽ�����Ƥ�������åɡ�Ruby 1.8.7�ʹߤǤ�((:Enumerable#cycle:))�����Ѳ�ǽ��
Thread.start do
  loop do
    %w[a b].each do |x|
      puts x
      sleep 0.1
    end
  end
end
# �ᥤ�󥹥�åɤ�0.39�ôֻߤޤäƤ���֤˥���åɤˤ��ɽ�����Ԥ��롣
sleep 0.39
# >> a
# >> b
# >> a
# >> b
