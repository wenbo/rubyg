Thread.abort_on_exception = true
th3 = Thread.start { raise "Error in th3" }
sleep 0.1
puts "End of program."  # �ץ����μ¹Ԥ��Ǥ��ڤ��뤿��ɽ������ʤ���
# ~> -:2:in `block in <main>': Error in th3 (RuntimeError)
