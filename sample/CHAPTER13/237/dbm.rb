# gdbm�饤�֥���GDBM���������Ƥ���Τ��ɤ߹���
require 'gdbm'
# �ǡ����١��� test.gdbm �򳫤�����GDBM���֥������Ȥ��֥�å��ѥ�᡼�����Ϥ롣
GDBM.open("test.gdbm") do |dbm|
# �ϥå���Ʊ�ͤ˥��������Ǥ��뤬��ʸ����ʳ����ͤ��Ǽ����ˤϡ�to_s�פ�ʸ���󲽤���ɬ�פ����롣
  dbm["foo"] = "bar"
  dbm["number"] = 1.to_s
  dbm.keys    # => ["number", "foo"]
  dbm.values  # => ["1", "bar"]
end
