#     0         1         2  
# idx:0123456789012345678901234
md = "<<<Item: Apple, Orange>>>".match(/Item: (\w+), (\w+)/)
# ����ɽ���ޥå��ξ�����Ǽ���Ƥ���MatchData�����롣
md                    # => #<MatchData "Item: Apple, Orange" 1:"Apple" 2:"Orange">
Regexp.last_match     # => #<MatchData "Item: Apple, Orange" 1:"Apple" 2:"Orange">
$~                    # => #<MatchData "Item: Apple, Orange" 1:"Apple" 2:"Orange">
# ����ɽ���˥ޥå�����ʸ����Υ��ե��åȡʻ����Ƚ����Υ���ǥå����ˤ����롣
md.offset(0)                    # => [3, 22]
# ����ɽ���˥ޥå�����ʸ����Υ��ե��åȤ��̡������롣
[ md.begin(0), md.end(0) ]      # => [3, 22]
# ()�˥ޥå�����ʸ����Υ��ե��åȤ����롣
[ md.offset(1), md.offset(2) ]  # => [[9, 14], [16, 22]]
# ()�˥ޥå�����ʸ����Υ��ե��åȤ��̡������롣
[ md.begin(1), md.end(1) ]      # => [9, 14]
# ����ɽ���˥ޥå�����ʸ��������롣
[ md[0], $& ]                   # => ["Item: Apple, Orange", "Item: Apple, Orange"]
# ()�˥ޥå�����ʸ��������롣
[ md[1], md[2], $1, $2 ]        # => ["Apple", "Orange", "Apple", "Orange"]
Regexp.last_match(1)            # => "Apple"
# �Ǹ��()�˥ޥå�����ʸ��������롣
[ md[-1], $+ ]                  # => ["Orange", "Orange"]
# ����ɽ���˥ޥå�������ʬ�������ʸ��������롣
[ md.pre_match, $` ]            # => ["<<<", "<<<"]
# ����ɽ���˥ޥå�������ʬ������ʸ��������롣
[ md.post_match, $' ]           # => [">>>", ">>>"]
# ()�˥ޥå�����ʸ����ʥ���ץ���ˤ���������롣
md.captures                     # => ["Apple", "Orange"]
# ���󲽤��롣
md.to_a                         # => ["Item: Apple, Orange", "Apple", "Orange"]
# ��()�ο�+1�פ��֤���
md.size                         # => 3
# ����������ɽ���ޥå���ȼ�����ü��ѿ����ͤ��ѹ�����롣
md.captures.select {|e| e =~ /A/ } # => ["Apple"]
$1                                 # => nil
