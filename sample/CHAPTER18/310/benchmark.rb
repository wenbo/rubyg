#!/usr/local/bin/ruby
# benchmark�饤�֥���Benchmark���������Ƥ���Τ��ɤ߹���
require 'benchmark'
# �٥���ޡ�������ѥ֥�å���������롣
Benchmark.bmbm do |b|     # �������100000���Ǥι߽祽���Ȥ����
  rand_ary = Array.new(100000) { rand }
# �֥�å��Ĥ�sort�Υ٥���ޡ���¬�ꡣ
  b.report("sort with block") { rand_ary.sort{|x,y| y<=>x } }
# sort.reverse�Υ٥���ޡ���¬�ꡣ�ʺ�®��
  b.report("sort.reverse")    { rand_ary.sort.reverse }
# sort_by�Υ٥���ޡ���¬�ꡣ
  b.report("sort_by")         { rand_ary.sort_by{|x| -x } }
end
# >> Rehearsal ---------------------------------------------------
# >> sort with block   0.760000   0.000000   0.760000 (  0.762515)
# >> sort.reverse      0.410000   0.000000   0.410000 (  0.410609)
# >> sort_by           0.480000   0.010000   0.490000 (  0.494006)
# >> ------------------------------------------ total: 1.660000sec
# >> 
# >>                       user     system      total        real
# >> sort with block   0.760000   0.000000   0.760000 (  0.761990)
# >> sort.reverse      0.400000   0.010000   0.410000 (  0.401244)
# >> sort_by           0.470000   0.000000   0.470000 (  0.467279)
