require 'rubygems'
# narray�饤�֥���Narray���������Ƥ���Τ��ɤ߹���
require 'narray'
# NArray�����Ǥ�ʣ�ǿ�����Ĥ��Ȥ��Ǥ���Τ�complex�饤�֥����ɤ߹��ࡣ
require 'complex'
require 'narray-oneline-inspect' # nodisp
# Ruby�����󼰤Τ褦�ʷ�����NArray��������롣���Ǽ���Ƿ�����ޤ롣
na1 = NArray[[1.1, 2, 3], [3, 4.4, 6+3.im]]
# => NArray.complex(3,2): [[1.1+0.0i, 2.0+0.0i, 3.0+0.0i], [3.0+0.0i, 4.4+0.0i, 6.0+3.0i]]
# �����������ǿ����������ȤΥ�����
[ na1.dim, na1.total ]               # => [2, 6]
na1.shape                            # => [3, 2]
# ����ǥå������ȡʥͥ�������Ȥϵա�
[ na1[2, 0], na1[1, 0], na1[0, 1] ]  # => [(3.0+0.0i), (2.0+0.0i), (3.0+0.0i)]
# �Ԥ���Ф�
na1[true, 0]     # => NArray.complex(3): [1.1+0.0i, 2.0+0.0i, 3.0+0.0i]
# �����Ф�
na1[0, true]     # => NArray.complex(2): [1.1+0.0i, 3.0+0.0i]
# ��ʬ�������Ф�
na1[0..1, 0]     # => NArray.complex(2): [1.1+0.0i, 2.0+0.0i]
na1[2, 0..1]     # => NArray.complex(2): [3.0+0.0i, 6.0+3.0i]
na1[0..1, 0..1]  # => NArray.complex(2,2): [[1.1+0.0i, 2.0+0.0i], [3.0+0.0i, 4.4+0.0i]]
# 3x2���󼡸������������������Ǥ�5�����롣
na2  = NArray.int(3,2).fill!(5)    # => NArray.int(3,2): [[5, 5, 5], [5, 5, 5]]
na2f = NArray.float(3,2).fill!(5)  # => NArray.float(3,2): [[5.0, 5.0, 5.0], [5.0, 5.0, 5.0]]
# Ruby�������NArray���Ѵ����롣
na3 = NArray.to_na [[1,1,1],[2,2,2]]  # => NArray.int(3,2): [[1, 1, 1], [2, 2, 2]]
# NArray�ɤ����α黻�����Ǥ��Ȥ˹Ԥ��롣
na1 + na2 + na3
# => NArray.complex(3,2): [[7.1+0.0i, 8.0+0.0i, 9.0+0.0i], [10.0+0.0i, 11.4+0.0i, 13.0+3.0i]]
# NArray�ȿ��ͤα黻�ϡ����줾������Ǥȿ��ͤα黻��̤�NArray�ˤʤ롣
na2 * 3             # => NArray.int(3,2): [[15, 15, 15], [15, 15, 15]]
