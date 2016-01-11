# ������:c�פ����֤äƤ�����ȤΥϥå��塣
hash1 = { :a=>1, :b=>2, :c=>3 }
hash2 = { :c=>4, :d=>5 }
# ���Τޤ޺������hash2���ͤ򥭡���:c�פ��ͤ˺��Ѥ��롣
hash1.merge hash2               # => {:a=>1, :b=>2, :c=>4, :d=>5}
# �֥�å��ϡ�:c�ס���3�ס���4�פ�����˼�ꡢɾ����̤򥭡���:c�פ��ͤ˺��Ѥ��롣
hash1.merge(hash2) {|k,v1,v2| "#{k}:#{v1}:#{v2}" } # => {:a=>1, :b=>2, :c=>"c:3:4", :d=>5}
# 2�ĤΥ��������֤äƤ���ϥå��塣
hash3 = { :b=>6, :c=>7 }
# hash1���˲�Ū�˺����롣���֤ä������ϥ������б������ͤ�­����
hash1.update(hash3) {|k,v1,v2| v1+v2 } # => {:a=>1, :b=>8, :c=>10}
hash1                                  # => {:a=>1, :b=>8, :c=>10}

# �������
CONFIG_DEFAULTS = { :verbose_level => :verbose, :format => :HTML }
# �ǥե���Ȥ������桼������Ǿ�񤭤��롣
def config(user_config)  CONFIG_DEFAULTS.merge(user_config)  end
conf = config(:format => :XML)  # => {:verbose_level=>:verbose, :format=>:XML}
