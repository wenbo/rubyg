# csv�饤�֥���CSV���������Ƥ���Τ��ɤ߹���
require 'csv'
# CSVʸ����ΰ���
# ��,�פ���Ԥ��ޤޤ�ʤ����Ȥ��ݾڤ���Ƥ�����ϡ�String#split�ǲ��ϤǤ��롣
"1,2\r\n3,4\r\n".split("\r\n").map {|l| l.split(",") } # => [["1", "2"], ["3", "4"]]
#1 ��̩��CSVʸ�������Ϥ���ˤ�CSV.parse����Ѥ��롣
CSV.parse(%Q!1,2,3\r\n4,5,"6,7"\r\n!) # => [["1", "2", "3"], ["4", "5", "6,7"]]
#1 �����CSVʸ������Ѵ�����ˤ�CSV.generate_line����Ѥ��롣Ruby 1.8�Ǥ������β��Ԥ��դ�����Ruby 1.9�Ǥ��դ���
CSV.generate_line [0, "a\nb", "c,d"]     # => "0,\"a\nb\",\"c,d\"\n"
# CSV�ե�����ΰ���
# CSV�ե������������롣
CSV.open("sample.csv", "w") do |csv|
# �ǡ����ϡ�<<�פ�1��ʬ�Υǡ�����񤭹��ࡣ
  csv << [1, "line1\nline2"]
  csv << [2, "with,comma"]
  csv << [3, '/"dquote"/']
end

# CSV�ե����뤫��1�Ԥ����ɤ߹��ࡣ
CSV.foreach("sample.csv") do |row|
  row # => ["1", "line1\nline2"], ["2", "with,comma"], ["3", "/\"dquote\"/"]
end
# CSV�ե������쵤���ɤ߹��ࡣ
CSV.read("sample.csv")
# => [["1", "line1\nline2"], ["2", "with,comma"], ["3", "/\"dquote\"/"]]
# �񤭹��ޤ줿CSV�ե�����Ϥ��Τ褦�ˤʤäƤ��롣
print File.read("sample.csv")
# >> 1,"line1
# >> line2"
# >> 2,"with,comma"
# >> 3,"/""dquote""/"
